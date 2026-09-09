# Customer Region Findings

## Definition

Customer Region:

customers.customer_state

Analysis Period:

2017-09-01 <= order_purchase_timestamp < 2018-09-01

Included Orders:

delivered

## Overall Performance

### Top States by Item Sales

1. SP
2. RJ
3. MG
4. RS
5. PR

### Sales Concentration

- Top 1 State Share: 39.03%
- Top 5 State Share: 74.32%

## Customer Scale and Purchase Intensity

### High Buyer Count States

- SP: 30937 Buyers

### High Item Sales per Buyer States

- PB: 232.82 (377 Buyers)

Key Interpretation: PB는 Item Sales per Buyer가 가장 높았지만 Buyer 규모가 작으므로 일부 고액 주문의 영향을 받을 수 있다. 따라서 지역 우선순위는 전체 Item Sales와 Buyer Count를 함께 고려한다.

- SP의 Item Sales per Buyer는 128.53으로, 높은 Item Sales 규모가 고객당 판매금액보다는 큰 Buyer 기반과 함께 나타났다.

## November 2017 Growth

Total Item Sales Change:

+339,517.72

Largest Positive State Changes:

1. SP
2. RJ
3. MG
4. RS
5. SC

Key Interpretation:

- 11월 성장은 신규 구매고객 확대와 주요 지역의 판매 확대가 동시에 나타난 시기로 볼 수 있다.

## December 2017 Decline

Total Item Sales Change:

-261,732.18

Largest Negative State Changes:

1. SP
2. MG
3. RJ
4. PR
5. RS

Key Interpretation:

- 12월 감소는 신규 구매고객 규모 축소와 주요 지역의 판매 감소가 함께 나타난 것으로 해석할 수 있다.

## Limitations

- customer_state represents the customer state attached to the order.
- Geographic differences do not establish causal effects.
- Marketing spend and acquisition channel by state are unavailable.
- Product mix and price mix may differ across states.
- Buyer counts across states should not be summed to reproduce overall unique buyers.