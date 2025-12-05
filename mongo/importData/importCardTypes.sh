#!/bin/bash

if [ -z "$MONGO_PASSWORD" ]; then
    MONGO_PASSWORD=$(grep MONGO_PASSWORD ../../.env | cut -d '=' -f2 | tr -d "'")
fi
MONGO_PASSWORD=$(echo "$MONGO_PASSWORD" | tr -d '\n' | jq -sRr @uri)

unzip -p ../data/CardTypes.json.zip \
| jq -c '.data | to_entries | .[] | {name: .key} + .value' \
| mongoimport --uri "mongodb://admin:${MONGO_PASSWORD}@localhost:27017/mtg?authSource=admin" \
  --collection cardTypes
