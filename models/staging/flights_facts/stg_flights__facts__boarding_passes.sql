{{ config(
    materialized='table',
    tags=['staging', 'flights_facts']
) }}
select
    ticket_no,
    flight_id,
    boarding_no,
    seat_no
from {{ source('demo_src_facts', 'boarding_passes') }}
