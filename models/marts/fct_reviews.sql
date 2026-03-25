{{
    config(
        materialized='incremental',
        unique_key='review_id'
    )
}}

select
    review_id,
    product_id,
    customer_id,
    rating,
    review_date
from {{ ref('stg_reviews') }}

{% if is_incremental() %}
    where review_date > (select max(review_date) from {{ this }})
{% endif %}