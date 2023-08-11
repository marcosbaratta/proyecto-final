const express = require("express");
const routes = express.Router();
const { getAllSongs, getFilteredSongs, getAllGenres } = require("../controllers/contextual-playlist.controllers");
const {register, login} = require('../controllers/register.controllers')
const jwt = require('jsonwebtoken') 

const secret = 'ni idea men';
const unaFuncion = (req, res, next) =>{
    const headerToken = req.headers['token'];
    jwt.verify(headerToken, secret, (error, decoded)=>{
        if(error){
            return res.status(403).json({mensaje: 'invalid token'})
        }
        return next()
    } )
}

//SONG FILTERS

routes.get('/songs', getAllSongs);


// CONTEXTUAL PLAYLISTS
routes.get('/contextualfilter', unaFuncion, getFilteredSongs);
routes.get('/genres',unaFuncion, getAllGenres)




// REGISTER AND LOGIN

routes.post('/register', register);
routes.post('/login', login);








module.exports = routes;


