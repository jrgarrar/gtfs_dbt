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
        STOPS_SEED
),

stop_features as (

    select 
        "STOP_ID" as "stop_id",
        "FEATURE_NAME" as "feature_name"
    from 
        STOP_FEATURES_SEED
)

select 
    stops."stop_id",
    stops."stop_latitude",
    stops."stop_longitude",
    stops."stop_name",
    stop_features."feature_name"
from 
    stops
left join
    stop_features
on
    stops."stop_id" = stop_features."stop_id"