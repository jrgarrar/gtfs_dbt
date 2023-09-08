/* Build Stops Table */

{{ config(materialized='view') }}

with

stops as (
    select 
        "STOP_ID" as "stop_id",
        "STOP_LAT" as "stop_latitude",
        "STOP_LON" as "stop_longitude",
        "STOP_NAME" as "stop_name"
    from 
        DEV.JUSTIN_STAGING.STG_GTFS__STOPS
)

select 
    *
from
    stops