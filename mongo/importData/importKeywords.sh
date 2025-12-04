#!/bin/bash

if [ -z "$MONGO_PASS" ]; then
    MONGO_PASS=$(grep MONGO_PASSWORD ../../.env | cut -d '=' -f2 | tr -d "'" | tr -d '\n')
fi
MONGO_PASS=$(echo "$MONGO_PASS" | jq -sRr @uri)

jq -c '.data | to_entries | .[] | {type: .key, values: .value}' ../data/Keywords.json \
| mongoimport --uri "mongodb://admin:${MONGO_PASS}@localhost:27017/mtg?authSource=admin" \
  --collection keywords
