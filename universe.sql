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
    name character varying(40) NOT NULL,
    description text,
    mass_suns numeric(5,1),
    diameter integer,
    distance integer,
    is_visible boolean,
    has_orbit boolean
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
-- Name: galaxy_star_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_star_planet (
    galaxy_star_planet_id integer NOT NULL,
    galaxy_id integer,
    star_id integer,
    planet_id integer,
    name character varying(40) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_star_planet OWNER TO freecodecamp;

--
-- Name: galaxy_star_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_star_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_star_planet_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_star_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_star_planet_id_seq OWNED BY public.galaxy_star_planet.galaxy_star_planet_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    mass_suns numeric(5,1),
    diameter integer,
    distance integer,
    is_visible boolean,
    has_orbit boolean,
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
    name character varying(40) NOT NULL,
    description text,
    mass_suns numeric(5,1),
    diameter integer,
    distance integer,
    is_visible boolean,
    has_orbit boolean,
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
    name character varying(40) NOT NULL,
    description text,
    mass_suns numeric(5,1),
    diameter integer,
    distance integer,
    is_visible boolean,
    has_orbit boolean,
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
-- Name: galaxy_star_planet galaxy_star_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet ALTER COLUMN galaxy_star_planet_id SET DEFAULT nextval('public.galaxy_star_planet_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'galaxy1', 'This is galaxy description', 530.4, 12345, 123245, false, false);
INSERT INTO public.galaxy VALUES (2, 'galaxy2', 'This is galaxy description', 650.3, 12345, 123245, false, false);
INSERT INTO public.galaxy VALUES (3, 'galaxy3', 'This is galaxy description', 490.7, 12345, 123245, false, false);
INSERT INTO public.galaxy VALUES (4, 'galaxy4', 'This is galaxy description', 640.5, 12345, 123245, false, false);
INSERT INTO public.galaxy VALUES (5, 'galaxy5', 'This is galaxy description', 580.4, 12345, 123245, false, false);
INSERT INTO public.galaxy VALUES (6, 'galaxy6', 'This is galaxy description', 710.6, 12345, 123245, false, false);


--
-- Data for Name: galaxy_star_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_star_planet VALUES (1, 1, 2, 3, 'milky_sun_earth', 'milkyway,sun, earth');
INSERT INTO public.galaxy_star_planet VALUES (2, 1, 2, 4, 'milky_sun_mars', 'milkyway,sun,mars');
INSERT INTO public.galaxy_star_planet VALUES (3, 1, 2, 1, 'milky_sun_mercury', 'milkyway,sun,mercury');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Earth''s natural satellite', 73.4, 34748, 38445, true, true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Mars''s larger moon', 1.1, 224, 942345, true, true, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Mars''s smaller moon', 0.1, 124, 235, true, true, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'Jupiter''s moon with volcanic activity', 8.9, 3432, 4218, true, true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Icy moon of Jupiter', 4.8, 316, 671, true, true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Largest moon in the solar system', 1.4, 524, 704, true, true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Galilean moon of Jupiter', 10.7, 486, 827, true, true, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'Saturn''s largest moon', 13.4, 510, 1218, true, true, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Moon of Saturn with ice geysers', 1.4, 502, 2238, true, true, 6);
INSERT INTO public.moon VALUES (10, 'Miranda', 'Uranus''s moon with varied terrain', 6.5, 4724, 23513, true, true, 7);
INSERT INTO public.moon VALUES (11, 'Ariel', 'Moon of Uranus with valleys and ridges', 1.3, 5796, 12325, true, true, 7);
INSERT INTO public.moon VALUES (12, 'Umbriel', 'Dark moon of Uranus', 11.7, 5847, 4539, true, true, 7);
INSERT INTO public.moon VALUES (13, 'Titania', 'Uranus''s largest moon', 3.5, 7884, 67887, true, true, 7);
INSERT INTO public.moon VALUES (14, 'Oberon', 'Moon of Uranus with ancient surface', 3.1, 7614, 23411, true, true, 7);
INSERT INTO public.moon VALUES (15, 'Triton', 'Neptune''s large moon with retrograde orbit', 2.1, 2707, 23548, true, true, 8);
INSERT INTO public.moon VALUES (16, 'Nereid', 'Neptune''s third-largest moon', 3.0, 1784, 5134, true, true, 8);
INSERT INTO public.moon VALUES (17, 'Charon', 'Pluto''s largest moon', 1.5, 1202, 5959, true, true, 9);
INSERT INTO public.moon VALUES (18, 'Styx', 'One of Pluto''s small moons', 7.8, 106, 427, true, true, 9);
INSERT INTO public.moon VALUES (19, 'Kerberos', 'Small moon of Pluto', 1.3, 192, 578, true, true, 9);
INSERT INTO public.moon VALUES (20, 'Hydra', 'Pluto''s outermost moon', 1.6, 456, 647, true, true, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Small rocky planet', 0.1, 4879, 391, true, true, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Hot and cloudy planet', 0.8, 12104, 722, true, true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Blue and green planet', 1.0, 12742, 134, true, true, 2);
INSERT INTO public.planet VALUES (4, 'Mars', 'Red planet with polar ice caps', 0.1, 6779, 2, true, true, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Giant gas planet', 317.8, 139822, 520, true, true, 3);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Ringed gas planet', 95.2, 116464, 958, true, true, 3);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice giant planet', 14.5, 50724, 1922, true, true, 4);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Blue gas planet', 17.1, 49244, 3005, true, true, 4);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf planet', 0.1, 2370, 3948, true, true, 5);
INSERT INTO public.planet VALUES (10, 'Eris', 'Dwarf planet in Kuiper Belt', 0.1, 2326, 6778, true, true, 5);
INSERT INTO public.planet VALUES (11, 'Haumea', 'Dwarf planet with elongated shape', 0.1, 1960, 4313, true, true, 6);
INSERT INTO public.planet VALUES (12, 'Makemake', 'Dwarf planet in Kuiper Belt', 0.1, 1434, 4579, true, true, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star1', 'This is star description', 530.4, 12345, 123245, false, false, 1);
INSERT INTO public.star VALUES (2, 'star2', 'This is star description', 650.3, 12345, 123245, false, false, 2);
INSERT INTO public.star VALUES (3, 'star3', 'This is star description', 490.7, 12345, 123245, false, false, 3);
INSERT INTO public.star VALUES (4, 'star4', 'This is star description', 640.5, 12345, 123245, false, false, 4);
INSERT INTO public.star VALUES (5, 'star5', 'This is star description', 580.4, 12345, 123245, false, false, 5);
INSERT INTO public.star VALUES (6, 'star6', 'This is star description', 710.6, 12345, 123245, false, false, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_star_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_star_planet_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


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
-- Name: galaxy_star_planet galaxy_star_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet
    ADD CONSTRAINT galaxy_star_planet_name_key UNIQUE (name);


--
-- Name: galaxy_star_planet galaxy_star_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet
    ADD CONSTRAINT galaxy_star_planet_pkey PRIMARY KEY (galaxy_star_planet_id);


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
-- Name: galaxy_star_planet galaxy_star_planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet
    ADD CONSTRAINT galaxy_star_planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy_star_planet galaxy_star_planet_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet
    ADD CONSTRAINT galaxy_star_planet_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: galaxy_star_planet galaxy_star_planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet
    ADD CONSTRAINT galaxy_star_planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

