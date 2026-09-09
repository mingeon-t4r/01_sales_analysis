# Olist Sales Analysis Final Report

## 1. Executive Summary

최근 완전 12개월 Olist delivered 주문을 분석한 결과,
Item Sales의 가장 큰 월간 증가는 2017년 11월,
가장 큰 감소는 2017년 12월에 나타났다.

11월 Item Sales는 52.4% 증가했고
Buyer Count는 62.6% 증가했다.

12월 Item Sales는 26.5% 감소했고
Buyer Count는 24.1% 감소했다.

구매 빈도와 주문당 판매금액보다
Buyer Count 변화가 Item Sales 변화와 더 크게 함께 나타났다.

---

## 2. Data and Metric Definition

분석기간:

2017-09-01 <= order_purchase_timestamp < 2018-09-01

유효 주문:

order_status = delivered

Customer:

customer_unique_id

Item Sales:

SUM(order_items.price)

본 프로젝트의 Item Sales는
할인·환불 금액이 반영된 회계적 Net Sales가 아니다.

---

## 3. Monthly Sales Dynamics

2017년 11월:

- Item Sales Growth: +52.4%
- Buyer Growth: +62.6%
- Orders per Buyer Growth: +0.1%
- Average Item Sales per Order Growth: -6.4%

2017년 12월:

- Item Sales Growth: -26.5%
- Buyer Growth: -24.1%
- Orders per Buyer Growth: -0.3%
- Average Item Sales per Order Growth: -2.8%

해석:

두 달의 Item Sales 변화는
고객당 주문 빈도나 주문당 판매금액보다
Buyer 규모 변화와 더 크게 함께 나타났다.

---

## 4. Product Category

전체 Item Sales 상위 카테고리:

1. health_beauty
2. watches_gifts
3. bed_bath_table
4. sports_leisure
5. computers_accessories

Top 5 카테고리는 전체 Item Sales의 40.50%를 차지했다.

11월 증가폭 상위:

- bed_bath_table
- health_beauty
- furniture_decor
- watches_gifts
- toys

12월 감소폭 상위:

- bed_bath_table
- computers_accessories
- furniture_decor
- watches_gifts
- cool_stuff

---

## 5. Customer Lifecycle

분석기간 전체 Buyer 중
first-observed New Customer 비중은 99.23%였다.

90일을 온전히 관찰할 수 있는 신규 고객:

54,038명

90일 내 재구매 고객:

693명

90일 재구매율:

1.28%

11월 Item Sales 변화:

- New Customer: +335,841.68
- Existing Customer: +3,676.04

12월 Item Sales 변화:

- New Customer: -262,770.48
- Existing Customer: +1,038.30

따라서 분석기간의 큰 Item Sales 변동은
기존 고객보다 신규 구매고객 규모 변화와
더 크게 함께 나타났다.

---

## 6. Customer Region

Item Sales 상위 지역:

1. SP
2. RJ
3. MG
4. RS
5. PR

SP는 전체 Item Sales의 39.03%를 차지했다.

Top 5 State는 전체 Item Sales의 74.32%를 차지했다.

11월 증가폭이 가장 큰 지역:

- SP
- RJ
- MG

12월 감소폭이 가장 큰 지역:

- SP
- MG
- RJ

SP는 고객당 Item Sales가 특별히 높아서라기보다
큰 Buyer 기반과 함께 전체 판매 규모가 크게 나타난 지역이다.

---

## 7. Business Priorities

### Maintain

- SP
- 주요 Item Sales 상위 카테고리

### Recovery Review

State × Category 교차 분석에서
절대 감소폭이 큰 조합을 우선 점검한다.

특히 2017년 12월에는
SP × bed_bath_table 조합이 우선 검토 대상으로 나타났다.

### Validate

신규 고객 의존과 낮은 관찰 재구매율이 확인됐으므로
카테고리·코호트별 90일 재구매 차이를 추가 검증한다.

---

## 8. Additional Data Required

- 고객 획득 채널
- 광고비
- 쿠폰과 프로모션
- 재고
- 원가
- 마진
- 실제 환불 금액
- CRM 캠페인

---

## 9. Limitations

- Item Sales is not accounting Net Sales.
- First Purchase is first observed purchase.
- Historical purchases before the dataset are unavailable.
- Marketing exposure is unavailable.
- Cost and margin are unavailable.
- Observational relationships are not causal effects.
- Seasonality cannot be isolated from the current analysis.

---

## 10. Conclusion

본 프로젝트에서는 Item Sales 변화를
전체 추세만 확인하는 데서 끝내지 않고,

Buyer Count,
상품 카테고리,
고객 생애주기,
고객 지역

순으로 분해했다.

그 결과 다음 운영 기간에는
대규모 판매 기반을 유지하면서,
절대 감소폭이 큰 세그먼트를 우선 점검하고,
신규 고객의 재구매 가능성을 추가 검증하는
세 단계의 우선순위를 제안했다.