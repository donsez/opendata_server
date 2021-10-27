#!/bin/bash

# REMARQUE : plusieurs entrées n'ont pas de coordonnées GPS renseignées.

CSV_FILE="/opendata/laposte_hexasmal.csv"
COLLECTION_NAME="villesInsee"
HEADERTYPE="codeCommuneINSEE.string(),nomCommune.string(),codePostal.string(),libelleAcheminement.string(),ligne5.string(),latitude.auto(),longitude.auto()"

DB="opendata"
MUSER="opendata"
MPASSWORD="__MY_SECRET_PASSWORD__"

tail -n +2 $CSV_FILE | tr ";" "," | \
  mongoimport --db $DB \
  -u $MUSER -p $MPASSWORD \
  --collection $COLLECTION_NAME \
  --type csv \
  --columnsHaveTypes \
  --fields "$HEADERTYPE"
