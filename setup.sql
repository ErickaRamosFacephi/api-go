--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3 (Debian 14.3-1.pgdg110+1)
-- Dumped by pg_dump version 14.3 (Debian 14.3-1.pgdg110+1)

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

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course (
                               id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
                               title character varying NOT NULL,
                               "creationDate" date NOT NULL,
                               "datePost" date NOT NULL,
                               author character varying NOT NULL,
                               "linkCourse" character varying NOT NULL,
                               "coverImage" character varying NOT NULL,
                               category text[] NOT NULL,
                               language text[] NOT NULL,
                               valoracion double precision NOT NULL
);


ALTER TABLE public.course OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
                              id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
                              email text NOT NULL,
                              password text NOT NULL,
                              "fullName" text NOT NULL,
                              "isActive" boolean DEFAULT true NOT NULL,
                              roles text[] DEFAULT '{user}'::text[] NOT NULL,
                              libro boolean DEFAULT true NOT NULL,
                              curso boolean DEFAULT true NOT NULL,
                              video boolean DEFAULT true NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

CREATE TABLE public.posts (
                    body text NOT NULL,
                    created_at timestamp DEFAULT now(),
                    updated_at timestamp NOT NULL,
);

ALTER TABLE public.posts OWNER TO postgres;


--
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course (id, title, "creationDate", "datePost", author, "linkCourse", "coverImage", category, language, valoracion) FROM stdin;
add43742-e658-46ab-b1f2-fcf3da855c37	DOCKER 2021 - De NOVATO a PRO	2022-10-24	2022-10-24	Pelado Nerd	https://www.youtube.com/watch?v=CV_Uf3Dq-EU	https://es-wiki.ikoula.com/images/7/7a/Docker_log.png	{docker,devops}	{españoll}	5
77be039a-cdf5-4e36-9115-b10b2e7eddaf	¡Tutorial de GIT para principantes!	2022-10-24	2022-10-24	Pelado Nerd	https://www.youtube.com/watch?v=kEPF-MWGq1w	https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Git-logo.svg/640px-Git-logo.svg.png	{git,github,"linea de comandos"}	{español}	4
97a6bff4-812f-4243-9154-01fff0216f28	Curso desde cero de GraphQL - Parte 2	2022-10-24	2022-10-24	Midudev	https://www.youtube.com/watch?v=3vldzoNRz-8	https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/GraphQL_Logo.svg/800px-GraphQL_Logo.svg.png	{graphql,api,backend}	{español}	3
37f49e99-6264-4236-bd20-8b94cbbf04a7	KUBERNETES-Introducción al orquestador más usado	2022-10-24	2022-10-24	Pelado Nerd	https://www.youtube.com/watch?v=oTf0KxK1QNo&list=PLqRCtm0kbeHA5M_E_Anwu-vh4NWlgrOY_	https://cursosdedesarrollo.com/wp-content/uploads/2020/03/k-logo.png	{docker,kubernetes,devops}	{españolll}	4
26167be5-e940-44f6-8791-18e82997aa78	Aprendiendo Node.JS y Express para crear una API	2022-10-24	2022-10-24	Midudev	https://www.youtube.com/watch?v=o85OkeVtm7k	https://raw.githubusercontent.com/MathiasRanieliFP/FotoChange/main/nodejs%2Bexpress.png	{js,node,express,api}	{español}	4
49ae06b5-3d46-4a19-8816-12b2aa73009b	Curso desde cero de GraphQL - Parte 1	2022-10-24	2022-10-24	AuthorTestTest	https://www.youtube.com/watch?v=QG-qbmW-wes	https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/GraphQL_Logo.svg/800px-GraphQL_Logo.svg.png	{graphql,api,backend}	{español}	4
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, "fullName", "isActive", roles, libro, curso, video) FROM stdin;
c42ef6b7-e026-4a70-88d5-53dbaab467e4	alvarogarrido@facephi.com	$2b$10$DS1Z.vbdworkZAkk.06J9up5ytQsU7qR9WU/yvE89JJhTNENs65li	Álvaro Garrido	t	{admin,user}	t	t	t
c203e7ce-e3ac-4f3f-9140-9f9f51cc1140	eva@facephi.com	$2b$10$dCB6bg8tFNw4Xf0vRPl.GOThdW0rQoYq.FtZAkhemUSPQMUOE9sZy	Eva	t	{admin}	t	t	t
\.


--
-- Name: users PK_a3ffb1c0c8416b9fc6f907b7433; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "PK_a3ffb1c0c8416b9fc6f907b7433" PRIMARY KEY (id);


--
-- Name: course PK_bf95180dd756fd204fb01ce4916; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT "PK_bf95180dd756fd204fb01ce4916" PRIMARY KEY (id);


--
-- Name: users UQ_97672ac88f789774dd47f7c8be3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "UQ_97672ac88f789774dd47f7c8be3" UNIQUE (email);

