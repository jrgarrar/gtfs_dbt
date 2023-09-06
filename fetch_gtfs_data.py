"""
Pull GTFS data for use in seeding tables.

- jrgarrar
"""

# Library Imports
import os
import pathlib
import requests
import zipfile

# Globals
PARENT_DIR = pathlib.Path(__file__).parent.absolute()
SEED_DIR = os.path.join(PARENT_DIR, 'seeds')
ZIP_FILE = os.path.join(SEED_DIR, 'gtfs_fact_tables.zip')
DATA_LINK = r'https://developer.trimet.org/schedule/gtfs.zip'


# Main Function
def main():
    """
    The main function.
    """
    # Pull the data from the internet
    r = requests.get(DATA_LINK)
    with open(ZIP_FILE, 'wb') as f:
        for chunk in r.iter_content(chunk_size=128):
            f.write(chunk)

    # Unzip the data
    with zipfile.ZipFile(ZIP_FILE, 'r') as f:
        f.extractall(SEED_DIR)

    # Change file extensions to match DBT's preference
    seed_filenames = [filename for filename in os.listdir(SEED_DIR) if '.txt' in filename]
    for filename in seed_filenames:
        source = os.path.join(SEED_DIR, filename)
        destination = os.path.join(SEED_DIR, filename.replace('.txt', '_seed.csv'))
        os.rename(source, destination)

    # Cleanup
    os.remove(ZIP_FILE)

if __name__ == "__main__":
    main()
