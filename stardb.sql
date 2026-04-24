--
-- PostgreSQL database dump
--

\restrict zfDMUsTg7SpKfrniQZ8wfGWCR7kTG8A4IuvdjV47irPp8MJe0ES44gfROdQXvUz

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
-- Name: auth; Type: SCHEMA; Schema: -; Owner: julius
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO julius;

--
-- Name: gi; Type: SCHEMA; Schema: -; Owner: julius
--

CREATE SCHEMA gi;


ALTER SCHEMA gi OWNER TO julius;

--
-- Name: hsr; Type: SCHEMA; Schema: -; Owner: julius
--

CREATE SCHEMA hsr;


ALTER SCHEMA hsr OWNER TO julius;

--
-- Name: nte; Type: SCHEMA; Schema: -; Owner: julius
--

CREATE SCHEMA nte;


ALTER SCHEMA nte OWNER TO julius;

--
-- Name: difficulty; Type: TYPE; Schema: public; Owner: julius
--

CREATE TYPE public.difficulty AS ENUM (
    'easy',
    'medium',
    'hard'
);


ALTER TYPE public.difficulty OWNER TO julius;

--
-- Name: lang; Type: TYPE; Schema: public; Owner: julius
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


ALTER TYPE public.lang OWNER TO julius;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admins; Type: TABLE; Schema: auth; Owner: julius
--

CREATE TABLE auth.admins (
    id integer NOT NULL
);


ALTER TABLE auth.admins OWNER TO julius;

--
-- Name: users; Type: TABLE; Schema: auth; Owner: julius
--

CREATE TABLE auth.users (
    id integer NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    email text
);


ALTER TABLE auth.users OWNER TO julius;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: auth; Owner: julius
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
-- Name: achievement_categories; Type: TABLE; Schema: gi; Owner: julius
--

CREATE TABLE gi.achievement_categories (
    id integer NOT NULL,
    extern_id text NOT NULL,
    sort integer NOT NULL
);


ALTER TABLE gi.achievement_categories OWNER TO julius;

--
-- Name: achievement_categories_id_seq; Type: SEQUENCE; Schema: gi; Owner: julius
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
-- Name: achievement_category_texts; Type: TABLE; Schema: gi; Owner: julius
--

CREATE TABLE gi.achievement_category_texts (
    id integer NOT NULL,
    lang public.lang NOT NULL,
    category integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE gi.achievement_category_texts OWNER TO julius;

--
-- Name: achievement_category_texts_id_seq; Type: SEQUENCE; Schema: gi; Owner: julius
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
-- Name: achievement_texts; Type: TABLE; Schema: gi; Owner: julius
--

CREATE TABLE gi.achievement_texts (
    id integer NOT NULL,
    lang public.lang NOT NULL,
    achievement integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL
);


ALTER TABLE gi.achievement_texts OWNER TO julius;

--
-- Name: achievement_texts_id_seq; Type: SEQUENCE; Schema: gi; Owner: julius
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
-- Name: achievements; Type: TABLE; Schema: gi; Owner: julius
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


ALTER TABLE gi.achievements OWNER TO julius;

--
-- Name: achievements_id_seq; Type: SEQUENCE; Schema: gi; Owner: julius
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
-- Name: achievement_categories; Type: TABLE; Schema: hsr; Owner: julius
--

CREATE TABLE hsr.achievement_categories (
    id integer NOT NULL,
    extern_id text NOT NULL,
    sort integer NOT NULL
);


ALTER TABLE hsr.achievement_categories OWNER TO julius;

--
-- Name: achievement_categories_id_seq; Type: SEQUENCE; Schema: hsr; Owner: julius
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
-- Name: achievement_category_texts; Type: TABLE; Schema: hsr; Owner: julius
--

CREATE TABLE hsr.achievement_category_texts (
    id integer NOT NULL,
    lang public.lang NOT NULL,
    category integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE hsr.achievement_category_texts OWNER TO julius;

--
-- Name: achievement_category_texts_id_seq; Type: SEQUENCE; Schema: hsr; Owner: julius
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
-- Name: achievement_texts; Type: TABLE; Schema: hsr; Owner: julius
--

CREATE TABLE hsr.achievement_texts (
    id integer NOT NULL,
    lang public.lang NOT NULL,
    achievement integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL
);


ALTER TABLE hsr.achievement_texts OWNER TO julius;

--
-- Name: achievement_texts_id_seq; Type: SEQUENCE; Schema: hsr; Owner: julius
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
-- Name: achievements; Type: TABLE; Schema: hsr; Owner: julius
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


ALTER TABLE hsr.achievements OWNER TO julius;

--
-- Name: achievements_id_seq; Type: SEQUENCE; Schema: hsr; Owner: julius
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
-- Name: banner_items; Type: TABLE; Schema: hsr; Owner: julius
--

CREATE TABLE hsr.banner_items (
    id integer NOT NULL,
    banner integer NOT NULL,
    item integer NOT NULL
);


ALTER TABLE hsr.banner_items OWNER TO julius;

--
-- Name: banner_items_id_seq; Type: SEQUENCE; Schema: hsr; Owner: julius
--

ALTER TABLE hsr.banner_items ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME hsr.banner_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: banners; Type: TABLE; Schema: hsr; Owner: julius
--

CREATE TABLE hsr.banners (
    id integer NOT NULL,
    gacha integer NOT NULL,
    start_cn timestamp with time zone,
    start_eu timestamp with time zone,
    start_na timestamp with time zone,
    end_cn timestamp with time zone,
    end_eu timestamp with time zone,
    end_na timestamp with time zone
);


ALTER TABLE hsr.banners OWNER TO julius;

--
-- Name: banners_id_seq; Type: SEQUENCE; Schema: hsr; Owner: julius
--

ALTER TABLE hsr.banners ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME hsr.banners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: gachas; Type: TABLE; Schema: hsr; Owner: julius
--

CREATE TABLE hsr.gachas (
    id integer NOT NULL,
    extern_id text NOT NULL,
    show boolean NOT NULL
);


ALTER TABLE hsr.gachas OWNER TO julius;

--
-- Name: gachas_id_seq; Type: SEQUENCE; Schema: hsr; Owner: julius
--

ALTER TABLE hsr.gachas ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME hsr.gachas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: item_texts; Type: TABLE; Schema: hsr; Owner: julius
--

CREATE TABLE hsr.item_texts (
    id integer NOT NULL,
    lang public.lang NOT NULL,
    item integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE hsr.item_texts OWNER TO julius;

--
-- Name: item_texts_id_seq; Type: SEQUENCE; Schema: hsr; Owner: julius
--

ALTER TABLE hsr.item_texts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME hsr.item_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: items; Type: TABLE; Schema: hsr; Owner: julius
--

CREATE TABLE hsr.items (
    id integer NOT NULL,
    extern_id text NOT NULL,
    type text NOT NULL,
    rarity integer NOT NULL
);


ALTER TABLE hsr.items OWNER TO julius;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: hsr; Owner: julius
--

ALTER TABLE hsr.items ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME hsr.items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: pulls; Type: TABLE; Schema: hsr; Owner: julius
--

CREATE TABLE hsr.pulls (
    id integer NOT NULL,
    extern_id text NOT NULL,
    gacha integer NOT NULL,
    uid integer NOT NULL,
    item integer NOT NULL,
    "time" timestamp with time zone NOT NULL,
    official boolean NOT NULL
);


ALTER TABLE hsr.pulls OWNER TO julius;

--
-- Name: pulls_id_seq; Type: SEQUENCE; Schema: hsr; Owner: julius
--

ALTER TABLE hsr.pulls ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME hsr.pulls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievement_categories; Type: TABLE; Schema: nte; Owner: julius
--

CREATE TABLE nte.achievement_categories (
    id integer NOT NULL,
    extern_id text NOT NULL,
    sort integer NOT NULL
);


ALTER TABLE nte.achievement_categories OWNER TO julius;

--
-- Name: achievement_categories_id_seq; Type: SEQUENCE; Schema: nte; Owner: julius
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
-- Name: achievement_category_texts; Type: TABLE; Schema: nte; Owner: julius
--

CREATE TABLE nte.achievement_category_texts (
    id integer NOT NULL,
    lang public.lang NOT NULL,
    category integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE nte.achievement_category_texts OWNER TO julius;

--
-- Name: achievement_category_texts_id_seq; Type: SEQUENCE; Schema: nte; Owner: julius
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
-- Name: achievement_texts; Type: TABLE; Schema: nte; Owner: julius
--

CREATE TABLE nte.achievement_texts (
    id integer NOT NULL,
    lang public.lang NOT NULL,
    achievement integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL
);


ALTER TABLE nte.achievement_texts OWNER TO julius;

--
-- Name: achievement_texts_id_seq; Type: SEQUENCE; Schema: nte; Owner: julius
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
-- Name: achievements; Type: TABLE; Schema: nte; Owner: julius
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


ALTER TABLE nte.achievements OWNER TO julius;

--
-- Name: achievements_id_seq; Type: SEQUENCE; Schema: nte; Owner: julius
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
-- Name: _sqlx_migrations; Type: TABLE; Schema: public; Owner: julius
--

CREATE TABLE public._sqlx_migrations (
    version bigint NOT NULL,
    description text NOT NULL,
    installed_on timestamp with time zone DEFAULT now() NOT NULL,
    success boolean NOT NULL,
    checksum bytea NOT NULL,
    execution_time bigint NOT NULL
);


ALTER TABLE public._sqlx_migrations OWNER TO julius;

--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: auth; Owner: julius
--

ALTER TABLE ONLY auth.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: julius
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: achievement_categories achievement_categories_extern_id_key; Type: CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.achievement_categories
    ADD CONSTRAINT achievement_categories_extern_id_key UNIQUE (extern_id);


--
-- Name: achievement_categories achievement_categories_pkey; Type: CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.achievement_categories
    ADD CONSTRAINT achievement_categories_pkey PRIMARY KEY (id);


--
-- Name: achievement_category_texts achievement_category_texts_pkey; Type: CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.achievement_category_texts
    ADD CONSTRAINT achievement_category_texts_pkey PRIMARY KEY (id);


--
-- Name: achievement_texts achievement_texts_pkey; Type: CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.achievement_texts
    ADD CONSTRAINT achievement_texts_pkey PRIMARY KEY (id);


--
-- Name: achievements achievements_extern_id_key; Type: CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.achievements
    ADD CONSTRAINT achievements_extern_id_key UNIQUE (extern_id);


--
-- Name: achievements achievements_pkey; Type: CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.achievements
    ADD CONSTRAINT achievements_pkey PRIMARY KEY (id);


--
-- Name: achievement_categories achievement_categories_extern_id_key; Type: CONSTRAINT; Schema: hsr; Owner: julius
--

ALTER TABLE ONLY hsr.achievement_categories
    ADD CONSTRAINT achievement_categories_extern_id_key UNIQUE (extern_id);


--
-- Name: achievement_categories achievement_categories_pkey; Type: CONSTRAINT; Schema: hsr; Owner: julius
--

ALTER TABLE ONLY hsr.achievement_categories
    ADD CONSTRAINT achievement_categories_pkey PRIMARY KEY (id);


--
-- Name: achievement_category_texts achievement_category_texts_pkey; Type: CONSTRAINT; Schema: hsr; Owner: julius
--

ALTER TABLE ONLY hsr.achievement_category_texts
    ADD CONSTRAINT achievement_category_texts_pkey PRIMARY KEY (id);


--
-- Name: achievement_texts achievement_texts_pkey; Type: CONSTRAINT; Schema: hsr; Owner: julius
--

ALTER TABLE ONLY hsr.achievement_texts
    ADD CONSTRAINT achievement_texts_pkey PRIMARY KEY (id);


--
-- Name: achievements achievements_extern_id_key; Type: CONSTRAINT; Schema: hsr; Owner: julius
--

ALTER TABLE ONLY hsr.achievements
    ADD CONSTRAINT achievements_extern_id_key UNIQUE (extern_id);


--
-- Name: achievements achievements_pkey; Type: CONSTRAINT; Schema: hsr; Owner: julius
--

ALTER TABLE ONLY hsr.achievements
    ADD CONSTRAINT achievements_pkey PRIMARY KEY (id);


--
-- Name: banner_items banner_items_pkey; Type: CONSTRAINT; Schema: hsr; Owner: julius
--

ALTER TABLE ONLY hsr.banner_items
    ADD CONSTRAINT banner_items_pkey PRIMARY KEY (id);


--
-- Name: banners banners_pkey; Type: CONSTRAINT; Schema: hsr; Owner: julius
--

ALTER TABLE ONLY hsr.banners
    ADD CONSTRAINT banners_pkey PRIMARY KEY (id);


--
-- Name: gachas gachas_extern_id_key; Type: CONSTRAINT; Schema: hsr; Owner: julius
--

ALTER TABLE ONLY hsr.gachas
    ADD CONSTRAINT gachas_extern_id_key UNIQUE (extern_id);


--
-- Name: gachas gachas_pkey; Type: CONSTRAINT; Schema: hsr; Owner: julius
--

ALTER TABLE ONLY hsr.gachas
    ADD CONSTRAINT gachas_pkey PRIMARY KEY (id);


--
-- Name: item_texts item_texts_pkey; Type: CONSTRAINT; Schema: hsr; Owner: julius
--

ALTER TABLE ONLY hsr.item_texts
    ADD CONSTRAINT item_texts_pkey PRIMARY KEY (id);


--
-- Name: items items_extern_id_key; Type: CONSTRAINT; Schema: hsr; Owner: julius
--

ALTER TABLE ONLY hsr.items
    ADD CONSTRAINT items_extern_id_key UNIQUE (extern_id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: hsr; Owner: julius
--

ALTER TABLE ONLY hsr.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: pulls pulls_pkey; Type: CONSTRAINT; Schema: hsr; Owner: julius
--

ALTER TABLE ONLY hsr.pulls
    ADD CONSTRAINT pulls_pkey PRIMARY KEY (id);


--
-- Name: achievement_categories achievement_categories_extern_id_key; Type: CONSTRAINT; Schema: nte; Owner: julius
--

ALTER TABLE ONLY nte.achievement_categories
    ADD CONSTRAINT achievement_categories_extern_id_key UNIQUE (extern_id);


--
-- Name: achievement_categories achievement_categories_pkey; Type: CONSTRAINT; Schema: nte; Owner: julius
--

ALTER TABLE ONLY nte.achievement_categories
    ADD CONSTRAINT achievement_categories_pkey PRIMARY KEY (id);


--
-- Name: achievement_category_texts achievement_category_texts_pkey; Type: CONSTRAINT; Schema: nte; Owner: julius
--

ALTER TABLE ONLY nte.achievement_category_texts
    ADD CONSTRAINT achievement_category_texts_pkey PRIMARY KEY (id);


--
-- Name: achievement_texts achievement_texts_pkey; Type: CONSTRAINT; Schema: nte; Owner: julius
--

ALTER TABLE ONLY nte.achievement_texts
    ADD CONSTRAINT achievement_texts_pkey PRIMARY KEY (id);


--
-- Name: achievements achievements_extern_id_key; Type: CONSTRAINT; Schema: nte; Owner: julius
--

ALTER TABLE ONLY nte.achievements
    ADD CONSTRAINT achievements_extern_id_key UNIQUE (extern_id);


--
-- Name: achievements achievements_pkey; Type: CONSTRAINT; Schema: nte; Owner: julius
--

ALTER TABLE ONLY nte.achievements
    ADD CONSTRAINT achievements_pkey PRIMARY KEY (id);


--
-- Name: _sqlx_migrations _sqlx_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: julius
--

ALTER TABLE ONLY public._sqlx_migrations
    ADD CONSTRAINT _sqlx_migrations_pkey PRIMARY KEY (version);


--
-- Name: users_email_idx; Type: INDEX; Schema: auth; Owner: julius
--

CREATE INDEX users_email_idx ON auth.users USING btree (email) WHERE (email IS NOT NULL);


--
-- Name: users_username_idx; Type: INDEX; Schema: auth; Owner: julius
--

CREATE INDEX users_username_idx ON auth.users USING btree (username);


--
-- Name: achievement_category_texts_lang_category_idx; Type: INDEX; Schema: gi; Owner: julius
--

CREATE UNIQUE INDEX achievement_category_texts_lang_category_idx ON gi.achievement_category_texts USING btree (lang, category);


--
-- Name: achievement_texts_lang_achievement_idx; Type: INDEX; Schema: gi; Owner: julius
--

CREATE UNIQUE INDEX achievement_texts_lang_achievement_idx ON gi.achievement_texts USING btree (lang, achievement);


--
-- Name: achievements_category_idx; Type: INDEX; Schema: gi; Owner: julius
--

CREATE INDEX achievements_category_idx ON gi.achievements USING btree (category);


--
-- Name: achievements_extern_id_idx; Type: INDEX; Schema: gi; Owner: julius
--

CREATE INDEX achievements_extern_id_idx ON gi.achievements USING btree (extern_id);


--
-- Name: achievement_category_texts_lang_category_idx; Type: INDEX; Schema: hsr; Owner: julius
--

CREATE UNIQUE INDEX achievement_category_texts_lang_category_idx ON hsr.achievement_category_texts USING btree (lang, category);


--
-- Name: achievement_texts_lang_achievement_idx; Type: INDEX; Schema: hsr; Owner: julius
--

CREATE UNIQUE INDEX achievement_texts_lang_achievement_idx ON hsr.achievement_texts USING btree (lang, achievement);


--
-- Name: achievements_category_idx; Type: INDEX; Schema: hsr; Owner: julius
--

CREATE INDEX achievements_category_idx ON hsr.achievements USING btree (category);


--
-- Name: achievements_extern_id_idx; Type: INDEX; Schema: hsr; Owner: julius
--

CREATE INDEX achievements_extern_id_idx ON hsr.achievements USING btree (extern_id);


--
-- Name: banner_items_banner_idx; Type: INDEX; Schema: hsr; Owner: julius
--

CREATE INDEX banner_items_banner_idx ON hsr.banner_items USING btree (banner);


--
-- Name: banners_gacha_idx; Type: INDEX; Schema: hsr; Owner: julius
--

CREATE INDEX banners_gacha_idx ON hsr.banners USING btree (gacha);


--
-- Name: banners_range_cn_idx; Type: INDEX; Schema: hsr; Owner: julius
--

CREATE INDEX banners_range_cn_idx ON hsr.banners USING gist (tstzrange(start_cn, end_cn));


--
-- Name: banners_range_eu_idx; Type: INDEX; Schema: hsr; Owner: julius
--

CREATE INDEX banners_range_eu_idx ON hsr.banners USING gist (tstzrange(start_eu, end_eu));


--
-- Name: banners_range_na_idx; Type: INDEX; Schema: hsr; Owner: julius
--

CREATE INDEX banners_range_na_idx ON hsr.banners USING gist (tstzrange(start_na, end_na));


--
-- Name: achievement_category_texts_lang_category_idx; Type: INDEX; Schema: nte; Owner: julius
--

CREATE UNIQUE INDEX achievement_category_texts_lang_category_idx ON nte.achievement_category_texts USING btree (lang, category);


--
-- Name: achievement_texts_lang_achievement_idx; Type: INDEX; Schema: nte; Owner: julius
--

CREATE UNIQUE INDEX achievement_texts_lang_achievement_idx ON nte.achievement_texts USING btree (lang, achievement);


--
-- Name: achievements_category_idx; Type: INDEX; Schema: nte; Owner: julius
--

CREATE INDEX achievements_category_idx ON nte.achievements USING btree (category);


--
-- Name: achievements_extern_id_idx; Type: INDEX; Schema: nte; Owner: julius
--

CREATE INDEX achievements_extern_id_idx ON nte.achievements USING btree (extern_id);


--
-- Name: admins admins_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: julius
--

ALTER TABLE ONLY auth.admins
    ADD CONSTRAINT admins_id_fkey FOREIGN KEY (id) REFERENCES auth.users(id);


--
-- Name: achievement_category_texts achievement_category_texts_category_fkey; Type: FK CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.achievement_category_texts
    ADD CONSTRAINT achievement_category_texts_category_fkey FOREIGN KEY (category) REFERENCES gi.achievement_categories(id);


--
-- Name: achievement_texts achievement_texts_achievement_fkey; Type: FK CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.achievement_texts
    ADD CONSTRAINT achievement_texts_achievement_fkey FOREIGN KEY (achievement) REFERENCES gi.achievements(id);


--
-- Name: achievements achievements_category_fkey; Type: FK CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.achievements
    ADD CONSTRAINT achievements_category_fkey FOREIGN KEY (category) REFERENCES gi.achievement_categories(id);


--
-- Name: achievement_category_texts achievement_category_texts_category_fkey; Type: FK CONSTRAINT; Schema: hsr; Owner: julius
--

ALTER TABLE ONLY hsr.achievement_category_texts
    ADD CONSTRAINT achievement_category_texts_category_fkey FOREIGN KEY (category) REFERENCES hsr.achievement_categories(id);


--
-- Name: achievement_texts achievement_texts_achievement_fkey; Type: FK CONSTRAINT; Schema: hsr; Owner: julius
--

ALTER TABLE ONLY hsr.achievement_texts
    ADD CONSTRAINT achievement_texts_achievement_fkey FOREIGN KEY (achievement) REFERENCES hsr.achievements(id);


--
-- Name: achievements achievements_category_fkey; Type: FK CONSTRAINT; Schema: hsr; Owner: julius
--

ALTER TABLE ONLY hsr.achievements
    ADD CONSTRAINT achievements_category_fkey FOREIGN KEY (category) REFERENCES hsr.achievement_categories(id);


--
-- Name: banner_items banner_items_banner_fkey; Type: FK CONSTRAINT; Schema: hsr; Owner: julius
--

ALTER TABLE ONLY hsr.banner_items
    ADD CONSTRAINT banner_items_banner_fkey FOREIGN KEY (banner) REFERENCES hsr.banners(id);


--
-- Name: banner_items banner_items_item_fkey; Type: FK CONSTRAINT; Schema: hsr; Owner: julius
--

ALTER TABLE ONLY hsr.banner_items
    ADD CONSTRAINT banner_items_item_fkey FOREIGN KEY (item) REFERENCES hsr.items(id);


--
-- Name: banners banners_gacha_fkey; Type: FK CONSTRAINT; Schema: hsr; Owner: julius
--

ALTER TABLE ONLY hsr.banners
    ADD CONSTRAINT banners_gacha_fkey FOREIGN KEY (gacha) REFERENCES hsr.gachas(id);


--
-- Name: item_texts item_texts_item_fkey; Type: FK CONSTRAINT; Schema: hsr; Owner: julius
--

ALTER TABLE ONLY hsr.item_texts
    ADD CONSTRAINT item_texts_item_fkey FOREIGN KEY (item) REFERENCES hsr.items(id);


--
-- Name: pulls pulls_gacha_fkey; Type: FK CONSTRAINT; Schema: hsr; Owner: julius
--

ALTER TABLE ONLY hsr.pulls
    ADD CONSTRAINT pulls_gacha_fkey FOREIGN KEY (gacha) REFERENCES hsr.gachas(id);


--
-- Name: pulls pulls_item_fkey; Type: FK CONSTRAINT; Schema: hsr; Owner: julius
--

ALTER TABLE ONLY hsr.pulls
    ADD CONSTRAINT pulls_item_fkey FOREIGN KEY (item) REFERENCES hsr.items(id);


--
-- Name: achievement_category_texts achievement_category_texts_category_fkey; Type: FK CONSTRAINT; Schema: nte; Owner: julius
--

ALTER TABLE ONLY nte.achievement_category_texts
    ADD CONSTRAINT achievement_category_texts_category_fkey FOREIGN KEY (category) REFERENCES nte.achievement_categories(id);


--
-- Name: achievement_texts achievement_texts_achievement_fkey; Type: FK CONSTRAINT; Schema: nte; Owner: julius
--

ALTER TABLE ONLY nte.achievement_texts
    ADD CONSTRAINT achievement_texts_achievement_fkey FOREIGN KEY (achievement) REFERENCES nte.achievements(id);


--
-- Name: achievements achievements_category_fkey; Type: FK CONSTRAINT; Schema: nte; Owner: julius
--

ALTER TABLE ONLY nte.achievements
    ADD CONSTRAINT achievements_category_fkey FOREIGN KEY (category) REFERENCES nte.achievement_categories(id);


--
-- PostgreSQL database dump complete
--

\unrestrict zfDMUsTg7SpKfrniQZ8wfGWCR7kTG8A4IuvdjV47irPp8MJe0ES44gfROdQXvUz

