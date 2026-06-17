{{
  config(
    materialized = 'table',
    tags = ['staging']
  )
}}

SELECT
  aircraft_code,
  seat_no,
  fare_conditions
FROM 
  {{ source('demo_src', 'seats') }}
