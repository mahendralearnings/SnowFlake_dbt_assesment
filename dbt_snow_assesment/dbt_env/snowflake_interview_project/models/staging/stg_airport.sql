SELECT
  v:airportCode::string AS airport_code,
  v:AirportFriendlyName::string AS airport_name,
  v:Latitude::float AS latitude,
  v:Longitude::float AS longitude
FROM {{ source('raw', 'airport_json') }}
