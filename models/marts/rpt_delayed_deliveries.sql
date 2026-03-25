{{ config(materialized='table') }}

select
    order_id,
    shipped_date,
    delivered_date,
    previous_delivery_attempt,
    date_diff('day', shipped_date, delivered_date) as delivery_days
from {{ ref('int_shipping_delays') }}
where delivered_date is not null
  and date_diff('day', shipped_date, delivered_date) > 3