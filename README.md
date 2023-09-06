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

# Pull down fact tables from GTFS
$ python fetch_data.py
```

### Usage

```bash
# Upload the seed files to your database as tables
$ dbt seed

# Generate the actual tables from model files 
$ dbt run
```

### Other Resources

* [DBT Init Documentation](https://docs.getdbt.com/reference/commands/init)
* [DBT Quickstart Documentation](https://docs.getdbt.com/quickstarts/manual-install?step=1)
* [GTFS Developer Pages](https://developers.google.com/transit/gtfs-realtime)
* [TriMet Developer Pages](https://developer.trimet.org/)