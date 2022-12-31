--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(30) NOT NULL,
    supermassive boolean,
    parsec_across numeric(4,1),
    type text
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
-- Name: life_specie; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.life_specie (
    life_specie_id integer NOT NULL,
    name character varying(40) NOT NULL,
    intelligent boolean,
    planet_id integer
);


ALTER TABLE public.life_specie OWNER TO freecodecamp;

--
-- Name: life_specie_specie_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.life_specie_specie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.life_specie_specie_id_seq OWNER TO freecodecamp;

--
-- Name: life_specie_specie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.life_specie_specie_id_seq OWNED BY public.life_specie.life_specie_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    radius_km integer,
    is_spherical boolean,
    planet_id integer
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
    name character varying(30) NOT NULL,
    planet_type character varying(30),
    distance_host_star_mil_km integer,
    star_id integer
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_bil_years numeric(3,1),
    future_supernovae boolean,
    galaxy_id integer
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
-- Name: life_specie life_specie_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life_specie ALTER COLUMN life_specie_id SET DEFAULT nextval('public.life_specie_specie_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milky way', true, 150.3, 'spiral');
INSERT INTO public.galaxy VALUES (2, 'andromeda', true, 120.7, 'spiral');
INSERT INTO public.galaxy VALUES (3, 'bogey', false, 10.5, 'irregular');
INSERT INTO public.galaxy VALUES (4, 'st113', true, 300.5, 'spiral');
INSERT INTO public.galaxy VALUES (5, 'blarkep', false, 40.3, 'elliptical');
INSERT INTO public.galaxy VALUES (6, 'guarfuargs', true, 98.4, 'elliptical');
INSERT INTO public.galaxy VALUES (7, 'sketysketybooboo', true, 900.2, 'spiral');


--
-- Data for Name: life_specie; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.life_specie VALUES (1, 'human', true, 1);
INSERT INTO public.life_specie VALUES (2, 'martians', true, 2);
INSERT INTO public.life_specie VALUES (3, 'gobligeks', true, 7);
INSERT INTO public.life_specie VALUES (4, 'marties', false, 2);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 3000, true, 1);
INSERT INTO public.moon VALUES (2, 'eros', 1500, true, 2);
INSERT INTO public.moon VALUES (3, 'a1', 6000, true, 3);
INSERT INTO public.moon VALUES (4, 'a2', 5500, true, 3);
INSERT INTO public.moon VALUES (5, 'b1', 2000, true, 3);
INSERT INTO public.moon VALUES (6, 'b2', 1200, true, 3);
INSERT INTO public.moon VALUES (7, 'b3', 3000, true, 3);
INSERT INTO public.moon VALUES (8, 'c1', 12000, true, 3);
INSERT INTO public.moon VALUES (9, 'abba', 400, false, 4);
INSERT INTO public.moon VALUES (10, 'bluey', 33000, true, 3);
INSERT INTO public.moon VALUES (11, 'tekka', 3200, true, 5);
INSERT INTO public.moon VALUES (12, 'tyka', 900, false, 5);
INSERT INTO public.moon VALUES (13, 'm-a123a443z', 87000, true, 8);
INSERT INTO public.moon VALUES (14, 'nurgla', 300, false, 12);
INSERT INTO public.moon VALUES (15, 'luku', 700, false, 9);
INSERT INTO public.moon VALUES (16, 'athena', 4000, true, 3);
INSERT INTO public.moon VALUES (17, 'apothos', 2000, true, 2);
INSERT INTO public.moon VALUES (18, 'olympo', 3000, true, 10);
INSERT INTO public.moon VALUES (19, 'allredy', 1241, true, 11);
INSERT INTO public.moon VALUES (20, 'beebulba', 5132, true, 12);
INSERT INTO public.moon VALUES (21, 'lambsqool', 5131, true, 13);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'earth', 'solid', 93, 1);
INSERT INTO public.planet VALUES (2, 'mars', 'solid', 200, 1);
INSERT INTO public.planet VALUES (3, 'jupiter', 'gas', 600, 1);
INSERT INTO public.planet VALUES (4, 'quarkquirk', 'solid', 345, 2);
INSERT INTO public.planet VALUES (5, 'p-34xz89', 'gas', 499, 2);
INSERT INTO public.planet VALUES (6, 'jljl5', 'solid', 4000, 3);
INSERT INTO public.planet VALUES (7, 'tukytuk', 'gas', 2400, 3);
INSERT INTO public.planet VALUES (8, 'blargblurgh', 'solid', 344, 4);
INSERT INTO public.planet VALUES (9, 'hyukligh', 'solid', 134, 4);
INSERT INTO public.planet VALUES (10, 'p-1531zzgx11', 'gas', 788, 5);
INSERT INTO public.planet VALUES (11, 'pluckyplanet', 'solid', 23, 5);
INSERT INTO public.planet VALUES (12, 'garbled', 'gas', 890, 6);
INSERT INTO public.planet VALUES (13, 'quereuere', 'gas', 1300, 6);
INSERT INTO public.planet VALUES (14, 'byuguus', 'solid', 93, 7);
INSERT INTO public.planet VALUES (15, 'herrrbergher', 'solid', 45, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', 4.5, false, 1);
INSERT INTO public.star VALUES (2, 's-45x7', 9.8, true, 2);
INSERT INTO public.star VALUES (3, 'kettybell', 0.3, false, 3);
INSERT INTO public.star VALUES (4, 'megabang', 10.4, true, 4);
INSERT INTO public.star VALUES (5, 'bloopdybloo', 4.6, false, 5);
INSERT INTO public.star VALUES (6, 'guavalagee', 7.8, true, 6);
INSERT INTO public.star VALUES (7, 'sketchaf', 57.4, true, 7);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: life_specie_specie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.life_specie_specie_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


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
-- Name: life_specie life_specie_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life_specie
    ADD CONSTRAINT life_specie_name_key UNIQUE (name);


--
-- Name: life_specie life_specie_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life_specie
    ADD CONSTRAINT life_specie_pkey PRIMARY KEY (life_specie_id);


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
-- Name: life_specie life_specie_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life_specie
    ADD CONSTRAINT life_specie_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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
--

