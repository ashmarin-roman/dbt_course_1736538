{{
  config(
    materialized = 'table',
    )
}}

select
    tf.ticket_no,
    tf.flight_id,
    fare_conditions,
    amount,
    bp.ticket_no IS NOT NULL AS boarding_pass_exists,  {# посадочный талон существует #}
    boarding_no,
    seat_no,
    current_timestamp AS load_date
from
    {{ ref('stg_flights__facts__ticket_flights') }} AS tf LEFT JOIN {{ ref('stg_flights__facts__boarding_passes') }} AS bp 
        ON tf.ticket_no = bp.ticket_no
        AND tf.flight_id = bp.flight_id