# SQL Customer Transaction Analysis

## What This Project Solves

This project answers practical business questions that commonly appear in analytics work:

1. **Monthly performance tracking**
   - How many transactions happen each month?
   - What is the total transaction amount per month?

2. **Customer-level behavior metrics**
   - For each customer, how many transactions did they make?
   - What is their total and average transaction amount?

3. **Complete customer coverage (including no-transaction customers)**
   - How do metrics look when we include customers who never transacted?
   - How do we correctly represent "0 transactions" and "0 amount" in SQL?

4. **Segment comparison (active vs inactive)**
   - Do active customers transact more than inactive customers?
   - How do transaction counts and total amounts differ by customer status?

5. **Identifying non-transacting customers**
   - Which customers have never made a transaction?

## Tech Stack

- PostgreSQL
- SQL (aggregation, joins, NULL handling, basic date functions)

## Dataset Overview

The dataset is simulated to reflect a typical relational structure used in real analytics projects.

### Tables

**customers**
- `customer_id` (*Primary Key*)
- `signup_date`
- `customer_status` (e.g., `active`, `inactive`)

**transactions**
- `transaction_id` (*Primary Key*)
- `customer_id` (*Foreign Key* -> customers.customer_id)
- `transaction_date`
- `amount`

## Project Structure

```
sql-customer-transaction-analysis/
├── schema.sql
├── seed_data.sql
├── analysis/
│   ├── 01_monthly_transaction_metrics.sql
│   ├── 02_customer_transaction_metrics.sql
│   ├── 03_customer_metrics_all_customers.sql
│   ├── 04_transaction_performance_by_status.sql
│   └── 05_customers_with_no_transactions.sql
└── README.md
```

## How to Run (PostgreSQL)

1. Create a database (example name: `sql_practice`).
2. Run scripts in this order:
   1) `schema.sql`  
   2) `seed_data.sql`
3. Run any query in the `analysis/` folder.


## Analysis Files (What Each One Does)

### analysis/01_monthly_transaction_metrics.sql
Computes monthly transaction count and total amount using:
- `date_trunc('month', transaction_date)`
- `COUNT(*)`, `SUM(amount)`
- `GROUP BY month`

### analysis/02_customer_transaction_metrics.sql
Computes customer-level metrics (one row per customer, based on transactions):
- transaction count
- total transaction amount
- average transaction amount

### analysis/03_customer_metrics_all_customers.sql
Returns customer metrics **for all customers**, including those with zero transactions:
- `customers` as the main table
- `LEFT JOIN` to `transactions`
- `COALESCE` to convert NULL aggregates to 0

### analysis/04_transaction_performance_by_status.sql
Compares performance by `customer_status` (active vs inactive), including:
- total customers per status
- customers with at least one transaction
- transaction count and total transaction amount

### analysis/05_customers_with_no_transactions.sql
Identifies customers who have never made a transaction using:
- `LEFT JOIN` + `WHERE t.transaction_id IS NULL`
