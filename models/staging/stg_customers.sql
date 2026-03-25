select
    cast(customer_id as integer) as customer_id,
    first_name,
    last_name,
    email,
    city
from {{ ref('raw_customers') }}