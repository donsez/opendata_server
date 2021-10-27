#!/bin/bash

downloadFranceEntiere () {
    URL=https://cadastre.data.gouv.fr/data/etalab-cadastre/latest/geojson/france
    FILES="cadastre-france-communes.json.gz cadastre-france-feuilles.json.gz cadastre-france-prefixes_sections.json.gz cadastre-france-sections.json.gz"
    mkdir france
    for FILE in $FILES
    do
        curl $URL/$FILE -o france/$FILE
    done
}

downloadParDepartement () {
    DEPARTEMENTS="01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 21 22 23 24 25 26 27 28 29 2A 2B 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 971 972 973 974 976"
    ENTITES="batiments communes feuilles lieux_dits parcelles prefixes_sections sections subdivisions_fiscales"
    URL=https://cadastre.data.gouv.fr/data/etalab-cadastre/latest/geojson/departements
    for DEPT in $DEPARTEMENTS
    do
        echo "Downloading departemant $DEPT ..."
        mkdir -p departements/$DEPT
        for ENTITE in $ENTITES
        do
            FFILE="cadastre-$DEPT-$ENTITE.json.gz"
            curl $URL/$DEPT/$FFILE -o departements/$DEPT/$FFILE
        done
    done
}

downloadParCommune () {
    BASE=~/cdn
    #DIR="$BASE/etalab-cadastre/communes"
    URL=https://cadastre.data.gouv.fr/data/etalab-cadastre/latest/geojson/communes/
    #mkdir -p $DIR
    cd $DIR
    wget -e robots=off -o logfile.txt -r -mk -w 5 --accept=.gz $URL
}


