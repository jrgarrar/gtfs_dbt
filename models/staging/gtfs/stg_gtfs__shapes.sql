/* Build Shapes Table */

{{ config(materialized='view') }}

with shapes as (

    select 
        "SHAPE_DIST_TRAVELED",
        "SHAPE_ID",
        "SHAPE_PT_LAT",
        "SHAPE_PT_LON",
        "SHAPE_PT_SEQUENCE"
    from 
        {{ ref('shapes_seed') }}
)

select 
    *
from 
    shapes