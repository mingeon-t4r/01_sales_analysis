# Sales Analysis - Data Selection

## 1. Selected Dataset

Brazilian E-Commerce Public Dataset by Olist

Source:
Kaggle / Olist

Dataset Identifier:
olistbr/brazilian-ecommerce

Data Type:
Real commercial ecommerce data, anonymized

Period:
2016-2018

License:
CC BY-NC-SA 4.0

## 2. Selection Reason

This dataset was selected because it provides
relational ecommerce data that can support:

- monthly sales analysis
- customer purchase analysis
- repeat purchase analysis
- product category analysis
- SQL JOIN practice
- customer and order level KPI analysis

## 3. Main Files

- olist_customers_dataset.csv
- olist_orders_dataset.csv
- olist_order_items_dataset.csv
- olist_products_dataset.csv
- product_category_name_translation.csv

Optional:

- olist_order_payments_dataset.csv
- olist_sellers_dataset.csv
- olist_order_reviews_dataset.csv
- olist_geolocation_dataset.csv

## 4. Key Mapping

Repeat Customer Key:
customer_unique_id

Order Key:
order_id

Order Date:
order_purchase_timestamp

Order Status:
order_status

Product Key:
product_id

Product Category:
product_category_name

Item Price:
price

## 5. Known Limitations

The dataset does not directly provide:

- sales channel
- explicit discount amount
- explicit refund amount
- explicit quantity column

Therefore the project will not claim
accounting Net Sales.

The initial sales metric will be defined as:

Item Sales = SUM(price)

The channel analysis originally planned
will be removed or replaced by
customer region analysis.

## 6. Next Step

Day 40 will validate:

- row count
- data types
- missing values
- duplicate keys
- foreign key matching
- date range
- order status
- price range
- actual usable analysis period