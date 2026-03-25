{{ config(materialized='table') }}

select
    date_trunc('month', i.order_date) as sales_month,
    p.category,
    sum(i.price * i.quantity) as total_revenue
from {{ ref('int_orders_joined_items') }} i
left join {{ ref('dim_products') }} p on i.product_id = p.product_id
group by 1, 2