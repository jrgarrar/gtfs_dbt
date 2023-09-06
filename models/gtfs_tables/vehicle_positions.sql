/* Build Vehicles Table */

{{ config(materialized='table') }}

with vehicle_positions as (

    select 
        TripDescriptor,
        VehicleDescriptor,
        Position,
        CurrentStopSequence,
        StopId,
        VehicleStopStatus,
        Timestamp,
        CongestionLevel,
        OccupancyStatus
    from 
        {{ ref('vehicle_position_seed') }}
)

select 
    *
from 
    vehicle_positions