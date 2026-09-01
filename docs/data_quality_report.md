# Olist Data Quality Report

## Data Structure

### 데이터 구조

- customers: (99441, 5)
- orders: (99441, 8)
- order_items: (112650, 7)
- products: (32951, 9)
- category_translation: (71, 2)

### Key 검증

- customers.customer_id 중복: 0
- customers.customer_unique_id 고유 고객 수: 96,096
- orders.order_id 중복: 0
- order_items.order_id 반복 행 수: 13,984
- order_items의 (order_id, order_item_id) 중복: 0
- products.product_id 중복: 0

### Foreign Key 검증

- orders → customers 미매칭: 0
- order_items → orders 미매칭: 0
- order_items → products 미매칭: 0
- products → category translation 미매칭: 13

### 날짜

- 최초 주문일: 2016-09-04
- 마지막 주문일: 2018-10-17
- 날짜 변환 실패: 0
- 실제 분석 기간: 2017-09-01 ~ 2018-08-31

### 주문 상태

존재하는 주문 상태: 

- delivered      96478
- shipped         1107
- canceled         625
- unavailable      609
- invoiced         314
- processing       301
- created            5
- approved           2

### 가격

- 최소 가격: 0.85
- 최대 가격: 6735.00
- 음수 가격: 0
- 0 가격: 0

### 핵심 해석

Olist 데이터는 주문, 주문상품, 고객과 상품 테이블을
관계형 구조로 연결할 수 있는 데이터이다.

orders와 order_items는 Grain이 다르므로
JOIN 이후 행 수 증가를 정상적인 주문상품 확장과
비정상적인 중복으로 구분해야 한다.

customer_id와 customer_unique_id의 역할이 다르므로
주문 연결에는 customer_id를 사용하고,
실제 고객 단위 재구매 분석에는 customer_unique_id를 사용해야 한다.

실제 분석에 사용하기 전에
주문 상태와 분석 기간을 추가로 정의해야 한다.