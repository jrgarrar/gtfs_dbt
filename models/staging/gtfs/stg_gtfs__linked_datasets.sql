/* Build Linked Datasets Table */

{{ config(materialized='view') }}

with linked_datasets as (

    select 
        "URL",
        "TRIP_UPDATES",
        "VEHICLE_POSITIONS",
        "SERVICE_ALERTS",
        "AUTHENTICATION_TYPE",
        "AUTHENTICATION_INFO_URL",
        "API_KEY_PARAMETER_NAME"

    from 
        {{ ref('linked_datasets_seed') }}
)

select 
    *
from 
    linked_datasets