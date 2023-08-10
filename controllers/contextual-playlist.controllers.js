const {knex} = require('../database/knex');



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
      const moods = req.body.moods_id;
      const occasions = req.body.occasions_id;
      const weathers = req.body.weathers_id;
      const genreIds = req.body.genre_id;
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

// .orWhereNull('genre_id')