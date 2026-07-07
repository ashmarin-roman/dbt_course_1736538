{{
  config(
    materialized = 'table',
    )
}}

select
    flight_id,
    flight_no,
    scheduled_departure,
    scheduled_arrival,
    departure_airport AS departure_airport_id,
    arrival_airport AS arrival_airport_id,
    status,
    aircraft_code AS aircraft_id,
    actual_departure,
    actual_arrival,
    current_timestamp AS load_date
from
    {{ ref('stg_flights__facts__flights') }}