-- Raw table 검증
SELECT
    count(*) AS customer_count
FROM customers;

SELECT
    count(*) AS order_count
FROM orders;

SELECT
    count(*) AS order_item_count
FROM order_items;

SELECT
    count(*) AS product_count
FROM products;

-- category translation key 확인
SELECT
    count(*) AS row_count,
    count(
        DISTINCT product_category_name
    ) AS unique_category_count
FROM category_translation;

-- 유효 주문 수 확인
SELECT 
	count(*) AS valid_order_count
FROM orders
WHERE
	order_status = 'delivered'
	AND order_purchase_timestamp >= '2017-09-01'
	AND order_purchase_timestamp < '2018-09-01';
	
-- 상품이 없는 유효 주문 확인
SELECT
	count(*) AS order_without_items
FROM orders AS o
LEFT JOIN order_items AS oi
	ON o.order_id = oi.order_id
WHERE
	o.order_status = 'delivered'
	AND o.order_purchase_timestamp >= '2017-09-01'
	AND o.order_purchase_timestamp < '2018-09-01'
	AND oi.order_id IS NULL;
	
-- Item level 분석 테이블
DROP TABLE IF EXISTS analysis_order_items;

CREATE TABLE analysis_order_items AS

SELECT
    o.order_id,
    oi.order_item_id,

    o.customer_id,
    c.customer_unique_id,

    o.order_purchase_timestamp,

    substr(
        o.order_purchase_timestamp,
        1,
        7
    ) AS order_month,

    c.customer_state,

    oi.product_id,

    p.product_category_name,

    ct.product_category_name_english,

    coalesce(
        ct.product_category_name_english,
        p.product_category_name
    ) AS product_category,

    oi.price AS item_price,

    oi.freight_value

FROM orders AS o

JOIN customers AS c
    ON o.customer_id = c.customer_id

JOIN order_items AS oi
    ON o.order_id = oi.order_id

JOIN products AS p
    ON oi.product_id = p.product_id

LEFT JOIN category_translation AS ct
    ON p.product_category_name
    = ct.product_category_name

WHERE
    o.order_status = 'delivered'
    AND o.order_purchase_timestamp >= '2017-09-01'
    AND o.order_purchase_timestamp < '2018-09-01';
	
-- Item-level Key 검증
SELECT
	count(*) AS duplicate_key_count
FROM (
	SELECT
		order_id,
		order_item_id,
		count(*) AS row_count
	FROM analysis_order_items
	GROUP BY
		order_id,
		order_item_id
	HAVING count(*) > 1
);

-- Order-level 분석 테이블
DROP TABLE IF EXISTS analysis_orders;

CREATE TABLE analysis_orders AS

SELECT
    order_id,
    customer_id,
    customer_unique_id,
    order_purchase_timestamp,
    order_month,
    customer_state,

    sum(
        item_price
    ) AS item_sales,

    sum(
        freight_value
    ) AS freight_total,

    count(*) AS item_row_count,

    count(
        DISTINCT product_id
    ) AS distinct_product_count,

    count(
        DISTINCT product_category
    ) AS category_count

FROM analysis_order_items

GROUP BY
    order_id,
    customer_id,
    customer_unique_id,
    order_purchase_timestamp,
    order_month,
    customer_state;

-- Order Grain 확인
SELECT
    count(*) AS row_count,

    count(
        DISTINCT order_id
    ) AS unique_order_count

FROM analysis_orders;

-- Item Sales 보존 검증
SELECT
    round(
        sum(item_price),
        2
    ) AS item_level_sales
FROM analysis_order_items;

SELECT
    round(
        sum(item_sales),
        2
    ) AS order_level_sales
FROM analysis_orders;

-- 분석 테이블 기간 확인
SELECT
    min(
        order_purchase_timestamp
    ) AS min_order_date,

    max(
        order_purchase_timestamp
    ) AS max_order_date

FROM analysis_orders;

-- 고객 수 확인
SELECT
    count(
        DISTINCT customer_unique_id
    ) AS buyer_count
FROM analysis_orders;

-- 월별 기본 KPI 확인
SELECT
    order_month,

    round(
        sum(item_sales),
        2
    ) AS item_sales,

    count(*) AS order_count,

    count(
        DISTINCT customer_unique_id
    ) AS buyer_count

FROM analysis_orders

GROUP BY
    order_month

ORDER BY
    order_month;