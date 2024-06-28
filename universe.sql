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
\ connect universe
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
    name character varying(30) NOT NULL,
    description text,
    age integer,
    distance_from_earth numeric,
    has_life boolean NOT NULL
);
ALTER TABLE public.galaxy OWNER TO freecodecamp;
--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.galaxy_galaxy_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
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
    name character varying(30) NOT NULL,
    description text,
    age integer,
    distance_from_earth numeric,
    has_life boolean NOT NULL,
    orbital_period double precision,
    planet_id integer
);
ALTER TABLE public.moon OWNER TO freecodecamp;
--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.moon_moon_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
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
    name character varying(30) NOT NULL,
    description text,
    age integer,
    distance_from_earth numeric,
    has_life boolean NOT NULL,
    orbital_period double precision,
    star_id integer
);
ALTER TABLE public.planet OWNER TO freecodecamp;
--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.planet_planet_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;
--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;
--
-- Name: spacecraft; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.spacecraft (
    spacecraft_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    launched integer,
    crew integer,
    destination character varying(255)
);
ALTER TABLE public.spacecraft OWNER TO freecodecamp;
--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.spacecraft_spacecraft_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.spacecraft_spacecraft_id_seq OWNER TO freecodecamp;
--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.spacecraft_spacecraft_id_seq OWNED BY public.spacecraft.spacecraft_id;
--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age integer,
    spectral_type character varying(10),
    distance_from_earth numeric,
    has_life boolean NOT NULL,
    galaxy_id integer
);
ALTER TABLE public.star OWNER TO freecodecamp;
--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.star_star_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;
--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;
--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.galaxy
ALTER COLUMN galaxy_id
SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);
--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.moon
ALTER COLUMN moon_id
SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);
--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.planet
ALTER COLUMN planet_id
SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);
--
-- Name: spacecraft spacecraft_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.spacecraft
ALTER COLUMN spacecraft_id
SET DEFAULT nextval('public.spacecraft_spacecraft_id_seq'::regclass);
--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.star
ALTER COLUMN star_id
SET DEFAULT nextval('public.star_star_id_seq'::regclass);
--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO public.galaxy
VALUES (
        9,
        'Andromeda',
        'A large spiral galaxy',
        1000000000,
        7700000000,
        true
    );
INSERT INTO public.galaxy
VALUES (
        10,
        'Milky Way',
        'The galaxy that contains our solar system',
        14,
        0,
        true
    );
INSERT INTO public.galaxy
VALUES (
        11,
        'Centaurus A',
        'A globular cluster',
        14,
        25000,
        true
    );
INSERT INTO public.galaxy
VALUES (
        12,
        'Whirlpool',
        'A giant molecular ring',
        14,
        1000000,
        true
    );
INSERT INTO public.galaxy
VALUES (
        13,
        'Dwarf Spheroidal',
        'A small, irregular galaxy',
        14,
        2000000,
        false
    );
INSERT INTO public.galaxy
VALUES (
        14,
        'Sombrero',
        'A dwarf irregular galaxy',
        14,
        10000,
        true
    );
INSERT INTO public.galaxy
VALUES (
        15,
        'Galaxy Cluster',
        'A large group of galaxies',
        14,
        1000000000,
        true
    );
--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO public.moon
VALUES (18, 'Phobos', '', 1, 0.0000001, false, 1, 1);
INSERT INTO public.moon
VALUES (19, 'Deimos', '', 1, 0.0000001, false, 1, 1);
INSERT INTO public.moon
VALUES (20, 'Io', '', 0, 0.007, false, 0.007, 2);
INSERT INTO public.moon
VALUES (21, 'Europa', '', 0, 0.009, false, 0.009, 2);
INSERT INTO public.moon
VALUES (22, 'Ganymede', '', 0, 0.17, false, 0.17, 3);
INSERT INTO public.moon
VALUES (23, 'Callisto', '', 0, 0.28, false, 0.28, 3);
INSERT INTO public.moon
VALUES (24, 'Amalthea', '', 0, 0.007, false, 0.007, 4);
INSERT INTO public.moon
VALUES (25, 'Thebe', '', 0, 0.007, false, 0.007, 4);
INSERT INTO public.moon
VALUES (26, 'Himalia', '', 0, 0.007, false, 0.007, 4);
INSERT INTO public.moon
VALUES (27, 'Elara', '', 0, 0.007, false, 0.007, 4);
INSERT INTO public.moon
VALUES (28, 'Pasiphae', '', 0, 0.007, false, 0.007, 4);
INSERT INTO public.moon
VALUES (29, 'Sycorax', '', 0, 0.007, false, 0.007, 4);
INSERT INTO public.moon
VALUES (30, 'Lysithea', '', 0, 0.007, false, 0.007, 5);
INSERT INTO public.moon
VALUES (31, 'Carme', '', 0, 0.007, false, 0.007, 5);
INSERT INTO public.moon
VALUES (32, 'Ananke', '', 0, 0.007, false, 0.007, 5);
INSERT INTO public.moon
VALUES (33, 'Leda', '', 0, 0.007, false, 0.007, 5);
INSERT INTO public.moon
VALUES (34, 'Theba', '', 0, 0.007, false, 0.007, 5);
INSERT INTO public.moon
VALUES (35, 'Pandora', '', 0, 0.007, false, 0.007, 6);
INSERT INTO public.moon
VALUES (36, 'Prometheus', '', 0, 0.007, false, 0.007, 6);
INSERT INTO public.moon
VALUES (37, 'Atlas', '', 0, 0.007, false, 0.007, 7);
INSERT INTO public.moon
VALUES (38, 'Dione', '', 0, 0.007, false, 0.007, 7);
INSERT INTO public.moon
VALUES (39, 'Rhea', '', 0, 0.007, false, 0.007, 8);
INSERT INTO public.moon
VALUES (40, 'Tethys', '', 0, 0.007, false, 0.007, 8);
--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO public.planet
VALUES (1, 'Mercury', '', 1, 0.387, false, 0.24, 1);
INSERT INTO public.planet
VALUES (2, 'Venus', '', 1, 0.723, false, 0.615, 2);
INSERT INTO public.planet
VALUES (3, 'Earth', '', 1, 1, true, 1, 3);
INSERT INTO public.planet
VALUES (4, 'Mars', '', 2, 1.52, false, 1.88, 4);
INSERT INTO public.planet
VALUES (5, 'Jupiter', '', 12, 5.203, false, 11.86, 5);
INSERT INTO public.planet
VALUES (6, 'Saturn', '', 29, 9.449, false, 29.46, 6);
INSERT INTO public.planet
VALUES (7, 'Uranus', '', 84, 19.18, false, 84, 7);
INSERT INTO public.planet
VALUES (8, 'Neptune', '', 165, 30.06, false, 164.8, 5);
INSERT INTO public.planet
VALUES (9, 'Ceres', '', 5, 0.003, false, 0.003, 3);
INSERT INTO public.planet
VALUES (10, 'Haumea', '', 74, 0.00003, false, 0.0003, 7);
INSERT INTO public.planet
VALUES (
        11,
        'Makemake',
        '',
        52,
        0.0000003,
        false,
        3e -07,
        2
    );
INSERT INTO public.planet
VALUES (12, 'Eris', '', 914, 0.0000003, false, 3e -06, 6);
--
-- Data for Name: spacecraft; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO public.spacecraft
VALUES (
        1,
        'Endurance',
        'A mission to study the Van Allen belts',
        1,
        4,
        'Mars'
    );
INSERT INTO public.spacecraft
VALUES (
        2,
        'Curiosity',
        'A robotic rover that explores Mars',
        1,
        7,
        'Mars'
    );
INSERT INTO public.spacecraft
VALUES (
        3,
        'New Horizons',
        'A spacecraft that explores Pluto and its moons',
        1,
        1,
        'Pluto'
    );
INSERT INTO public.spacecraft
VALUES (
        4,
        'Galileo',
        'A spacecraft that explores Jupiter',
        1,
        1,
        'Jupiter'
    );
INSERT INTO public.spacecraft
VALUES (
        5,
        'Voyager 1',
        'A spacecraft that explores the outer solar system',
        1,
        1,
        'Jupiter'
    );
--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO public.star
VALUES (
        1,
        'Sun',
        'The star at the center of our solar system.',
        460000,
        'G2',
        0,
        true,
        9
    );
INSERT INTO public.star
VALUES (
        2,
        'Vega',
        'A star in the constellation Lyra.',
        46000,
        'G2',
        25.38,
        true,
        10
    );
INSERT INTO public.star
VALUES (
        3,
        'Rigel',
        'A star in the constellation Orion.',
        21000,
        'K2',
        898.5,
        true,
        11
    );
INSERT INTO public.star
VALUES (
        4,
        'Betelgeuse',
        'A red supergiant star in the constellation Orion.',
        10,
        'M3',
        604,
        true,
        12
    );
INSERT INTO public.star
VALUES (
        5,
        'Aldebaran',
        'A yellow supergiant star in the constellation Taurus.',
        110000,
        'K0',
        114,
        true,
        13
    );
INSERT INTO public.star
VALUES (
        6,
        'Capella',
        'A yellow-orange star in the constellation Auriga.',
        110000,
        'G8',
        42.46,
        true,
        14
    );
INSERT INTO public.star
VALUES (
        7,
        'Proxima Centauri',
        'A small, cool star located about 4.24 light-years from the Sun.',
        14,
        'M7',
        0.04,
        true,
        15
    );
--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 15, true);
--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);
--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);
--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT pg_catalog.setval('public.spacecraft_spacecraft_id_seq', 5, true);
--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);
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
-- Name: spacecraft spacecraft_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.spacecraft
ADD CONSTRAINT spacecraft_name_key UNIQUE (name);
--
-- Name: spacecraft spacecraft_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.spacecraft
ADD CONSTRAINT spacecraft_pkey PRIMARY KEY (spacecraft_id);
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
ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);
--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.planet
ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);
--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.star
ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);
--
-- PostgreSQL database dump complete
- -