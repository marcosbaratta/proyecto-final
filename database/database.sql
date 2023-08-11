-- Inserciones en la tabla 'moods'
INSERT INTO moods (name) VALUES
    ('Happy'),
    ('Sad'),
    ('Energetic'),
    ('Chill');

-- Inserciones en la tabla 'weathers'
INSERT INTO weathers (name) VALUES
    ('Sunny'),
    ('Rainy'),
    ('Cloudy'),
    ('Snowy');

-- Inserciones en la tabla 'occasions'
INSERT INTO occasions (name) VALUES
    ('Party'),
    ('Relaxation'),
    ('Exercise'),
    ('Study');

-- Inserciones en la tabla 'songs_moods'
INSERT INTO songs_moods (songs_id, moods_id) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4);

-- Inserciones en la tabla 'songs_weathers'
INSERT INTO songs_weathers (songs_id, weathers_id) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4);

-- Inserciones en la tabla 'songs_occasion'
INSERT INTO songs_occasion (songs_id, occasions_id) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4);

-- ... Puedes seguir agregando inserciones para las relaciones many-to-many según tus necesidades ...

--@block
INSERT INTO songs (name, duration, album_id, genre_id, artist_id) VALUES
    ('Thriller', 356, 1, 2, 1),
    ('Billie Jean', 290, 1, 1, 1),
    ('Beat It', 254, 1, 2, 1),
    ('Smooth Criminal', 230, 1, 3, 1),
    ('Black or White', 255, 1, 2, 1);

-- Inserciones en las tablas de relaciones many-to-many para las canciones de Michael Jackson
INSERT INTO songs_occasion (songs_id, occasions_id) VALUES
    (15, 1),
    (16, 2),
    (17, 3),
    (18, 1),
    (19, 4),
    (15, 4),
    (16, 3),
    (17, 2),
    (18, 2),
    (19, 3);

INSERT INTO songs_moods (songs_id, moods_id) VALUES
    (15, 3),
    (16, 2),
    (17, 1),
    (18, 4),
    (19, 3),
    (15, 2),
    (16, 1),
    (17, 4),
    (18, 3),
    (19, 2);

INSERT INTO songs_weathers (songs_id, weathers_id) VALUES
    (15, 1),
    (16, 2),
    (17, 3),
    (18, 4),
    (19, 1),
    (15, 2),
    (16, 4),
    (17, 1),
    (18, 2),
    (19, 2);