# Makefile for the ETL project

# Variables
DBT_PROFILE_DIR = .
DBT_PROJECT_DIR = .

# Targets
.PHONY: all install run test notebook clean

all: install run test notebook

install:
	pip install --upgrade pip
	pip install -r requirements.txt

run:
	dbt seed --profiles-dir $(DBT_PROFILE_DIR) --project-dir $(DBT_PROJECT_DIR)
	dbt run --profiles-dir $(DBT_PROFILE_DIR) --project-dir $(DBT_PROJECT_DIR)

test:
	dbt test --profiles-dir $(DBT_PROFILE_DIR) --project-dir $(DBT_PROJECT_DIR)

notebook:
	jupyter nbconvert --to notebook --execute notebooks/etl_and_analysis.ipynb

clean:
	rm -rf target dbt_modules logs jaffle_shop.duckdb*
