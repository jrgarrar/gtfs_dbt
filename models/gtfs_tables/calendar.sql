/* Build Calendar Table */

{{ config(materialized='view') }}

with calendar as (

    select 
        "SERVICE_ID",
        "MONDAY",
        "TUESDAY",
        "WEDNESDAY",
        "THURSDAY",
        "FRIDAY",
        "SATURDAY",
        "SUNDAY",
        "START_DATE",
        "END_DATE"
    from 
        {{ ref('calendar_seed') }}
)

select 
    *
from 
    calendar