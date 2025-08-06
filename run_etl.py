# run_etl.py

import os
import duckdb

def run_sql_scripts(path):
    for filename in sorted(os.listdir(path)):
        if filename.endswith(".sql"):
            with open(os.path.join(path, filename), "r") as f:
                query = f.read()
                print(f"Running {filename}...")
                duckdb.sql(query)

# Adjust folders accordingly
run_sql_scripts("sql/staging")
run_sql_scripts("sql/models")
run_sql_scripts("sql/final")
