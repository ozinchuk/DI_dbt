{{
    config(
        materialized='incremental',
        unique_key='order_id',
        incremental_strategy='delete+insert',
        incremental_predicates=["DBT_INTERNAL_DEST.order_date >= current_date - interval '7 days'"]
    )
}}

select
    order_id,
    customer_id,
    order_date,
    status
from {{ ref('stg_orders') }}

{% if is_incremental() %}
    where order_date >= (select max(order_date) from {{ this }})
{% endif %}