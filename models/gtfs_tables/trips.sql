/* Build Trips Table */

{{ config(materialized='view') }}

with trips as (

    select 
        "BLOCK_ID",
        "DIRECTION_ID",
        "ROUTE_ID",
        "SERVICE_ID",
        "SHAPE_ID",
        "TRIP_ID",
        "TRIP_SHORT_NAME",
        "TRIP_TYPE",
        "WHEELCHAIR_ACCESSIBLE"
    from 
        {{ ref('trips_seed') }}
)

select 
    *
from 
    trips