/* Build Vehicles Table */

{{ config(materialized='view') }}

with vehicles as (

    select 
        "ROUTECOLOR",
        "EXPIRES",
        "SIGNMESSAGE",
        "SERVICEDATE",
        "LOADPERCENTAGE",
        "LATITUDE",
        "NEXTSTOPSEQ",
        "SOURCE",
        "TYPE",
        "BLOCKID",
        "SIGNMESSAGELONG",
        "LASTLOCID",
        "NEXTLOCID",
        "LOCATIONINSCHEDULEDAY",
        "ROUTESUBTYPE",
        "NEWTRIP",
        "LONGITUDE",
        "DIRECTION",
        "INCONGESTION",
        "ROUTENUMBER",
        "BEARING",
        "GARAGE",
        "TRIPID",
        "DELAY",
        "EXTRABLOCKID",
        "MESSAGECODE",
        "LASTSTOPSEQ",
        "VEHICLEID",
        "TIME",
        "OFFROUTE"
    from 
        {{ ref('vehicles_seed') }}
)

select 
    *
from 
    vehicles