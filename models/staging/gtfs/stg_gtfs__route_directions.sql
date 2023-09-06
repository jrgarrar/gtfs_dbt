/* Build Route Directions Table */

{{ config(materialized='view') }}

with route_directions as (

    select 
        "DIRECTION_ID",
        "DIRECTION_NAME",
        "ROUTE_ID"
    from 
        {{ ref('route_directions_seed') }}
)

select 
    *
from 
    route_directions