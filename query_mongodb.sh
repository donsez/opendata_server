#!/bin/bash

# Mongo CLI
QUERY="use opendata; db.auth('opendata','__MY_SECRET_PASSWORD__'); show collections;"

EXEC_FROM_CONTAINER="docker-compose exec mongo"
EXEC_MONGO_FROM_CONTAINER="$EXEC_FROM_CONTAINER mongo opendata -u opendata -p __MY_SECRET_PASSWORD__ --quiet"
$EXEC_MONGO_FROM_CONTAINER 

$EXEC_MONGO_FROM_CONTAINER --eval 'db.communes.count()'
$EXEC_MONGO_FROM_CONTAINER --eval 'db.communes.find().forEach(printjson)'

$EXEC_MONGO_FROM_CONTAINER --shell /opendata/query.cmd

$EXEC_MONGO_FROM_CONTAINER  --shell /opendata/query.js

