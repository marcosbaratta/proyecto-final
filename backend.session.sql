

-- Tabla Artist
CREATE TABLE Artist(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Tabla Playlist
CREATE TABLE Playlist(
    id SERIAL PRIMARY KEY, 
    name VARCHAR(255) NOT NULL
);

-- Tabla User_playlist
CREATE TABLE User_playlist(
    user_id BIGINT NOT NULL,
    playlist_id BIGINT NOT NULL,
    PRIMARY KEY(user_id, playlist_id),
    FOREIGN KEY(user_id) REFERENCES User(id),
    FOREIGN KEY(playlist_id) REFERENCES Playlist(id)
);

-- Tabla Album
CREATE TABLE Album(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    picture CHAR(255) NOT NULL
);

-- Tabla Song
CREATE TABLE Song(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    duration BIGINT NOT NULL,
    album_id BIGINT NOT NULL,
    genre_id BIGINT NOT NULL,
    artist_id BIGINT NOT NULL,
    FOREIGN KEY(genre_id) REFERENCES Genre(id),
    FOREIGN KEY(artist_id) REFERENCES Artist(id),
    FOREIGN KEY(album_id) REFERENCES Album(id)
);

-- Tabla Playlist_song (relación entre Playlist y Song)
CREATE TABLE Playlist_song(
    playlist_id BIGINT NOT NULL,
    song_id BIGINT NOT NULL,
    PRIMARY KEY(playlist_id, song_id),
    FOREIGN KEY(playlist_id) REFERENCES Playlist(id),
    FOREIGN KEY(song_id) REFERENCES Song(id)
);

-- Tabla Artist_album (relación entre Artist y Album)
CREATE TABLE Artist_album(
    artist_id BIGINT NOT NULL,
    album_id BIGINT NOT NULL,
    PRIMARY KEY(artist_id, album_id),
    FOREIGN KEY(artist_id) REFERENCES Artist(id),
    FOREIGN KEY(album_id) REFERENCES Album(id)
);
