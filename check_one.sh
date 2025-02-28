#!/bin/bash

echo "------------------------------------------"
echo "Running from project two with hackney 1.21"

# Make the curl request and capture the HTTP status code
status_code=$(curl -o /dev/null -s -w "%{http_code}" http://one:4000/api)

# Check if the status code is 200
if [ "$status_code" -eq 200 ]; then
  echo "CURL Request succeeded with status code 200."
else
  echo "CURL Request failed with status code $status_code."
fi

cd /usr/src/app/two
PORT=3000 mix run -e ":hackney.get(\"http://one:4000/api\") |> IO.inspect()"
cd -

echo "------------------------------------------"
