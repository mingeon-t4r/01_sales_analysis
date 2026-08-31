# Sales Analysis - Data Dictionary

> 현재 문서는 실제 데이터 확정 전의 데이터 요구사항 초안이다.
> 실제 공개 데이터 선정 후 컬럼명, 자료형, 결측 규칙과 출처를 갱신한다.

# 데이터 확정

- Dataset : Brazilian E-Commerce Public Dataset by Olist
- 출처 : www.kaggle.com
- Data 설명 : Brazilian ecommerce public dataset of orders made at Olist Store

- 데이터 구조
| Table                | Key                        | 핵심 컬럼                                                   | Grain                 |
| customers            | `customer_id`              | `customer_unique_id`, `customer_state`                    | customer_id record 1행 |
| orders               | `order_id`                 | `customer_id`, `order_purchase_timestamp`, `order_status` | 주문 1건                |
| order_items          | `order_id + order_item_id` | `product_id`, `price`, `freight_value`                    | 주문상품 항목 1행        |
| products             | `product_id`               | `product_category_name`                                   | 상품 1개                |
| category_translation | `product_category_name`    | `product_category_name_english`                           | 카테고리 1개            |
