--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

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
-- Name: animals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.animals (
    id integer NOT NULL,
    name character varying,
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg numeric,
    species_id integer,
    owner_id integer
);


ALTER TABLE public.animals OWNER TO postgres;

--
-- Name: animals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.animals ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.animals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: owners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.owners (
    id integer NOT NULL,
    full_name character varying,
    age integer
);


ALTER TABLE public.owners OWNER TO postgres;

--
-- Name: owners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.owners ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.owners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: specialties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.specialties (
    vet integer,
    species integer
);


ALTER TABLE public.specialties OWNER TO postgres;

--
-- Name: species; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.species (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.species OWNER TO postgres;

--
-- Name: species_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.species ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.species_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: vets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vets (
    id integer NOT NULL,
    name character varying,
    age integer,
    date_of_graduation date
);


ALTER TABLE public.vets OWNER TO postgres;

--
-- Name: vets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.vets ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.vets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: visits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.visits (
    animal integer,
    vet integer,
    visit_date date
);


ALTER TABLE public.visits OWNER TO postgres;

--
-- Data for Name: animals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg, species_id, owner_id) FROM stdin;
8	Agumon	2020-02-03	0	t	10.23	2	1
9	Gabumon	2018-11-15	2	t	8	2	2
11	Devimon	2017-05-12	5	t	11	2	3
2	Plantmon	20201-11-15	2	t	-5.7	2	3
4	Angemon	2005-06-12	5	t	-45	2	5
5	Boarmon	2005-06-07	2	t	20.4	2	5
7	Ditto	2022-05-14	5	t	22	1	\N
10	Pikachu	2021-01-07	1	f	15.04	1	2
1	Charmander	2020-02-08	0	f	-11	1	4
3	Squirtle	1993-04-02	1	f	-12.13	1	4
6	Blossom	1998-10-13	1	t	17	1	4
\.


--
-- Data for Name: owners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.owners (id, full_name, age) FROM stdin;
1	Sam Smith	34
2	Jennifer Orwell	19
3	Bob 	45
4	Melody Pond	44
5	Dean Winchester	14
6	Jodie Whittaker	38
\.


--
-- Data for Name: specialties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.specialties (vet, species) FROM stdin;
1	1
3	2
3	2
4	1
\.


--
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.species (id, name) FROM stdin;
1	Pokemon
2	Digimon
\.


--
-- Data for Name: vets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vets (id, name, age, date_of_graduation) FROM stdin;
1	William Tatcher	45	2000-04-23
2	Maisy Smith	26	2019-04-23
3	Stephanie Mendez	64	1981-04-23
4	Jack Harkness	38	2008-04-23
\.


--
-- Data for Name: visits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.visits (animal, vet, visit_date) FROM stdin;
8	1	2020-05-24
8	3	2020-06-22
9	4	2021-02-02
10	2	2020-01-05
10	2	2020-03-08
10	2	2020-05-14
11	3	2021-05-04
1	4	2021-02-24
2	2	2019-12-21
2	1	2020-08-10
2	2	2021-04-07
3	3	2019-04-29
4	4	2020-10-03
4	4	2020-11-04
5	2	2019-01-02
5	2	2019-05-15
5	2	2020-02-27
5	2	2020-08-03
6	3	2020-05-24
6	1	2021-01-11
\.


--
-- Name: animals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.animals_id_seq', 11, true);


--
-- Name: owners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.owners_id_seq', 6, true);


--
-- Name: species_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.species_id_seq', 2, true);


--
-- Name: vets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vets_id_seq', 4, true);


--
-- Name: animals animal_primary_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animal_primary_key PRIMARY KEY (id);


--
-- Name: owners owners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owners
    ADD CONSTRAINT owners_pkey PRIMARY KEY (id);


--
-- Name: species species_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pkey PRIMARY KEY (id);


--
-- Name: vets vets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vets
    ADD CONSTRAINT vets_pkey PRIMARY KEY (id);


--
-- Name: visits animal_visit_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visits
    ADD CONSTRAINT animal_visit_fk FOREIGN KEY (animal) REFERENCES public.animals(id);


--
-- Name: animals owner_forign_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animals
    ADD CONSTRAINT owner_forign_key FOREIGN KEY (owner_id) REFERENCES public.owners(id);


--
-- Name: animals species_foregn_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animals
    ADD CONSTRAINT species_foregn_key FOREIGN KEY (species_id) REFERENCES public.species(id);


--
-- Name: specialties species_specialized_vets; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specialties
    ADD CONSTRAINT species_specialized_vets FOREIGN KEY (species) REFERENCES public.species(id);


--
-- Name: specialties vet_specializes_in; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specialties
    ADD CONSTRAINT vet_specializes_in FOREIGN KEY (vet) REFERENCES public.vets(id);


--
-- Name: visits vet_visited_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visits
    ADD CONSTRAINT vet_visited_fk FOREIGN KEY (vet) REFERENCES public.vets(id);


--
-- PostgreSQL database dump complete
--

