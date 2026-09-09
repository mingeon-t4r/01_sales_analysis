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

-- 2017년 11월 카테고리별 Item Sales 변화

SELECT
    coalesce(
        product_category,
        'unknown'
    ) AS product_category,

    round(
        sum(
            CASE
                WHEN order_month = '2017-10'
                THEN item_price
                ELSE 0
            END
        ),
        2
    ) AS october_item_sales,

    round(
        sum(
            CASE
                WHEN order_month = '2017-11'
                THEN item_price
                ELSE 0
            END
        ),
        2
    ) AS november_item_sales,

    round(
        sum(
            CASE
                WHEN order_month = '2017-11'
                THEN item_price
                ELSE 0
            END
        )
        -
        sum(
            CASE
                WHEN order_month = '2017-10'
                THEN item_price
                ELSE 0
            END
        ),
        2
    ) AS item_sales_change

FROM analysis_order_items

WHERE
    order_month IN (
        '2017-10',
        '2017-11'
    )

GROUP BY
    coalesce(
        product_category,
        'unknown'
    )

ORDER BY
    item_sales_change DESC;

-- 2017년 12월 카테고리별 Item Sales 변화

SELECT
    coalesce(
        product_category,
        'unknown'
    ) AS product_category,

    round(
        sum(
            CASE
                WHEN order_month = '2017-11'
                THEN item_price
                ELSE 0
            END
        ),
        2
    ) AS november_item_sales,

    round(
        sum(
            CASE
                WHEN order_month = '2017-12'
                THEN item_price
                ELSE 0
            END
        ),
        2
    ) AS december_item_sales,

    round(
        sum(
            CASE
                WHEN order_month = '2017-12'
                THEN item_price
                ELSE 0
            END
        )
        -
        sum(
            CASE
                WHEN order_month = '2017-11'
                THEN item_price
                ELSE 0
            END
        ),
        2
    ) AS item_sales_change

FROM analysis_order_items

WHERE
    order_month IN (
        '2017-11',
        '2017-12'
    )

GROUP BY
    coalesce(
        product_category,
        'unknown'
    )

ORDER BY
    item_sales_change;