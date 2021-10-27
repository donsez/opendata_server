const ville = require('../models/ville.model.js');


// POST a ville
exports.create = (req, res) => {
    // Create a ville
    const ville = new ville({
        codeCommuneINSEE: req.body.codeCommuneINSEE,
        nomCommune: req.body.nomCommune,
        codePostal: req.body.codePostal,
        libelleAcheminement: req.body.libelleAcheminement,
        ligne5: req.body.ligne5,
        latitude: eq.body.latitude, // TODO convert
        longitude: req.body.longitude  // TODO convert
});

    // Save a ville in the MongoDB
    ville.save()
    .then(data => {
        res.send(data);
    }).catch(err => {
        res.status(500).send({
            message: err.message
        });
    });
};

// FETCH all villes
exports.findAll = (req, res) => {
    console.debug("findAll", req.query);
    ville.find()
    .then(villes => {
        res.send(villes);
    }).catch(err => {
        res.status(500).send({
            message: err.message
        });
    });
};

// FETCH some villes
exports.findSome = (req, res) => {
    console.debug("findSome", req.query);
    var l = req.query.l ? parseInt(req.query.l) : 10;
    var r = '^' + req.query.s;
    // TODO ville.find( {nomCommune: {$regex: r }}).sort({'nomCommune': -1}).limit(l)
    ville.find( {nomCommune: {$regex: r }}).limit(l)
    .then(villes => {
        res.send(villes);
    }).catch(err => {
        res.status(500).send({
            message: err.message
        });
    });
};

// FIND a ville
exports.findOne = (req, res) => {
    ville.findById(req.params.villeId)
    .then(ville => {
        if(!ville) {
            return res.status(404).send({
                message: "ville not found with id " + req.params.villeId
            });            
        }
        res.send(ville);
    }).catch(err => {
        if(err.kind === 'ObjectId') {
            return res.status(404).send({
                message: "ville not found with id " + req.params.villeId
            });                
        }
        return res.status(500).send({
            message: "Error retrieving ville with id " + req.params.villeId
        });
    });
};

// UPDATE a ville
exports.update = (req, res) => {
    // Find ville and update it
    ville.findByIdAndUpdate(req.params.villeId, {
        firstname: req.body.firstname,
		lastname: req.body.lastname,
		age: req.body.age
    }, {new: true})
    .then(ville => {
        if(!ville) {
            return res.status(404).send({
                message: "ville not found with id " + req.params.villeId
            });
        }
        res.send(ville);
    }).catch(err => {
        if(err.kind === 'ObjectId') {
            return res.status(404).send({
                message: "ville not found with id " + req.params.villeId
            });                
        }
        return res.status(500).send({
            message: "Error updating ville with id " + req.params.villeId
        });
    });
};

// DELETE a ville
exports.delete = (req, res) => {
    ville.findByIdAndRemove(req.params.villeId)
    .then(ville => {
        if(!ville) {
            return res.status(404).send({
                message: "ville not found with id " + req.params.villeId
            });
        }
        res.send({message: "ville deleted successfully!"});
    }).catch(err => {
        if(err.kind === 'ObjectId' || err.name === 'NotFound') {
            return res.status(404).send({
                message: "ville not found with id " + req.params.villeId
            });                
        }
        return res.status(500).send({
            message: "Could not delete ville with id " + req.params.villeId
        });
    });
};