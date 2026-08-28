# Sales Analysis - Analysis Plan

## Phase 1 - Data Selection

- 공개 데이터 후보 탐색
- 데이터 출처 확인
- 이용 조건 확인
- 분석 기간 확인
- 필수 컬럼 존재 여부 확인
- 데이터 크기 확인

## Phase 2 - Data Quality

- 행 수 확인
- Primary Key 중복 확인
- Foreign Key 미매칭 확인
- 날짜 범위 확인
- 주문 상태 확인
- 수량과 가격 범위 확인
- 결측값 확인

## Phase 3 - SQL Analysis Table

주문상품 단위 데이터를 주문 단위로 집계한다.

확인:

- Order Sales
- Quantity
- Discount
- Product Category

주문과 고객 정보를 연결한다.

JOIN 이후:

- 행 수
- 주문 ID 중복
- 합계 변화

를 반드시 검증한다.

## Phase 4 - KPI

월별:

- Net Sales
- Order Count
- Buyer Count
- Average Order Value
- Orders per Buyer
- Monthly Growth

## Phase 5 - Segmentation

- Product Category
- Channel
- New vs Existing Customer
- Repeat Customer

## Phase 6 - Interpretation

매출 변화를:

- Buyer Count
- Purchase Frequency
- Average Order Value

관점으로 분해한다.

## Phase 7 - Business Recommendation

- 유지 대상
- 회복 대상
- 상품 우선순위
- 채널 점검 대상

을 근거와 함께 제안한다.

## Phase 8 - Limitations

- 데이터 범위
- 환불/비용 포함 여부
- 관찰 데이터의 인과 한계
- 계절성
- 외부 요인