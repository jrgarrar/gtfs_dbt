/* Build Agency Table */

{{ config(materialized='view') }}

with source as (

    select 
        "AGENCY_ID",
        "AGENCY_NAME",
        "AGENCY_URL",
        "AGENCY_TIMEZONE",
        "AGENCY_LANG",
        "AGENCY_PHONE",
        "AGENCY_FARE_URL",
        "AGENCY_EMAIL",
        "BIKES_POLICY_URL"
    from 
        {{ ref('agency_seed') }}
)

select 
    *
from 
    agency