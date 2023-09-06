/* Build Vehicle Position Table */

{{ config(materialized='view') }}

with

vehicle_source as (

    select 
        "VEHICLEID" as "vehicle_id",
        "TIME" as "timestamp",
        "LATITUDE" as "latitude",
        "LONGITUDE" as "longitude",
        "TYPE" as "transit_type",
        "ROUTESUBTYPE" as "transit_sub_type",
        "BLOCKID" as "block_id",
        "SIGNMESSAGELONG" as "sign_message",
        "ROUTENUMBER" as "route_id",
        "TRIPID" as "trip_id"
    from 
        DEV.JUSTIN.STG_TRIMET__VEHICLES
),

route_source as (
    select 
        "ROUTE_ID" as "route_id",
        "ROUTE_LONG_NAME" as "route_name"
    from 
        DEV.JUSTIN.STG_GTFS__ROUTES
    where 
        "route_id" LIKE '[0-9]%'
)

select 
    "vehicle_id",
    "timestamp",
    "latitude",
    "longitude",
    "transit_type",
    "transit_sub_type",
    "block_id",
    "sign_message",
    "route_name",
    "trip_id"
from 
    vehicle_source 
left join 
    route_source 
on 
    vehicle_source."route_id" = route_source."route_id"