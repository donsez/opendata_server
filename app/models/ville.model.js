const mongoose = require('mongoose');

const VilleSchema = mongoose.Schema({
    codeCommuneINSEE: {type: String, required: true, min: 5, max: 5},
    nomCommune: {type: String, required: true, max: 100},
    codePostal: {type: String, required: true, min: 5, max: 5},
    libelleAcheminement: {type: String, required: true, max: 100},
    ligne5: {type: String, required: false, max: 100},
    latitude: {type: Number, required: false},
    longitude: {type: Number, required: false}
});

module.exports = mongoose.model('villesInsee', VilleSchema, 'villesInsee');