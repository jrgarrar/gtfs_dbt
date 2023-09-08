/* Build Current Vehicle Location Table */

{{ config(materialized='view') }}

with 

ranked_vehicle_locations as (
    select 
        "VEHICLEID" as "vehicle_id",
        "LATITUDE" as "vehicle_latitude",
        "LONGITUDE" as "vehicle_longitude",
        "TIME" as "vehicle_timestamp",
        "TYPE" as "vehicle_type",
        "ROUTESUBTYPE" as "vehicle_subtype",
        rank() over ( partition by "vehicle_id" order by "vehicle_timestamp" desc ) as rnk
    from 
        DEV.JUSTIN_STAGING.STG_TRIMET__VEHICLES
),

current_vehicle_locations as (
    select
        "vehicle_id",
        "vehicle_latitude",
        "vehicle_longitude",
        "vehicle_timestamp",
        "vehicle_type",
        "vehicle_subtype"
    from
        ranked_vehicle_locations
    where
        rnk = 1
    order by 
        "vehicle_id"
)

select 
    *
from 
    current_vehicle_locations