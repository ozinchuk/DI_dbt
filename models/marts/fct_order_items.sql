{{
    config(
        materialized='incremental',
        unique_key='order_item_id'
    )
}}

select
    {{ generate_surrogate_key(['order_id', 'product_id']) }} as order_item_id,
    order_id,
    product_id,
    quantity,
    price,
    updated_at
from {{ ref('stg_order_items') }}

{% if is_incremental() %}
    where updated_at > (select max(updated_at) from {{ this }})
{% endif %}