select
    id as order_id,
    user_id as customer_id,
    order_date,
    status,
    _etl_loaded_at as loaded_at
    
from {{ source('dbt_unnathi_redshift', 'orders') }}