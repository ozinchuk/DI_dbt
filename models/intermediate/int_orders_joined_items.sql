select
    i.order_item_id,
    i.order_id,
    o.customer_id,
    o.order_date,
    i.product_id,
    i.quantity,
    i.price
from {{ ref('stg_order_items') }} as i
left join {{ ref('stg_orders') }} as o
    on i.order_id = o.order_id