select
    order_id,
    shipped_date,
    delivered_date
from {{ ref('stg_shipping') }}
where delivered_date < shipped_date