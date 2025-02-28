#!/bin/bash

echo "------------------------------------------"
echo "Running from project one with hackney 1.23"

# Make the curl request and capture the HTTP status code
status_code=$(curl -o /dev/null -s -w "%{http_code}" http://two:5000/api)

# Check if the status code is 200
if [ "$status_code" -eq 200 ]; then
  echo "CURL Request succeeded with status code 200."
else
  echo "CURL Request failed with status code $status_code."
fi

cd /usr/src/app/one
PORT=3000 mix run -e ":hackney.get(\"http://two:5000/api\") |> IO.inspect()"
cd -

echo "------------------------------------------"
