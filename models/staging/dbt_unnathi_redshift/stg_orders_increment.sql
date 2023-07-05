{{ config(
    materialized = 'incremental',
    unique_key = 'id'
) }}
with events as (
    select * from {{ source('dbt_unnathi_redshift', 'orders') }}
    {% if is_incremental() %}
    where order_date >= (select dateadd('day',-1,max(order_date)) from {{ this }})
    {% endif %}
)
select * from events