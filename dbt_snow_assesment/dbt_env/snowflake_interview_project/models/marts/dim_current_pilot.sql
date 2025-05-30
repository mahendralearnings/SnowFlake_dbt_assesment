--to get the current pilio records 

SELECT *
FROM {{ ref('pilot_snapshot') }}
WHERE dbt_valid_to IS NULL
