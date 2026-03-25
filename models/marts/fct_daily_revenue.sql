{{
    config(
        materialized='incremental',
        unique_key='revenue_date'
    )
}}

select
    order_date as revenue_date,
    sum(price * quantity) as total_revenue
from {{ ref('int_orders_joined_items') }}
group by 1

{% if is_incremental() %}
    having order_date > (select max(revenue_date) from {{ this }})
{% endif %}