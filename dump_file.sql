--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: albums; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.albums (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    picture character(255) NOT NULL
);


ALTER TABLE public.albums OWNER TO postgres;

--
-- Name: albums_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.albums_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.albums_id_seq OWNER TO postgres;

--
-- Name: albums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.albums_id_seq OWNED BY public.albums.id;


--
-- Name: artists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artists (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.artists OWNER TO postgres;

--
-- Name: artists_albums; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artists_albums (
    artist_id bigint NOT NULL,
    album_id bigint NOT NULL
);


ALTER TABLE public.artists_albums OWNER TO postgres;

--
-- Name: artists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.artists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.artists_id_seq OWNER TO postgres;

--
-- Name: artists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.artists_id_seq OWNED BY public.artists.id;


--
-- Name: genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genres (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.genres OWNER TO postgres;

--
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genres_id_seq OWNER TO postgres;

--
-- Name: genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genres_id_seq OWNED BY public.genres.id;


--
-- Name: moods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moods (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.moods OWNER TO postgres;

--
-- Name: moods_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moods_id_seq OWNER TO postgres;

--
-- Name: moods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moods_id_seq OWNED BY public.moods.id;


--
-- Name: occasions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.occasions (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.occasions OWNER TO postgres;

--
-- Name: occasions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.occasions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.occasions_id_seq OWNER TO postgres;

--
-- Name: occasions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.occasions_id_seq OWNED BY public.occasions.id;


--
-- Name: playlist_songs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlist_songs (
    playlist_id bigint NOT NULL,
    song_id bigint NOT NULL
);


ALTER TABLE public.playlist_songs OWNER TO postgres;

--
-- Name: playlists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlists (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.playlists OWNER TO postgres;

--
-- Name: playlists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.playlists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.playlists_id_seq OWNER TO postgres;

--
-- Name: playlists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.playlists_id_seq OWNED BY public.playlists.id;


--
-- Name: songs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.songs (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    duration bigint NOT NULL,
    album_id bigint NOT NULL,
    genre_id bigint NOT NULL,
    artist_id bigint NOT NULL
);


ALTER TABLE public.songs OWNER TO postgres;

--
-- Name: songs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.songs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.songs_id_seq OWNER TO postgres;

--
-- Name: songs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.songs_id_seq OWNED BY public.songs.id;


--
-- Name: songs_moods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.songs_moods (
    moods_id bigint NOT NULL,
    songs_id bigint NOT NULL
);


ALTER TABLE public.songs_moods OWNER TO postgres;

--
-- Name: songs_occasion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.songs_occasion (
    occasions_id bigint NOT NULL,
    songs_id bigint NOT NULL
);


ALTER TABLE public.songs_occasion OWNER TO postgres;

--
-- Name: songs_weathers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.songs_weathers (
    songs_id bigint NOT NULL,
    weathers_id bigint NOT NULL
);


ALTER TABLE public.songs_weathers OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users_playlists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_playlists (
    user_id bigint NOT NULL,
    playlist_id bigint NOT NULL
);


ALTER TABLE public.users_playlists OWNER TO postgres;

--
-- Name: weathers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.weathers (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.weathers OWNER TO postgres;

--
-- Name: weathers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.weathers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weathers_id_seq OWNER TO postgres;

--
-- Name: weathers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.weathers_id_seq OWNED BY public.weathers.id;


--
-- Name: albums id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums ALTER COLUMN id SET DEFAULT nextval('public.albums_id_seq'::regclass);


--
-- Name: artists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists ALTER COLUMN id SET DEFAULT nextval('public.artists_id_seq'::regclass);


--
-- Name: genres id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres ALTER COLUMN id SET DEFAULT nextval('public.genres_id_seq'::regclass);


--
-- Name: moods id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moods ALTER COLUMN id SET DEFAULT nextval('public.moods_id_seq'::regclass);


--
-- Name: occasions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.occasions ALTER COLUMN id SET DEFAULT nextval('public.occasions_id_seq'::regclass);


--
-- Name: playlists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists ALTER COLUMN id SET DEFAULT nextval('public.playlists_id_seq'::regclass);


--
-- Name: songs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs ALTER COLUMN id SET DEFAULT nextval('public.songs_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: weathers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weathers ALTER COLUMN id SET DEFAULT nextval('public.weathers_id_seq'::regclass);


--
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.albums (id, name, picture) FROM stdin;
9	Album 1	album1.jpg                                                                                                                                                                                                                                                     
10	Album 2	album2.jpg                                                                                                                                                                                                                                                     
\.


--
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.artists (id, name) FROM stdin;
4	Shakira
\.


--
-- Data for Name: artists_albums; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.artists_albums (artist_id, album_id) FROM stdin;
\.


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genres (id, name) FROM stdin;
1	Pop
2	Rock
3	Electronic
4	Hip-Hop
5	R&B
6	Country
7	Jazz
8	Reggae
9	Classical
10	Latin
\.


--
-- Data for Name: moods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.moods (id, name) FROM stdin;
1	Happy
2	Sad
3	Angry
\.


--
-- Data for Name: occasions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.occasions (id, name) FROM stdin;
1	Study
2	Exercise
3	Chilling
4	Beach
5	Party
\.


--
-- Data for Name: playlist_songs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playlist_songs (playlist_id, song_id) FROM stdin;
\.


--
-- Data for Name: playlists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playlists (id, name) FROM stdin;
\.


--
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.songs (id, name, duration, album_id, genre_id, artist_id) FROM stdin;
19	Waka Waka	210	9	1	4
20	Hips Don't Lie	180	10	2	4
\.


--
-- Data for Name: songs_moods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.songs_moods (moods_id, songs_id) FROM stdin;
1	19
3	19
1	20
3	20
\.


--
-- Data for Name: songs_occasion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.songs_occasion (occasions_id, songs_id) FROM stdin;
3	19
4	19
5	19
3	20
4	20
5	20
\.


--
-- Data for Name: songs_weathers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.songs_weathers (songs_id, weathers_id) FROM stdin;
19	1
19	2
20	2
20	3
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password) FROM stdin;
\.


--
-- Data for Name: users_playlists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_playlists (user_id, playlist_id) FROM stdin;
\.


--
-- Data for Name: weathers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.weathers (id, name) FROM stdin;
1	Sunny
2	Cloudy
3	Summer Night
\.


--
-- Name: albums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.albums_id_seq', 10, true);


--
-- Name: artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.artists_id_seq', 4, true);


--
-- Name: genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genres_id_seq', 10, true);


--
-- Name: moods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moods_id_seq', 3, true);


--
-- Name: occasions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.occasions_id_seq', 5, true);


--
-- Name: playlists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.playlists_id_seq', 1, false);


--
-- Name: songs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.songs_id_seq', 20, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: weathers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.weathers_id_seq', 3, true);


--
-- Name: albums albums_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (id);


--
-- Name: artists_albums artists_albums_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists_albums
    ADD CONSTRAINT artists_albums_pkey PRIMARY KEY (artist_id, album_id);


--
-- Name: artists artists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (id);


--
-- Name: genres genres_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_name_key UNIQUE (name);


--
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);


--
-- Name: moods moods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moods
    ADD CONSTRAINT moods_pkey PRIMARY KEY (id);


--
-- Name: occasions occasions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.occasions
    ADD CONSTRAINT occasions_pkey PRIMARY KEY (id);


--
-- Name: playlist_songs playlist_songs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlist_songs
    ADD CONSTRAINT playlist_songs_pkey PRIMARY KEY (playlist_id, song_id);


--
-- Name: playlists playlists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists
    ADD CONSTRAINT playlists_pkey PRIMARY KEY (id);


--
-- Name: songs_moods songs_moods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs_moods
    ADD CONSTRAINT songs_moods_pkey PRIMARY KEY (moods_id, songs_id);


--
-- Name: songs_occasion songs_occasion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs_occasion
    ADD CONSTRAINT songs_occasion_pkey PRIMARY KEY (occasions_id, songs_id);


--
-- Name: songs songs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (id);


--
-- Name: songs_weathers songs_weathers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs_weathers
    ADD CONSTRAINT songs_weathers_pkey PRIMARY KEY (songs_id, weathers_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_playlists users_playlists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_playlists
    ADD CONSTRAINT users_playlists_pkey PRIMARY KEY (user_id, playlist_id);


--
-- Name: weathers weathers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weathers
    ADD CONSTRAINT weathers_pkey PRIMARY KEY (id);


--
-- Name: artists_albums artists_albums_album_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists_albums
    ADD CONSTRAINT artists_albums_album_id_fk FOREIGN KEY (album_id) REFERENCES public.albums(id);


--
-- Name: artists_albums artists_albums_artist_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists_albums
    ADD CONSTRAINT artists_albums_artist_id_fk FOREIGN KEY (artist_id) REFERENCES public.artists(id);


--
-- Name: playlist_songs playlist_songs_song_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlist_songs
    ADD CONSTRAINT playlist_songs_song_id_fk FOREIGN KEY (song_id) REFERENCES public.songs(id);


--
-- Name: songs songs_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.albums(id);


--
-- Name: songs songs_artist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES public.artists(id);


--
-- Name: songs songs_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.genres(id);


--
-- Name: songs_moods songs_moods_moods_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs_moods
    ADD CONSTRAINT songs_moods_moods_id_fk FOREIGN KEY (moods_id) REFERENCES public.moods(id);


--
-- Name: songs_occasion songs_occasion_occasions_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs_occasion
    ADD CONSTRAINT songs_occasion_occasions_id_fk FOREIGN KEY (occasions_id) REFERENCES public.occasions(id);


--
-- Name: songs_occasion songs_occasion_songs_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs_occasion
    ADD CONSTRAINT songs_occasion_songs_id_fk FOREIGN KEY (songs_id) REFERENCES public.songs(id);


--
-- Name: songs_weathers songs_weathers_songs_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs_weathers
    ADD CONSTRAINT songs_weathers_songs_id_fk FOREIGN KEY (songs_id) REFERENCES public.songs(id);


--
-- Name: songs_weathers songs_weathers_weathers_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs_weathers
    ADD CONSTRAINT songs_weathers_weathers_id_fk FOREIGN KEY (weathers_id) REFERENCES public.weathers(id);


--
-- Name: users_playlists users_playlists_playlist_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_playlists
    ADD CONSTRAINT users_playlists_playlist_id_fk FOREIGN KEY (playlist_id) REFERENCES public.playlists(id);


--
-- Name: users_playlists users_playlists_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_playlists
    ADD CONSTRAINT users_playlists_user_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

