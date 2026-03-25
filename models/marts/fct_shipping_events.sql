{{
    config(
        materialized='incremental',
        unique_key='shipping_id'
    )
}}

select
    shipping_id,
    order_id,
    carrier,
    status,
    event_timestamp
from {{ ref('stg_shipping') }}

{% if is_incremental() %}
    where event_timestamp > (select max(event_timestamp) from {{ this }})
{% endif %}