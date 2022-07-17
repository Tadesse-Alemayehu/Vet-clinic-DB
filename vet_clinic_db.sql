--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Ubuntu 14.4-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.4 (Ubuntu 14.4-0ubuntu0.22.04.1)

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
    name character varying(20),
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
    full_name character varying(20),
    age integer,
    email character varying(120)
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
-- Name: specializations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.specializations (
    id integer NOT NULL,
    species_id integer,
    vet_id integer
);


ALTER TABLE public.specializations OWNER TO postgres;

--
-- Name: specializations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.specializations ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.specializations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: species; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.species (
    id integer NOT NULL,
    name character varying(20)
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
    name character varying(20),
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
    id integer NOT NULL,
    animal_id integer,
    vet_id integer,
    date_of_visit date
);


ALTER TABLE public.visits OWNER TO postgres;

--
-- Name: visits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.visits ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.visits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: animals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg, species_id, owner_id) FROM stdin;
\.


--
-- Data for Name: owners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.owners (id, full_name, age, email) FROM stdin;
\.


--
-- Data for Name: specializations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.specializations (id, species_id, vet_id) FROM stdin;
\.


--
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.species (id, name) FROM stdin;
\.


--
-- Data for Name: vets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vets (id, name, age, date_of_graduation) FROM stdin;
1	William Tatcher	\N	\N
2	Maisy Smith	\N	\N
3	Stephanie Mendez	\N	\N
4	Jack Harkness	\N	\N
\.


--
-- Data for Name: visits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.visits (id, animal_id, vet_id, date_of_visit) FROM stdin;
\.


--
-- Name: animals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.animals_id_seq', 10, true);


--
-- Name: owners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.owners_id_seq', 2500000, true);


--
-- Name: specializations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.specializations_id_seq', 1, false);


--
-- Name: species_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.species_id_seq', 1, false);


--
-- Name: vets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vets_id_seq', 4, true);


--
-- Name: visits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.visits_id_seq', 10782840, true);


--
-- Name: animals animals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_pkey PRIMARY KEY (id);


--
-- Name: owners owners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owners
    ADD CONSTRAINT owners_pkey PRIMARY KEY (id);


--
-- Name: specializations specializations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specializations
    ADD CONSTRAINT specializations_pkey PRIMARY KEY (id);


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
-- Name: visits visits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visits
    ADD CONSTRAINT visits_pkey PRIMARY KEY (id);


--
-- Name: animal_visit_count; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX animal_visit_count ON public.visits USING btree (animal_id);


--
-- Name: owner_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX owner_email_index ON public.owners USING btree (email);


--
-- Name: visits_vet_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX visits_vet_id_index ON public.visits USING btree (vet_id);


--
-- Name: animals animals_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.owners(id);


--
-- Name: animals animals_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_species_id_fkey FOREIGN KEY (species_id) REFERENCES public.species(id);


--
-- Name: specializations specializations_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specializations
    ADD CONSTRAINT specializations_species_id_fkey FOREIGN KEY (species_id) REFERENCES public.species(id);


--
-- Name: specializations specializations_vet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specializations
    ADD CONSTRAINT specializations_vet_id_fkey FOREIGN KEY (vet_id) REFERENCES public.vets(id);


--
-- Name: visits visits_animal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visits
    ADD CONSTRAINT visits_animal_id_fkey FOREIGN KEY (animal_id) REFERENCES public.animals(id);


--
-- Name: visits visits_vet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visits
    ADD CONSTRAINT visits_vet_id_fkey FOREIGN KEY (vet_id) REFERENCES public.vets(id);


--
-- PostgreSQL database dump complete
--

