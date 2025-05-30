
--final_unmasked:we may  Used for internal users/data science
SELECT
  l.flight,
  l.touchdown_time,
  l.airport_code,
  l.latest_temperature,
  p.first_name,
  p.last_name,
  p.grade,
  p.favorite_food
FROM {{ ref('fact_landing_with_weather') }} l
JOIN {{ ref('pilot_snapshot') }} p
  ON l.pilot_id = p.pilot_id
WHERE p.dbt_valid_to IS NULL
