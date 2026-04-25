--
-- PostgreSQL database dump
--

\restrict BlEvkGJKMoUinyyRToazj3RMF3x0RXmzhHrgqrbBcMM9VQiAjnuygI2JY1oEofh

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
-- Name: ake; Type: SCHEMA; Schema: -; Owner: julius
--

CREATE SCHEMA ake;


ALTER SCHEMA ake OWNER TO julius;

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
-- Name: wuwa; Type: SCHEMA; Schema: -; Owner: julius
--

CREATE SCHEMA wuwa;


ALTER SCHEMA wuwa OWNER TO julius;

--
-- Name: zzz; Type: SCHEMA; Schema: -; Owner: julius
--

CREATE SCHEMA zzz;


ALTER SCHEMA zzz OWNER TO julius;

--
-- Name: item_type; Type: TYPE; Schema: ake; Owner: julius
--

CREATE TYPE ake.item_type AS ENUM (
    'character',
    'weapon'
);


ALTER TYPE ake.item_type OWNER TO julius;

--
-- Name: item_type; Type: TYPE; Schema: gi; Owner: julius
--

CREATE TYPE gi.item_type AS ENUM (
    'character',
    'weapon',
    'cosmestic'
);


ALTER TYPE gi.item_type OWNER TO julius;

--
-- Name: item_type; Type: TYPE; Schema: hsr; Owner: julius
--

CREATE TYPE hsr.item_type AS ENUM (
    'character',
    'light_cone'
);


ALTER TYPE hsr.item_type OWNER TO julius;

--
-- Name: item_type; Type: TYPE; Schema: nte; Owner: julius
--

CREATE TYPE nte.item_type AS ENUM (
    'character',
    'arc'
);


ALTER TYPE nte.item_type OWNER TO julius;

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

--
-- Name: item_type; Type: TYPE; Schema: wuwa; Owner: julius
--

CREATE TYPE wuwa.item_type AS ENUM (
    'resonator',
    'weapon'
);


ALTER TYPE wuwa.item_type OWNER TO julius;

--
-- Name: item_type; Type: TYPE; Schema: zzz; Owner: julius
--

CREATE TYPE zzz.item_type AS ENUM (
    'agent',
    'w_engine',
    'bangboo'
);


ALTER TYPE zzz.item_type OWNER TO julius;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: achievement_categories; Type: TABLE; Schema: ake; Owner: julius
--

CREATE TABLE ake.achievement_categories (
    id integer NOT NULL,
    extern_id text NOT NULL,
    sort integer NOT NULL
);


ALTER TABLE ake.achievement_categories OWNER TO julius;

--
-- Name: achievement_categories_id_seq; Type: SEQUENCE; Schema: ake; Owner: julius
--

ALTER TABLE ake.achievement_categories ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME ake.achievement_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievement_category_texts; Type: TABLE; Schema: ake; Owner: julius
--

CREATE TABLE ake.achievement_category_texts (
    id integer NOT NULL,
    lang public.lang NOT NULL,
    category integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE ake.achievement_category_texts OWNER TO julius;

--
-- Name: achievement_category_texts_id_seq; Type: SEQUENCE; Schema: ake; Owner: julius
--

ALTER TABLE ake.achievement_category_texts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME ake.achievement_category_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievement_profiles; Type: TABLE; Schema: ake; Owner: julius
--

CREATE TABLE ake.achievement_profiles (
    id integer NOT NULL,
    account integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE ake.achievement_profiles OWNER TO julius;

--
-- Name: achievement_profiles_id_seq; Type: SEQUENCE; Schema: ake; Owner: julius
--

ALTER TABLE ake.achievement_profiles ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME ake.achievement_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievement_texts; Type: TABLE; Schema: ake; Owner: julius
--

CREATE TABLE ake.achievement_texts (
    id integer NOT NULL,
    lang public.lang NOT NULL,
    achievement integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL
);


ALTER TABLE ake.achievement_texts OWNER TO julius;

--
-- Name: achievement_texts_id_seq; Type: SEQUENCE; Schema: ake; Owner: julius
--

ALTER TABLE ake.achievement_texts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME ake.achievement_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievements; Type: TABLE; Schema: ake; Owner: julius
--

CREATE TABLE ake.achievements (
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


ALTER TABLE ake.achievements OWNER TO julius;

--
-- Name: achievements_completed; Type: TABLE; Schema: ake; Owner: julius
--

CREATE TABLE ake.achievements_completed (
    id bigint NOT NULL,
    profile integer NOT NULL,
    achievement integer NOT NULL
);


ALTER TABLE ake.achievements_completed OWNER TO julius;

--
-- Name: achievements_completed_id_seq; Type: SEQUENCE; Schema: ake; Owner: julius
--

ALTER TABLE ake.achievements_completed ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME ake.achievements_completed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievements_favorited; Type: TABLE; Schema: ake; Owner: julius
--

CREATE TABLE ake.achievements_favorited (
    id bigint NOT NULL,
    profile integer NOT NULL,
    achievement integer NOT NULL
);


ALTER TABLE ake.achievements_favorited OWNER TO julius;

--
-- Name: achievements_favorited_id_seq; Type: SEQUENCE; Schema: ake; Owner: julius
--

ALTER TABLE ake.achievements_favorited ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME ake.achievements_favorited_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievements_id_seq; Type: SEQUENCE; Schema: ake; Owner: julius
--

ALTER TABLE ake.achievements ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME ake.achievements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: banner_items; Type: TABLE; Schema: ake; Owner: julius
--

CREATE TABLE ake.banner_items (
    id integer NOT NULL,
    banner integer NOT NULL,
    item integer NOT NULL
);


ALTER TABLE ake.banner_items OWNER TO julius;

--
-- Name: banner_items_id_seq; Type: SEQUENCE; Schema: ake; Owner: julius
--

ALTER TABLE ake.banner_items ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME ake.banner_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: banners; Type: TABLE; Schema: ake; Owner: julius
--

CREATE TABLE ake.banners (
    id integer NOT NULL,
    gacha integer NOT NULL,
    start_cn timestamp with time zone,
    start_eu timestamp with time zone,
    start_na timestamp with time zone,
    end_cn timestamp with time zone,
    end_eu timestamp with time zone,
    end_na timestamp with time zone
);


ALTER TABLE ake.banners OWNER TO julius;

--
-- Name: banners_id_seq; Type: SEQUENCE; Schema: ake; Owner: julius
--

ALTER TABLE ake.banners ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME ake.banners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: gachas; Type: TABLE; Schema: ake; Owner: julius
--

CREATE TABLE ake.gachas (
    id integer NOT NULL,
    extern_id text NOT NULL,
    name text NOT NULL,
    show boolean NOT NULL,
    sort integer NOT NULL
);


ALTER TABLE ake.gachas OWNER TO julius;

--
-- Name: gachas_id_seq; Type: SEQUENCE; Schema: ake; Owner: julius
--

ALTER TABLE ake.gachas ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME ake.gachas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: item_texts; Type: TABLE; Schema: ake; Owner: julius
--

CREATE TABLE ake.item_texts (
    id integer NOT NULL,
    lang public.lang NOT NULL,
    item integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE ake.item_texts OWNER TO julius;

--
-- Name: item_texts_id_seq; Type: SEQUENCE; Schema: ake; Owner: julius
--

ALTER TABLE ake.item_texts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME ake.item_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: items; Type: TABLE; Schema: ake; Owner: julius
--

CREATE TABLE ake.items (
    id integer NOT NULL,
    extern_id text NOT NULL,
    type ake.item_type NOT NULL,
    rarity integer NOT NULL
);


ALTER TABLE ake.items OWNER TO julius;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: ake; Owner: julius
--

ALTER TABLE ake.items ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME ake.items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: pulls; Type: TABLE; Schema: ake; Owner: julius
--

CREATE TABLE ake.pulls (
    id bigint NOT NULL,
    extern_id text NOT NULL,
    gacha integer NOT NULL,
    uid integer NOT NULL,
    item integer NOT NULL,
    "time" timestamp with time zone NOT NULL,
    official boolean NOT NULL
);


ALTER TABLE ake.pulls OWNER TO julius;

--
-- Name: pulls_id_seq; Type: SEQUENCE; Schema: ake; Owner: julius
--

ALTER TABLE ake.pulls ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME ake.pulls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: accounts; Type: TABLE; Schema: auth; Owner: julius
--

CREATE TABLE auth.accounts (
    id integer NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    email text
);


ALTER TABLE auth.accounts OWNER TO julius;

--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: auth; Owner: julius
--

ALTER TABLE auth.accounts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME auth.accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: admins; Type: TABLE; Schema: auth; Owner: julius
--

CREATE TABLE auth.admins (
    id integer NOT NULL
);


ALTER TABLE auth.admins OWNER TO julius;

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
-- Name: achievement_profiles; Type: TABLE; Schema: gi; Owner: julius
--

CREATE TABLE gi.achievement_profiles (
    id integer NOT NULL,
    account integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE gi.achievement_profiles OWNER TO julius;

--
-- Name: achievement_profiles_id_seq; Type: SEQUENCE; Schema: gi; Owner: julius
--

ALTER TABLE gi.achievement_profiles ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME gi.achievement_profiles_id_seq
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
-- Name: achievements_completed; Type: TABLE; Schema: gi; Owner: julius
--

CREATE TABLE gi.achievements_completed (
    id bigint NOT NULL,
    profile integer NOT NULL,
    achievement integer NOT NULL
);


ALTER TABLE gi.achievements_completed OWNER TO julius;

--
-- Name: achievements_completed_id_seq; Type: SEQUENCE; Schema: gi; Owner: julius
--

ALTER TABLE gi.achievements_completed ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME gi.achievements_completed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievements_favorited; Type: TABLE; Schema: gi; Owner: julius
--

CREATE TABLE gi.achievements_favorited (
    id bigint NOT NULL,
    profile integer NOT NULL,
    achievement integer NOT NULL
);


ALTER TABLE gi.achievements_favorited OWNER TO julius;

--
-- Name: achievements_favorited_id_seq; Type: SEQUENCE; Schema: gi; Owner: julius
--

ALTER TABLE gi.achievements_favorited ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME gi.achievements_favorited_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


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
-- Name: banner_items; Type: TABLE; Schema: gi; Owner: julius
--

CREATE TABLE gi.banner_items (
    id integer NOT NULL,
    banner integer NOT NULL,
    item integer NOT NULL
);


ALTER TABLE gi.banner_items OWNER TO julius;

--
-- Name: banner_items_id_seq; Type: SEQUENCE; Schema: gi; Owner: julius
--

ALTER TABLE gi.banner_items ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME gi.banner_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: banners; Type: TABLE; Schema: gi; Owner: julius
--

CREATE TABLE gi.banners (
    id integer NOT NULL,
    gacha integer NOT NULL,
    start_cn timestamp with time zone,
    start_eu timestamp with time zone,
    start_na timestamp with time zone,
    end_cn timestamp with time zone,
    end_eu timestamp with time zone,
    end_na timestamp with time zone
);


ALTER TABLE gi.banners OWNER TO julius;

--
-- Name: banners_id_seq; Type: SEQUENCE; Schema: gi; Owner: julius
--

ALTER TABLE gi.banners ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME gi.banners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: gachas; Type: TABLE; Schema: gi; Owner: julius
--

CREATE TABLE gi.gachas (
    id integer NOT NULL,
    extern_id text NOT NULL,
    name text NOT NULL,
    show boolean NOT NULL,
    sort integer NOT NULL
);


ALTER TABLE gi.gachas OWNER TO julius;

--
-- Name: gachas_id_seq; Type: SEQUENCE; Schema: gi; Owner: julius
--

ALTER TABLE gi.gachas ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME gi.gachas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: item_texts; Type: TABLE; Schema: gi; Owner: julius
--

CREATE TABLE gi.item_texts (
    id integer NOT NULL,
    lang public.lang NOT NULL,
    item integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE gi.item_texts OWNER TO julius;

--
-- Name: item_texts_id_seq; Type: SEQUENCE; Schema: gi; Owner: julius
--

ALTER TABLE gi.item_texts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME gi.item_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: items; Type: TABLE; Schema: gi; Owner: julius
--

CREATE TABLE gi.items (
    id integer NOT NULL,
    extern_id text NOT NULL,
    type gi.item_type NOT NULL,
    rarity integer NOT NULL
);


ALTER TABLE gi.items OWNER TO julius;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: gi; Owner: julius
--

ALTER TABLE gi.items ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME gi.items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: pulls; Type: TABLE; Schema: gi; Owner: julius
--

CREATE TABLE gi.pulls (
    id bigint NOT NULL,
    extern_id text NOT NULL,
    gacha integer NOT NULL,
    uid integer NOT NULL,
    item integer NOT NULL,
    "time" timestamp with time zone NOT NULL,
    official boolean NOT NULL
);


ALTER TABLE gi.pulls OWNER TO julius;

--
-- Name: pulls_id_seq; Type: SEQUENCE; Schema: gi; Owner: julius
--

ALTER TABLE gi.pulls ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME gi.pulls_id_seq
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
-- Name: achievement_profiles; Type: TABLE; Schema: hsr; Owner: julius
--

CREATE TABLE hsr.achievement_profiles (
    id integer NOT NULL,
    account integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE hsr.achievement_profiles OWNER TO julius;

--
-- Name: achievement_profiles_id_seq; Type: SEQUENCE; Schema: hsr; Owner: julius
--

ALTER TABLE hsr.achievement_profiles ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME hsr.achievement_profiles_id_seq
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
-- Name: achievements_completed; Type: TABLE; Schema: hsr; Owner: julius
--

CREATE TABLE hsr.achievements_completed (
    id bigint NOT NULL,
    profile integer NOT NULL,
    achievement integer NOT NULL
);


ALTER TABLE hsr.achievements_completed OWNER TO julius;

--
-- Name: achievements_completed_id_seq; Type: SEQUENCE; Schema: hsr; Owner: julius
--

ALTER TABLE hsr.achievements_completed ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME hsr.achievements_completed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievements_favorited; Type: TABLE; Schema: hsr; Owner: julius
--

CREATE TABLE hsr.achievements_favorited (
    id bigint NOT NULL,
    profile integer NOT NULL,
    achievement integer NOT NULL
);


ALTER TABLE hsr.achievements_favorited OWNER TO julius;

--
-- Name: achievements_favorited_id_seq; Type: SEQUENCE; Schema: hsr; Owner: julius
--

ALTER TABLE hsr.achievements_favorited ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME hsr.achievements_favorited_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


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
    name text NOT NULL,
    show boolean NOT NULL,
    sort integer NOT NULL
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
    type hsr.item_type NOT NULL,
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
    id bigint NOT NULL,
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
-- Name: achievement_profiles; Type: TABLE; Schema: nte; Owner: julius
--

CREATE TABLE nte.achievement_profiles (
    id integer NOT NULL,
    account integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE nte.achievement_profiles OWNER TO julius;

--
-- Name: achievement_profiles_id_seq; Type: SEQUENCE; Schema: nte; Owner: julius
--

ALTER TABLE nte.achievement_profiles ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME nte.achievement_profiles_id_seq
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
-- Name: achievements_completed; Type: TABLE; Schema: nte; Owner: julius
--

CREATE TABLE nte.achievements_completed (
    id bigint NOT NULL,
    profile integer NOT NULL,
    achievement integer NOT NULL
);


ALTER TABLE nte.achievements_completed OWNER TO julius;

--
-- Name: achievements_completed_id_seq; Type: SEQUENCE; Schema: nte; Owner: julius
--

ALTER TABLE nte.achievements_completed ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME nte.achievements_completed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievements_favorited; Type: TABLE; Schema: nte; Owner: julius
--

CREATE TABLE nte.achievements_favorited (
    id bigint NOT NULL,
    profile integer NOT NULL,
    achievement integer NOT NULL
);


ALTER TABLE nte.achievements_favorited OWNER TO julius;

--
-- Name: achievements_favorited_id_seq; Type: SEQUENCE; Schema: nte; Owner: julius
--

ALTER TABLE nte.achievements_favorited ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME nte.achievements_favorited_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


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
-- Name: banner_items; Type: TABLE; Schema: nte; Owner: julius
--

CREATE TABLE nte.banner_items (
    id integer NOT NULL,
    banner integer NOT NULL,
    item integer NOT NULL
);


ALTER TABLE nte.banner_items OWNER TO julius;

--
-- Name: banner_items_id_seq; Type: SEQUENCE; Schema: nte; Owner: julius
--

ALTER TABLE nte.banner_items ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME nte.banner_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: banners; Type: TABLE; Schema: nte; Owner: julius
--

CREATE TABLE nte.banners (
    id integer NOT NULL,
    gacha integer NOT NULL,
    start_cn timestamp with time zone,
    start_eu timestamp with time zone,
    start_na timestamp with time zone,
    end_cn timestamp with time zone,
    end_eu timestamp with time zone,
    end_na timestamp with time zone
);


ALTER TABLE nte.banners OWNER TO julius;

--
-- Name: banners_id_seq; Type: SEQUENCE; Schema: nte; Owner: julius
--

ALTER TABLE nte.banners ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME nte.banners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: gachas; Type: TABLE; Schema: nte; Owner: julius
--

CREATE TABLE nte.gachas (
    id integer NOT NULL,
    extern_id text NOT NULL,
    name text NOT NULL,
    show boolean NOT NULL,
    sort integer NOT NULL
);


ALTER TABLE nte.gachas OWNER TO julius;

--
-- Name: gachas_id_seq; Type: SEQUENCE; Schema: nte; Owner: julius
--

ALTER TABLE nte.gachas ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME nte.gachas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: item_texts; Type: TABLE; Schema: nte; Owner: julius
--

CREATE TABLE nte.item_texts (
    id integer NOT NULL,
    lang public.lang NOT NULL,
    item integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE nte.item_texts OWNER TO julius;

--
-- Name: item_texts_id_seq; Type: SEQUENCE; Schema: nte; Owner: julius
--

ALTER TABLE nte.item_texts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME nte.item_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: items; Type: TABLE; Schema: nte; Owner: julius
--

CREATE TABLE nte.items (
    id integer NOT NULL,
    extern_id text NOT NULL,
    type nte.item_type NOT NULL,
    rarity integer NOT NULL
);


ALTER TABLE nte.items OWNER TO julius;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: nte; Owner: julius
--

ALTER TABLE nte.items ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME nte.items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: pulls; Type: TABLE; Schema: nte; Owner: julius
--

CREATE TABLE nte.pulls (
    id bigint NOT NULL,
    extern_id text NOT NULL,
    gacha integer NOT NULL,
    uid integer NOT NULL,
    item integer NOT NULL,
    "time" timestamp with time zone NOT NULL,
    official boolean NOT NULL
);


ALTER TABLE nte.pulls OWNER TO julius;

--
-- Name: pulls_id_seq; Type: SEQUENCE; Schema: nte; Owner: julius
--

ALTER TABLE nte.pulls ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME nte.pulls_id_seq
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
-- Name: achievement_categories; Type: TABLE; Schema: wuwa; Owner: julius
--

CREATE TABLE wuwa.achievement_categories (
    id integer NOT NULL,
    extern_id text NOT NULL,
    sort integer NOT NULL
);


ALTER TABLE wuwa.achievement_categories OWNER TO julius;

--
-- Name: achievement_categories_id_seq; Type: SEQUENCE; Schema: wuwa; Owner: julius
--

ALTER TABLE wuwa.achievement_categories ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME wuwa.achievement_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievement_category_texts; Type: TABLE; Schema: wuwa; Owner: julius
--

CREATE TABLE wuwa.achievement_category_texts (
    id integer NOT NULL,
    lang public.lang NOT NULL,
    category integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE wuwa.achievement_category_texts OWNER TO julius;

--
-- Name: achievement_category_texts_id_seq; Type: SEQUENCE; Schema: wuwa; Owner: julius
--

ALTER TABLE wuwa.achievement_category_texts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME wuwa.achievement_category_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievement_profiles; Type: TABLE; Schema: wuwa; Owner: julius
--

CREATE TABLE wuwa.achievement_profiles (
    id integer NOT NULL,
    account integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE wuwa.achievement_profiles OWNER TO julius;

--
-- Name: achievement_profiles_id_seq; Type: SEQUENCE; Schema: wuwa; Owner: julius
--

ALTER TABLE wuwa.achievement_profiles ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME wuwa.achievement_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievement_texts; Type: TABLE; Schema: wuwa; Owner: julius
--

CREATE TABLE wuwa.achievement_texts (
    id integer NOT NULL,
    lang public.lang NOT NULL,
    achievement integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL
);


ALTER TABLE wuwa.achievement_texts OWNER TO julius;

--
-- Name: achievement_texts_id_seq; Type: SEQUENCE; Schema: wuwa; Owner: julius
--

ALTER TABLE wuwa.achievement_texts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME wuwa.achievement_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievements; Type: TABLE; Schema: wuwa; Owner: julius
--

CREATE TABLE wuwa.achievements (
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


ALTER TABLE wuwa.achievements OWNER TO julius;

--
-- Name: achievements_completed; Type: TABLE; Schema: wuwa; Owner: julius
--

CREATE TABLE wuwa.achievements_completed (
    id bigint NOT NULL,
    profile integer NOT NULL,
    achievement integer NOT NULL
);


ALTER TABLE wuwa.achievements_completed OWNER TO julius;

--
-- Name: achievements_completed_id_seq; Type: SEQUENCE; Schema: wuwa; Owner: julius
--

ALTER TABLE wuwa.achievements_completed ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME wuwa.achievements_completed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievements_favorited; Type: TABLE; Schema: wuwa; Owner: julius
--

CREATE TABLE wuwa.achievements_favorited (
    id bigint NOT NULL,
    profile integer NOT NULL,
    achievement integer NOT NULL
);


ALTER TABLE wuwa.achievements_favorited OWNER TO julius;

--
-- Name: achievements_favorited_id_seq; Type: SEQUENCE; Schema: wuwa; Owner: julius
--

ALTER TABLE wuwa.achievements_favorited ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME wuwa.achievements_favorited_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievements_id_seq; Type: SEQUENCE; Schema: wuwa; Owner: julius
--

ALTER TABLE wuwa.achievements ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME wuwa.achievements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: banner_items; Type: TABLE; Schema: wuwa; Owner: julius
--

CREATE TABLE wuwa.banner_items (
    id integer NOT NULL,
    banner integer NOT NULL,
    item integer NOT NULL
);


ALTER TABLE wuwa.banner_items OWNER TO julius;

--
-- Name: banner_items_id_seq; Type: SEQUENCE; Schema: wuwa; Owner: julius
--

ALTER TABLE wuwa.banner_items ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME wuwa.banner_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: banners; Type: TABLE; Schema: wuwa; Owner: julius
--

CREATE TABLE wuwa.banners (
    id integer NOT NULL,
    gacha integer NOT NULL,
    start_cn timestamp with time zone,
    start_eu timestamp with time zone,
    start_na timestamp with time zone,
    end_cn timestamp with time zone,
    end_eu timestamp with time zone,
    end_na timestamp with time zone
);


ALTER TABLE wuwa.banners OWNER TO julius;

--
-- Name: banners_id_seq; Type: SEQUENCE; Schema: wuwa; Owner: julius
--

ALTER TABLE wuwa.banners ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME wuwa.banners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: gachas; Type: TABLE; Schema: wuwa; Owner: julius
--

CREATE TABLE wuwa.gachas (
    id integer NOT NULL,
    extern_id text NOT NULL,
    name text NOT NULL,
    show boolean NOT NULL,
    sort integer NOT NULL
);


ALTER TABLE wuwa.gachas OWNER TO julius;

--
-- Name: gachas_id_seq; Type: SEQUENCE; Schema: wuwa; Owner: julius
--

ALTER TABLE wuwa.gachas ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME wuwa.gachas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: item_texts; Type: TABLE; Schema: wuwa; Owner: julius
--

CREATE TABLE wuwa.item_texts (
    id integer NOT NULL,
    lang public.lang NOT NULL,
    item integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE wuwa.item_texts OWNER TO julius;

--
-- Name: item_texts_id_seq; Type: SEQUENCE; Schema: wuwa; Owner: julius
--

ALTER TABLE wuwa.item_texts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME wuwa.item_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: items; Type: TABLE; Schema: wuwa; Owner: julius
--

CREATE TABLE wuwa.items (
    id integer NOT NULL,
    extern_id text NOT NULL,
    type wuwa.item_type NOT NULL,
    rarity integer NOT NULL
);


ALTER TABLE wuwa.items OWNER TO julius;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: wuwa; Owner: julius
--

ALTER TABLE wuwa.items ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME wuwa.items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: pulls; Type: TABLE; Schema: wuwa; Owner: julius
--

CREATE TABLE wuwa.pulls (
    id bigint NOT NULL,
    extern_id text NOT NULL,
    gacha integer NOT NULL,
    uid integer NOT NULL,
    item integer NOT NULL,
    "time" timestamp with time zone NOT NULL,
    official boolean NOT NULL
);


ALTER TABLE wuwa.pulls OWNER TO julius;

--
-- Name: pulls_id_seq; Type: SEQUENCE; Schema: wuwa; Owner: julius
--

ALTER TABLE wuwa.pulls ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME wuwa.pulls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievement_categories; Type: TABLE; Schema: zzz; Owner: julius
--

CREATE TABLE zzz.achievement_categories (
    id integer NOT NULL,
    extern_id text NOT NULL,
    sort integer NOT NULL
);


ALTER TABLE zzz.achievement_categories OWNER TO julius;

--
-- Name: achievement_categories_id_seq; Type: SEQUENCE; Schema: zzz; Owner: julius
--

ALTER TABLE zzz.achievement_categories ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME zzz.achievement_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievement_category_texts; Type: TABLE; Schema: zzz; Owner: julius
--

CREATE TABLE zzz.achievement_category_texts (
    id integer NOT NULL,
    lang public.lang NOT NULL,
    category integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE zzz.achievement_category_texts OWNER TO julius;

--
-- Name: achievement_category_texts_id_seq; Type: SEQUENCE; Schema: zzz; Owner: julius
--

ALTER TABLE zzz.achievement_category_texts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME zzz.achievement_category_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievement_profiles; Type: TABLE; Schema: zzz; Owner: julius
--

CREATE TABLE zzz.achievement_profiles (
    id integer NOT NULL,
    account integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE zzz.achievement_profiles OWNER TO julius;

--
-- Name: achievement_profiles_id_seq; Type: SEQUENCE; Schema: zzz; Owner: julius
--

ALTER TABLE zzz.achievement_profiles ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME zzz.achievement_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievement_texts; Type: TABLE; Schema: zzz; Owner: julius
--

CREATE TABLE zzz.achievement_texts (
    id integer NOT NULL,
    lang public.lang NOT NULL,
    achievement integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL
);


ALTER TABLE zzz.achievement_texts OWNER TO julius;

--
-- Name: achievement_texts_id_seq; Type: SEQUENCE; Schema: zzz; Owner: julius
--

ALTER TABLE zzz.achievement_texts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME zzz.achievement_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievements; Type: TABLE; Schema: zzz; Owner: julius
--

CREATE TABLE zzz.achievements (
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


ALTER TABLE zzz.achievements OWNER TO julius;

--
-- Name: achievements_completed; Type: TABLE; Schema: zzz; Owner: julius
--

CREATE TABLE zzz.achievements_completed (
    id bigint NOT NULL,
    profile integer NOT NULL,
    achievement integer NOT NULL
);


ALTER TABLE zzz.achievements_completed OWNER TO julius;

--
-- Name: achievements_completed_id_seq; Type: SEQUENCE; Schema: zzz; Owner: julius
--

ALTER TABLE zzz.achievements_completed ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME zzz.achievements_completed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievements_favorited; Type: TABLE; Schema: zzz; Owner: julius
--

CREATE TABLE zzz.achievements_favorited (
    id bigint NOT NULL,
    profile integer NOT NULL,
    achievement integer NOT NULL
);


ALTER TABLE zzz.achievements_favorited OWNER TO julius;

--
-- Name: achievements_favorited_id_seq; Type: SEQUENCE; Schema: zzz; Owner: julius
--

ALTER TABLE zzz.achievements_favorited ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME zzz.achievements_favorited_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievements_id_seq; Type: SEQUENCE; Schema: zzz; Owner: julius
--

ALTER TABLE zzz.achievements ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME zzz.achievements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: banner_items; Type: TABLE; Schema: zzz; Owner: julius
--

CREATE TABLE zzz.banner_items (
    id integer NOT NULL,
    banner integer NOT NULL,
    item integer NOT NULL
);


ALTER TABLE zzz.banner_items OWNER TO julius;

--
-- Name: banner_items_id_seq; Type: SEQUENCE; Schema: zzz; Owner: julius
--

ALTER TABLE zzz.banner_items ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME zzz.banner_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: banners; Type: TABLE; Schema: zzz; Owner: julius
--

CREATE TABLE zzz.banners (
    id integer NOT NULL,
    gacha integer NOT NULL,
    start_cn timestamp with time zone,
    start_eu timestamp with time zone,
    start_na timestamp with time zone,
    end_cn timestamp with time zone,
    end_eu timestamp with time zone,
    end_na timestamp with time zone
);


ALTER TABLE zzz.banners OWNER TO julius;

--
-- Name: banners_id_seq; Type: SEQUENCE; Schema: zzz; Owner: julius
--

ALTER TABLE zzz.banners ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME zzz.banners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: gachas; Type: TABLE; Schema: zzz; Owner: julius
--

CREATE TABLE zzz.gachas (
    id integer NOT NULL,
    extern_id text NOT NULL,
    name text NOT NULL,
    show boolean NOT NULL,
    sort integer NOT NULL
);


ALTER TABLE zzz.gachas OWNER TO julius;

--
-- Name: gachas_id_seq; Type: SEQUENCE; Schema: zzz; Owner: julius
--

ALTER TABLE zzz.gachas ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME zzz.gachas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: item_texts; Type: TABLE; Schema: zzz; Owner: julius
--

CREATE TABLE zzz.item_texts (
    id integer NOT NULL,
    lang public.lang NOT NULL,
    item integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE zzz.item_texts OWNER TO julius;

--
-- Name: item_texts_id_seq; Type: SEQUENCE; Schema: zzz; Owner: julius
--

ALTER TABLE zzz.item_texts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME zzz.item_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: items; Type: TABLE; Schema: zzz; Owner: julius
--

CREATE TABLE zzz.items (
    id integer NOT NULL,
    extern_id text NOT NULL,
    type zzz.item_type NOT NULL,
    rarity integer NOT NULL
);


ALTER TABLE zzz.items OWNER TO julius;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: zzz; Owner: julius
--

ALTER TABLE zzz.items ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME zzz.items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: pulls; Type: TABLE; Schema: zzz; Owner: julius
--

CREATE TABLE zzz.pulls (
    id bigint NOT NULL,
    extern_id text NOT NULL,
    gacha integer NOT NULL,
    uid integer NOT NULL,
    item integer NOT NULL,
    "time" timestamp with time zone NOT NULL,
    official boolean NOT NULL
);


ALTER TABLE zzz.pulls OWNER TO julius;

--
-- Name: pulls_id_seq; Type: SEQUENCE; Schema: zzz; Owner: julius
--

ALTER TABLE zzz.pulls ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME zzz.pulls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: achievement_categories achievement_categories_extern_id_key; Type: CONSTRAINT; Schema: ake; Owner: julius
--

ALTER TABLE ONLY ake.achievement_categories
    ADD CONSTRAINT achievement_categories_extern_id_key UNIQUE (extern_id);


--
-- Name: achievement_categories achievement_categories_pkey; Type: CONSTRAINT; Schema: ake; Owner: julius
--

ALTER TABLE ONLY ake.achievement_categories
    ADD CONSTRAINT achievement_categories_pkey PRIMARY KEY (id);


--
-- Name: achievement_category_texts achievement_category_texts_pkey; Type: CONSTRAINT; Schema: ake; Owner: julius
--

ALTER TABLE ONLY ake.achievement_category_texts
    ADD CONSTRAINT achievement_category_texts_pkey PRIMARY KEY (id);


--
-- Name: achievement_profiles achievement_profiles_pkey; Type: CONSTRAINT; Schema: ake; Owner: julius
--

ALTER TABLE ONLY ake.achievement_profiles
    ADD CONSTRAINT achievement_profiles_pkey PRIMARY KEY (id);


--
-- Name: achievement_texts achievement_texts_pkey; Type: CONSTRAINT; Schema: ake; Owner: julius
--

ALTER TABLE ONLY ake.achievement_texts
    ADD CONSTRAINT achievement_texts_pkey PRIMARY KEY (id);


--
-- Name: achievements_completed achievements_completed_pkey; Type: CONSTRAINT; Schema: ake; Owner: julius
--

ALTER TABLE ONLY ake.achievements_completed
    ADD CONSTRAINT achievements_completed_pkey PRIMARY KEY (id);


--
-- Name: achievements achievements_extern_id_key; Type: CONSTRAINT; Schema: ake; Owner: julius
--

ALTER TABLE ONLY ake.achievements
    ADD CONSTRAINT achievements_extern_id_key UNIQUE (extern_id);


--
-- Name: achievements_favorited achievements_favorited_pkey; Type: CONSTRAINT; Schema: ake; Owner: julius
--

ALTER TABLE ONLY ake.achievements_favorited
    ADD CONSTRAINT achievements_favorited_pkey PRIMARY KEY (id);


--
-- Name: achievements achievements_pkey; Type: CONSTRAINT; Schema: ake; Owner: julius
--

ALTER TABLE ONLY ake.achievements
    ADD CONSTRAINT achievements_pkey PRIMARY KEY (id);


--
-- Name: banner_items banner_items_pkey; Type: CONSTRAINT; Schema: ake; Owner: julius
--

ALTER TABLE ONLY ake.banner_items
    ADD CONSTRAINT banner_items_pkey PRIMARY KEY (id);


--
-- Name: banners banners_pkey; Type: CONSTRAINT; Schema: ake; Owner: julius
--

ALTER TABLE ONLY ake.banners
    ADD CONSTRAINT banners_pkey PRIMARY KEY (id);


--
-- Name: gachas gachas_extern_id_key; Type: CONSTRAINT; Schema: ake; Owner: julius
--

ALTER TABLE ONLY ake.gachas
    ADD CONSTRAINT gachas_extern_id_key UNIQUE (extern_id);


--
-- Name: gachas gachas_pkey; Type: CONSTRAINT; Schema: ake; Owner: julius
--

ALTER TABLE ONLY ake.gachas
    ADD CONSTRAINT gachas_pkey PRIMARY KEY (id);


--
-- Name: item_texts item_texts_pkey; Type: CONSTRAINT; Schema: ake; Owner: julius
--

ALTER TABLE ONLY ake.item_texts
    ADD CONSTRAINT item_texts_pkey PRIMARY KEY (id);


--
-- Name: items items_extern_id_key; Type: CONSTRAINT; Schema: ake; Owner: julius
--

ALTER TABLE ONLY ake.items
    ADD CONSTRAINT items_extern_id_key UNIQUE (extern_id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: ake; Owner: julius
--

ALTER TABLE ONLY ake.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: pulls pulls_pkey; Type: CONSTRAINT; Schema: ake; Owner: julius
--

ALTER TABLE ONLY ake.pulls
    ADD CONSTRAINT pulls_pkey PRIMARY KEY (id);


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: auth; Owner: julius
--

ALTER TABLE ONLY auth.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: auth; Owner: julius
--

ALTER TABLE ONLY auth.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


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
-- Name: achievement_profiles achievement_profiles_pkey; Type: CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.achievement_profiles
    ADD CONSTRAINT achievement_profiles_pkey PRIMARY KEY (id);


--
-- Name: achievement_texts achievement_texts_pkey; Type: CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.achievement_texts
    ADD CONSTRAINT achievement_texts_pkey PRIMARY KEY (id);


--
-- Name: achievements_completed achievements_completed_pkey; Type: CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.achievements_completed
    ADD CONSTRAINT achievements_completed_pkey PRIMARY KEY (id);


--
-- Name: achievements achievements_extern_id_key; Type: CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.achievements
    ADD CONSTRAINT achievements_extern_id_key UNIQUE (extern_id);


--
-- Name: achievements_favorited achievements_favorited_pkey; Type: CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.achievements_favorited
    ADD CONSTRAINT achievements_favorited_pkey PRIMARY KEY (id);


--
-- Name: achievements achievements_pkey; Type: CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.achievements
    ADD CONSTRAINT achievements_pkey PRIMARY KEY (id);


--
-- Name: banner_items banner_items_pkey; Type: CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.banner_items
    ADD CONSTRAINT banner_items_pkey PRIMARY KEY (id);


--
-- Name: banners banners_pkey; Type: CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.banners
    ADD CONSTRAINT banners_pkey PRIMARY KEY (id);


--
-- Name: gachas gachas_extern_id_key; Type: CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.gachas
    ADD CONSTRAINT gachas_extern_id_key UNIQUE (extern_id);


--
-- Name: gachas gachas_pkey; Type: CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.gachas
    ADD CONSTRAINT gachas_pkey PRIMARY KEY (id);


--
-- Name: item_texts item_texts_pkey; Type: CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.item_texts
    ADD CONSTRAINT item_texts_pkey PRIMARY KEY (id);


--
-- Name: items items_extern_id_key; Type: CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.items
    ADD CONSTRAINT items_extern_id_key UNIQUE (extern_id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: pulls pulls_pkey; Type: CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.pulls
    ADD CONSTRAINT pulls_pkey PRIMARY KEY (id);


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
-- Name: achievement_profiles achievement_profiles_pkey; Type: CONSTRAINT; Schema: hsr; Owner: julius
--

ALTER TABLE ONLY hsr.achievement_profiles
    ADD CONSTRAINT achievement_profiles_pkey PRIMARY KEY (id);


--
-- Name: achievement_texts achievement_texts_pkey; Type: CONSTRAINT; Schema: hsr; Owner: julius
--

ALTER TABLE ONLY hsr.achievement_texts
    ADD CONSTRAINT achievement_texts_pkey PRIMARY KEY (id);


--
-- Name: achievements_completed achievements_completed_pkey; Type: CONSTRAINT; Schema: hsr; Owner: julius
--

ALTER TABLE ONLY hsr.achievements_completed
    ADD CONSTRAINT achievements_completed_pkey PRIMARY KEY (id);


--
-- Name: achievements achievements_extern_id_key; Type: CONSTRAINT; Schema: hsr; Owner: julius
--

ALTER TABLE ONLY hsr.achievements
    ADD CONSTRAINT achievements_extern_id_key UNIQUE (extern_id);


--
-- Name: achievements_favorited achievements_favorited_pkey; Type: CONSTRAINT; Schema: hsr; Owner: julius
--

ALTER TABLE ONLY hsr.achievements_favorited
    ADD CONSTRAINT achievements_favorited_pkey PRIMARY KEY (id);


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
-- Name: achievement_profiles achievement_profiles_pkey; Type: CONSTRAINT; Schema: nte; Owner: julius
--

ALTER TABLE ONLY nte.achievement_profiles
    ADD CONSTRAINT achievement_profiles_pkey PRIMARY KEY (id);


--
-- Name: achievement_texts achievement_texts_pkey; Type: CONSTRAINT; Schema: nte; Owner: julius
--

ALTER TABLE ONLY nte.achievement_texts
    ADD CONSTRAINT achievement_texts_pkey PRIMARY KEY (id);


--
-- Name: achievements_completed achievements_completed_pkey; Type: CONSTRAINT; Schema: nte; Owner: julius
--

ALTER TABLE ONLY nte.achievements_completed
    ADD CONSTRAINT achievements_completed_pkey PRIMARY KEY (id);


--
-- Name: achievements achievements_extern_id_key; Type: CONSTRAINT; Schema: nte; Owner: julius
--

ALTER TABLE ONLY nte.achievements
    ADD CONSTRAINT achievements_extern_id_key UNIQUE (extern_id);


--
-- Name: achievements_favorited achievements_favorited_pkey; Type: CONSTRAINT; Schema: nte; Owner: julius
--

ALTER TABLE ONLY nte.achievements_favorited
    ADD CONSTRAINT achievements_favorited_pkey PRIMARY KEY (id);


--
-- Name: achievements achievements_pkey; Type: CONSTRAINT; Schema: nte; Owner: julius
--

ALTER TABLE ONLY nte.achievements
    ADD CONSTRAINT achievements_pkey PRIMARY KEY (id);


--
-- Name: banner_items banner_items_pkey; Type: CONSTRAINT; Schema: nte; Owner: julius
--

ALTER TABLE ONLY nte.banner_items
    ADD CONSTRAINT banner_items_pkey PRIMARY KEY (id);


--
-- Name: banners banners_pkey; Type: CONSTRAINT; Schema: nte; Owner: julius
--

ALTER TABLE ONLY nte.banners
    ADD CONSTRAINT banners_pkey PRIMARY KEY (id);


--
-- Name: gachas gachas_extern_id_key; Type: CONSTRAINT; Schema: nte; Owner: julius
--

ALTER TABLE ONLY nte.gachas
    ADD CONSTRAINT gachas_extern_id_key UNIQUE (extern_id);


--
-- Name: gachas gachas_pkey; Type: CONSTRAINT; Schema: nte; Owner: julius
--

ALTER TABLE ONLY nte.gachas
    ADD CONSTRAINT gachas_pkey PRIMARY KEY (id);


--
-- Name: item_texts item_texts_pkey; Type: CONSTRAINT; Schema: nte; Owner: julius
--

ALTER TABLE ONLY nte.item_texts
    ADD CONSTRAINT item_texts_pkey PRIMARY KEY (id);


--
-- Name: items items_extern_id_key; Type: CONSTRAINT; Schema: nte; Owner: julius
--

ALTER TABLE ONLY nte.items
    ADD CONSTRAINT items_extern_id_key UNIQUE (extern_id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: nte; Owner: julius
--

ALTER TABLE ONLY nte.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: pulls pulls_pkey; Type: CONSTRAINT; Schema: nte; Owner: julius
--

ALTER TABLE ONLY nte.pulls
    ADD CONSTRAINT pulls_pkey PRIMARY KEY (id);


--
-- Name: _sqlx_migrations _sqlx_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: julius
--

ALTER TABLE ONLY public._sqlx_migrations
    ADD CONSTRAINT _sqlx_migrations_pkey PRIMARY KEY (version);


--
-- Name: achievement_categories achievement_categories_extern_id_key; Type: CONSTRAINT; Schema: wuwa; Owner: julius
--

ALTER TABLE ONLY wuwa.achievement_categories
    ADD CONSTRAINT achievement_categories_extern_id_key UNIQUE (extern_id);


--
-- Name: achievement_categories achievement_categories_pkey; Type: CONSTRAINT; Schema: wuwa; Owner: julius
--

ALTER TABLE ONLY wuwa.achievement_categories
    ADD CONSTRAINT achievement_categories_pkey PRIMARY KEY (id);


--
-- Name: achievement_category_texts achievement_category_texts_pkey; Type: CONSTRAINT; Schema: wuwa; Owner: julius
--

ALTER TABLE ONLY wuwa.achievement_category_texts
    ADD CONSTRAINT achievement_category_texts_pkey PRIMARY KEY (id);


--
-- Name: achievement_profiles achievement_profiles_pkey; Type: CONSTRAINT; Schema: wuwa; Owner: julius
--

ALTER TABLE ONLY wuwa.achievement_profiles
    ADD CONSTRAINT achievement_profiles_pkey PRIMARY KEY (id);


--
-- Name: achievement_texts achievement_texts_pkey; Type: CONSTRAINT; Schema: wuwa; Owner: julius
--

ALTER TABLE ONLY wuwa.achievement_texts
    ADD CONSTRAINT achievement_texts_pkey PRIMARY KEY (id);


--
-- Name: achievements_completed achievements_completed_pkey; Type: CONSTRAINT; Schema: wuwa; Owner: julius
--

ALTER TABLE ONLY wuwa.achievements_completed
    ADD CONSTRAINT achievements_completed_pkey PRIMARY KEY (id);


--
-- Name: achievements achievements_extern_id_key; Type: CONSTRAINT; Schema: wuwa; Owner: julius
--

ALTER TABLE ONLY wuwa.achievements
    ADD CONSTRAINT achievements_extern_id_key UNIQUE (extern_id);


--
-- Name: achievements_favorited achievements_favorited_pkey; Type: CONSTRAINT; Schema: wuwa; Owner: julius
--

ALTER TABLE ONLY wuwa.achievements_favorited
    ADD CONSTRAINT achievements_favorited_pkey PRIMARY KEY (id);


--
-- Name: achievements achievements_pkey; Type: CONSTRAINT; Schema: wuwa; Owner: julius
--

ALTER TABLE ONLY wuwa.achievements
    ADD CONSTRAINT achievements_pkey PRIMARY KEY (id);


--
-- Name: banner_items banner_items_pkey; Type: CONSTRAINT; Schema: wuwa; Owner: julius
--

ALTER TABLE ONLY wuwa.banner_items
    ADD CONSTRAINT banner_items_pkey PRIMARY KEY (id);


--
-- Name: banners banners_pkey; Type: CONSTRAINT; Schema: wuwa; Owner: julius
--

ALTER TABLE ONLY wuwa.banners
    ADD CONSTRAINT banners_pkey PRIMARY KEY (id);


--
-- Name: gachas gachas_extern_id_key; Type: CONSTRAINT; Schema: wuwa; Owner: julius
--

ALTER TABLE ONLY wuwa.gachas
    ADD CONSTRAINT gachas_extern_id_key UNIQUE (extern_id);


--
-- Name: gachas gachas_pkey; Type: CONSTRAINT; Schema: wuwa; Owner: julius
--

ALTER TABLE ONLY wuwa.gachas
    ADD CONSTRAINT gachas_pkey PRIMARY KEY (id);


--
-- Name: item_texts item_texts_pkey; Type: CONSTRAINT; Schema: wuwa; Owner: julius
--

ALTER TABLE ONLY wuwa.item_texts
    ADD CONSTRAINT item_texts_pkey PRIMARY KEY (id);


--
-- Name: items items_extern_id_key; Type: CONSTRAINT; Schema: wuwa; Owner: julius
--

ALTER TABLE ONLY wuwa.items
    ADD CONSTRAINT items_extern_id_key UNIQUE (extern_id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: wuwa; Owner: julius
--

ALTER TABLE ONLY wuwa.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: pulls pulls_pkey; Type: CONSTRAINT; Schema: wuwa; Owner: julius
--

ALTER TABLE ONLY wuwa.pulls
    ADD CONSTRAINT pulls_pkey PRIMARY KEY (id);


--
-- Name: achievement_categories achievement_categories_extern_id_key; Type: CONSTRAINT; Schema: zzz; Owner: julius
--

ALTER TABLE ONLY zzz.achievement_categories
    ADD CONSTRAINT achievement_categories_extern_id_key UNIQUE (extern_id);


--
-- Name: achievement_categories achievement_categories_pkey; Type: CONSTRAINT; Schema: zzz; Owner: julius
--

ALTER TABLE ONLY zzz.achievement_categories
    ADD CONSTRAINT achievement_categories_pkey PRIMARY KEY (id);


--
-- Name: achievement_category_texts achievement_category_texts_pkey; Type: CONSTRAINT; Schema: zzz; Owner: julius
--

ALTER TABLE ONLY zzz.achievement_category_texts
    ADD CONSTRAINT achievement_category_texts_pkey PRIMARY KEY (id);


--
-- Name: achievement_profiles achievement_profiles_pkey; Type: CONSTRAINT; Schema: zzz; Owner: julius
--

ALTER TABLE ONLY zzz.achievement_profiles
    ADD CONSTRAINT achievement_profiles_pkey PRIMARY KEY (id);


--
-- Name: achievement_texts achievement_texts_pkey; Type: CONSTRAINT; Schema: zzz; Owner: julius
--

ALTER TABLE ONLY zzz.achievement_texts
    ADD CONSTRAINT achievement_texts_pkey PRIMARY KEY (id);


--
-- Name: achievements_completed achievements_completed_pkey; Type: CONSTRAINT; Schema: zzz; Owner: julius
--

ALTER TABLE ONLY zzz.achievements_completed
    ADD CONSTRAINT achievements_completed_pkey PRIMARY KEY (id);


--
-- Name: achievements achievements_extern_id_key; Type: CONSTRAINT; Schema: zzz; Owner: julius
--

ALTER TABLE ONLY zzz.achievements
    ADD CONSTRAINT achievements_extern_id_key UNIQUE (extern_id);


--
-- Name: achievements_favorited achievements_favorited_pkey; Type: CONSTRAINT; Schema: zzz; Owner: julius
--

ALTER TABLE ONLY zzz.achievements_favorited
    ADD CONSTRAINT achievements_favorited_pkey PRIMARY KEY (id);


--
-- Name: achievements achievements_pkey; Type: CONSTRAINT; Schema: zzz; Owner: julius
--

ALTER TABLE ONLY zzz.achievements
    ADD CONSTRAINT achievements_pkey PRIMARY KEY (id);


--
-- Name: banner_items banner_items_pkey; Type: CONSTRAINT; Schema: zzz; Owner: julius
--

ALTER TABLE ONLY zzz.banner_items
    ADD CONSTRAINT banner_items_pkey PRIMARY KEY (id);


--
-- Name: banners banners_pkey; Type: CONSTRAINT; Schema: zzz; Owner: julius
--

ALTER TABLE ONLY zzz.banners
    ADD CONSTRAINT banners_pkey PRIMARY KEY (id);


--
-- Name: gachas gachas_extern_id_key; Type: CONSTRAINT; Schema: zzz; Owner: julius
--

ALTER TABLE ONLY zzz.gachas
    ADD CONSTRAINT gachas_extern_id_key UNIQUE (extern_id);


--
-- Name: gachas gachas_pkey; Type: CONSTRAINT; Schema: zzz; Owner: julius
--

ALTER TABLE ONLY zzz.gachas
    ADD CONSTRAINT gachas_pkey PRIMARY KEY (id);


--
-- Name: item_texts item_texts_pkey; Type: CONSTRAINT; Schema: zzz; Owner: julius
--

ALTER TABLE ONLY zzz.item_texts
    ADD CONSTRAINT item_texts_pkey PRIMARY KEY (id);


--
-- Name: items items_extern_id_key; Type: CONSTRAINT; Schema: zzz; Owner: julius
--

ALTER TABLE ONLY zzz.items
    ADD CONSTRAINT items_extern_id_key UNIQUE (extern_id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: zzz; Owner: julius
--

ALTER TABLE ONLY zzz.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: pulls pulls_pkey; Type: CONSTRAINT; Schema: zzz; Owner: julius
--

ALTER TABLE ONLY zzz.pulls
    ADD CONSTRAINT pulls_pkey PRIMARY KEY (id);


--
-- Name: achievement_category_texts_lang_category_idx; Type: INDEX; Schema: ake; Owner: julius
--

CREATE UNIQUE INDEX achievement_category_texts_lang_category_idx ON ake.achievement_category_texts USING btree (lang, category);


--
-- Name: achievement_profiles_user_idx; Type: INDEX; Schema: ake; Owner: julius
--

CREATE INDEX achievement_profiles_user_idx ON ake.achievement_profiles USING btree (account);


--
-- Name: achievement_texts_lang_achievement_idx; Type: INDEX; Schema: ake; Owner: julius
--

CREATE UNIQUE INDEX achievement_texts_lang_achievement_idx ON ake.achievement_texts USING btree (lang, achievement);


--
-- Name: achievements_category_idx; Type: INDEX; Schema: ake; Owner: julius
--

CREATE INDEX achievements_category_idx ON ake.achievements USING btree (category);


--
-- Name: achievements_completed_profile_achievement_idx; Type: INDEX; Schema: ake; Owner: julius
--

CREATE UNIQUE INDEX achievements_completed_profile_achievement_idx ON ake.achievements_completed USING btree (profile, achievement);


--
-- Name: achievements_favorited_profile_achievement_idx; Type: INDEX; Schema: ake; Owner: julius
--

CREATE UNIQUE INDEX achievements_favorited_profile_achievement_idx ON ake.achievements_favorited USING btree (profile, achievement);


--
-- Name: item_texts_lang_item_idx; Type: INDEX; Schema: ake; Owner: julius
--

CREATE UNIQUE INDEX item_texts_lang_item_idx ON ake.item_texts USING btree (lang, item);


--
-- Name: accounts_email_idx; Type: INDEX; Schema: auth; Owner: julius
--

CREATE INDEX accounts_email_idx ON auth.accounts USING btree (email) WHERE (email IS NOT NULL);


--
-- Name: accounts_username_idx; Type: INDEX; Schema: auth; Owner: julius
--

CREATE INDEX accounts_username_idx ON auth.accounts USING btree (username);


--
-- Name: achievement_category_texts_lang_category_idx; Type: INDEX; Schema: gi; Owner: julius
--

CREATE UNIQUE INDEX achievement_category_texts_lang_category_idx ON gi.achievement_category_texts USING btree (lang, category);


--
-- Name: achievement_profiles_user_idx; Type: INDEX; Schema: gi; Owner: julius
--

CREATE INDEX achievement_profiles_user_idx ON gi.achievement_profiles USING btree (account);


--
-- Name: achievement_texts_lang_achievement_idx; Type: INDEX; Schema: gi; Owner: julius
--

CREATE UNIQUE INDEX achievement_texts_lang_achievement_idx ON gi.achievement_texts USING btree (lang, achievement);


--
-- Name: achievements_category_idx; Type: INDEX; Schema: gi; Owner: julius
--

CREATE INDEX achievements_category_idx ON gi.achievements USING btree (category);


--
-- Name: achievements_completed_profile_achievement_idx; Type: INDEX; Schema: gi; Owner: julius
--

CREATE UNIQUE INDEX achievements_completed_profile_achievement_idx ON gi.achievements_completed USING btree (profile, achievement);


--
-- Name: achievements_favorited_profile_achievement_idx; Type: INDEX; Schema: gi; Owner: julius
--

CREATE UNIQUE INDEX achievements_favorited_profile_achievement_idx ON gi.achievements_favorited USING btree (profile, achievement);


--
-- Name: item_texts_lang_item_idx; Type: INDEX; Schema: gi; Owner: julius
--

CREATE UNIQUE INDEX item_texts_lang_item_idx ON gi.item_texts USING btree (lang, item);


--
-- Name: achievement_category_texts_lang_category_idx; Type: INDEX; Schema: hsr; Owner: julius
--

CREATE UNIQUE INDEX achievement_category_texts_lang_category_idx ON hsr.achievement_category_texts USING btree (lang, category);


--
-- Name: achievement_profiles_user_idx; Type: INDEX; Schema: hsr; Owner: julius
--

CREATE INDEX achievement_profiles_user_idx ON hsr.achievement_profiles USING btree (account);


--
-- Name: achievement_texts_lang_achievement_idx; Type: INDEX; Schema: hsr; Owner: julius
--

CREATE UNIQUE INDEX achievement_texts_lang_achievement_idx ON hsr.achievement_texts USING btree (lang, achievement);


--
-- Name: achievements_category_idx; Type: INDEX; Schema: hsr; Owner: julius
--

CREATE INDEX achievements_category_idx ON hsr.achievements USING btree (category);


--
-- Name: achievements_completed_profile_achievement_idx; Type: INDEX; Schema: hsr; Owner: julius
--

CREATE UNIQUE INDEX achievements_completed_profile_achievement_idx ON hsr.achievements_completed USING btree (profile, achievement);


--
-- Name: achievements_favorited_profile_achievement_idx; Type: INDEX; Schema: hsr; Owner: julius
--

CREATE UNIQUE INDEX achievements_favorited_profile_achievement_idx ON hsr.achievements_favorited USING btree (profile, achievement);


--
-- Name: item_texts_lang_item_idx; Type: INDEX; Schema: hsr; Owner: julius
--

CREATE UNIQUE INDEX item_texts_lang_item_idx ON hsr.item_texts USING btree (lang, item);


--
-- Name: achievement_category_texts_lang_category_idx; Type: INDEX; Schema: nte; Owner: julius
--

CREATE UNIQUE INDEX achievement_category_texts_lang_category_idx ON nte.achievement_category_texts USING btree (lang, category);


--
-- Name: achievement_profiles_user_idx; Type: INDEX; Schema: nte; Owner: julius
--

CREATE INDEX achievement_profiles_user_idx ON nte.achievement_profiles USING btree (account);


--
-- Name: achievement_texts_lang_achievement_idx; Type: INDEX; Schema: nte; Owner: julius
--

CREATE UNIQUE INDEX achievement_texts_lang_achievement_idx ON nte.achievement_texts USING btree (lang, achievement);


--
-- Name: achievements_category_idx; Type: INDEX; Schema: nte; Owner: julius
--

CREATE INDEX achievements_category_idx ON nte.achievements USING btree (category);


--
-- Name: achievements_completed_profile_achievement_idx; Type: INDEX; Schema: nte; Owner: julius
--

CREATE UNIQUE INDEX achievements_completed_profile_achievement_idx ON nte.achievements_completed USING btree (profile, achievement);


--
-- Name: achievements_favorited_profile_achievement_idx; Type: INDEX; Schema: nte; Owner: julius
--

CREATE UNIQUE INDEX achievements_favorited_profile_achievement_idx ON nte.achievements_favorited USING btree (profile, achievement);


--
-- Name: item_texts_lang_item_idx; Type: INDEX; Schema: nte; Owner: julius
--

CREATE UNIQUE INDEX item_texts_lang_item_idx ON nte.item_texts USING btree (lang, item);


--
-- Name: achievement_category_texts_lang_category_idx; Type: INDEX; Schema: wuwa; Owner: julius
--

CREATE UNIQUE INDEX achievement_category_texts_lang_category_idx ON wuwa.achievement_category_texts USING btree (lang, category);


--
-- Name: achievement_profiles_user_idx; Type: INDEX; Schema: wuwa; Owner: julius
--

CREATE INDEX achievement_profiles_user_idx ON wuwa.achievement_profiles USING btree (account);


--
-- Name: achievement_texts_lang_achievement_idx; Type: INDEX; Schema: wuwa; Owner: julius
--

CREATE UNIQUE INDEX achievement_texts_lang_achievement_idx ON wuwa.achievement_texts USING btree (lang, achievement);


--
-- Name: achievements_category_idx; Type: INDEX; Schema: wuwa; Owner: julius
--

CREATE INDEX achievements_category_idx ON wuwa.achievements USING btree (category);


--
-- Name: achievements_completed_profile_achievement_idx; Type: INDEX; Schema: wuwa; Owner: julius
--

CREATE UNIQUE INDEX achievements_completed_profile_achievement_idx ON wuwa.achievements_completed USING btree (profile, achievement);


--
-- Name: achievements_favorited_profile_achievement_idx; Type: INDEX; Schema: wuwa; Owner: julius
--

CREATE UNIQUE INDEX achievements_favorited_profile_achievement_idx ON wuwa.achievements_favorited USING btree (profile, achievement);


--
-- Name: item_texts_lang_item_idx; Type: INDEX; Schema: wuwa; Owner: julius
--

CREATE UNIQUE INDEX item_texts_lang_item_idx ON wuwa.item_texts USING btree (lang, item);


--
-- Name: achievement_category_texts_lang_category_idx; Type: INDEX; Schema: zzz; Owner: julius
--

CREATE UNIQUE INDEX achievement_category_texts_lang_category_idx ON zzz.achievement_category_texts USING btree (lang, category);


--
-- Name: achievement_profiles_user_idx; Type: INDEX; Schema: zzz; Owner: julius
--

CREATE INDEX achievement_profiles_user_idx ON zzz.achievement_profiles USING btree (account);


--
-- Name: achievement_texts_lang_achievement_idx; Type: INDEX; Schema: zzz; Owner: julius
--

CREATE UNIQUE INDEX achievement_texts_lang_achievement_idx ON zzz.achievement_texts USING btree (lang, achievement);


--
-- Name: achievements_category_idx; Type: INDEX; Schema: zzz; Owner: julius
--

CREATE INDEX achievements_category_idx ON zzz.achievements USING btree (category);


--
-- Name: achievements_completed_profile_achievement_idx; Type: INDEX; Schema: zzz; Owner: julius
--

CREATE UNIQUE INDEX achievements_completed_profile_achievement_idx ON zzz.achievements_completed USING btree (profile, achievement);


--
-- Name: achievements_favorited_profile_achievement_idx; Type: INDEX; Schema: zzz; Owner: julius
--

CREATE UNIQUE INDEX achievements_favorited_profile_achievement_idx ON zzz.achievements_favorited USING btree (profile, achievement);


--
-- Name: item_texts_lang_item_idx; Type: INDEX; Schema: zzz; Owner: julius
--

CREATE UNIQUE INDEX item_texts_lang_item_idx ON zzz.item_texts USING btree (lang, item);


--
-- Name: achievement_category_texts achievement_category_texts_category_fkey; Type: FK CONSTRAINT; Schema: ake; Owner: julius
--

ALTER TABLE ONLY ake.achievement_category_texts
    ADD CONSTRAINT achievement_category_texts_category_fkey FOREIGN KEY (category) REFERENCES ake.achievement_categories(id);


--
-- Name: achievement_profiles achievement_profiles_account_fkey; Type: FK CONSTRAINT; Schema: ake; Owner: julius
--

ALTER TABLE ONLY ake.achievement_profiles
    ADD CONSTRAINT achievement_profiles_account_fkey FOREIGN KEY (account) REFERENCES auth.accounts(id);


--
-- Name: achievement_texts achievement_texts_achievement_fkey; Type: FK CONSTRAINT; Schema: ake; Owner: julius
--

ALTER TABLE ONLY ake.achievement_texts
    ADD CONSTRAINT achievement_texts_achievement_fkey FOREIGN KEY (achievement) REFERENCES ake.achievements(id);


--
-- Name: achievements achievements_category_fkey; Type: FK CONSTRAINT; Schema: ake; Owner: julius
--

ALTER TABLE ONLY ake.achievements
    ADD CONSTRAINT achievements_category_fkey FOREIGN KEY (category) REFERENCES ake.achievement_categories(id);


--
-- Name: achievements_completed achievements_completed_achievement_fkey; Type: FK CONSTRAINT; Schema: ake; Owner: julius
--

ALTER TABLE ONLY ake.achievements_completed
    ADD CONSTRAINT achievements_completed_achievement_fkey FOREIGN KEY (achievement) REFERENCES ake.achievements(id);


--
-- Name: achievements_completed achievements_completed_profile_fkey; Type: FK CONSTRAINT; Schema: ake; Owner: julius
--

ALTER TABLE ONLY ake.achievements_completed
    ADD CONSTRAINT achievements_completed_profile_fkey FOREIGN KEY (profile) REFERENCES ake.achievement_profiles(id);


--
-- Name: achievements_favorited achievements_favorited_achievement_fkey; Type: FK CONSTRAINT; Schema: ake; Owner: julius
--

ALTER TABLE ONLY ake.achievements_favorited
    ADD CONSTRAINT achievements_favorited_achievement_fkey FOREIGN KEY (achievement) REFERENCES ake.achievements(id);


--
-- Name: achievements_favorited achievements_favorited_profile_fkey; Type: FK CONSTRAINT; Schema: ake; Owner: julius
--

ALTER TABLE ONLY ake.achievements_favorited
    ADD CONSTRAINT achievements_favorited_profile_fkey FOREIGN KEY (profile) REFERENCES ake.achievement_profiles(id);


--
-- Name: banner_items banner_items_banner_fkey; Type: FK CONSTRAINT; Schema: ake; Owner: julius
--

ALTER TABLE ONLY ake.banner_items
    ADD CONSTRAINT banner_items_banner_fkey FOREIGN KEY (banner) REFERENCES ake.banners(id);


--
-- Name: banner_items banner_items_item_fkey; Type: FK CONSTRAINT; Schema: ake; Owner: julius
--

ALTER TABLE ONLY ake.banner_items
    ADD CONSTRAINT banner_items_item_fkey FOREIGN KEY (item) REFERENCES ake.items(id);


--
-- Name: banners banners_gacha_fkey; Type: FK CONSTRAINT; Schema: ake; Owner: julius
--

ALTER TABLE ONLY ake.banners
    ADD CONSTRAINT banners_gacha_fkey FOREIGN KEY (gacha) REFERENCES ake.gachas(id);


--
-- Name: item_texts item_texts_item_fkey; Type: FK CONSTRAINT; Schema: ake; Owner: julius
--

ALTER TABLE ONLY ake.item_texts
    ADD CONSTRAINT item_texts_item_fkey FOREIGN KEY (item) REFERENCES ake.items(id);


--
-- Name: pulls pulls_gacha_fkey; Type: FK CONSTRAINT; Schema: ake; Owner: julius
--

ALTER TABLE ONLY ake.pulls
    ADD CONSTRAINT pulls_gacha_fkey FOREIGN KEY (gacha) REFERENCES ake.gachas(id);


--
-- Name: pulls pulls_item_fkey; Type: FK CONSTRAINT; Schema: ake; Owner: julius
--

ALTER TABLE ONLY ake.pulls
    ADD CONSTRAINT pulls_item_fkey FOREIGN KEY (item) REFERENCES ake.items(id);


--
-- Name: admins admins_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: julius
--

ALTER TABLE ONLY auth.admins
    ADD CONSTRAINT admins_id_fkey FOREIGN KEY (id) REFERENCES auth.accounts(id);


--
-- Name: achievement_category_texts achievement_category_texts_category_fkey; Type: FK CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.achievement_category_texts
    ADD CONSTRAINT achievement_category_texts_category_fkey FOREIGN KEY (category) REFERENCES gi.achievement_categories(id);


--
-- Name: achievement_profiles achievement_profiles_account_fkey; Type: FK CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.achievement_profiles
    ADD CONSTRAINT achievement_profiles_account_fkey FOREIGN KEY (account) REFERENCES auth.accounts(id);


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
-- Name: achievements_completed achievements_completed_achievement_fkey; Type: FK CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.achievements_completed
    ADD CONSTRAINT achievements_completed_achievement_fkey FOREIGN KEY (achievement) REFERENCES gi.achievements(id);


--
-- Name: achievements_completed achievements_completed_profile_fkey; Type: FK CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.achievements_completed
    ADD CONSTRAINT achievements_completed_profile_fkey FOREIGN KEY (profile) REFERENCES gi.achievement_profiles(id);


--
-- Name: achievements_favorited achievements_favorited_achievement_fkey; Type: FK CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.achievements_favorited
    ADD CONSTRAINT achievements_favorited_achievement_fkey FOREIGN KEY (achievement) REFERENCES gi.achievements(id);


--
-- Name: achievements_favorited achievements_favorited_profile_fkey; Type: FK CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.achievements_favorited
    ADD CONSTRAINT achievements_favorited_profile_fkey FOREIGN KEY (profile) REFERENCES gi.achievement_profiles(id);


--
-- Name: banner_items banner_items_banner_fkey; Type: FK CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.banner_items
    ADD CONSTRAINT banner_items_banner_fkey FOREIGN KEY (banner) REFERENCES gi.banners(id);


--
-- Name: banner_items banner_items_item_fkey; Type: FK CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.banner_items
    ADD CONSTRAINT banner_items_item_fkey FOREIGN KEY (item) REFERENCES gi.items(id);


--
-- Name: banners banners_gacha_fkey; Type: FK CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.banners
    ADD CONSTRAINT banners_gacha_fkey FOREIGN KEY (gacha) REFERENCES gi.gachas(id);


--
-- Name: item_texts item_texts_item_fkey; Type: FK CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.item_texts
    ADD CONSTRAINT item_texts_item_fkey FOREIGN KEY (item) REFERENCES gi.items(id);


--
-- Name: pulls pulls_gacha_fkey; Type: FK CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.pulls
    ADD CONSTRAINT pulls_gacha_fkey FOREIGN KEY (gacha) REFERENCES gi.gachas(id);


--
-- Name: pulls pulls_item_fkey; Type: FK CONSTRAINT; Schema: gi; Owner: julius
--

ALTER TABLE ONLY gi.pulls
    ADD CONSTRAINT pulls_item_fkey FOREIGN KEY (item) REFERENCES gi.items(id);


--
-- Name: achievement_category_texts achievement_category_texts_category_fkey; Type: FK CONSTRAINT; Schema: hsr; Owner: julius
--

ALTER TABLE ONLY hsr.achievement_category_texts
    ADD CONSTRAINT achievement_category_texts_category_fkey FOREIGN KEY (category) REFERENCES hsr.achievement_categories(id);


--
-- Name: achievement_profiles achievement_profiles_account_fkey; Type: FK CONSTRAINT; Schema: hsr; Owner: julius
--

ALTER TABLE ONLY hsr.achievement_profiles
    ADD CONSTRAINT achievement_profiles_account_fkey FOREIGN KEY (account) REFERENCES auth.accounts(id);


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
-- Name: achievements_completed achievements_completed_achievement_fkey; Type: FK CONSTRAINT; Schema: hsr; Owner: julius
--

ALTER TABLE ONLY hsr.achievements_completed
    ADD CONSTRAINT achievements_completed_achievement_fkey FOREIGN KEY (achievement) REFERENCES hsr.achievements(id);


--
-- Name: achievements_completed achievements_completed_profile_fkey; Type: FK CONSTRAINT; Schema: hsr; Owner: julius
--

ALTER TABLE ONLY hsr.achievements_completed
    ADD CONSTRAINT achievements_completed_profile_fkey FOREIGN KEY (profile) REFERENCES hsr.achievement_profiles(id);


--
-- Name: achievements_favorited achievements_favorited_achievement_fkey; Type: FK CONSTRAINT; Schema: hsr; Owner: julius
--

ALTER TABLE ONLY hsr.achievements_favorited
    ADD CONSTRAINT achievements_favorited_achievement_fkey FOREIGN KEY (achievement) REFERENCES hsr.achievements(id);


--
-- Name: achievements_favorited achievements_favorited_profile_fkey; Type: FK CONSTRAINT; Schema: hsr; Owner: julius
--

ALTER TABLE ONLY hsr.achievements_favorited
    ADD CONSTRAINT achievements_favorited_profile_fkey FOREIGN KEY (profile) REFERENCES hsr.achievement_profiles(id);


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
-- Name: achievement_profiles achievement_profiles_account_fkey; Type: FK CONSTRAINT; Schema: nte; Owner: julius
--

ALTER TABLE ONLY nte.achievement_profiles
    ADD CONSTRAINT achievement_profiles_account_fkey FOREIGN KEY (account) REFERENCES auth.accounts(id);


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
-- Name: achievements_completed achievements_completed_achievement_fkey; Type: FK CONSTRAINT; Schema: nte; Owner: julius
--

ALTER TABLE ONLY nte.achievements_completed
    ADD CONSTRAINT achievements_completed_achievement_fkey FOREIGN KEY (achievement) REFERENCES nte.achievements(id);


--
-- Name: achievements_completed achievements_completed_profile_fkey; Type: FK CONSTRAINT; Schema: nte; Owner: julius
--

ALTER TABLE ONLY nte.achievements_completed
    ADD CONSTRAINT achievements_completed_profile_fkey FOREIGN KEY (profile) REFERENCES nte.achievement_profiles(id);


--
-- Name: achievements_favorited achievements_favorited_achievement_fkey; Type: FK CONSTRAINT; Schema: nte; Owner: julius
--

ALTER TABLE ONLY nte.achievements_favorited
    ADD CONSTRAINT achievements_favorited_achievement_fkey FOREIGN KEY (achievement) REFERENCES nte.achievements(id);


--
-- Name: achievements_favorited achievements_favorited_profile_fkey; Type: FK CONSTRAINT; Schema: nte; Owner: julius
--

ALTER TABLE ONLY nte.achievements_favorited
    ADD CONSTRAINT achievements_favorited_profile_fkey FOREIGN KEY (profile) REFERENCES nte.achievement_profiles(id);


--
-- Name: banner_items banner_items_banner_fkey; Type: FK CONSTRAINT; Schema: nte; Owner: julius
--

ALTER TABLE ONLY nte.banner_items
    ADD CONSTRAINT banner_items_banner_fkey FOREIGN KEY (banner) REFERENCES nte.banners(id);


--
-- Name: banner_items banner_items_item_fkey; Type: FK CONSTRAINT; Schema: nte; Owner: julius
--

ALTER TABLE ONLY nte.banner_items
    ADD CONSTRAINT banner_items_item_fkey FOREIGN KEY (item) REFERENCES nte.items(id);


--
-- Name: banners banners_gacha_fkey; Type: FK CONSTRAINT; Schema: nte; Owner: julius
--

ALTER TABLE ONLY nte.banners
    ADD CONSTRAINT banners_gacha_fkey FOREIGN KEY (gacha) REFERENCES nte.gachas(id);


--
-- Name: item_texts item_texts_item_fkey; Type: FK CONSTRAINT; Schema: nte; Owner: julius
--

ALTER TABLE ONLY nte.item_texts
    ADD CONSTRAINT item_texts_item_fkey FOREIGN KEY (item) REFERENCES nte.items(id);


--
-- Name: pulls pulls_gacha_fkey; Type: FK CONSTRAINT; Schema: nte; Owner: julius
--

ALTER TABLE ONLY nte.pulls
    ADD CONSTRAINT pulls_gacha_fkey FOREIGN KEY (gacha) REFERENCES nte.gachas(id);


--
-- Name: pulls pulls_item_fkey; Type: FK CONSTRAINT; Schema: nte; Owner: julius
--

ALTER TABLE ONLY nte.pulls
    ADD CONSTRAINT pulls_item_fkey FOREIGN KEY (item) REFERENCES nte.items(id);


--
-- Name: achievement_category_texts achievement_category_texts_category_fkey; Type: FK CONSTRAINT; Schema: wuwa; Owner: julius
--

ALTER TABLE ONLY wuwa.achievement_category_texts
    ADD CONSTRAINT achievement_category_texts_category_fkey FOREIGN KEY (category) REFERENCES wuwa.achievement_categories(id);


--
-- Name: achievement_profiles achievement_profiles_account_fkey; Type: FK CONSTRAINT; Schema: wuwa; Owner: julius
--

ALTER TABLE ONLY wuwa.achievement_profiles
    ADD CONSTRAINT achievement_profiles_account_fkey FOREIGN KEY (account) REFERENCES auth.accounts(id);


--
-- Name: achievement_texts achievement_texts_achievement_fkey; Type: FK CONSTRAINT; Schema: wuwa; Owner: julius
--

ALTER TABLE ONLY wuwa.achievement_texts
    ADD CONSTRAINT achievement_texts_achievement_fkey FOREIGN KEY (achievement) REFERENCES wuwa.achievements(id);


--
-- Name: achievements achievements_category_fkey; Type: FK CONSTRAINT; Schema: wuwa; Owner: julius
--

ALTER TABLE ONLY wuwa.achievements
    ADD CONSTRAINT achievements_category_fkey FOREIGN KEY (category) REFERENCES wuwa.achievement_categories(id);


--
-- Name: achievements_completed achievements_completed_achievement_fkey; Type: FK CONSTRAINT; Schema: wuwa; Owner: julius
--

ALTER TABLE ONLY wuwa.achievements_completed
    ADD CONSTRAINT achievements_completed_achievement_fkey FOREIGN KEY (achievement) REFERENCES wuwa.achievements(id);


--
-- Name: achievements_completed achievements_completed_profile_fkey; Type: FK CONSTRAINT; Schema: wuwa; Owner: julius
--

ALTER TABLE ONLY wuwa.achievements_completed
    ADD CONSTRAINT achievements_completed_profile_fkey FOREIGN KEY (profile) REFERENCES wuwa.achievement_profiles(id);


--
-- Name: achievements_favorited achievements_favorited_achievement_fkey; Type: FK CONSTRAINT; Schema: wuwa; Owner: julius
--

ALTER TABLE ONLY wuwa.achievements_favorited
    ADD CONSTRAINT achievements_favorited_achievement_fkey FOREIGN KEY (achievement) REFERENCES wuwa.achievements(id);


--
-- Name: achievements_favorited achievements_favorited_profile_fkey; Type: FK CONSTRAINT; Schema: wuwa; Owner: julius
--

ALTER TABLE ONLY wuwa.achievements_favorited
    ADD CONSTRAINT achievements_favorited_profile_fkey FOREIGN KEY (profile) REFERENCES wuwa.achievement_profiles(id);


--
-- Name: banner_items banner_items_banner_fkey; Type: FK CONSTRAINT; Schema: wuwa; Owner: julius
--

ALTER TABLE ONLY wuwa.banner_items
    ADD CONSTRAINT banner_items_banner_fkey FOREIGN KEY (banner) REFERENCES wuwa.banners(id);


--
-- Name: banner_items banner_items_item_fkey; Type: FK CONSTRAINT; Schema: wuwa; Owner: julius
--

ALTER TABLE ONLY wuwa.banner_items
    ADD CONSTRAINT banner_items_item_fkey FOREIGN KEY (item) REFERENCES wuwa.items(id);


--
-- Name: banners banners_gacha_fkey; Type: FK CONSTRAINT; Schema: wuwa; Owner: julius
--

ALTER TABLE ONLY wuwa.banners
    ADD CONSTRAINT banners_gacha_fkey FOREIGN KEY (gacha) REFERENCES wuwa.gachas(id);


--
-- Name: item_texts item_texts_item_fkey; Type: FK CONSTRAINT; Schema: wuwa; Owner: julius
--

ALTER TABLE ONLY wuwa.item_texts
    ADD CONSTRAINT item_texts_item_fkey FOREIGN KEY (item) REFERENCES wuwa.items(id);


--
-- Name: pulls pulls_gacha_fkey; Type: FK CONSTRAINT; Schema: wuwa; Owner: julius
--

ALTER TABLE ONLY wuwa.pulls
    ADD CONSTRAINT pulls_gacha_fkey FOREIGN KEY (gacha) REFERENCES wuwa.gachas(id);


--
-- Name: pulls pulls_item_fkey; Type: FK CONSTRAINT; Schema: wuwa; Owner: julius
--

ALTER TABLE ONLY wuwa.pulls
    ADD CONSTRAINT pulls_item_fkey FOREIGN KEY (item) REFERENCES wuwa.items(id);


--
-- Name: achievement_category_texts achievement_category_texts_category_fkey; Type: FK CONSTRAINT; Schema: zzz; Owner: julius
--

ALTER TABLE ONLY zzz.achievement_category_texts
    ADD CONSTRAINT achievement_category_texts_category_fkey FOREIGN KEY (category) REFERENCES zzz.achievement_categories(id);


--
-- Name: achievement_profiles achievement_profiles_account_fkey; Type: FK CONSTRAINT; Schema: zzz; Owner: julius
--

ALTER TABLE ONLY zzz.achievement_profiles
    ADD CONSTRAINT achievement_profiles_account_fkey FOREIGN KEY (account) REFERENCES auth.accounts(id);


--
-- Name: achievement_texts achievement_texts_achievement_fkey; Type: FK CONSTRAINT; Schema: zzz; Owner: julius
--

ALTER TABLE ONLY zzz.achievement_texts
    ADD CONSTRAINT achievement_texts_achievement_fkey FOREIGN KEY (achievement) REFERENCES zzz.achievements(id);


--
-- Name: achievements achievements_category_fkey; Type: FK CONSTRAINT; Schema: zzz; Owner: julius
--

ALTER TABLE ONLY zzz.achievements
    ADD CONSTRAINT achievements_category_fkey FOREIGN KEY (category) REFERENCES zzz.achievement_categories(id);


--
-- Name: achievements_completed achievements_completed_achievement_fkey; Type: FK CONSTRAINT; Schema: zzz; Owner: julius
--

ALTER TABLE ONLY zzz.achievements_completed
    ADD CONSTRAINT achievements_completed_achievement_fkey FOREIGN KEY (achievement) REFERENCES zzz.achievements(id);


--
-- Name: achievements_completed achievements_completed_profile_fkey; Type: FK CONSTRAINT; Schema: zzz; Owner: julius
--

ALTER TABLE ONLY zzz.achievements_completed
    ADD CONSTRAINT achievements_completed_profile_fkey FOREIGN KEY (profile) REFERENCES zzz.achievement_profiles(id);


--
-- Name: achievements_favorited achievements_favorited_achievement_fkey; Type: FK CONSTRAINT; Schema: zzz; Owner: julius
--

ALTER TABLE ONLY zzz.achievements_favorited
    ADD CONSTRAINT achievements_favorited_achievement_fkey FOREIGN KEY (achievement) REFERENCES zzz.achievements(id);


--
-- Name: achievements_favorited achievements_favorited_profile_fkey; Type: FK CONSTRAINT; Schema: zzz; Owner: julius
--

ALTER TABLE ONLY zzz.achievements_favorited
    ADD CONSTRAINT achievements_favorited_profile_fkey FOREIGN KEY (profile) REFERENCES zzz.achievement_profiles(id);


--
-- Name: banner_items banner_items_banner_fkey; Type: FK CONSTRAINT; Schema: zzz; Owner: julius
--

ALTER TABLE ONLY zzz.banner_items
    ADD CONSTRAINT banner_items_banner_fkey FOREIGN KEY (banner) REFERENCES zzz.banners(id);


--
-- Name: banner_items banner_items_item_fkey; Type: FK CONSTRAINT; Schema: zzz; Owner: julius
--

ALTER TABLE ONLY zzz.banner_items
    ADD CONSTRAINT banner_items_item_fkey FOREIGN KEY (item) REFERENCES zzz.items(id);


--
-- Name: banners banners_gacha_fkey; Type: FK CONSTRAINT; Schema: zzz; Owner: julius
--

ALTER TABLE ONLY zzz.banners
    ADD CONSTRAINT banners_gacha_fkey FOREIGN KEY (gacha) REFERENCES zzz.gachas(id);


--
-- Name: item_texts item_texts_item_fkey; Type: FK CONSTRAINT; Schema: zzz; Owner: julius
--

ALTER TABLE ONLY zzz.item_texts
    ADD CONSTRAINT item_texts_item_fkey FOREIGN KEY (item) REFERENCES zzz.items(id);


--
-- Name: pulls pulls_gacha_fkey; Type: FK CONSTRAINT; Schema: zzz; Owner: julius
--

ALTER TABLE ONLY zzz.pulls
    ADD CONSTRAINT pulls_gacha_fkey FOREIGN KEY (gacha) REFERENCES zzz.gachas(id);


--
-- Name: pulls pulls_item_fkey; Type: FK CONSTRAINT; Schema: zzz; Owner: julius
--

ALTER TABLE ONLY zzz.pulls
    ADD CONSTRAINT pulls_item_fkey FOREIGN KEY (item) REFERENCES zzz.items(id);


--
-- PostgreSQL database dump complete
--

\unrestrict BlEvkGJKMoUinyyRToazj3RMF3x0RXmzhHrgqrbBcMM9VQiAjnuygI2JY1oEofh

