# Business Recommendations

## Decision Context

본 분석은 최근 완전 12개월의
Item Sales 변화를 고객 수, 구매 빈도,
주문당 판매금액과 세그먼트별 성과로 분해하여

다음 운영 기간의 우선 관리 대상을
제안하는 것을 목적으로 한다.

---

## 1. Executive Summary

- 2017년 11월 Item Sales는 전월 대비 52.4% 증가했다.
- 2017년 12월 Item Sales는 전월 대비 26.5% 감소했다.
- 두 달 모두 Item Sales 변화와 Buyer Count 변화가 크게 함께 나타났다.
- 분석기간 전체 Buyer 중 first-observed New Customer 비중은 99.23%였다.
- 관찰 가능한 신규 고객의 90일 재구매율은 1.28%였다.
- SP는 전체 Item Sales의 39.03%를 차지했다.
- 상품과 지역 모두 일부 주요 세그먼트에 Item Sales가 집중되어 있었다.

---

## 2. Maintain Targets

### Customer Region

SP

Evidence:

- Item Sales Share: 39.03%
- Largest Buyer base
- November Item Sales Change: +130,986.10
- December Item Sales Change: -75,838.44

Interpretation:

SP는 고객당 Item Sales가 특별히 높아서라기보다
큰 Buyer 기반을 바탕으로 전체 판매 규모가 큰 핵심 지역이다.

Recommendation:

SP를 다음 운영 기간의 핵심 모니터링 지역으로 유지하고,
Buyer Count와 Item Sales 변화를 함께 추적한다.

---

### Product Categories

- health_beauty
- watches_gifts
- bed_bath_table

Evidence:

전체 12개월 Item Sales 상위 카테고리이다.

Recommendation:

상위 판매 카테고리는 유지 대상으로 두되,
단순 매출 규모뿐 아니라 월별 변동성과
Buyer 변화도 함께 점검한다.

---

## 3. Recovery Review Targets

December State × Category 분석 결과:

1. SP x bed_bath_table
2. SP x furniture_decor
3. SP x watches_gifts
4. SP x health_beauty
5. SP x computers_accessories

Interpretation:

12월 전체 감소는 Buyer Count 축소와 함께 나타났으며,
일부 대형 지역과 주요 상품 카테고리의
판매금액 감소폭도 크게 나타났다.

Recommendation:

전체 지역 또는 전체 상품을 대상으로 대응하기보다,
State × Category 기준 절대 감소액이 큰 조합부터
우선 원인을 점검한다.

---

## 4. Retention Validation

Evidence:

- Overall First-observed New Buyer Share: 99.23%
- Eligible New Customers: 54,038
- 90-day Repeat Customers: 693
- 90-day Repeat Rate: 1.28%

Interpretation:

현재 데이터에서는 전체 Buyer와 Item Sales가
신규 고객에 매우 크게 의존하는 구조가 관찰됐다.

Recommendation:

즉시 CRM 투자를 확대한다고 결론내리기보다,
90일 재구매율을 카테고리와 코호트별로 분해하여
반복 구매 가능성이 상대적으로 높은 세그먼트를
추가 검증한다.

---

## 5. Additional Data Required

더 구체적인 실행 결정을 위해 필요한 데이터:

- 광고비 및 고객 획득 채널
- 프로모션 및 쿠폰 정보
- 상품 재고
- 원가와 마진
- 실제 환불 금액
- 고객 접촉 및 CRM 캠페인 기록

---

## 6. Limitations

- Item Sales is not accounting Net Sales.
- First Purchase is the first observed purchase in the available data.
- Product cost and margin are unavailable.
- Marketing and promotion exposure are unavailable.
- Observed relationships do not establish causal effects.
- Seasonal and external factors are not directly observed.

---

## 7. Priority Summary

### Maintain

- SP
- 주요 Item Sales 상위 카테고리

### Recovery Review

- SP x bed_bath_table
- State × Category 분석에서
  절대 감소폭이 큰 조합

### Validate

- New Customer → 90-day Repeat 전환
- 지역 및 카테고리별 재구매 차이
