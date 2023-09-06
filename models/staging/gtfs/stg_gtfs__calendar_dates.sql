/* Build Calendar Dates Table */

{{ config(materialized='view') }}

with calendar_dates as (

    select 
        "SERVICE_ID",
        "DATE",
        "EXCEPTION_TYPE"
    from 
        {{ ref('calendar_dates_seed') }}
)

select 
    *
from 
    calendar_dates