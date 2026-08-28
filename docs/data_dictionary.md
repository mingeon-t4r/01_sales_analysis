# Sales Analysis - Data Dictionary

> 현재 문서는 실제 데이터 확정 전의 데이터 요구사항 초안이다.
> 실제 공개 데이터 선정 후 컬럼명, 자료형, 결측 규칙과 출처를 갱신한다.

## customers

| Column | Meaning | Required | Quality Rule |
| customer_id | 고객 식별자 | Yes | 고객 단위에서 Unique |
| customer_created_at | 고객 가입일 | Preferred | 유효한 날짜 |
| region | 고객 지역 | Optional | 범주값 확인 |
| customer_segment | 고객 구분 | Optional | 범주값 확인 |

Grain:

고객 1명당 1행

Primary Key:

customer_id

---

## orders

| Column | Meaning | Required | Quality Rule |
| order_id | 주문 식별자 | Yes | Unique |
| customer_id | 주문 고객 | Yes | customers와 연결 |
| order_date | 주문일 | Yes | 유효한 날짜 |
| status | 주문 상태 | Yes | 허용 상태 확인 |
| channel | 주문 채널 | Preferred | 범주값 확인 |

Grain:

주문 1건당 1행

Primary Key:

order_id

Foreign Key:

customer_id

---

## order_items

| Column | Meaning | Required | Quality Rule |
| order_id | 주문 식별자 | Yes | orders와 연결 |
| product_id | 상품 식별자 | Yes | products와 연결 |
| quantity | 주문 수량 | Yes | 0 초과 |
| unit_price | 단가 | Yes | 0 이상 |
| discount | 할인 금액 | Preferred | 0 이상 |

Grain:

주문-상품 1건당 1행

---

## products

| Column | Meaning | Required | Quality Rule |
| product_id | 상품 식별자 | Yes | Unique |
| product_name | 상품명 | Preferred | 결측 확인 |
| category | 상품 카테고리 | Yes | 범주값 확인 |

Grain:

상품 1개당 1행

Primary Key:

product_id

---

## Optional Refund Data

필요 정보:

- order_id 또는 order_item_id
- refund_amount 또는 return_quantity
- refund_date

환불 정보가 없는 데이터에서는
순매출 정의가 제한되므로
Gross Sales와 Net Sales 표현을 구분한다.