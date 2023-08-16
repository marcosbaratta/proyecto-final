const {knex} = require('../database/knex');



const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const { matchedData } = require("express-validator");



// OBTIENE TODAS LAS CANCIONES


exports.getAllSongs =  async (req, res)=>{
    {
        const songs = await knex.select("*").from("songs");
        res.status(200);
        console.log("ya envie la consulta");
        res.json( {songs} );
      }
};


// OBTIENE CANCIONES PARA CONTEXTUAL PLAYLIST
exports.getFilteredSongs = async (req, res)=>{
    { 

      const genre_id = req?.body?.genre;
      delete req.body.genre;
      console.log(req.body);
      console.log(genre_id);
      const filter = await knex.select("songs.name as song_name", 'artists.name as artist_name', 'songs.duration as song_duration', 'songs.id' ).from("songs").innerJoin('songs_moods', 'songs.id','songs_moods.songs_id').innerJoin('songs_weathers', 'songs.id','songs_weathers.songs_id').innerJoin('songs_occasion', 'songs.id','songs_occasion.songs_id').innerJoin('artists', 'songs.artist_id', 'artists.id').where(req.body).whereIn('genre_id', genre_id).distinctOn('songs.id');


        res.status(200);
        console.log('salio todo ok');
        res.json( filter );
      }

}




  
exports.getFilters =  async (req, res)=>{
  
    const genres = await knex.select("*").from("genres");
    const moods = await knex.select("*").from("moods");
    const occasions = await knex.select("*").from("occasions");
    const weathers = await knex.select("*").from("weathers");

    res.status(200);

    // console.log(nombres);
    res.send( {genres, moods, occasions, weathers});
  
};