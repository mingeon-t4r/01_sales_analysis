-- 월별 KPI 만들기

SELECT
	order_month,
	
	sum(
		item_sales
	) AS item_sales,
	
	count(*) AS order_count,
	
	count(
		DISTINCT customer_unique_id
	) AS buyer_count,
	
	sum(
		item_sales
	) * 1.0
	/ count(*) AS average_item_sales_per_order,
	
	count(*) * 1.0
	/ count(
		DISTINCT customer_unique_id
	) AS orders_per_buyer
	
FROM analysis_orders

GROUP BY
	order_month

ORDER BY
	order_month;
	
-- 분석기간 확인
SELECT
	count(*) AS month_count
FROM (
	SELECT
		order_month
	FROM analysis_orders
	GROUP BY
		order_month
);

-- 월 누락 확인
SELECT
	order_month,
	count(*) AS order_count
FROM analysis_orders
GROUP BY
	order_month
ORDER BY
	order_month;