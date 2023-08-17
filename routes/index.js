const express = require("express");
const routes = express.Router();
const { getAllSongs, getFilteredSongs, getFilters, getPlaylistById} = require("../controllers/contextual-playlist.controllers");
const {getAllArtists, getTinderPlaylist} = require('../controllers/tinder.controllers')
const {register, login} = require('../controllers/register.controllers')
const { userAuthentication } = require("../middlewares/auth.middleware");
const userPostValidators = require('../validators/register.validators');
const runValidator = require('../validators/index');




//SONG FILTERS

routes.get('/songs', getAllSongs);


// CONTEXTUAL PLAYLISTS
routes.post('/contextualfilter', userAuthentication, getFilteredSongs);
routes.get('/filters',userAuthentication, getFilters);
routes.post('/playlist',userAuthentication, getPlaylistById);

// TINDER

routes.get('/tinder',userAuthentication, getAllArtists);
routes.post('/tinder/playlist',userAuthentication, getTinderPlaylist);


// REGISTER AND LOGIN

routes.post('/register',userPostValidators, runValidator, register);
routes.post('/login', login);








module.exports = routes;


