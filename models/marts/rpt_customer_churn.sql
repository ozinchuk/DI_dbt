{{ config(materialized='table') }}

select
    customer_id,
    first_name,
    last_name,
    last_order_date,
    date_diff('day', last_order_date, current_date) as days_since_last_order,
    case
        when date_diff('day', last_order_date, current_date) > 30 then 'Churned'
        else 'Active'
    end as customer_status
from {{ ref('dim_customers') }}