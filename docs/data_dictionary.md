# Sales Analysis - Data Dictionary

## 데이터 확정

- Dataset : Brazilian E-Commerce Public Dataset by Olist
- 출처 : www.kaggle.com
- Data 설명 : Brazilian ecommerce public dataset of orders made at Olist Store

## 데이터 구조

| Table | Key | 핵심 컬럼 | Grain |
|---|---|---|---|
| customers | `customer_id` | `customer_unique_id`, `customer_state` | `customer_id` 1개당 1행 |
| orders | `order_id` | `customer_id`, `order_purchase_timestamp`, `order_status` | 주문 1건당 1행 |
| order_items | (`order_id`, `order_item_id`) | `product_id`, `price`, `freight_value` | 주문상품 항목 1개당 1행 |
| products | `product_id` | `product_category_name` | 상품 1개당 1행 |
| category_translation | `product_category_name` | `product_category_name_english` | 카테고리 1개당 1행 |

## Customer Key 주의사항

`customer_id`는 주문과 customers 테이블을 연결하기 위한 키이다.

동일한 실제 고객이 여러 주문을 수행한 경우
서로 다른 `customer_id`를 가질 수 있다.

따라서 반복 구매 및 고객 단위 분석에서는
`customer_unique_id`를 고객 식별자로 사용한다.