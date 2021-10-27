# Open Data Service with Node, Express, MongoDB and Docker

Author : Didier DONSEZ

## Requirements
* NodeJS (mongoose, express)
* MongoDB

## Setup

```bash
./setup.sh
docker-compose up -d
docker-compose logs -f
```

## Load data intop MongoDB

```bash
TODO
```

## Test

```bash
curl http://localhost:8083/api/villes?s=GREN&l=10
```

## Query with Mongo Compass

Install [Mongo Compass](https://www.mongodb.com/en/products/compass).

Connect to `locahost:

## TODO
* [ ] Retirer res.header("Access-Control-Allow-Origin", "*"); du routage
* [ ] Add NGInx container with Let's Encrypt