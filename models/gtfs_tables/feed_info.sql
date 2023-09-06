/* Build Feed Info Table */

{{ config(materialized='view') }}

with feed_info as (

    select 
        "FEED_PUBLISHER_NAME",
        "FEED_PUBLISHER_URL",
        "FEED_LANG",
        "FEED_START_DATE",
        "FEED_END_DATE",
        "FEED_VERSION",
        "FEED_ID",
        "FEED_CONTACT_URL"
    from 
        {{ ref('feed_info_seed') }}
)

select 
    *
from 
    feed_info