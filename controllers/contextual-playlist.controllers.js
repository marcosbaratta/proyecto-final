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
      // const moods = req.body.moods_id;
      // const occasions = req.body.occasions_id;
      // const weathers = req.body.weathers_id;
      // const genreIds = req.body.genre_id;
      // const filter = await knex.select("*").from("songs").innerJoin('songs_moods', 'songs.id','songs_moods.songs_id').innerJoin('songs_weathers', 'songs.id','songs_weathers.songs_id').innerJoin('songs_occasion', 'songs.id','songs_occasion.songs_id').where('moods_id', moods).where('weathers_id', weathers).where('occasions_id', occasions).whereIn('genre_id', genreIds).distinctOn('songs.id');


      const genre_id = req.body.genre;
      delete req.body.genre;
      console.log(req.body);
      console.log(genre_id);
      const filter = await knex.select("*").from("songs").innerJoin('songs_moods', 'songs.id','songs_moods.songs_id').innerJoin('songs_weathers', 'songs.id','songs_weathers.songs_id').innerJoin('songs_occasion', 'songs.id','songs_occasion.songs_id').where(req.body).whereIn('genre_id', genre_id);


        res.status(200);
        console.log('salio todo ok');
        res.json( filter );
      }

}



const secret = 'ni idea men';
exports.secret = secret;
exports.registrame = async (req, res, next) => {
    const salt = await bcrypt.genSalt(10);
    const hashContrasenia = await bcrypt.hash(req.body.password, salt);
  
    await knex("users").insert({ ...req.body, password: hashContrasenia });
    console.log('registro');
  
    sendToken(res, next, req.body.email, req.body.name);
  };

  const sendToken = (res, next, email, nombre) => {
    const token = jwt.sign({ email, nombre }, secret);
    res.json({ token });
    next();
  };


  
exports.getAllGenres =  async (req, res)=>{
  {
      const genres = await knex.select("name").from("genres");
      const moods = await knex.select("name").from("moods");
      const occasions = await knex.select("name").from("occasions");
      const weathers = await knex.select("name").from("weathers");

      res.status(200);
      const genres1 = genres.map(n => n.name);
      const moods1 = moods.map(n => n.name);
      const occasions1 = occasions.map(n => n.name);
      const weathers1 = weathers.map(n => n.name);
      
      // console.log(nombres);
      res.send( [genres1, moods1, occasions1, weathers1]);
    }
};