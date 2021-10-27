#!/bin/bash

start_mongodb () {
    mkdir -p ./data/mongo
    mkdir -p ./data/dump
    mkdir -p ./data/opendata
    chmod 755 ./data

    docker-compose down
    docker-compose up -d
    docker-compose ps
    open http://localhost:8081
}

docker-compose exec mongo mongo

