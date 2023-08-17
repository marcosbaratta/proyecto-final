const {knex} = require('../database/knex');

exports.getAllArtists =  async (req, res)=>{
    {
        const artists = await knex.select("*").from("artists");
        res.status(200);
        console.log("ya te envie los artistas");
        res.json( artists );
      }
};

exports.getTinderPlaylist = async (req, res) =>{
    console.log(req.body);
    const consult = await knex.select("*").from("artists").innerJoin('songs','artists.id','songs.artist_id').innerJoin('playlist_songs','playlist_songs.song_id','songs.id').innerJoin('playlists','playlists.id','playlist_songs.playlist_id').innerJoin('users','users.id','playlists.user_id')

    res.status(200);
    console.log(consult);
    res.json( artists );

}