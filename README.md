# Modular ETL Project with SQL and dbt

This project demonstrates a modular ETL (Extract, Transform, Load) pipeline using SQL and dbt, with DuckDB as the database engine. The project is structured to follow dbt-style transformation principles, with clear staging, modeling, and final layers.

## Project Overview

The project uses the Jaffle Shop dataset, a fictional e-commerce store. The ETL pipeline performs the following steps:

1.  **Extract**: Raw data is loaded from CSV files into the database.
2.  **Stage**: Data is cleaned, columns are renamed, and types are cast.
3.  **Model**: Data is transformed with business logic, including aggregations and joins.
4.  **Final**: Final tables are created, ready for analytics or machine learning.

## Tooling and Setup

- **dbt**: Used for SQL-based transformations.
- **DuckDB**: A fast, in-process analytical database.
- **Python**: Used for executing the ETL pipeline and for data analysis in a Jupyter notebook.

### Setup Instructions

1.  **Clone the repository**:
    ```bash
    git clone <repository-url>
    cd <repository-name>
    ```

2.  **Install dependencies**:
    ```bash
    pip install -r requirements.txt
    ```

3.  **Run the ETL pipeline**:
    ```bash
    make run
    ```

## Sample Queries

Here are some sample queries you can run against the final tables:

**Get the top 10 customers by order value:**

```sql
SELECT
    customer_id,
    total_order_amount
FROM
    final.customers
ORDER BY
    total_order_amount DESC
LIMIT 10;
```

**Get the number of orders per month:**

```sql
SELECT
    strftime('%Y-%m', order_date) AS month,
    COUNT(*) AS num_orders
FROM
    final.orders
GROUP BY
    1
ORDER BY
    1;
```

## Dashboard Examples

The Jupyter notebook in the `notebooks/` directory contains examples of how to query the final tables and visualize the results.
