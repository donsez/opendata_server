module.exports = function(app) {

    var villes = require('../controllers/ville.controller.js');


    app.use(function(req, res, next) {
        res.header("Access-Control-Allow-Origin", "*"); // update to match the domain you will make the request from
        res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
        next();
      });

    // Create a new ville
    //app.post('/api/villes', villes.create);

    // Retrieve all ville
    //app.get('/api/villes', villes.findAll);

    // Retrieve some ville
    app.get('/api/villes', villes.findSome);

    // Retrieve a single ville by Id
    app.get('/api/villes/:villeId', villes.findOne);

    // Update a ville with Id
    //app.put('/api/villes/:villeId', villes.update);

    // Delete a ville with Id
    //app.delete('/api/villes/:villeId', villes.delete);
}