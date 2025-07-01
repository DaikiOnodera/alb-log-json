#!/bin/bash

# Extract year, month, day from config
s3_key=$(grep 's3_key=' alblogjson-config.toml | cut -d'"' -f2)
year=$(echo "$s3_key" | cut -d'/' -f5)
month=$(echo "$s3_key" | cut -d'/' -f6)
day=$(echo "$s3_key" | cut -d'/' -f7)

# Generate filename
filename="alblog${year}${month}${day}.json"

echo "Storing logs in $filename"

# Run alblogjson and redirect to generated filename
./alblogjson > "$filename"

