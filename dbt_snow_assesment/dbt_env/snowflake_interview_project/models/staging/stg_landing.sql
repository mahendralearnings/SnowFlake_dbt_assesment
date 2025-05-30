SELECT
  v:flight::string AS flight,
  v:callsign::string AS callsign,
  v:model::string AS model,
  v:tail::string AS tail,
  TRY_TO_TIMESTAMP(v:touchdown_time::string) AS touchdown_time,
  v:pilotId::int AS pilot_id,
  v:airportCode::string AS airport_code
FROM {{ source('raw', 'landing_json') }}
