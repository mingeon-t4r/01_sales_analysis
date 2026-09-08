-- 2017년 12월
-- Customer State x Product Category 변화

SELECT
	customer_state,
	
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
	customer_state,
	coalesce(
		product_category,
		'unknown'
	)
	
ORDER BY
	item_sales_change
	
LIMIT 20;

-- 2017년 11월
-- Customer State x Product Category 변화
SELECT
    customer_state,

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
    customer_state,
    coalesce(
        product_category,
        'unknown'
    )

ORDER BY
    item_sales_change DESC

LIMIT 20;