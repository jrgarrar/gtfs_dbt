/* Build Fare Attributes Table */

{{ config(materialized='view') }}

with fare_rules as (

    select 
        "FARE_ID",
        "ORIGIN_ID",
        "ROUTE_ID",
        "CONTAINS_ID"

    from 
        {{ ref('fare_rules_seed') }}
)

select 
    *
from 
    fare_rules