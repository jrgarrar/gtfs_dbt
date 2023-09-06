/* Build Routes Table */

{{ config(materialized='view') }}

with routes as (

    select 
        "AGENCY_ID",
        "ROUTE_COLOR",
        "ROUTE_ID",
        "ROUTE_LONG_NAME",
        "ROUTE_SHORT_NAME",
        "ROUTE_SORT_ORDER",
        "ROUTE_TEXT_COLOR",
        "ROUTE_TYPE",
        "ROUTE_URL"

    from 
        {{ ref('routes_seed') }}
)

select 
    *
from 
    routes