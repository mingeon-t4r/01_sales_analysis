-- 전체 기간 카테고리 성과

SELECT
	coalesce(
		product_category,
		'unknown'
	) AS product_category,
	
	round(
		sum(item_price),
		2
	) AS item_sales,
	
	count(*) AS item_row_count,
	
	count(
		DISTINCT product_id
	) AS product_count,
	
	count(
		DISTINCT order_id
	) AS order_count,
	
	count(
		DISTINCT customer_unique_id
	) AS buyer_count

FROM analysis_order_items

GROUP BY
	coalesce(
		product_category,
		'unknown'
	)

ORDER BY
	item_sales DESC;
	
-- 카테고리별 Item Sales 비중

WITH category_sales AS (
	SELECT
		coalesce(
			product_category,
			'unknown'
		) AS product_category,
		
		sum(
			item_price
		) AS item_sales
		
	FROM analysis_order_items

	GROUP BY
		coalesce(
			product_category,
			'unknown'
		)
)

SELECT
	product_category,
	
	round(
		item_sales,
		2
	) AS item_sales,
	
	round(
		item_sales * 1.0
		/ sum(item_sales) OVER (),
		4
	) AS item_sales_share

FROM category_sales

ORDER BY
	item_sales DESC;
	
-- 월별 카테고리 Item Sales

SELECT
	order_month,
	
	coalesce(
		product_category,
		'unknown'
	) AS product_category,
	
	round(
		sum(item_price),
		2
	) AS item_sales
	
FROM analysis_order_items

GROUP BY
	order_month,
	coalesce(
		product_category,
		'unknown'
	)

ORDER BY
	product_category,
	order_month;
	
-- 카테고리별 전월 대비 성장률

WITH monthly_category_sales AS (

    SELECT
        order_month,

        coalesce(
            product_category,
            'unknown'
        ) AS product_category,

        sum(
            item_price
        ) AS item_sales

    FROM analysis_order_items

    GROUP BY
        order_month,
        coalesce(
            product_category,
            'unknown'
        )
),

category_growth AS (

    SELECT
        order_month,
        product_category,
        item_sales,

        lag(
            item_sales
        ) OVER (
            PARTITION BY product_category
            ORDER BY order_month
        ) AS previous_item_sales

    FROM monthly_category_sales
)

SELECT
    order_month,
    product_category,

    round(
        item_sales,
        2
    ) AS item_sales,

    round(
        previous_item_sales,
        2
    ) AS previous_item_sales,

    round(
        item_sales * 1.0
        / previous_item_sales
        - 1,
        4
    ) AS item_sales_growth

FROM category_growth

ORDER BY
    product_category,
    order_month;
	
-- 카테고리 매출 증감액
WITH monthly_category_sales AS (

    SELECT
        order_month,

        coalesce(
            product_category,
            'unknown'
        ) AS product_category,

        sum(
            item_price
        ) AS item_sales

    FROM analysis_order_items

    GROUP BY
        order_month,
        coalesce(
            product_category,
            'unknown'
        )
),

category_change AS (

    SELECT
        order_month,
        product_category,
        item_sales,

        lag(
            item_sales
        ) OVER (
            PARTITION BY product_category
            ORDER BY order_month
        ) AS previous_item_sales

    FROM monthly_category_sales
)

SELECT
    order_month,
    product_category,

    round(
        item_sales,
        2
    ) AS item_sales,

    round(
        previous_item_sales,
        2
    ) AS previous_item_sales,

    round(
        item_sales
        - previous_item_sales,
        2
    ) AS item_sales_change

FROM category_change

ORDER BY
    order_month,
    item_sales_change DESC;
	
-- 11월 성장기여 카테고리
WITH monthly_category_sales AS (

    SELECT
        order_month,

        coalesce(
            product_category,
            'unknown'
        ) AS product_category,

        sum(
            item_price
        ) AS item_sales

    FROM analysis_order_items

    GROUP BY
        order_month,
        coalesce(
            product_category,
            'unknown'
        )
),

category_change AS (

    SELECT
        order_month,
        product_category,
        item_sales,

        lag(
            item_sales
        ) OVER (
            PARTITION BY product_category
            ORDER BY order_month
        ) AS previous_item_sales

    FROM monthly_category_sales
)

SELECT
    product_category,

    round(
        previous_item_sales,
        2
    ) AS october_item_sales,

    round(
        item_sales,
        2
    ) AS november_item_sales,

    round(
        item_sales
        - previous_item_sales,
        2
    ) AS item_sales_change

FROM category_change

WHERE
    order_month = '2017-11'

ORDER BY
    item_sales_change DESC

LIMIT 10;

-- 12월 감소 카테고리
WITH monthly_category_sales AS (

    SELECT
        order_month,

        coalesce(
            product_category,
            'unknown'
        ) AS product_category,

        sum(
            item_price
        ) AS item_sales

    FROM analysis_order_items

    GROUP BY
        order_month,
        coalesce(
            product_category,
            'unknown'
        )
),

category_change AS (

    SELECT
        order_month,
        product_category,
        item_sales,

        lag(
            item_sales
        ) OVER (
            PARTITION BY product_category
            ORDER BY order_month
        ) AS previous_item_sales

    FROM monthly_category_sales
)

SELECT
    product_category,

    round(
        previous_item_sales,
        2
    ) AS november_item_sales,

    round(
        item_sales,
        2
    ) AS december_item_sales,

    round(
        item_sales
        - previous_item_sales,
        2
    ) AS item_sales_change

FROM category_change

WHERE
    order_month = '2017-12'

ORDER BY
    item_sales_change

LIMIT 10;