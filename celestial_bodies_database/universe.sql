--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    size numeric NOT NULL,
    type text,
    discovered boolean NOT NULL,
    habitable boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer,
    orbital_period integer NOT NULL,
    atmosphere boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer,
    radius numeric NOT NULL,
    distance_from_star integer NOT NULL,
    has_life boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: spaceship; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spaceship (
    spaceship_id integer NOT NULL,
    name character varying(255) NOT NULL,
    crew_capacity integer NOT NULL,
    mission text,
    operational boolean NOT NULL
);


ALTER TABLE public.spaceship OWNER TO freecodecamp;

--
-- Name: spaceship_spaceship_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.spaceship_spaceship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spaceship_spaceship_id_seq OWNER TO freecodecamp;

--
-- Name: spaceship_spaceship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.spaceship_spaceship_id_seq OWNED BY public.spaceship.spaceship_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer,
    mass numeric NOT NULL,
    brightness integer,
    discovered boolean NOT NULL,
    habitable boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: spaceship spaceship_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceship ALTER COLUMN spaceship_id SET DEFAULT nextval('public.spaceship_spaceship_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1000000, 'Spiral', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1100000, 'Spiral', true, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 800000, 'Spiral', true, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 1500000, 'Spiral', true, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 1300000, 'Elliptical', true, false);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 1400000, 'Lenticular', true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 27, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 8, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 30, false);
INSERT INTO public.moon VALUES (4, 'Kepler Moon I', 3, 40, false);
INSERT INTO public.moon VALUES (5, 'Kepler Moon II', 3, 60, false);
INSERT INTO public.moon VALUES (6, 'Proxima Moon I', 4, 15, true);
INSERT INTO public.moon VALUES (7, 'Betelgeuse Moon I', 5, 20, false);
INSERT INTO public.moon VALUES (8, 'Betelgeuse Moon II', 6, 25, false);
INSERT INTO public.moon VALUES (9, 'Betelgeuse Moon III', 6, 35, false);
INSERT INTO public.moon VALUES (10, 'Vega Moon I', 7, 45, true);
INSERT INTO public.moon VALUES (11, 'Vega Moon II', 8, 50, true);
INSERT INTO public.moon VALUES (12, 'Vega Moon III', 8, 70, false);
INSERT INTO public.moon VALUES (13, 'Rigel Moon I', 9, 80, false);
INSERT INTO public.moon VALUES (14, 'Rigel Moon II', 10, 90, false);
INSERT INTO public.moon VALUES (15, 'Rigel Moon III', 11, 100, false);
INSERT INTO public.moon VALUES (16, 'Rigel Moon IV', 12, 110, false);
INSERT INTO public.moon VALUES (17, 'Rigel Moon V', 12, 120, false);
INSERT INTO public.moon VALUES (18, 'Rigel Moon VI', 12, 130, false);
INSERT INTO public.moon VALUES (19, 'Rigel Moon VII', 12, 140, false);
INSERT INTO public.moon VALUES (20, 'Rigel Moon VIII', 12, 150, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 6371, 149600000, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 3389, 227900000, false);
INSERT INTO public.planet VALUES (3, 'Kepler-22b', 2, 24700, 600000000, false);
INSERT INTO public.planet VALUES (4, 'Proxima b', 3, 6371, 7730000, false);
INSERT INTO public.planet VALUES (5, 'Betelgeuse I', 4, 5000, 300000000, false);
INSERT INTO public.planet VALUES (6, 'Betelgeuse II', 4, 6000, 450000000, false);
INSERT INTO public.planet VALUES (7, 'Vega I', 5, 9000, 250000000, false);
INSERT INTO public.planet VALUES (8, 'Vega II', 5, 10000, 350000000, false);
INSERT INTO public.planet VALUES (9, 'Rigel I', 6, 20000, 600000000, false);
INSERT INTO public.planet VALUES (10, 'Rigel II', 6, 21000, 700000000, false);
INSERT INTO public.planet VALUES (11, 'Rigel III', 6, 22000, 800000000, false);
INSERT INTO public.planet VALUES (12, 'Rigel IV', 6, 23000, 900000000, false);


--
-- Data for Name: spaceship; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spaceship VALUES (1, 'Enterprise', 1000, 'Exploration', true);
INSERT INTO public.spaceship VALUES (2, 'Millennium Falcon', 4, 'Smuggling', true);
INSERT INTO public.spaceship VALUES (3, 'Discovery', 150, 'Research', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1989000000000000000000000000000, 1, true, true);
INSERT INTO public.star VALUES (2, 'Sirius', 2, 3978000000000000000000000000000, 25, true, false);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 3, 244600000000000000000000000000, 0, true, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 4, 28000000000000000000000000000000, 100000, true, false);
INSERT INTO public.star VALUES (5, 'Vega', 5, 4100000000000000000000000000000, 40, true, false);
INSERT INTO public.star VALUES (6, 'Rigel', 6, 40500000000000000000000000000000, 120000, true, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: spaceship_spaceship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spaceship_spaceship_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: spaceship spaceship_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceship
    ADD CONSTRAINT spaceship_name_key UNIQUE (name);


--
-- Name: spaceship spaceship_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceship
    ADD CONSTRAINT spaceship_pkey PRIMARY KEY (spaceship_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

