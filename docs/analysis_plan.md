# Sales Analysis - Analysis Plan

## Phase 1 - Data Selection ✅ Completed

- 공개 데이터 후보 탐색
- 데이터 출처 확인
- 이용 조건 확인
- 분석 기간 확인
- 필수 컬럼 존재 여부 확인
- 데이터 크기 확인

## Phase 2 - Data Quality ✅ Completed

- 행 수 확인
- Primary Key 중복 확인
- Foreign Key 미매칭 확인
- 날짜 범위 확인
- 주문 상태 확인
- 수량과 가격 범위 확인
- 결측값 확인

## Phase 3 - SQL Analysis Tables ✅ Completed

Item-level analysis table:

- Order ID
- Customer ID
- Customer Unique ID
- Order Timestamp
- Customer State
- Product ID
- Product Category
- Item Price
- Freight Value

Order-level analysis table:

- Item Sales
- Freight Total
- Item Row Count
- Distinct Product Count

JOIN 이후 반드시 확인:

- 행 수
- 고유 Order ID 수
- Composite Key 중복
- Item Sales 합계

## Phase 4 - KPI ✅ Completed

월별:

- Item Sales
- Order Count
- Buyer Count
- Average Item Sales per Order
- Orders per Buyer
- Monthly Growth

## Phase 5 - Segmentation ✅ Completed

- Product Category ✅
- Customer Region ✅
- New vs Existing Customer ✅
- Repeat Customer ✅

## Phase 6 - Interpretation ✅ Completed

Item Sales 변화를:

- Buyer Count
- Purchase Frequency
- Average Item Sales per Order
- Product Category
- Customer Lifecycle
- Customer Region

관점으로 통합 해석했다.

## Phase 7 - Business Recommendation ✅ Completed

- 유지 대상
- 회복 검토 대상
- 재구매 추가 검증 대상
- 추가 필요 데이터

를 분석 근거와 함께 제안했다.

## Phase 8 - Limitations 🟡 In Progress

- 데이터 범위
- 환불/비용 포함 여부
- 관찰 데이터의 인과 한계
- 계절성
- 외부 요인