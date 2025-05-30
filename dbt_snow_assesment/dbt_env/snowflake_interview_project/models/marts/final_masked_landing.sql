--final_masked: we may used for Used for sharing with restricted/business users

SELECT
  l.flight,
  l.touchdown_time,
  l.airport_code,
  l.latest_temperature,
  p.grade
FROM {{ ref('fact_landing_with_weather') }} l
JOIN {{ ref('pilot_snapshot') }} p
  ON l.pilot_id = p.pilot_id
WHERE p.dbt_valid_to IS NULL