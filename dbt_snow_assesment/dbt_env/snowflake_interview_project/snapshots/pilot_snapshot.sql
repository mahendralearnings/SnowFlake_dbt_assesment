

{% snapshot pilot_snapshot %}
{{
    config(
        target_schema='raw',
        unique_key='pilot_id',
        strategy='timestamp',
        updated_at='updated_at',
        invalidate_hard_deletes=True
    )
}}

SELECT
    pilot_id,
    first_name,
    last_name,
    grade,
    dob,
    favorite_food,
    CURRENT_TIMESTAMP() AS updated_at
FROM {{ ref('stg_pilot') }}

{% endsnapshot %}
