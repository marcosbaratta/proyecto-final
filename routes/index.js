const express = require("express");
const routes = express.Router();
const { getAllSongs, getFilteredSongs, getAllGenres } = require("../controllers/contextual-playlist.controllers");
const {register, login} = require('../controllers/register.controllers')


//SONG FILTERS

routes.get('/songs', getAllSongs);


// CONTEXTUAL PLAYLISTS
routes.get('/contextualfilter', getFilteredSongs);
routes.get('/genres', getAllGenres)




// REGISTER AND LOGIN

routes.post('/register', register);
routes.post('/login', login);








module.exports = routes;


