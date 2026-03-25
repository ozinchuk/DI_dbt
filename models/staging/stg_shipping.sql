select
    cast(shipping_id as integer) as shipping_id,
    cast(order_id as integer) as order_id,
    carrier,
    status,
    cast(shipped_date as date) as shipped_date,
    cast(delivered_date as date) as delivered_date,
    cast(event_timestamp as timestamp) as event_timestamp
from {{ ref('raw_shipping') }}