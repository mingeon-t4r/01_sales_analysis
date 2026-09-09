# Reproducibility Check

## Environment

- OS: Windows
- Python: 3.13
- SQLite
- Jupyter Notebook

## Data

Olist Brazilian E-Commerce Public Dataset

Raw data location:

data/raw/olist/

Processed database:

data/processed/olist.db

## Execution Order

1. 01_data_check.ipynb
2. 02_build_olist_sqlite.ipynb
3. sql/01_build_sales_analysis_tables.sql
4. 03_monthly_kpi_analysis.ipynb
5. 04_category_performance_analysis.ipynb
6. 05_customer_segment_analysis.ipynb
7. 06_customer_region_analysis.ipynb

## Validation Results

- 2017-11 Item Sales: 987,765.37
- 2017-12 Item Sales: 726,033.19
- Eligible 90-day customers: 54,038
- 90-day repeat customers: 693
- 90-day repeat rate: 1.28%
- SP Item Sales: 3,976,325.47

## Result

Reproduction successful:

Yes

## Notes

-