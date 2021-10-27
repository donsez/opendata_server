use opendata;
db.auth('opendata','__MY_SECRET_PASSWORD__');
show collections;

// Données INSEE

// db.villesInsee.drop()
db.villesInsee.count()
db.villesInsee.find().limit(10)
db.villesInsee.find({nomCommune : "GRENOBLE"}).limit(10)
db.villesInsee.find({nomCommune : "GRENOBLE"}).limit(10)
db.villesInsee.find({nomCommune : /^GRENOBLE$/i }).limit(10)

// CREATION D'INDEX
db.villesInsee.createIndex(
  { nomCommune: 1 },
  { 
    collation: {
      locale: 'fr',
      strength: 2
    }
  }
);
db.villesInsee.find({nomCommune : /^GRENOBLE$/i }).limit(10)

// CREATION D'INDEX
db.villesInsee.createIndex( { nomCommune: "text" } )
db.villesInsee.find( { $text: { $search: "grenoble", $caseSensitive :false } } )
db.villesInsee.find( { $text: { $search: "GRE", $caseSensitive :false } } )

db.villesInsee.find({$or: [{$text: {$search: 'GRE'}}, {nomCommune: {$regex: 'GRE'}}]})
db.villesInsee.find( {nomCommune: {$regex: '^GRE'}})

// Création d'une nouvelle collection villesInsee2 avec un champ location
db.villesInsee2.drop()
db.villesInsee.aggregate(
    [
        { "$match" : { "latitude" : {"$ne": ""}} },
        { "$addFields": { "location": [ "$longitude", "$latitude" ] }},
        { "$out": "villesInsee2" }
    ]
)
db.villesInsee2.find()
// Création d'un index pour le champ location de villesInsee2
db.villesInsee2.createIndex( { location : "2dsphere" } )

// Recherche des villes à 10 kms autour de Grenoble
db.villesInsee2.find(
{
  location: {
     $near: {
       $geometry: {
          type: "Point" ,
          coordinates: [ 5.72133051752 , 45.1821215167 ]
       },
       $minDistance: 100,
       $maxDistance: 10000
     }
  }
} , { nomCommune: 1, codePostal: 1 }
)
