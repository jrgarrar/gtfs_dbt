/* Build Stop Times Table */

{{ config(materialized='view') }}

with stop_times as (

    select 
        "ARRIVAL_TIME",
        "CONTINUOUS_DROP_OFF",
        "CONTINUOUS_PICKUP",
        "DEPARTURE_TIME",
        "DROP_OFF_TYPE",
        "PICKUP_TYPE",
        "SHAPE_DIST_TRAVELED",
        "STOP_HEADSIGN",
        "STOP_ID",
        "STOP_SEQUENCE",
        "TIMEPOINT",
        "TRIP_ID"
    from 
        {{ ref('stop_times_seed') }}
)

select 
    *
from 
    stop_times