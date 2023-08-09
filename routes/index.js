const express = require("express");
const routes = express.Router();
const {knex} = require('../database/knex')




routes.get('/canciones', async (req, res)=>{
    {
        const tareas = await knex.select("*").from("songs");
        res.status(200);
        console.log("ya envie la consulta");
        res.json( tareas );
      }
});


module.exports = routes;
