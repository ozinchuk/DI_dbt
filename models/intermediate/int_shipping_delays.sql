select
    shipping_id,
    order_id,
    shipped_date,
    delivered_date,
    lag(delivered_date) over (partition by order_id order by shipped_date) as previous_delivery_attempt
from {{ ref('stg_shipping') }}