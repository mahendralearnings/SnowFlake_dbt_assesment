WITH weather_ranked AS (
    SELECT
        w.airport_code,
        w.ts,
        w.temperature,
        l.flight,
        l.callsign,
        l.model,
        l.tail,
        l.touchdown_time,
        l.pilot_id,
        ROW_NUMBER() OVER (
            PARTITION BY l.flight
            ORDER BY w.ts DESC
        ) AS rn
    FROM {{ ref('stg_landing') }} l
    JOIN {{ ref('stg_weather') }} w
      ON w.airport_code = l.airport_code
     AND w.ts <= l.touchdown_time
)

SELECT
    flight,
    callsign,
    model,
    tail,
    touchdown_time,
    pilot_id,
    airport_code,
    temperature AS latest_temperature
FROM weather_ranked
WHERE rn = 1
