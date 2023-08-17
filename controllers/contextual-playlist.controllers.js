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
      const copy = {...req?.body}
      const genre_id = copy.genre;
      delete req.body.genre;
      console.log(req.body);
      console.log(genre_id);
      // generar playlist y agarrar su id
      const filter = await knex.select("songs.name as song_name", 'artists.name as artist_name', 'songs.duration as song_duration', 'songs.id' ).from("songs").innerJoin('songs_moods', 'songs.id','songs_moods.songs_id').innerJoin('songs_weathers', 'songs.id','songs_weathers.songs_id').innerJoin('songs_occasion', 'songs.id','songs_occasion.songs_id').innerJoin('artists', 'songs.artist_id', 'artists.id').where(req.body).whereIn('genre_id', genre_id).distinctOn('songs.id');
      console.log(filter);

      const userEmail = req.headers.username;
      console.log(userEmail);
      const userId = await knex.select('users.id').from('users').where('users.email',userEmail);
      console.log(userId);

      const newPlaylist = { 
        user_id: userId[0].id,
        name: userId[0].id.toString()
      };
      

      const playlistId = await knex('playlists').insert(newPlaylist).returning('id');
      console.log('playlist id es: ',playlistId);


      // const insertToPlaylist_songs = await 


      filter.forEach( async (element) => {
        const playlist_songs = {
          playlist_id: playlistId[0].id,
          song_id: element.id
        }
        // console.log(playlist_songs);
        const insertToPlaylist_songs = await knex('playlist_songs').insert(playlist_songs)
        
      });
 
// nacho 
//insertar en playlist_song con el playlist_id todos los song_id de las canciones de la variable filter
//devolver el playlist_id para luego pedir esta playlist desde el front en otra ruta
//pasar el playlist_id a traves de react router de un componente a otro usando route-params
//crear el endpoint para obtener playlist y sus canciones por id

// fran
// - generar una playlist, hacer un insert en la tabla playlists y luego obtener el ID generado
// - para cada canción del filter (filtrado) recorrer e insertar en la tabla playlist_songs utilizando el id de la canción (que obtenemos en el recorrido) y el id del punto 1

// si todo va bien, realizar un select * playlist join playlistsongs join canciones utilizando el id del punto 1 y dicho resultado devolver al front



        res.status(200);
        console.log('salio todo ok');
        res.json( playlistId[0].id );
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