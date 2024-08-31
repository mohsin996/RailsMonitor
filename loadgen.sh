#!/bin/bash

# Load Generation Script
# This script sends a number of HTTP requests to localhost:3000

# Number of requests to send
REQUESTS=1000

# Time to wait between requests (in seconds)
DELAY=1.5

# Target URL
URL="http://localhost:3000"

echo "Starting load generation on $URL with $REQUESTS requests..."

for ((i=1;i<=REQUESTS;i++)); do
  STATUS_CODE=$(curl -o /dev/null -s -w "%{http_code}\n" $URL)
  
  if [ "$STATUS_CODE" -eq 200 ]; then
    echo "Request #$i: Success ($STATUS_CODE)"
  else
    echo "Request #$i: Failed ($STATUS_CODE)"
  fi
  
  sleep $DELAY
done

echo "Load generation completed."

