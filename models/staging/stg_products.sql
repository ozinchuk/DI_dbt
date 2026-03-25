select
    cast(product_id as integer) as product_id,
    product_name,
    category,
    cast(price as decimal(10,2)) as price
from {{ ref('raw_products') }}