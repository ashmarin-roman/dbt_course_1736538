{{ config(
    materialized = 'table',
    tags = ['staging', 'flights']
) }}
SELECT
    aircraft_code,
    model,
    "range"
FROM
    {{ source('demo_src', 'aircrafts') }} 