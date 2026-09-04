-- 고객별 관측 가능한 최초 구매일

DROP TABLE IF EXISTS customer_first_purchase;

CREATE TABLE customer_first_purchase AS

SELECT
	c.customer_unique_id,
	
	min(
		o.order_purchase_timestamp
	) AS first_purchase_timestamp,
	
	substr(
		min(
			o.order_purchase_timestamp
		),
		1,
		7
	) AS first_purchase_month
	
FROM orders AS o

JOIN customers AS c
	ON o.customer_id = c.customer_id

WHERE
	o.order_status = 'delivered'

GROUP BY
	c.customer_unique_id;
	
-- Key 검증
SELECT
	count(*) AS row_count,
	
	count(
		DISTINCT customer_unique_id
	) AS unique_customer_count

FROM customer_first_purchase;

-- 신규/기존 고객 분류
WITH segmented_orders AS (
	
	SELECT
		ao.order_month,
		ao.order_id,
		ao.customer_unique_id,
		ao.item_sales,
		
		CASE
			WHEN ao.order_month
				= fp.first_purchase_month
				THEN 'new'
			ELSE 'existing'
		END AS customer_segment
	
	FROM analysis_orders AS ao
	
	JOIN customer_first_purchase AS fp
		ON ao.customer_unique_id = fp.customer_unique_id
)

SELECT
	order_month,
	customer_segment,
	
	round(
		sum(item_sales),
		2
	) AS item_sales,
	
	count(*) AS order_count,
	
	count(
		DISTINCT customer_unique_id
	) AS buyer_count
	
FROM segmented_orders

GROUP BY
	order_month,
	customer_segment

ORDER BY
	order_month,
	customer_segment;

-- 월별 신규/기존을 한 행으로 정리
WITH segmented_orders AS (

    SELECT
        ao.order_month,
        ao.order_id,
        ao.customer_unique_id,
        ao.item_sales,

        CASE
            WHEN ao.order_month
                = fp.first_purchase_month
                THEN 'new'
            ELSE 'existing'
        END AS customer_segment

    FROM analysis_orders AS ao

    JOIN customer_first_purchase AS fp
        ON ao.customer_unique_id
        = fp.customer_unique_id
)

SELECT
    order_month,

    round(
        sum(
            CASE
                WHEN customer_segment = 'new'
                THEN item_sales
                ELSE 0
            END
        ),
        2
    ) AS new_item_sales,

    round(
        sum(
            CASE
                WHEN customer_segment = 'existing'
                THEN item_sales
                ELSE 0
            END
        ),
        2
    ) AS existing_item_sales,

    round(
        sum(item_sales),
        2
    ) AS total_item_sales,

    count(
        DISTINCT CASE
            WHEN customer_segment = 'new'
            THEN customer_unique_id
        END
    ) AS new_buyer_count,

    count(
        DISTINCT CASE
            WHEN customer_segment = 'existing'
            THEN customer_unique_id
        END
    ) AS existing_buyer_count,

    count(
        DISTINCT customer_unique_id
    ) AS total_buyer_count

FROM segmented_orders

GROUP BY
    order_month

ORDER BY
    order_month;
	
-- 검산

WITH segment_summary AS (

    WITH segmented_orders AS (
        SELECT
            ao.order_month,
            ao.order_id,
            ao.customer_unique_id,
            ao.item_sales,

            CASE
                WHEN ao.order_month = fp.first_purchase_month
                    THEN 'new'
                ELSE 'existing'
            END AS customer_segment

        FROM analysis_orders AS ao

        JOIN customer_first_purchase AS fp
            ON ao.customer_unique_id = fp.customer_unique_id
    )

    SELECT
        order_month,

        round(
            sum(
                CASE
                    WHEN customer_segment = 'new'
                        THEN item_sales
                    ELSE 0
                END
            ),
            2
        ) AS new_item_sales,

        round(
            sum(
                CASE
                    WHEN customer_segment = 'existing'
                        THEN item_sales
                    ELSE 0
                END
            ),
            2
        ) AS existing_item_sales,

        round(
            sum(item_sales),
            2
        ) AS total_item_sales,

        count(
            DISTINCT CASE
                WHEN customer_segment = 'new'
                    THEN customer_unique_id
            END
        ) AS new_buyer_count,

        count(
            DISTINCT CASE
                WHEN customer_segment = 'existing'
                    THEN customer_unique_id
            END
        ) AS existing_buyer_count,

        count(
            DISTINCT customer_unique_id
        ) AS total_buyer_count

    FROM segmented_orders

    GROUP BY
        order_month
)

SELECT
    order_month,

    round(
        total_item_sales
        - new_item_sales
        - existing_item_sales,
        2
    ) AS item_sales_difference,

    total_buyer_count
        - new_buyer_count
        - existing_buyer_count
        AS buyer_count_difference

FROM segment_summary;

-- 90일 재구매 SQL
WITH delivered_orders AS (

	SELECT
		c.customer_unique_id,
		o.order_id,
		o.order_purchase_timestamp
		
	FROM orders AS o
	
	JOIN customers AS c
		ON o.customer_id = c.customer_id
	
	WHERE
		o.order_status = 'delivered'
),

first_purchase AS (
	
	SELECT
		customer_unique_id,
		
		min(
			order_purchase_timestamp
		) AS first_purchase_timestamp
		
	FROM delivered_orders
	
	GROUP BY
		customer_unique_id
),

eligible_new_customers AS (
	
	SELECT
		customer_unique_id,
		first_purchase_timestamp
	
	FROM first_purchase
	
	WHERE
		first_purchase_timestamp >= '2017-09-01'
		
		AND date(
			first_purchase_timestamp,
			'+90 days'
		) < '2018-09-01'
),

repeat_flag AS (
	
	SELECT
		e.customer_unique_id,
		
		CASE
			WHEN count(
				DISTINCT CASE
					WHEN date(
						d.order_purchase_timestamp
					) > date(
						e.first_purchase_timestamp
					)
					
					AND date(
						d.order_purchase_timestamp
					) <= date(
						e.first_purchase_timestamp,
						'+90 days'
					)
					
					THEN d.order_id
				END
			) > 0
			THEN 1
			
			ELSE 0
		END AS repeat_90
	
	FROM eligible_new_customers AS e
	
	LEFT JOIN delivered_orders AS d
		ON e.customer_unique_id = d.customer_unique_id
	
	GROUP BY
		e.customer_unique_id
)

SELECT
	count(*) AS eligible_new_customer_count,
	
	sum(
		repeat_90
	) AS repeat_90_customer_count,
	
	round(
		avg(
			repeat_90 * 1.0
		),
		4
	) AS repeat_90_rate

FROM repeat_flag;