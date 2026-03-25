select
    cast(order_item_id as integer) as order_item_id,
    cast(order_id as integer) as order_id,
    cast(product_id as integer) as product_id,
    cast(quantity as integer) as quantity,
    cast(price as decimal(10,2)) as price,
    cast(updated_at as timestamp) as updated_at
from {{ ref('raw_order_items') }}