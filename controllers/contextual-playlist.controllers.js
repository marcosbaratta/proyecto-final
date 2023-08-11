const {knex} = require('../database/knex');



const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const { matchedData } = require("express-validator");



// OBTIENE TODAS LAS CANCIONES


exports.getAllSongs =  async (req, res)=>{
    {
        const tareas = await knex.select("*").from("songs");
        res.status(200);
        console.log("ya envie la consulta");
        res.json( tareas );
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

// exports.registrame = async (req, res, next) => {
//   const newUser = matchedData(req);
//   console.log(newUser);
//   try {
//     const respuestaBd = await knex('users').insert(newUser, "*");
//     res.status(201);

//     res.json(respuestaBd[0]);
//   } catch (e) {
//     res.status(500);
//     res.json(e);
//   }
//   next();
// };


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