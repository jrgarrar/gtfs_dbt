/* Build Vehicles Table */

{{ config(materialized='table') }}

with alerts as (

    select 
        ActivePeriod,
        InformedEntity,
        Cause,
        Effect,
        Url,
        HeaderText,
        DescriptionText
    from 
        {{ ref('alerts_seed') }}
)

select 
    *
from 
    alerts