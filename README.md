# Snowflake + DBT Assessment

This project demonstrates an end-to-end data engineering solution using **Snowflake** and **dbt**.

## ✅ What It Covers

- JSON ingestion and parsing with `VARIANT` columns
- Data flattening using dbt staging models
- Pilot SCD2 tracking using `dbt snapshot`
- Latest weather data join using `ROW_NUMBER()` 
- Final views for different access levels (masked/unmasked)

## 🧱 Data Model Layers

### 🧩 Raw
- JSON files loaded into Snowflake (`landing_json`, `weather_json`, etc.)

### 🧩 Staging
- `stg_landing`, `stg_weather`, `stg_pilot`, `stg_airport`

### 🧩 Intermediate
- `fact_landing_with_weather`: enriches landings with weather

### 🧩 Snapshot
- `pilot_snapshot`: SCD Type 2 tracking of pilot info

### 🧩 Final Views
- `final_unmasked_landing`: Internal use, full details
- `final_masked_landing`: External/reporting view
- `dim_current_pilot`: Latest snapshot version of pilots

## 🛠️ How to Run

1. Clone this repo:
   ```bash
   git clone https://github.com/mahendralearnings/SnowFlake_dbt_assesment.git
   cd SnowFlake_dbt_assesment
