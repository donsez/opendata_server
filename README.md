# Open Data Service with Node, Express, MongoDB and Docker

Author : Didier DONSEZ

## Requirements
* NodeJS (mongoose, express)
* MongoDB

## Setup

```bash
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

## TODO
* [ ] Retirer res.header("Access-Control-Allow-Origin", "*"); du routage
* [ ] Add NGInx container with Let's Encrypt