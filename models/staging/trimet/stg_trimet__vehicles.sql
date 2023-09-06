/* Build Vehicles Table */

{{ config(materialized='view') }}

with vehicles as (

    select 
        "TripDescriptor",
        "VehicleDescriptor",
        "Position",
        "CurrentStopSequence",
        "StopId",
        "VehicleStopStatus",
        "Timestamp",
        "CongestionLevel",
        "OccupancyStatus"
    from 
        {{ ref('vehicles_seed') }}
)

select 
    *
from 
    vehicles