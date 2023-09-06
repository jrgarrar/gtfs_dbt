/* Build Stop Features Table */

{{ config(materialized='view') }}

with stop_features as (

    select 
        "FEATURE_NAME",
        "STOP_ID"
    from 
        {{ ref('stop_features_seed') }}
)

select 
    *
from 
    stop_features