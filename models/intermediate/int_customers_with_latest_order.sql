select
    customer_id,
    order_id,
    order_date,
    row_number() over (partition by customer_id order by order_date desc) as order_rank
from {{ ref('stg_orders') }}