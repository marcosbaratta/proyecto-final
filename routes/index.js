const express = require("express");
const routes = express.Router();
const { getAllSongs, getFilteredSongs } = require("../controllers/contextual-playlist.controllers");
const {register} = require('../controllers/register.controllers')


//SONG FILTERS

routes.get('/songs', getAllSongs);
routes.get('/contextualfilter', getFilteredSongs);


// REGISTER AND LOGIN

routes.post('/registrame', register);







module.exports = routes;


