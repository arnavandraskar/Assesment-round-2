#!/bin/bash

# This script downloads a text file containing mutual fund NAV data from amfiindia.com,
# extracts the Scheme Name and Asset Value fields from it, and saves them in a CSV file.

# URL of the text file containing mutual fund NAV data
url="https://www.amfiindia.com/spages/NAVAll.txt"

# Download the file and save it as navall.txt
wget -q -O navall.txt $url

# Extract Scheme Name and Asset Value fields and save in a csv file
awk -F ';' '{gsub(/,/, "|", $4); if ($4 != "") print $4 "," $5}' navall.txt > output.csv

# Print success message
echo "Scheme Name and Asset Value fields extracted and saved in output.csv"

