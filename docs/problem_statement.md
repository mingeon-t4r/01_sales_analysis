# Sales Analysis Project - Problem Statement

## 1. 프로젝트 목적

최근 완전 12개월의 상품 판매금액(Item Sales) 변화를
구매고객 수, 고객당 주문 수와 주문당 상품 판매금액으로 분해하고,
상품 카테고리·고객 지역·고객군별 성과를 비교하여
다음 운영 기간의 우선 관리 대상을 제안한다.

## 2. 의사결정자

온라인 쇼핑몰 운영 및 CRM 담당자

## 3. 의사결정

분석 결과를 이용하여 다음 운영 기간의:

- 우선 관리 고객군
- 강화 또는 회복이 필요한 상품 카테고리
- 성과 차이를 점검해야 할 고객 지역

을 결정한다.

## 4. 분석 질문

1. 최근 완전 12개월 월별 Item Sales는 어떤 추세인가?
2. Item Sales 변화는 Buyer Count, Orders per Buyer와 Average Item Sales per Order 중 어디에서 발생했는가?
3. 상품 카테고리별 Item Sales와 성장률은 어떻게 다른가?
4. 고객 지역별 Item Sales와 고객 기여는 어떻게 다른가?
5. 신규 고객과 기존 고객의 Item Sales 기여는 어떻게 다른가?
6. 신규 고객의 90일 재구매율은 얼마인가?
7. 다음 운영 기간에 우선 유지 또는 회복해야 할 대상은 무엇인가?

## 5. 핵심 KPI

- Item Sales
- Order Count
- Buyer Count
- Average Item Sales per Order
- Orders per Buyer
- Repeat Purchase Rate
- Monthly Item Sales Growth

## 6. 분석 범위

분석 기간:

2017-09-01 이상
2018-09-01 미만

유효 주문:

order_status = delivered

기본 분석 단위:

- 고객 식별: customer_unique_id
- 주문: order_id 1개당 1행
- 주문상품: (order_id, order_item_id) 1개당 1행
- 상품: product_id 1개당 1행

최종 KPI 분석에서는 질문에 따라
월, 고객, 상품 카테고리와 고객 지역 단위로 집계한다.

## 7. 주요 데이터

customers:

- customer_id
- customer_unique_id
- customer_state

orders:

- order_id
- customer_id
- order_purchase_timestamp
- order_status

order_items:

- order_id
- order_item_id
- product_id
- price
- freight_value

products:

- product_id
- product_category_name

category_translation:

- product_category_name
- product_category_name_english

## 8. Item Sales 정의

Olist 데이터에는 명시적인 할인 금액과 환불 금액이 제공되지 않는다.

따라서 본 프로젝트에서는 회계적 Net Sales를 계산하지 않는다.

Item Sales는 다음과 같이 정의한다.

Item Sales = SUM(order_items.price)

freight_value는 Item Sales에 포함하지 않고
배송비 지표로 별도 관리한다.

## 9. 분석 한계

- 판매 채널 데이터가 존재하지 않는다.
- 명시적인 할인 금액이 존재하지 않는다.
- 명시적인 환불 금액이 존재하지 않는다.
- 명시적인 quantity 컬럼이 존재하지 않는다.
- delivered 주문을 완료된 판매 활동의 대리 기준으로 사용한다.
- 실제 환불이나 사후 취소를 완전히 반영하는 회계적 Net Sales가 아니다.
- 관찰 데이터의 관계를 인과관계로 해석하지 않는다.