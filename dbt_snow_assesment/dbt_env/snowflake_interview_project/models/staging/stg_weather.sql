SELECT
  v:ts::timestamp AS ts,
  v:airportCode::string AS airport_code,
  v:temperature::float AS temperature
FROM {{ source('raw', 'weather_json') }}
