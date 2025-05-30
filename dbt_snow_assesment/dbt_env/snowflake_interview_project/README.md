# Snowflake + DBT Assessment

This project demonstrates a complete data pipeline using Snowflake and dbt to fulfill a real-world data engineering use case.

## ✅ Project Structure

- **Raw Layer**: JSON files ingested as VARIANT columns
- **Staging Layer**: Flattened models for Landing, Weather, Pilot, Airport
- **Intermediate Layer**: `fact_landing_with_weather` joins latest weather per flight
- **Snapshot Layer**: `pilot_snapshot` tracks historical pilot changes (SCD2)
- **Final Views**:
  - `final_unmasked_landing`: PII available
  - `final_masked_landing`: PII hidden
  - `dim_current_pilot`: current snapshot version only

## 📦 Tools Used

- Snowflake (Free Trial)
- dbt (CLI, open source)
- Git / GitHub

## 🛠 How to Run

1. Clone the repo
2. Set up your Snowflake credentials in `profiles.yml`
3. Run the following:
```bash
dbt deps
dbt run
dbt snapshot
