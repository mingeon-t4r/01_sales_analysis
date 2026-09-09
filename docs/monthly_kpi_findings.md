# Monthly KPI Findings

## Analysis Period

2017-09-01 <= order_purchase_timestamp < 2018-09-01

Included orders:

delivered

## KPI Definition

Item Sales = SUM(item_price)

Item Sales is decomposed as:

Buyer Count
× Orders per Buyer
× Average Item Sales per Order

## Key Findings

1. 가장 큰 Item Sales 증가 월: 2017년 11월
   - Item Sales Growth: 52.4%
   - Buyer Growth: 62.6%
   - Orders per Buyer Growth: 0.1%
   - Avg Item Sales per Order Growth: -6.4%

2. 가장 큰 Item Sales 감소 월: 2017년 12월
   - Item Sales Growth: -26.5%
   - Buyer Growth: -24.1%
   - Orders per Buyer Growth: -0.3%
   - Avg Item Sales per Order Growth: -2.8%

3. 핵심 해석:
   - Item Sales의 큰 월간 변동은 Orders per Buyer나 Average Item Sales per Order보다 Buyer Count 변화와 더 크게 함께 나타났다.

## Limitations

- Item Sales is not accounting Net Sales.
- Explicit discount and refund data are unavailable.
- The decomposition identifies arithmetic components, not causal effects.
- Seasonality and external factors are not directly observed.
