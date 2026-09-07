-- 고객 지역 기본 확인
SELECT
	customer_state,
	count(*) AS order_count
	
FROM analysis_orders

GROUP BY
	customer_state

ORDER BY
	order_count DESC;
	
-- NULL 지역 확인
SELECT
	count(*) AS missing_state_count

FROM analysis_orders

WHERE
	customer_state IS NULL
	OR customer_state = '';
	
-- 지역별 전체 성과
SELECT
	customer_state,
	
	round(
		sum(item_sales),
		2
	) AS item_sales,
	
	count(*) AS order_count,
	
	count(
		DISTINCT customer_unique_id
	) AS buyer_count,
	
	round(
		sum(item_sales) * 1.0
		/ count(*),
		2
	) AS average_item_sales_per_order,
	
	round(
		count(*) * 1.0
		/ count(
			DISTINCT customer_unique_id
		),
		4
	) AS order_per_buyer,
	
	round(
		sum(item_sales) * 1.0
		/ count(
			DISTINCT customer_unique_id
		),
		2
	) AS item_sales_per_buyer

FROM analysis_orders

GROUP BY
	customer_state
	
ORDER BY
	item_sales DESC;
	
-- Item Sales 비중
WITH region_performance AS (
	
	SELECT
		customer_state,
		
		sum(
			item_sales
		) AS item_sales,
		
		count(*) AS order_count,
		
		count(
			DISTINCT customer_unique_id
		) AS buyer_count
		
	FROM analysis_orders
	
	GROUP BY
		customer_state
)

SELECT
	customer_state,
	
	round(
		item_sales,
		2
	) AS item_sales,
	
	order_count,
	buyer_count,
	
	round(
		item_sales * 1.0
		/ sum(item_sales) OVER (),
		4
	) AS item_sales_share
	
FROM region_performance

ORDER BY
	item_sales DESC;

	
-- 2017년 11월 지역별 Item Sales 변화
SELECT
	customer_state,
	
	round(
		sum(
			CASE
				WHEN order_month = '2017-10'
				THEN item_sales
				ELSE 0
			END
		),
		2
	) AS october_item_sales,
	
	round(
		sum(
			CASE
				WHEN order_month = '2017-11'
				THEN item_sales
				ELSE 0
			END
		),
		2
	) AS november_item_sales,
	
	round(
		sum(
			CASE
				WHEN order_month = '2017-11'
				THEN item_sales
				ELSE 0
			END
		)
		-
		sum(
			CASE
				WHEN order_month = '2017-10'
				THEN item_sales
				ELSE 0
			END
		),
		2
	) AS item_sales_change
	
FROM analysis_orders

WHERE
	order_month IN (
		'2017-10',
		'2017-11'
	)
	
GROUP BY
	customer_state

ORDER BY
	item_sales_change DESC;
	
-- 2017년 12월 지역별 Item Sales qusghk
SELECT
	customer_state,
	
	round(
		sum(
			CASE
				WHEN order_month = '2017-11'
				THEN item_sales
				ELSE 0
			END
		),
		2
	) AS october_item_sales,
	
	round(
		sum(
			CASE
				WHEN order_month = '2017-12'
				THEN item_sales
				ELSE 0
			END
		),
		2
	) AS november_item_sales,
	
	round(
		sum(
			CASE
				WHEN order_month = '2017-12'
				THEN item_sales
				ELSE 0
			END
		)
		-
		sum(
			CASE
				WHEN order_month = '2017-11'
				THEN item_sales
				ELSE 0
			END
		),
		2
	) AS item_sales_change
	
FROM analysis_orders

WHERE
	order_month IN (
		'2017-11',
		'2017-12'
	)
	
GROUP BY
	customer_state

ORDER BY
	item_sales_change;
	
-- 지역 증감 검산 11월
WITH region_change AS (

    SELECT
        customer_state,

        sum(
            CASE
                WHEN order_month = '2017-11'
                THEN item_sales
                ELSE 0
            END
        )
        -
        sum(
            CASE
                WHEN order_month = '2017-10'
                THEN item_sales
                ELSE 0
            END
        ) AS item_sales_change

    FROM analysis_orders

    WHERE
        order_month IN (
            '2017-10',
            '2017-11'
        )

    GROUP BY
        customer_state
)

SELECT
    round(
        sum(item_sales_change),
        2
    ) AS total_region_change

FROM region_change;

-- 지역 증감 검산 12월
WITH region_change AS (

    SELECT
        customer_state,

        sum(
            CASE
                WHEN order_month = '2017-12'
                THEN item_sales
                ELSE 0
            END
        )
        -
        sum(
            CASE
                WHEN order_month = '2017-11'
                THEN item_sales
                ELSE 0
            END
        ) AS item_sales_change

    FROM analysis_orders

    WHERE
        order_month IN (
            '2017-11',
            '2017-12'
        )

    GROUP BY
        customer_state
)

SELECT
    round(
        sum(item_sales_change),
        2
    ) AS total_region_change

FROM region_change;