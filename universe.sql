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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    stars_with_planets integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type character varying(30),
    size_in_ly integer,
    description text
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
    name character varying(30) NOT NULL,
    size_in_miles numeric(10,1),
    speed_in_kms numeric(5,1),
    orbital_period_in_days numeric(5,1),
    is_habitable boolean,
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
    size_in_miles numeric(10,1),
    speed_in_kms numeric(6,1),
    orbital_period_in_days numeric(8,2),
    has_moon boolean,
    description text,
    is_habitable boolean,
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
    size_in_mil_miles numeric(7,1),
    distance_from_center_in_ly integer,
    description text,
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Andromeda', 12);
INSERT INTO public.constellation VALUES (2, 'Pegasus', 12);
INSERT INTO public.constellation VALUES (3, 'Carina', 11);
INSERT INTO public.constellation VALUES (4, 'Dorado', 5);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 87400, 'The name describes a hazy band of light seen in the night sky');
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 'Dwarf', 32500, 'It contains a stellar bar that is geometrically off-center, suggesting that it was once a barred dwarf spiral galaxy before its spiral arms were disrupted');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical', 132000, 'It is one of the brightest radio sources in the sky and a popular target for both amateur and professional astronomers');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Barred Spiral', 152000, 'The name stems from the area of the sky in which appears, the constellation of Andromeda, which itself is named after the princess who was wife of Perseus in Greek mythology');
INSERT INTO public.galaxy VALUES (5, 'Cartwheel Galaxy', 'Lenticular', 144300, 'It was discovered by Fritz Zwicky in 1941.Zwicky considered his discovery "one of the most complicated structures awaiting its explanation on the basis of stellar dynamics"');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel Galaxy', 'Spiral', 170000, 'On February 28, 2006, NASA and the European Space Agency released a very detailed image of the Pinwheel Galaxy, which was the largest and most-detailed image of a galaxy by Hubble Space Telescope at the time');
INSERT INTO public.galaxy VALUES (7, 'Tatoo', NULL, NULL, 'The Tatoo System also known as Tatooine System was a binary solar system in the sector of arkanis of the exterior border');
INSERT INTO public.galaxy VALUES (8, 'Alderaan System', NULL, NULL, 'The Aldeeran System was a stellar system in the center worlds of the galaxy. It was home of the planet alderaan before it was destroyed by the first Death Star');
INSERT INTO public.galaxy VALUES (9, 'Kashyyyk System', NULL, NULL, 'The Kashyyyk System was a stellar system in the Mytaranor sector of the Middle Border. Contains the planet Kashyyyk and Trandosha');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1079.5, 1.0, 27.3, false, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 7000.9, 2.1, 0.3, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 3.8, 1.3, 1.3, false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 1131.8, 17.3, 1.8, false, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 969.8, 13.7, 3.6, false, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1636.7, 10.8, 7.2, false, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 1497.6, 8.2, 16.7, false, 5);
INSERT INTO public.moon VALUES (8, 'Mimas', 123.1, 14.2, 0.9, false, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 156.6, NULL, 1.4, false, 6);
INSERT INTO public.moon VALUES (10, 'Tethys', 329.9, 11.3, 1.9, false, 6);
INSERT INTO public.moon VALUES (11, 'Dione', 348.8, NULL, 2.7, false, 6);
INSERT INTO public.moon VALUES (12, 'Rhea', 474.6, 8.4, 4.5, false, 6);
INSERT INTO public.moon VALUES (13, 'Titan', 1599.8, 5.5, 15.9, false, 6);
INSERT INTO public.moon VALUES (14, 'Hyperion', 83.8, NULL, 21.3, false, 6);
INSERT INTO public.moon VALUES (15, 'Iapetus', 456.3, 3.2, 79.3, false, 6);
INSERT INTO public.moon VALUES (16, 'Phoebe', 66.1, NULL, 550.6, false, 6);
INSERT INTO public.moon VALUES (17, 'Puck', 50.3, 8.2, 0.8, false, 7);
INSERT INTO public.moon VALUES (18, 'Miranda', 146.5, 6.6, 1.4, false, 7);
INSERT INTO public.moon VALUES (19, 'Ariel', 359.7, 5.5, 2.5, false, 7);
INSERT INTO public.moon VALUES (20, 'Umbriel', 363.3, 4.6, 4.1, false, 7);
INSERT INTO public.moon VALUES (21, 'Farming Moon', NULL, NULL, NULL, true, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (10, 'Tatooine', 6502.6, NULL, NULL, true, NULL, true, 7);
INSERT INTO public.planet VALUES (11, 'Alderaan', 7767.1, NULL, 364.00, false, NULL, true, 8);
INSERT INTO public.planet VALUES (12, 'Kashyyyk', 7931.8, NULL, 381.00, true, NULL, true, 9);
INSERT INTO public.planet VALUES (1, 'Mercury', 960.0, 47.3, 87.96, false, 'Mercury is the first planet from the Sun and the smallest in the Solar System. In English, it is named after the ancient Roman god Mercurius (Mercury)', false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 3760.4, 35.0, 583.92, false, 'Venus is notable for having the densest atmosphere of the terrestrial planets, composed mostly of carbon dioxide with a thick, global sulfuric acid cloud cover', false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 7926.0, 29.7, 365.25, true, 'Earth is the third planet from the Sun and the only astronomical object known to harbor life. This is enabled by Earth being an ocean world, the only one in the Solar System sustaining liquid surface water', true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 2106.1, 24.0, 686.98, true, 'The surface of Mars is orange-red because it is covered in iron(III) oxide dust, giving it the nickname "the Red Planet"', false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 43440.7, 13.0, 398.88, true, 'A gas giant, it mass is more than two and a half times that of all the other planets in the Solar System combined and slightly less than one one-thousandth the mass of the Sun', false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 36183.6, 9.6, 10755.70, true, 'It has only one-eighth the average density of Earth, but is over 95 times more massive', false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 15759.2, 6.8, 30688.50, true, 'It is a gaseous cyan-coloured ice giant. Most of the planet is made of water, ammonia, and methane in a supercritical phase of matter, which in astronomy is called "ice" or volatiles', false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 30775.0, 5.4, 60195.00, true, ' It is 17 times the mass of Earth, and slightly more massive than fellow ice giant Uranus. Neptune is denser and physically smaller than Uranus because its greater mass causes more gravitational compression of its atmosphere', false, 1);
INSERT INTO public.planet VALUES (9, 'Dimidium', 84400.8, 136.0, 4.23, NULL, 'It was the first exoplanet to be discovered orbiting a main-sequence star, the Sun-like 51 Pegasi, and marked a breakthrough in astronomical research', NULL, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 0.8, 26000, 'The Sun is the star at the center of the Solar System. It is a massive, nearly perfect ball of hot plasma', 1);
INSERT INTO public.star VALUES (4, 'LMC195-1', 1.1, 186000, 'It is an extremely rare member of the WO oxygen sequence, at WO2 the hottest known in the LMC', 3);
INSERT INTO public.star VALUES (2, 'Canopus', 6.9, 26310, 'Canopus is a bright giant of spectral type A9, so it is essentially white when seen with the naked eye', 1);
INSERT INTO public.star VALUES (3, 'Sirius', 1.5, 34611, 'Its name is derived from the Greek word Σείριος (Latin script: Seirios), meaning "glowing" or "scorching"', 1);
INSERT INTO public.star VALUES (5, 'Alpheratz', 2.2, 26097, 'Although it appears to the naked eye as a single star, with overall apparent visual magnitude +2.06, it is actually a binary system composed of two stars in close orbit', 2);
INSERT INTO public.star VALUES (6, 'Beta Pegasi', 76.0, 26196, 'It bore the traditional name of Scheat, a name that had also been used for Delta Aquarii. The name was derived from the Arabic "the upper arm"', 4);
INSERT INTO public.star VALUES (8, 'Sun of Alderaan', NULL, NULL, NULL, 8);
INSERT INTO public.star VALUES (9, 'Kashyyyk', NULL, NULL, NULL, 9);
INSERT INTO public.star VALUES (7, 'Tatoo I and II', NULL, NULL, NULL, 7);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
--

