# GTFS Example DBT Code

This repository demonstrates how to configure a simple DBT pipeline for GTFS data.


### First Time Setup

```
# Install the DBT CLI tool
$ pip install dbt-snowflake

# Configure your connection profile under ~/.dbt/profiles.yml
# (Note: You may need to create a database and schema in Snowflake if you haven't already)
$ dbt init

# Test that configuration worked
$ dbt debug
```

### Usage

```
# Upload the seed files to your database as tables
$ dbt seed

# Generate the actual tables from model files under models/
$ dbt run
```

### Other Resources

* [DBT Init Documentation](https://docs.getdbt.com/reference/commands/init)
* [DBT Quickstart Documentation](https://docs.getdbt.com/quickstarts/manual-install?step=1)