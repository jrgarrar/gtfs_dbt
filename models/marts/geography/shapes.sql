/* Build Map Table */

{{ config(materialized='view') }}

with shapes as (

    select 
        "SHAPE_ID" as "shape_id",
        "SHAPE_DIST_TRAVELED" as "shape_distance_traveled",
        "SHAPE_PT_LAT" as "shape_latitude",
        "SHAPE_PT_LON" as "shape_longitude",
        "SHAPE_PT_SEQUENCE" as "shape_sequence"
    from 
        SHAPES_SEED
)

select 
    *
from 
    shapes