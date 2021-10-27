#!/bin/bash

SRC_DIR=./
OPENDATA_DIR=./data/opendata
DEPARTEMENTS="38"
ENTITES="batiments communes feuilles lieux_dits parcelles prefixes_sections sections subdivisions_fiscales"

# Dans l'hote
# Split GeoJSON arrays in order to import them into MongoDB

for DEPT in $DEPARTEMENTS
do
    for ENTITE in $ENTITES
    do
        cp $DIR/$DEPT/cadastre-$DEPT-$ENTITE.json.gz $OPENDATA_DIR
        gunzip -c $SRC_DIR/$DEPT/cadastre-$DEPT-$ENTITE.json.gz | jq --compact-output ".features[]" > $OPENDATA_DIR/cadastre-$DEPT-$ENTITE.geojson.import_mongo
    done
done


# Dans le conteneur
EXEC_FROM_CONTAINER="docker-compose -f stack.yml exec mongo"
for DEPT in $DEPARTEMENTS
do
    for ENTITE in $ENTITES
    do
        # TODO coercion des dates à l'import avec --columnsHaveTypes 
        $EXEC_FROM_CONTAINER mongoimport -u cadastre -p __MY_SECRET_PASSWORD__ --db cadastre -c $ENTITE --file /opendata/cadastre-$DEPT-$ENTITE.geojson.import_mongo
    done
done
