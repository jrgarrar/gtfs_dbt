/* Build Vehicles Table */

{{ config(materialized='view') }}

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
        {{ ref('data_vehicle_positions_seed') }}
)

select 
    *
from 
    vehicle_positions