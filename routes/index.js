const express = require("express");
const routes = express.Router();
const { getAllSongs, getFilteredSongs, getFilters } = require("../controllers/contextual-playlist.controllers");
const {register, login} = require('../controllers/register.controllers')
const { userAuthentication } = require("../middlewares/auth.middleware");
const userPostValidators = require('../validators/register.validators');
const runValidator = require('../validators/index');
 


//SONG FILTERS

routes.get('/songs', getAllSongs);


// CONTEXTUAL PLAYLISTS
routes.post('/contextualfilter', userAuthentication, getFilteredSongs);
routes.get('/filters',userAuthentication, getFilters)




// REGISTER AND LOGIN

routes.post('/register',userPostValidators, runValidator, register);
routes.post('/login', login);








module.exports = routes;


