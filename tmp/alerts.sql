/* Build Vehicles Table */

{{ config(materialized='view') }}

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
        {{ ref('data_alerts_seed') }}
)

select 
    *
from 
    alerts