{{ config(
    materialized='table',
    tags=['staging', 'flights_facts']
) }}

select
  ticket_no,
  flight_id,
  fare_conditions,
  amount
from {{ source('demo_src_facts', 'ticket_flights') }}