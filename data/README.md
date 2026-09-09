# Data

## Dataset

Brazilian E-Commerce Public Dataset by Olist

Source:

Kaggle / Olist

Dataset identifier:

olistbr/brazilian-ecommerce

## Required Files

Place the following files in:

data/raw/olist/

Required CSV files:

- olist_customers_dataset.csv
- olist_orders_dataset.csv
- olist_order_items_dataset.csv
- olist_products_dataset.csv
- product_category_name_translation.csv

## Local Data Structure

data/
├── README.md
├── raw/
│   └── olist/
│       └── raw CSV files
└── processed/
    └── olist.db

Raw and processed data are excluded from Git.

## Analysis Scope

Analysis period:

2017-09-01 <= order_purchase_timestamp < 2018-09-01

Included orders:

order_status = delivered

Customer key:

customer_unique_id

Item Sales:

SUM(order_items.price)

freight_value is excluded from Item Sales.