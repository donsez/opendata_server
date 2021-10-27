use opendata;
db.auth('opendata','__MY_SECRET_PASSWORD__');
show collections;

// Données Cadastre
db.batiments.count()
db.communes.count()
db.feuilles.count()
db.lieux_dits.count()
db.parcelles.count()
db.prefixes_sections.count()
db.sections.count()
db.subdivisions_fiscales.count()


db.batiments.find().limit(1)
db.communes.find().limit(1)
db.feuilles.find().limit(1)
db.lieux_dits.find().limit(1)
db.parcelles.find().limit(1)
db.prefixes_sections.find().limit(1)
db.sections.find().limit(1)
db.subdivisions_fiscales.find().limit(1)

