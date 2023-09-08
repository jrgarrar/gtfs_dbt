# GTFS Example DBT Code

This repository demonstrates how to configure a simple DBT pipeline for GTFS data.


### First Time Setup

```bash
# Install the DBT CLI tool
$ pip install dbt-snowflake

# Use the interactive tool to configure a connection profile under ~/.dbt/profiles.yml
# (An example output file can be found under resources/)
$ dbt init

# Test that configuration worked
$ dbt debug

# Configure your API key for TriMet
$ echo "<your_app_id_for_the_api>" > appID.txt

# Pull down seed data from GTFS
$ python fetch_gtfs_data.py

# Pull down seed data from TriMet
$ python fetch_trimet_data.py
```

### Basic Usage

```bash
# Upload the seed files to your database as tables
$ dbt seed

# Generate the actual tables from model files 
$ dbt run
```

### Advanced Usage

##### Work w/ Individual Files

```bash
# Seed using a single file
$ dbt seed --select agency_seed

# Build a model using a single file
$ dbt run --select stg_gtfs__agency
```

### Other Resources

##### DBT

* [DBT Init Documentation](https://docs.getdbt.com/reference/commands/init)
* [DBT Quickstart Documentation](https://docs.getdbt.com/quickstarts/manual-install?step=1)
* [DBT Filename Conventions](https://docs.getdbt.com/guides/best-practices/how-we-structure/2-staging#staging-files-and-folders)

##### GTFS / TriMet
* [GTFS Developer Pages](https://developers.google.com/transit/gtfs-realtime)
* [TriMet Developer Pages](https://developer.trimet.org/)

##### OpenStreetMap
* [Portland Street Map](https://www.openstreetmap.org/export#map=11/45.5006/-122.7997)
* [API Data Request](https://overpass-api.de/api/map?bbox=-123.1000,45.3000,-122.5000,45.7000)