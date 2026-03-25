{{ config(materialized='table') }}

select
    c.customer_id,
    c.first_name,
    c.last_name,
    sum(i.price * i.quantity) as lifetime_value,
    count(distinct i.order_id) as total_orders
from {{ ref('dim_customers') }} c
left join {{ ref('int_orders_joined_items') }} i on c.customer_id = i.customer_id
group by 1, 2, 3
order by lifetime_value desc