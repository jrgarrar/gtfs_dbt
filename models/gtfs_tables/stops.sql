/* Build Stops Table */

{{ config(materialized='view') }}

with stops as (

    select 
        "DIRECTION",
        "LOCATION_TYPE",
        "PARENT_STATION",
        "POSITION",
        "STOP_CODE",
        "STOP_DESC",
        "STOP_ID",
        "STOP_LAT",
        "STOP_LON",
        "STOP_NAME",
        "STOP_URL",
        "TTS_STOP_NAME",
        "ZONE_ID"
    from 
        {{ ref('stops_seed') }}
)

select 
    *
from 
    stops