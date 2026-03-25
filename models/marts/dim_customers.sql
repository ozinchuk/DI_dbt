{{ config(materialized='table') }}

select
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    c.city,
    lo.order_date as last_order_date
from {{ ref('stg_customers') }} as c
left join {{ ref('int_customers_with_latest_order') }} as lo
    on c.customer_id = lo.customer_id
    and lo.order_rank = 1