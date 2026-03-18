## ETL Decisions :

### Decision 1 — Standard & Unified Date Parsing :

**Problem:** The raw data contained three different date formats: `DD/MM/YYYY`, `DD-MM-YYYY`, and `YYYY-MM-DD`. Standard SQL loaders often fail when encountering mixed formats in a single column.

**Resolution:** During the ETL process, I tried convert the date  entries into a standardized `ISO 8601` format (`YYYY-MM-DD`) before loading them into the `dim_date` and `fact_sales` tables.

### Decision 2 — Categorical Data Normalization :

**Problem:** The `category` column had inconsistent casing (e.g., 'electronics' vs 'Electronics') and inconsistent naming (e.g., 'Grocery' vs 'Groceries'). This would lead to duplicated entries.

**Resolution:** I followed a two ways to normalize this issue. First,by  capitalizing the first letter of every category string. and next by mapping all variations of food-related products to a single standard value,"Groceries". This ensures to avoid unwated duplication and ensure proper aggregation of data while using `GROUP BY` operations.

### Decision 3 — Missing Attribute Inference :

**Problem:** There where 'NULL' on values in the `store_city` column, even though the `store_name` was provided.

**Resolution:** I implemented a lookup strategy. I built a mapping of `store_name` to `store_city` from the valid rows in the dataset and used this dictionary to fill the missing city values. This preserved data integrity for geographic-based analysis (like Q2) without having to discard valid transaction records.







