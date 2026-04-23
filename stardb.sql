--
-- PostgreSQL database dump
--

\restrict IcUCouRg4hbAMJxT8hfDGESvNbm8O0TsgF4scJP8XptcOFGK1sLiG7OEAhCyhcA

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: root
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO root;

--
-- Name: gi; Type: SCHEMA; Schema: -; Owner: root
--

CREATE SCHEMA gi;


ALTER SCHEMA gi OWNER TO root;

--
-- Name: hsr; Type: SCHEMA; Schema: -; Owner: root
--

CREATE SCHEMA hsr;


ALTER SCHEMA hsr OWNER TO root;

--
-- Name: nte; Type: SCHEMA; Schema: -; Owner: root
--

CREATE SCHEMA nte;


ALTER SCHEMA nte OWNER TO root;

--
-- Name: difficulty; Type: TYPE; Schema: public; Owner: root
--

CREATE TYPE public.difficulty AS ENUM (
    'easy',
    'medium',
    'hard'
);


ALTER TYPE public.difficulty OWNER TO root;

--
-- Name: lang; Type: TYPE; Schema: public; Owner: root
--

CREATE TYPE public.lang AS ENUM (
    'de',
    'en',
    'es_es',
    'fr',
    'id',
    'ja',
    'ko',
    'pt_pt',
    'ru',
    'th',
    'vi',
    'zh_cn',
    'zh_tw'
);


ALTER TYPE public.lang OWNER TO root;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admins; Type: TABLE; Schema: auth; Owner: root
--

CREATE TABLE auth.admins (
    id integer NOT NULL
);


ALTER TABLE auth.admins OWNER TO root;

--
-- Name: users; Type: TABLE; Schema: auth; Owner: root
--

CREATE TABLE auth.users (
    id integer NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    email text
);


ALTER TABLE auth.users OWNER TO root;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: auth; Owner: root
--

ALTER TABLE auth.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME auth.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievement_categories; Type: TABLE; Schema: gi; Owner: root
--

CREATE TABLE gi.achievement_categories (
    id integer NOT NULL,
    extern_id text NOT NULL,
    sort integer NOT NULL
);


ALTER TABLE gi.achievement_categories OWNER TO root;

--
-- Name: achievement_categories_id_seq; Type: SEQUENCE; Schema: gi; Owner: root
--

ALTER TABLE gi.achievement_categories ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME gi.achievement_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievement_category_texts; Type: TABLE; Schema: gi; Owner: root
--

CREATE TABLE gi.achievement_category_texts (
    id integer NOT NULL,
    lang public.lang NOT NULL,
    category integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE gi.achievement_category_texts OWNER TO root;

--
-- Name: achievement_category_texts_id_seq; Type: SEQUENCE; Schema: gi; Owner: root
--

ALTER TABLE gi.achievement_category_texts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME gi.achievement_category_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievement_texts; Type: TABLE; Schema: gi; Owner: root
--

CREATE TABLE gi.achievement_texts (
    id integer NOT NULL,
    lang public.lang NOT NULL,
    achievement integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL
);


ALTER TABLE gi.achievement_texts OWNER TO root;

--
-- Name: achievement_texts_id_seq; Type: SEQUENCE; Schema: gi; Owner: root
--

ALTER TABLE gi.achievement_texts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME gi.achievement_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievements; Type: TABLE; Schema: gi; Owner: root
--

CREATE TABLE gi.achievements (
    id integer NOT NULL,
    extern_id text NOT NULL,
    category integer NOT NULL,
    version text,
    difficulty public.difficulty,
    currency integer NOT NULL,
    comment text,
    reference text,
    video text,
    batch integer,
    hidden boolean DEFAULT false NOT NULL,
    gacha boolean DEFAULT false NOT NULL,
    timegated boolean DEFAULT false NOT NULL,
    missable boolean DEFAULT false NOT NULL,
    possible boolean DEFAULT true NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    sort integer NOT NULL
);


ALTER TABLE gi.achievements OWNER TO root;

--
-- Name: achievements_id_seq; Type: SEQUENCE; Schema: gi; Owner: root
--

ALTER TABLE gi.achievements ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME gi.achievements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievement_categories; Type: TABLE; Schema: hsr; Owner: root
--

CREATE TABLE hsr.achievement_categories (
    id integer NOT NULL,
    extern_id text NOT NULL,
    sort integer NOT NULL
);


ALTER TABLE hsr.achievement_categories OWNER TO root;

--
-- Name: achievement_categories_id_seq; Type: SEQUENCE; Schema: hsr; Owner: root
--

ALTER TABLE hsr.achievement_categories ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME hsr.achievement_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievement_category_texts; Type: TABLE; Schema: hsr; Owner: root
--

CREATE TABLE hsr.achievement_category_texts (
    id integer NOT NULL,
    lang public.lang NOT NULL,
    category integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE hsr.achievement_category_texts OWNER TO root;

--
-- Name: achievement_category_texts_id_seq; Type: SEQUENCE; Schema: hsr; Owner: root
--

ALTER TABLE hsr.achievement_category_texts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME hsr.achievement_category_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievement_texts; Type: TABLE; Schema: hsr; Owner: root
--

CREATE TABLE hsr.achievement_texts (
    id integer NOT NULL,
    lang public.lang NOT NULL,
    achievement integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL
);


ALTER TABLE hsr.achievement_texts OWNER TO root;

--
-- Name: achievement_texts_id_seq; Type: SEQUENCE; Schema: hsr; Owner: root
--

ALTER TABLE hsr.achievement_texts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME hsr.achievement_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievements; Type: TABLE; Schema: hsr; Owner: root
--

CREATE TABLE hsr.achievements (
    id integer NOT NULL,
    extern_id text NOT NULL,
    category integer NOT NULL,
    version text,
    difficulty public.difficulty,
    currency integer NOT NULL,
    comment text,
    reference text,
    video text,
    batch integer,
    hidden boolean DEFAULT false NOT NULL,
    gacha boolean DEFAULT false NOT NULL,
    timegated boolean DEFAULT false NOT NULL,
    missable boolean DEFAULT false NOT NULL,
    possible boolean DEFAULT true NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    sort integer NOT NULL
);


ALTER TABLE hsr.achievements OWNER TO root;

--
-- Name: achievements_id_seq; Type: SEQUENCE; Schema: hsr; Owner: root
--

ALTER TABLE hsr.achievements ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME hsr.achievements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievement_categories; Type: TABLE; Schema: nte; Owner: root
--

CREATE TABLE nte.achievement_categories (
    id integer NOT NULL,
    extern_id text NOT NULL,
    sort integer NOT NULL
);


ALTER TABLE nte.achievement_categories OWNER TO root;

--
-- Name: achievement_categories_id_seq; Type: SEQUENCE; Schema: nte; Owner: root
--

ALTER TABLE nte.achievement_categories ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME nte.achievement_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievement_category_texts; Type: TABLE; Schema: nte; Owner: root
--

CREATE TABLE nte.achievement_category_texts (
    id integer NOT NULL,
    lang public.lang NOT NULL,
    category integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE nte.achievement_category_texts OWNER TO root;

--
-- Name: achievement_category_texts_id_seq; Type: SEQUENCE; Schema: nte; Owner: root
--

ALTER TABLE nte.achievement_category_texts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME nte.achievement_category_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievement_texts; Type: TABLE; Schema: nte; Owner: root
--

CREATE TABLE nte.achievement_texts (
    id integer NOT NULL,
    lang public.lang NOT NULL,
    achievement integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL
);


ALTER TABLE nte.achievement_texts OWNER TO root;

--
-- Name: achievement_texts_id_seq; Type: SEQUENCE; Schema: nte; Owner: root
--

ALTER TABLE nte.achievement_texts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME nte.achievement_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievements; Type: TABLE; Schema: nte; Owner: root
--

CREATE TABLE nte.achievements (
    id integer NOT NULL,
    extern_id text NOT NULL,
    category integer NOT NULL,
    version text,
    difficulty public.difficulty,
    currency integer NOT NULL,
    comment text,
    reference text,
    video text,
    batch integer,
    hidden boolean DEFAULT false NOT NULL,
    gacha boolean DEFAULT false NOT NULL,
    timegated boolean DEFAULT false NOT NULL,
    missable boolean DEFAULT false NOT NULL,
    possible boolean DEFAULT true NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    sort integer NOT NULL
);


ALTER TABLE nte.achievements OWNER TO root;

--
-- Name: achievements_id_seq; Type: SEQUENCE; Schema: nte; Owner: root
--

ALTER TABLE nte.achievements ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME nte.achievements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: _sqlx_migrations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public._sqlx_migrations (
    version bigint NOT NULL,
    description text NOT NULL,
    installed_on timestamp with time zone DEFAULT now() NOT NULL,
    success boolean NOT NULL,
    checksum bytea NOT NULL,
    execution_time bigint NOT NULL
);


ALTER TABLE public._sqlx_migrations OWNER TO root;

--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: auth; Owner: root
--

ALTER TABLE ONLY auth.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: root
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: achievement_categories achievement_categories_extern_id_key; Type: CONSTRAINT; Schema: gi; Owner: root
--

ALTER TABLE ONLY gi.achievement_categories
    ADD CONSTRAINT achievement_categories_extern_id_key UNIQUE (extern_id);


--
-- Name: achievement_categories achievement_categories_pkey; Type: CONSTRAINT; Schema: gi; Owner: root
--

ALTER TABLE ONLY gi.achievement_categories
    ADD CONSTRAINT achievement_categories_pkey PRIMARY KEY (id);


--
-- Name: achievement_category_texts achievement_category_texts_pkey; Type: CONSTRAINT; Schema: gi; Owner: root
--

ALTER TABLE ONLY gi.achievement_category_texts
    ADD CONSTRAINT achievement_category_texts_pkey PRIMARY KEY (id);


--
-- Name: achievement_texts achievement_texts_pkey; Type: CONSTRAINT; Schema: gi; Owner: root
--

ALTER TABLE ONLY gi.achievement_texts
    ADD CONSTRAINT achievement_texts_pkey PRIMARY KEY (id);


--
-- Name: achievements achievements_extern_id_key; Type: CONSTRAINT; Schema: gi; Owner: root
--

ALTER TABLE ONLY gi.achievements
    ADD CONSTRAINT achievements_extern_id_key UNIQUE (extern_id);


--
-- Name: achievements achievements_pkey; Type: CONSTRAINT; Schema: gi; Owner: root
--

ALTER TABLE ONLY gi.achievements
    ADD CONSTRAINT achievements_pkey PRIMARY KEY (id);


--
-- Name: achievement_categories achievement_categories_extern_id_key; Type: CONSTRAINT; Schema: hsr; Owner: root
--

ALTER TABLE ONLY hsr.achievement_categories
    ADD CONSTRAINT achievement_categories_extern_id_key UNIQUE (extern_id);


--
-- Name: achievement_categories achievement_categories_pkey; Type: CONSTRAINT; Schema: hsr; Owner: root
--

ALTER TABLE ONLY hsr.achievement_categories
    ADD CONSTRAINT achievement_categories_pkey PRIMARY KEY (id);


--
-- Name: achievement_category_texts achievement_category_texts_pkey; Type: CONSTRAINT; Schema: hsr; Owner: root
--

ALTER TABLE ONLY hsr.achievement_category_texts
    ADD CONSTRAINT achievement_category_texts_pkey PRIMARY KEY (id);


--
-- Name: achievement_texts achievement_texts_pkey; Type: CONSTRAINT; Schema: hsr; Owner: root
--

ALTER TABLE ONLY hsr.achievement_texts
    ADD CONSTRAINT achievement_texts_pkey PRIMARY KEY (id);


--
-- Name: achievements achievements_extern_id_key; Type: CONSTRAINT; Schema: hsr; Owner: root
--

ALTER TABLE ONLY hsr.achievements
    ADD CONSTRAINT achievements_extern_id_key UNIQUE (extern_id);


--
-- Name: achievements achievements_pkey; Type: CONSTRAINT; Schema: hsr; Owner: root
--

ALTER TABLE ONLY hsr.achievements
    ADD CONSTRAINT achievements_pkey PRIMARY KEY (id);


--
-- Name: achievement_categories achievement_categories_extern_id_key; Type: CONSTRAINT; Schema: nte; Owner: root
--

ALTER TABLE ONLY nte.achievement_categories
    ADD CONSTRAINT achievement_categories_extern_id_key UNIQUE (extern_id);


--
-- Name: achievement_categories achievement_categories_pkey; Type: CONSTRAINT; Schema: nte; Owner: root
--

ALTER TABLE ONLY nte.achievement_categories
    ADD CONSTRAINT achievement_categories_pkey PRIMARY KEY (id);


--
-- Name: achievement_category_texts achievement_category_texts_pkey; Type: CONSTRAINT; Schema: nte; Owner: root
--

ALTER TABLE ONLY nte.achievement_category_texts
    ADD CONSTRAINT achievement_category_texts_pkey PRIMARY KEY (id);


--
-- Name: achievement_texts achievement_texts_pkey; Type: CONSTRAINT; Schema: nte; Owner: root
--

ALTER TABLE ONLY nte.achievement_texts
    ADD CONSTRAINT achievement_texts_pkey PRIMARY KEY (id);


--
-- Name: achievements achievements_extern_id_key; Type: CONSTRAINT; Schema: nte; Owner: root
--

ALTER TABLE ONLY nte.achievements
    ADD CONSTRAINT achievements_extern_id_key UNIQUE (extern_id);


--
-- Name: achievements achievements_pkey; Type: CONSTRAINT; Schema: nte; Owner: root
--

ALTER TABLE ONLY nte.achievements
    ADD CONSTRAINT achievements_pkey PRIMARY KEY (id);


--
-- Name: _sqlx_migrations _sqlx_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public._sqlx_migrations
    ADD CONSTRAINT _sqlx_migrations_pkey PRIMARY KEY (version);


--
-- Name: users_email_idx; Type: INDEX; Schema: auth; Owner: root
--

CREATE INDEX users_email_idx ON auth.users USING btree (email) WHERE (email IS NOT NULL);


--
-- Name: users_username_idx; Type: INDEX; Schema: auth; Owner: root
--

CREATE INDEX users_username_idx ON auth.users USING btree (username);


--
-- Name: achievement_category_texts_lang_category_idx; Type: INDEX; Schema: gi; Owner: root
--

CREATE UNIQUE INDEX achievement_category_texts_lang_category_idx ON gi.achievement_category_texts USING btree (lang, category);


--
-- Name: achievement_texts_lang_achievement_idx; Type: INDEX; Schema: gi; Owner: root
--

CREATE UNIQUE INDEX achievement_texts_lang_achievement_idx ON gi.achievement_texts USING btree (lang, achievement);


--
-- Name: achievements_category_idx; Type: INDEX; Schema: gi; Owner: root
--

CREATE INDEX achievements_category_idx ON gi.achievements USING btree (category);


--
-- Name: achievements_extern_id_idx; Type: INDEX; Schema: gi; Owner: root
--

CREATE INDEX achievements_extern_id_idx ON gi.achievements USING btree (extern_id);


--
-- Name: achievement_category_texts_lang_category_idx; Type: INDEX; Schema: hsr; Owner: root
--

CREATE UNIQUE INDEX achievement_category_texts_lang_category_idx ON hsr.achievement_category_texts USING btree (lang, category);


--
-- Name: achievement_texts_lang_achievement_idx; Type: INDEX; Schema: hsr; Owner: root
--

CREATE UNIQUE INDEX achievement_texts_lang_achievement_idx ON hsr.achievement_texts USING btree (lang, achievement);


--
-- Name: achievements_category_idx; Type: INDEX; Schema: hsr; Owner: root
--

CREATE INDEX achievements_category_idx ON hsr.achievements USING btree (category);


--
-- Name: achievements_extern_id_idx; Type: INDEX; Schema: hsr; Owner: root
--

CREATE INDEX achievements_extern_id_idx ON hsr.achievements USING btree (extern_id);


--
-- Name: achievement_category_texts_lang_category_idx; Type: INDEX; Schema: nte; Owner: root
--

CREATE UNIQUE INDEX achievement_category_texts_lang_category_idx ON nte.achievement_category_texts USING btree (lang, category);


--
-- Name: achievement_texts_lang_achievement_idx; Type: INDEX; Schema: nte; Owner: root
--

CREATE UNIQUE INDEX achievement_texts_lang_achievement_idx ON nte.achievement_texts USING btree (lang, achievement);


--
-- Name: achievements_category_idx; Type: INDEX; Schema: nte; Owner: root
--

CREATE INDEX achievements_category_idx ON nte.achievements USING btree (category);


--
-- Name: achievements_extern_id_idx; Type: INDEX; Schema: nte; Owner: root
--

CREATE INDEX achievements_extern_id_idx ON nte.achievements USING btree (extern_id);


--
-- Name: admins admins_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: root
--

ALTER TABLE ONLY auth.admins
    ADD CONSTRAINT admins_id_fkey FOREIGN KEY (id) REFERENCES auth.users(id);


--
-- Name: achievement_category_texts achievement_category_texts_category_fkey; Type: FK CONSTRAINT; Schema: gi; Owner: root
--

ALTER TABLE ONLY gi.achievement_category_texts
    ADD CONSTRAINT achievement_category_texts_category_fkey FOREIGN KEY (category) REFERENCES gi.achievement_categories(id);


--
-- Name: achievement_texts achievement_texts_achievement_fkey; Type: FK CONSTRAINT; Schema: gi; Owner: root
--

ALTER TABLE ONLY gi.achievement_texts
    ADD CONSTRAINT achievement_texts_achievement_fkey FOREIGN KEY (achievement) REFERENCES gi.achievements(id);


--
-- Name: achievements achievements_category_fkey; Type: FK CONSTRAINT; Schema: gi; Owner: root
--

ALTER TABLE ONLY gi.achievements
    ADD CONSTRAINT achievements_category_fkey FOREIGN KEY (category) REFERENCES gi.achievement_categories(id);


--
-- Name: achievement_category_texts achievement_category_texts_category_fkey; Type: FK CONSTRAINT; Schema: hsr; Owner: root
--

ALTER TABLE ONLY hsr.achievement_category_texts
    ADD CONSTRAINT achievement_category_texts_category_fkey FOREIGN KEY (category) REFERENCES hsr.achievement_categories(id);


--
-- Name: achievement_texts achievement_texts_achievement_fkey; Type: FK CONSTRAINT; Schema: hsr; Owner: root
--

ALTER TABLE ONLY hsr.achievement_texts
    ADD CONSTRAINT achievement_texts_achievement_fkey FOREIGN KEY (achievement) REFERENCES hsr.achievements(id);


--
-- Name: achievements achievements_category_fkey; Type: FK CONSTRAINT; Schema: hsr; Owner: root
--

ALTER TABLE ONLY hsr.achievements
    ADD CONSTRAINT achievements_category_fkey FOREIGN KEY (category) REFERENCES hsr.achievement_categories(id);


--
-- Name: achievement_category_texts achievement_category_texts_category_fkey; Type: FK CONSTRAINT; Schema: nte; Owner: root
--

ALTER TABLE ONLY nte.achievement_category_texts
    ADD CONSTRAINT achievement_category_texts_category_fkey FOREIGN KEY (category) REFERENCES nte.achievement_categories(id);


--
-- Name: achievement_texts achievement_texts_achievement_fkey; Type: FK CONSTRAINT; Schema: nte; Owner: root
--

ALTER TABLE ONLY nte.achievement_texts
    ADD CONSTRAINT achievement_texts_achievement_fkey FOREIGN KEY (achievement) REFERENCES nte.achievements(id);


--
-- Name: achievements achievements_category_fkey; Type: FK CONSTRAINT; Schema: nte; Owner: root
--

ALTER TABLE ONLY nte.achievements
    ADD CONSTRAINT achievements_category_fkey FOREIGN KEY (category) REFERENCES nte.achievement_categories(id);


--
-- PostgreSQL database dump complete
--

\unrestrict IcUCouRg4hbAMJxT8hfDGESvNbm8O0TsgF4scJP8XptcOFGK1sLiG7OEAhCyhcA

