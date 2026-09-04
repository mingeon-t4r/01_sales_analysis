# Sales Analysis

온라인 쇼핑몰의 최근 12개월 상품 판매금액(Item Sales) 변화를
구매고객 수, 고객당 주문 수와 주문당 상품 판매금액으로 분해하고,
상품 카테고리·고객 지역·고객군별 성과를 분석하는 포트폴리오 프로젝트입니다.

## Project Goal

단순히 매출 증감만 확인하는 것이 아니라
매출 변화가 어떤 구성 요소에서 발생했는지 분석하고
다음 분기의 우선 관리 대상을 제안합니다.

## Core Questions

1. 월별 Item Sales는 어떻게 변화했는가?
2. 변화는 구매고객 수, 고객당 주문 수와 주문당 상품 판매금액 중 어디에서 발생했는가?
3. 어떤 상품군과 고객 지역이 성과 변화를 주도했는가?
4. 신규/기존 및 재구매 고객의 매출 기여는 어떻게 다른가?
5. 다음 분기 어떤 대상을 우선 관리해야 하는가?

## Core Metrics

- Item Sales
- Order Count
- Buyer Count
- Average Item Sales per Order
- Orders per Buyer
- Repeat Purchase Rate
- Monthly Growth

## Data Source

Brazilian E-Commerce Public Dataset by Olist

- Real commercial ecommerce data
- Anonymized
- Period: 2016-2018
- Source: Kaggle / Olist
- License: CC BY-NC-SA 4.0

Raw data is not included in this repository.

## Key Findings

- Item Sales의 최대 월간 증가는 2017년 11월에 발생했으며 Buyer Count 증가가 함께 나타났다.
- 11월 성장에는 bed_bath_table, health_beauty 카테고리의 Item Sales 증가가 크게 기여했다.
- 12월 감소에는 bed_bath_table, computers_accessories 카테고리의 감소폭이 크게 나타났다.
- 신규 고객은 전체 Buyer의 99.23%를 차지했으며, 관찰 가능한 신규 고객의 90일 재구매율은 1%였다.

## Project Status

🟡 Customer lifecycle analysis completed / customer region analysis pending