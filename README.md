# Open Data Service with Node, Express, MongoDB and Docker

Author : Didier DONSEZ

## Requirements
* NodeJS (mongoose, express)
* MongoDB

## Download the datasets
```bash
./download_cadastre.sh
```

## Setup

```bash
./setup.sh
docker-compose up -d
docker-compose logs -f
```

## Load data into MongoDB

```bash
./import_cadastre.sh
./import_villes_insee.sh
```

## Query MongoDB

Queries are in `query_villesInsee.cmd` and `query_cadastre.cmd`.

```bash
cat query_villesInsee.cmd
cat query_cadastre.cmd
./query_mongodb.sh .sh
```

## Query the REST API

```bash
curl http://localhost:8083/api/villes?s=GREN&l=10
```

## Query with Mongo Compass

Install [Mongo Compass](https://www.mongodb.com/en/products/compass).

Connect to `locahost:27017`

## TODO
* [ ] Retirer res.header("Access-Control-Allow-Origin", "*"); du routage
* [ ] Add NGInx container with Let's Encrypt
