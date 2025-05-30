SELECT
  v:pilotId::int AS pilot_id,
  v:pilotFirstName::string AS first_name,
  v:pilotSecondName::string AS last_name,
  v:grade::int AS grade,
  v:dob::string AS dob,
  v:favoriteFood::string AS favorite_food
FROM {{ source('raw', 'pilot_json') }}
