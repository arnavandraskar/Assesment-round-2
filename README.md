# Mutual Fund NAV Data Extractor

This script downloads a text file containing mutual fund NAV data from amfiindia.com, extracts the Scheme Name and Asset Value fields from it, and saves them in a CSV file.

## Prerequisites

- Bash
- wget

## Installation

1. Clone or download the script from this repository.
2. Open a terminal window and navigate to the directory where the script is located.
3. Make the script executable using the following command: `chmod +x mutual_fund_nav_extractor.sh`

## Usage

1. Open a terminal window and navigate to the directory where the script is located.
2. Run the script using the following command: `./mutual_fund_nav_extractor.sh`
3. Wait for the script to finish executing.
4. The extracted data will be saved in a CSV file called `scheme_assets.csv` in the same directory as the script.

## Notes

- The script uses the `wget` command to download the mutual fund NAV data file from amfiindia.com. If you are behind a firewall or proxy server, you may need to configure `wget` to work with your network.
- The script uses the `awk` command to extract the Scheme Name and Asset Value fields from the downloaded file. If you want to modify the script to extract different fields, you will need to modify the `awk` command accordingly.
- The script skips rows that have an empty Scheme Name field. If you want to modify the script to include rows with empty Scheme Name fields, you will need to modify the `awk` command accordingly.
