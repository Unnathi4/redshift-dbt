select
    unique_id, 
    status
from {{ref('stg_model_run_results')}}
where status == "Failure"