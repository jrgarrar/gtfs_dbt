/* Build Fare Attributes Table */

{{ config(materialized='view') }}

with fare_attributes as (

    select 
        "FARE_ID",
        "AGENCY_ID",
        "PRICE",
        "CURRENCY_TYPE",
        "PAYMENT_METHOD",
        "TRANSFERS",
        "TRANSFER_DURATION"

    from 
        {{ ref('fare_attributes_seed') }}
)

select 
    *
from 
    fare_attributes