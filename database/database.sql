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
