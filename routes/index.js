const express = require("express");
const routes = express.Router();
const {knex} = require('../database/knex');
const { getAllSongs, getFilteredSongs } = require("../controllers/contextual-playlist.controllers");




routes.get('/songs', getAllSongs);
routes.get('/contextualfilter', getFilteredSongs);


// const tareasDelUsuario = await knex('tareas').where('usuario_id', req.params.id)


module.exports = routes;


