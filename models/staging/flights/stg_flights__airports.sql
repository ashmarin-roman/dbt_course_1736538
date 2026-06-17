{{ 
  config(
    materialized = 'table',
    tags = ['staging', 'flights']
) }}

SELECT
  airport_code,
  airport_name,
  city,
  coordinates,
  timezone
FROM {{ source('demo_src', 'airports') }}
