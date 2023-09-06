# GTFS Example DBT Code

This repository demonstrates how to configure a simple DBT pipeline for GTFS data.


### First Time Setup

```bash
# Install the DBT CLI tool
$ pip install dbt-snowflake

# Use the interactive tool to configure a connection profile under ~/.dbt/profiles.yml
# (An example can be found under resources/)
$ dbt init

# Test that configuration worked
$ dbt debug

# Configure your API key for TriMet
$ echo "<your_app_id_for_the_api>" > appID.txt
```

### Usage

```bash
# Pull down seed data from GTFS
$ python fetch_gtfs_data.py

# Pull down seed data from TriMet
$ python fetch_trimet_data.py

# Upload the seed files to your database as tables
$ dbt seed

# Generate the actual tables from model files 
$ dbt run
```

### Other Resources

##### DBT

* [DBT Init Documentation](https://docs.getdbt.com/reference/commands/init)
* [DBT Quickstart Documentation](https://docs.getdbt.com/quickstarts/manual-install?step=1)
* [DBT Filename Conventions](https://docs.getdbt.com/guides/best-practices/how-we-structure/2-staging#staging-files-and-folders)

##### GTFS / TriMet
* [GTFS Developer Pages](https://developers.google.com/transit/gtfs-realtime)
* [TriMet Developer Pages](https://developer.trimet.org/)