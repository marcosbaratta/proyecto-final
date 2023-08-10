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
routes.get('/moodsfilter', async (req, res)=>{
    { 
      const condition = req.body.id;
        const filter = await knex.select("*").from("songs").innerJoin('songs_moods', 'songs.id','songs_moods.songs_id').where('moods_id', condition);
        res.status(200);
        console.log('salio todo ok');
        res.json( condition );
      }
});


// const tareasDelUsuario = await knex('tareas').where('usuario_id', req.params.id)


module.exports = routes;


