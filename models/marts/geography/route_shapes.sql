/* Map the route data to shapes */

{{ config(materialized='view') }}

with

shapes as (

    select 
        "SHAPE_ID" as "shape_id",
        "SHAPE_DIST_TRAVELED" as "shape_distance_traveled",
        "SHAPE_PT_LAT" as "shape_latitude",
        "SHAPE_PT_LON" as "shape_longitude",
        "SHAPE_PT_SEQUENCE" as "shape_sequence"
    from 
        SHAPES_SEED
),

trips_one_direction as (

    select distinct
        "TRIP_ID" as "trip_id",
        "DIRECTION_ID" as "direction_id",
        "ROUTE_ID" as "route_id",
        "SERVICE_ID" as "service_id",
        "SHAPE_ID" as "shape_id",
        "TRIP_TYPE" as "trip_type"
    from 
        TRIPS_SEED
    where 
        "direction_id" = 0
),

routes as (

    select
        "ROUTE_ID" as "route_id",
        "ROUTE_COLOR" as "route_color",
        "ROUTE_LONG_NAME" as "route_name",
        "ROUTE_TYPE" as "route_type"
    from 
        ROUTES_SEED
),

shapes_to_routes as (
    select distinct
        shapes."shape_id",
        shapes."shape_distance_traveled",
        shapes."shape_latitude",
        shapes."shape_longitude",
        shapes."shape_sequence",
        routes."route_id",
        routes."route_color",
        routes."route_name",
        routes."route_type"
    from 
        shapes
    inner join
        trips_one_direction
    on
        shapes."shape_id" = trips_one_direction."shape_id"
    inner join
        routes
    on
        trips_one_direction."route_id" = routes."route_id"
    order by 
        routes."route_id", shapes."shape_sequence"
)

select 
    *
from 
    shapes_to_routes 