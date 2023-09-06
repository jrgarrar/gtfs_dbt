/* Build Transfers Table */

{{ config(materialized='view') }}

with transfers as (

    select 
        "FROM_STOP_ID",
        "TO_STOP_ID",
        "TRANSFER_TYPE"
    from 
        {{ ref('transfers_seed') }}
)

select 
    *
from 
    transfers