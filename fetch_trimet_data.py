"""
Pull TriMet data for use in seeding tables.

- jrgarrar
"""

# Library Imports
import os
import json
import pandas as pd
import pathlib
import requests

# Globals
PARENT_DIR = pathlib.Path(__file__).parent.absolute()
SEED_DIR = os.path.join(PARENT_DIR, 'seeds')
APP_ID_FILE = os.path.join(PARENT_DIR, 'appID.txt')
OUTPUT_FILE = os.path.join(SEED_DIR, 'vehicles_seed.csv')
API_LINK = r'https://developer.trimet.org/ws/v2/vehicles'


# Main Function
def main():
    """
    The main function.
    """
    # Load the AppID from a non-version controlled file
    with open(APP_ID_FILE) as f:
        appID = f.readline()

    # Prep the API request
    request_url = f'{API_LINK}?appID={appID}'

    # Pull data from the API
    r = requests.get(request_url)
    payload = r.json()

    # Convert the JSON to a CSV
    # TODO: Use something that's more lightweight than Pandas
    payload_df = pd.DataFrame.from_dict(payload['resultSet']['vehicle'])
    
    # # Output data as a CSV file
    payload_df.to_csv(OUTPUT_FILE, index=False)

if __name__ == "__main__":
    main()
