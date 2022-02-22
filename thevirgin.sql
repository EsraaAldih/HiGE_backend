--
-- PostgreSQL database dump
--

-- Dumped from database version 10.19 (Ubuntu 10.19-1.pgdg18.04+1)
-- Dumped by pg_dump version 10.19 (Ubuntu 10.19-1.pgdg18.04+1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO djangos;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO djangos;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO djangos;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO djangos;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: api_comment; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.api_comment (
    id integer NOT NULL,
    content text NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    owner_id integer NOT NULL,
    post_id integer NOT NULL
);


ALTER TABLE public.api_comment OWNER TO djangos;

--
-- Name: api_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.api_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_comment_id_seq OWNER TO djangos;

--
-- Name: api_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.api_comment_id_seq OWNED BY public.api_comment.id;


--
-- Name: api_post; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.api_post (
    id integer NOT NULL,
    text text NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    owner_id integer NOT NULL
);


ALTER TABLE public.api_post OWNER TO djangos;

--
-- Name: api_post_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.api_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_post_id_seq OWNER TO djangos;

--
-- Name: api_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.api_post_id_seq OWNED BY public.api_post.id;


--
-- Name: api_reportcomment; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.api_reportcomment (
    id integer NOT NULL,
    content text NOT NULL,
    comment_id integer NOT NULL,
    owner_id integer NOT NULL
);


ALTER TABLE public.api_reportcomment OWNER TO djangos;

--
-- Name: api_reportcomment_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.api_reportcomment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_reportcomment_id_seq OWNER TO djangos;

--
-- Name: api_reportcomment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.api_reportcomment_id_seq OWNED BY public.api_reportcomment.id;


--
-- Name: api_reportpost; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.api_reportpost (
    id integer NOT NULL,
    text text NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    owner_id integer NOT NULL,
    post_id integer NOT NULL
);


ALTER TABLE public.api_reportpost OWNER TO djangos;

--
-- Name: api_reportpost_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.api_reportpost_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_reportpost_id_seq OWNER TO djangos;

--
-- Name: api_reportpost_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.api_reportpost_id_seq OWNED BY public.api_reportpost.id;


--
-- Name: api_trainee; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.api_trainee (
    id integer NOT NULL,
    age integer NOT NULL,
    "currentWeight" character varying(5),
    height character varying(5) NOT NULL,
    "medicalHistory" boolean NOT NULL,
    status character varying(20),
    trainee_id integer,
    "trainerID_id" integer,
    "workoutPlan_id" integer,
    "yogaPlan_id" integer
);


ALTER TABLE public.api_trainee OWNER TO djangos;

--
-- Name: api_trainee_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.api_trainee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_trainee_id_seq OWNER TO djangos;

--
-- Name: api_trainee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.api_trainee_id_seq OWNED BY public.api_trainee.id;


--
-- Name: api_trainer; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.api_trainer (
    id integer NOT NULL,
    gender character varying(6) NOT NULL,
    "phoneNumber" character varying(11) NOT NULL,
    image character varying(100) NOT NULL,
    trainer_id integer,
    age integer NOT NULL,
    address text NOT NULL
);


ALTER TABLE public.api_trainer OWNER TO djangos;

--
-- Name: api_trainer_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.api_trainer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_trainer_id_seq OWNER TO djangos;

--
-- Name: api_trainer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.api_trainer_id_seq OWNED BY public.api_trainer.id;


--
-- Name: api_weighttracker; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.api_weighttracker (
    id integer NOT NULL,
    "currentWeight" character varying(5),
    "traineeID_id" integer
);


ALTER TABLE public.api_weighttracker OWNER TO djangos;

--
-- Name: api_weighttracker_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.api_weighttracker_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_weighttracker_id_seq OWNER TO djangos;

--
-- Name: api_weighttracker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.api_weighttracker_id_seq OWNED BY public.api_weighttracker.id;


--
-- Name: api_workoutexcercise; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.api_workoutexcercise (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    duration integer,
    description character varying(650) NOT NULL,
    gif character varying(100) NOT NULL
);


ALTER TABLE public.api_workoutexcercise OWNER TO djangos;

--
-- Name: api_workoutexcercise_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.api_workoutexcercise_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_workoutexcercise_id_seq OWNER TO djangos;

--
-- Name: api_workoutexcercise_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.api_workoutexcercise_id_seq OWNED BY public.api_workoutexcercise.id;


--
-- Name: api_workoutplan; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.api_workoutplan (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    image character varying(100) NOT NULL,
    status boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    owner_id integer NOT NULL,
    description character varying(70)
);


ALTER TABLE public.api_workoutplan OWNER TO djangos;

--
-- Name: api_workoutplan_exercise; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.api_workoutplan_exercise (
    id integer NOT NULL,
    workoutplan_id integer NOT NULL,
    workoutexcercise_id integer NOT NULL
);


ALTER TABLE public.api_workoutplan_exercise OWNER TO djangos;

--
-- Name: api_workoutplan_exercises_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.api_workoutplan_exercises_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_workoutplan_exercises_id_seq OWNER TO djangos;

--
-- Name: api_workoutplan_exercises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.api_workoutplan_exercises_id_seq OWNED BY public.api_workoutplan_exercise.id;


--
-- Name: api_workoutplan_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.api_workoutplan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_workoutplan_id_seq OWNER TO djangos;

--
-- Name: api_workoutplan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.api_workoutplan_id_seq OWNED BY public.api_workoutplan.id;


--
-- Name: api_yogaexercise; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.api_yogaexercise (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    details text NOT NULL,
    duration integer NOT NULL,
    image character varying(100) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.api_yogaexercise OWNER TO djangos;

--
-- Name: api_yogaexercise_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.api_yogaexercise_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_yogaexercise_id_seq OWNER TO djangos;

--
-- Name: api_yogaexercise_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.api_yogaexercise_id_seq OWNED BY public.api_yogaexercise.id;


--
-- Name: api_yogaplan; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.api_yogaplan (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(70),
    image character varying(100) NOT NULL,
    status boolean NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    owner_id integer NOT NULL
);


ALTER TABLE public.api_yogaplan OWNER TO djangos;

--
-- Name: api_yogaplan_exercises; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.api_yogaplan_exercises (
    id integer NOT NULL,
    yogaplan_id integer NOT NULL,
    yogaexercise_id integer NOT NULL
);


ALTER TABLE public.api_yogaplan_exercises OWNER TO djangos;

--
-- Name: api_yogaplan_exercises_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.api_yogaplan_exercises_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_yogaplan_exercises_id_seq OWNER TO djangos;

--
-- Name: api_yogaplan_exercises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.api_yogaplan_exercises_id_seq OWNED BY public.api_yogaplan_exercises.id;


--
-- Name: api_yogaplan_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.api_yogaplan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_yogaplan_id_seq OWNER TO djangos;

--
-- Name: api_yogaplan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.api_yogaplan_id_seq OWNED BY public.api_yogaplan.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO djangos;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO djangos;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO djangos;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO djangos;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO djangos;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO djangos;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO djangos;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO djangos;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO djangos;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO djangos;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO djangos;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO djangos;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO djangos;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO djangos;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO djangos;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO djangos;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.socialaccount_socialaccount (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO djangos;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialaccount_id_seq OWNER TO djangos;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


ALTER TABLE public.socialaccount_socialapp OWNER TO djangos;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_id_seq OWNER TO djangos;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.socialaccount_socialapp_sites (
    id integer NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialapp_sites OWNER TO djangos;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.socialaccount_socialapp_sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_sites_id_seq OWNER TO djangos;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNED BY public.socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO djangos;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialtoken_id_seq OWNER TO djangos;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;


--
-- Name: users_newuser; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.users_newuser (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    email character varying(254) NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    start_date timestamp with time zone NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.users_newuser OWNER TO djangos;

--
-- Name: users_newuser_groups; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.users_newuser_groups (
    id integer NOT NULL,
    newuser_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_newuser_groups OWNER TO djangos;

--
-- Name: users_newuser_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.users_newuser_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_newuser_groups_id_seq OWNER TO djangos;

--
-- Name: users_newuser_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.users_newuser_groups_id_seq OWNED BY public.users_newuser_groups.id;


--
-- Name: users_newuser_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.users_newuser_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_newuser_id_seq OWNER TO djangos;

--
-- Name: users_newuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.users_newuser_id_seq OWNED BY public.users_newuser.id;


--
-- Name: users_newuser_user_permissions; Type: TABLE; Schema: public; Owner: djangos
--

CREATE TABLE public.users_newuser_user_permissions (
    id integer NOT NULL,
    newuser_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_newuser_user_permissions OWNER TO djangos;

--
-- Name: users_newuser_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: djangos
--

CREATE SEQUENCE public.users_newuser_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_newuser_user_permissions_id_seq OWNER TO djangos;

--
-- Name: users_newuser_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangos
--

ALTER SEQUENCE public.users_newuser_user_permissions_id_seq OWNED BY public.users_newuser_user_permissions.id;


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: api_comment id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_comment ALTER COLUMN id SET DEFAULT nextval('public.api_comment_id_seq'::regclass);


--
-- Name: api_post id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_post ALTER COLUMN id SET DEFAULT nextval('public.api_post_id_seq'::regclass);


--
-- Name: api_reportcomment id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_reportcomment ALTER COLUMN id SET DEFAULT nextval('public.api_reportcomment_id_seq'::regclass);


--
-- Name: api_reportpost id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_reportpost ALTER COLUMN id SET DEFAULT nextval('public.api_reportpost_id_seq'::regclass);


--
-- Name: api_trainee id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_trainee ALTER COLUMN id SET DEFAULT nextval('public.api_trainee_id_seq'::regclass);


--
-- Name: api_trainer id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_trainer ALTER COLUMN id SET DEFAULT nextval('public.api_trainer_id_seq'::regclass);


--
-- Name: api_weighttracker id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_weighttracker ALTER COLUMN id SET DEFAULT nextval('public.api_weighttracker_id_seq'::regclass);


--
-- Name: api_workoutexcercise id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_workoutexcercise ALTER COLUMN id SET DEFAULT nextval('public.api_workoutexcercise_id_seq'::regclass);


--
-- Name: api_workoutplan id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_workoutplan ALTER COLUMN id SET DEFAULT nextval('public.api_workoutplan_id_seq'::regclass);


--
-- Name: api_workoutplan_exercise id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_workoutplan_exercise ALTER COLUMN id SET DEFAULT nextval('public.api_workoutplan_exercises_id_seq'::regclass);


--
-- Name: api_yogaexercise id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_yogaexercise ALTER COLUMN id SET DEFAULT nextval('public.api_yogaexercise_id_seq'::regclass);


--
-- Name: api_yogaplan id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_yogaplan ALTER COLUMN id SET DEFAULT nextval('public.api_yogaplan_id_seq'::regclass);


--
-- Name: api_yogaplan_exercises id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_yogaplan_exercises ALTER COLUMN id SET DEFAULT nextval('public.api_yogaplan_exercises_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: socialaccount_socialaccount id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: socialaccount_socialapp id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);


--
-- Name: socialaccount_socialapp_sites id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: socialaccount_socialtoken id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);


--
-- Name: users_newuser id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.users_newuser ALTER COLUMN id SET DEFAULT nextval('public.users_newuser_id_seq'::regclass);


--
-- Name: users_newuser_groups id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.users_newuser_groups ALTER COLUMN id SET DEFAULT nextval('public.users_newuser_groups_id_seq'::regclass);


--
-- Name: users_newuser_user_permissions id; Type: DEFAULT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.users_newuser_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_newuser_user_permissions_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
1	lol@w.com	f	t	2
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: api_comment; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.api_comment (id, content, "createdAt", "updatedAt", owner_id, post_id) FROM stdin;
\.


--
-- Data for Name: api_post; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.api_post (id, text, "createdAt", "updatedAt", owner_id) FROM stdin;
\.


--
-- Data for Name: api_reportcomment; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.api_reportcomment (id, content, comment_id, owner_id) FROM stdin;
\.


--
-- Data for Name: api_reportpost; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.api_reportpost (id, text, "createdAt", "updatedAt", owner_id, post_id) FROM stdin;
\.


--
-- Data for Name: api_trainee; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.api_trainee (id, age, "currentWeight", height, "medicalHistory", status, trainee_id, "trainerID_id", "workoutPlan_id", "yogaPlan_id") FROM stdin;
\.


--
-- Data for Name: api_trainer; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.api_trainer (id, gender, "phoneNumber", image, trainer_id, age, address) FROM stdin;
1	Female	01123455502	profile/happybaby.gif	2	16	elzaher
\.


--
-- Data for Name: api_weighttracker; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.api_weighttracker (id, "currentWeight", "traineeID_id") FROM stdin;
\.


--
-- Data for Name: api_workoutexcercise; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.api_workoutexcercise (id, name, duration, description, gif) FROM stdin;
2	Standing Bicycle Crunch	30	Stand with feet shoulder-width apart, hands behind your head, elbows out. Lift your right knee and twist to meet it with your left elbow. Now do the opposite — touching your right elbow to your raised knee on the left. As you twist your upper body, crunch the abs	exercises/standing.gif
4	Side Plank Front Kick	30	Start in a side plank position, with your bottom knee bent and on the mat and with your top leg extended. Lift your top leg at hip height and kick it slowly to the front, without moving your upper body. Bring your leg back and repeat.	exercises/sideplank.gif
3	Plank	30	Plant hands directly under shoulders (slightly wider than shoulder width) . Ground toes into the floor and squeeze gluts to stabilize your body. Your legs should be working, too — be careful not to lock or hyper extend your knees. Neutralize your neck and spine by looking at a spot on the floor about a foot beyond your hands. Your head should be in line with your back.	exercises/plank.gif
5	Bicycle Crunch	30	Lie down on your back. Plant your feet on the floor, hip-width apart. Bend your knees and place your arms across your chest. Contract your abs and inhale. Exhale and lift your upper body, keeping your head and neck relaxed. Inhale and return to the starting position.	exercises/bicycle-crunches-exercise-illustration.gif
6	Vertical Leg Crunch	30	Grab a mat or choose a comfortable surface to lie on.  Lie on your back and get into a comfortable position.  Keep your legs together and raise them vertically in the air.  Place your hands behind your head. Contract your abs and lift your shoulder blades off the floor.	exercises/vertical.gif
7	Single Leg V-Up	30	Lie on your back with your arms extended overhead. Engage your abs to crunch up. Lift your leg upright at the same time, with your lower back on the ground. Touch your hands to the shin of the lifted leg. Keep your body tight and do not drop freely when lowering back down.	exercises/singleleg.gif
8	Mountain Climber	30	Check your form—your hands should be about shoulder-width apart, back flat, abs engaged, and head in alignment. Pull your right knee into your chest as far as you can. Switch legs, pulling one knee out and bringing the other knee in. Keep your hips down and run your knees in and out as far and as fast as you can. Alternate inhaling and exhaling with each leg change.	exercises/mountain.gif
9	Abdominal Crunch	30	Lie face up to the floor with knees bent. With hands behind ears, raise your body off the floor. Hold for 1 second and slowly return to starting position. Repeat	exercises/abdominal.gif
10	V-Sit	30	Hold a dumbbell in each hand, sit on the mat and raise your legs to a 45-degree angle. Squeeze the biceps, lift the dumbbells and curl. Rotate your palms to the front, push the dumbbells up and fully extend your arms. Lower your arms back to the starting position and repeat until the set is complete.	exercises/vsit2.gif
11	Plank With Leg Lift	30	Start in plank position with hands shoulder-width apart. Your shoulders, hips, and ankles should be in a line. Keep abs engaged and raise right leg off the floor until it’s at about hip height. Keep right foot flexed. Pause and feel the burn. Then lower your right leg back to the floor. Repeat with your left leg.	exercises/plankleglift.gif
1	Jumping Jack	30	Stand upright with your legs together, arms at your sides. Bend your knees slightly, and jump into the air. As you jump, spread your legs to be about shoulder-width apart. Stretch your arms out and over your head. Jump back to starting position. Repeat.	exercises/jumpingg.gif
12	Clam-shell	30	Lie on one side, with legs stacked and knees bent at a 45 degree angle. Keeping your feet touching. raise your upper knee as high as you can without shifting your hips or pelvis.	exercises/clamshell-left.gif
13	Reclined Bound Angle Pose	30	Sit on the floor, bend your legs and pull your knees toward your body. Let your thighs fall open , press the soles of your feet together and carefully pull your heels toward your pelvis.	exercises/reclinedBound.jpg
14	Surrender	30	Keeping your whole upper body upright and strong, proceed to bend in the knees, placing your left knee on the floor. As soon as your first knee finds placement on the floor, follow with the second knee.	exercises/surrender.gif
15	Squat Kickback	30	Begin this move by standing tall, chest high, core engaged, with your added weight on your shoulders. Place your feet just at hip width, with your toes forward.  Proceed to bend in your knees, pushing your rear end out behind you. Focus on keeping your knees behind your toes. Keep the weight in your heels. Once you reach your lowest point, immediately start to push back upward. Only now, you will lift one knee up with you as you reach a standing position.	exercises/squat.gif
16	Step Up	30	Perform step-ups by standing in front of an elevated, knee-height surface like a poly metric box or bench. Place your right foot on top of the elevated surface and push through your right leg to lift your body up onto it.	exercises/stepup.gif
17	Side To Side Squats	30	Start with your feet slightly wider than hip-width apart. Keep your chest up, engage your abdominals, and shift your weight onto your heels as you push your hips back into a sitting position. Lower your hips until your thighs are parallel or almost parallel to the floor. You should feel the squat in your thighs and gluts. Pause with your knees over, but not beyond, your toes. Exhale and push back up to the starting position.	exercises/sideToSideSquats.gif
18	Boxer Squat Punch	30	Start in boxer stance, hands near your nose. Your back heel should be slightly lifted off the ground. Have your fists closed with fingertips facing your chin. Keep your hips in place as you punch your left hand straight out. As you punch, twist the knuckles of your hand so that when your arm is extended, your fingertips face the ground. Be sure to keep your right hand in a fist, tucked and at the ready. Return your left hand to the starting position	exercises/boxerSquat.gif
19	Jump Squat	30	Stand with feet shoulder width and knees slightly bent. Bend your knees and descend to a full squat position. Engage through the quads, glutes, and hamstrings and propel the body up and off the floor, extending through the legs. With the legs fully extended, the feet will be a few inches (or more) off the floor.	exercises/jumpSquat.gif
20	Plie Squat Scoop Up	30	Stand up your feet two to three feet apart and turn your toes out. Bring your hands to your hips. And as you sit back bend your knees and lower into a squat position push	exercises/PileSquat.gif
21	Lunge Punch	30	Stand straight with your feet hip-width apart and hold a dumbbell in each hand. Position the dumbbells at shoulder height with your palms facing each other. Take a step back with your left leg, flex your knees and push your left arm out in a punching motion. Stand back up, switch legs and repeat. Keep alternating legs until the set is complete.	exercises/lungePunch.gif
22	Lunge Kicks	30	Start with your feet together, step back with your right leg, and lunge. As you come up kick your right leg up. Return to the starting position and repeat with the left leg. Keep alternating legs until set is complete. Proper Form And Breathing Pattern.	exercises/lungeKicks.gif
23	Flutter Kick	30	Lie on your back on a gym mat with your legs extended and your arms alongside your hips, palms down. Lift your Legs 4 to 6 inches off the floor. Press your low back into the mat. Keep your Legs  straits as you rhythmically raise one leg higher, then switch. Move in a flutting, up and down motion.  Repeat	exercises/Flutter_Kick.gif
24	Calf Raises	60	Stand with your feet hip-width apart and the toes pointing forward. Raise your heels and squeeze the calves. Lower the heels back to the floor and repeat.	exercises/Calf_raises.gif
25	Lateral Leg Swings	30	Swing your leg across your body from left to right. Switch legs and swing from right to left.	exercises/Lateral_leg_swings.gif
26	Forward Leg Swings	30	Stand up straight and hold onto a wall. Swing one leg forward and backward in a single smooth movement. Switch legs and repeat.	exercises/Forward_leg_swings.gif
27	Back Leg Lifts	30	Start on all fours with the hands under the shoulders and the knees under the hips. Extend one leg behind you. Lift the leg to hip level and then slowly lower it back down. Repeat with the opposite leg until the set is complete.	exercises/Back_Leg_Lifts.gif
28	Fire Hydrant	30	Get down on your hands and knees, with your wrists under your shoulders and your knees hip-width apart. Keeping the knee bent, raise one leg up and out to the side, until it’s level with your hip. Return to the starting position, repeat, and then switch legs.	exercises/Fire_Hydrant.gif
29	Front And Back Lunges	30	Stand with your feet hip-width apart, take a step forward and then slowly bend both knees until your back knee is just above the floor. Stand back up, take a step back with the same leg, and bend both knees until your back knee is just above the floor. Repeat this back and forth movement for the entire duration of the set, and then switch legs.	exercises/Front_And_Back_Lunges.gif
30	Kick Crunch	30	Stand tall with your feet shoulder-width apart. Lift your left leg as high as you can, and touch your left foot with your right hand. Return to the initial position and repeat on the opposite side. Continue alternating sides, in a fast-paced move, until the set is complete.	exercises/kick_crunch.gif
31	Knee to elbow kickback	30	Start in a low plank position, bring your right knee close to your right elbow and crunch. Extend your right leg behind you and kick back. Repeat for 30 seconds and then switch sides.	exercises/Knee_to_elbow_kickback.gif
32	Lunge back kick	60	Stand with your feet hip-width apart, take a step to the front with your right leg and lunge. As you come back up, kick your right leg back and squeeze the glutes. Switch legs and repeat.	exercises/Lunge_back_kick.gif
33	Double Leg Stretch	30	Lie on the mat with your legs bent, feet off the floor, and grab both knees. Lift the shoulders off the floor, extend your arms toward the ears and simultaneously extend both legs to a 45-degree angle off the floor. Then bend the knees and hug the chins toward your chest. Extend your arms and legs and repeat until the set is complete.	exercises/Double_Leg_Stretch_.gif
34	Hamstring Stretch	30	Lie on your back and lift your left leg. Gently pull your thigh toward your chest until you feel a stretch in your hamstrings. Hold the stretch and then repeat with the right leg.	exercises/Hamstring_Stretch.gif
35	Arm swings	60	Stand up straight with your feet shoulder-width apart. Cross your arms at the front and then quickly bring them back as far as you can.	exercises/Arm_swings.gif
36	Arm circles	30	Stand straight with your feet shoulder-width apart. Raise and extend your arms to the sides without bending the elbows. Slowly rotate your arms forward, making small circles for 30 seconds, and then switch, rotating backward.	exercises/Arm_circles_.gif
37	Big arm circles	30	Stand with your feet shoulder width apart and rotate your arms forward, making big circles. Repeat for 30 seconds and then rotate backwards.	exercises/Big_arm_circles.gif
38	Dumbbell shoulder press	60	Lift your torso and position the dumbbells at your shoulders with your palms facing forward and your elbows under your wrists. Push the dumbbells up and fully extend your arms. Lower the dumbbells back down to your shoulders and repeat the movement for 60 seconds.	exercises/Dumbbell_shoulder_press_.gif
39	Cross chest curl	30	Roll your shoulders back, squeeze the left biceps, and bring the dumbbell across your body and toward your right shoulder. Repeat for 30 seconds and then switch sides.	exercises/Cross_chest_curl_.gif
40	Dumbbell front raise	45	Stand with your palms facing down and lift one dumbbell until your arm is slightly above parallel to the floor. Pause and then slowly lower the arm back to the starting position. Repeat with the opposite arm and keep alternating sides for 45 seconds.	exercises/Dumbbell_front_raise.gif
41	Dumbbell lateral raise	45	Stand straight with your palms facing down, lift the dumbbells and raise your arms out to the sides. Once your elbows are at shoulder height, pause, and then slowly lower the arms back to the initial position. Repeat.	exercises/Dumbbell_lateral_raise.gif
42	Bicep curls	60	Stand straight with your feet shoulder-width apart and hands by your sides. Squeeze the biceps and lift the dumbbells. Keep the elbows close to your body and the upper arms stationary, only the forearms should move. Once the dumbbells are at shoulder level, slowly lower the arms to the starting position and repeat.	exercises/Bicep_curls_.gif
43	Concentration curl	30	Sit on a bench holding a dumbbell in your left hand, and rest your elbow on the inside of your left thigh. Squeeze the left biceps and bring the dumbbell toward your chest. Lower the left arm to the starting position, repeat for 30 seconds, and then switch arms.	exercises/Concentration_curl.gif
44	Tricep dips	60	Place your hands behind you onto a chair, so that your fingers face forward. Extend your legs and start bending your elbows. Lower your body until your arms are at a 90-degree angle. Lift your body back and repeat.	exercises/Tricep_dips.gif
45	Push ups	45	Get down into a push-up position, start bending your elbows, and lower your chest until it’s just above the floor.	exercises/Push_ups.gif
46	Inchworm	30	Start standing with your feet together. Forward fold with straight legs, and place your hands on the floor. Walk your hands out until you are in a plank position with shoulders over your wrists. Bend your elbows and bring your chin and chest to the floor. Your elbows should form a 45-degree angle with your shoulder joints. Press back up to your plank. Walk your hands back in toward your feet, keeping your legs as straight as possible. Roll back up to a standing position, with control.	exercises/inchworm.gif
47	Rope Climb Crunches	30	Sit down on the floor with your knees slightly bent and lean your torso back. Extend your right arm toward the ceiling and bring your left knee up. Switch sides, moving your arms as if you were climbing a rope, and repeat. Keep alternating sides until the set is complete	exercises/ropeClimb.gif
48	Single Leg Stretch	30	Lie on the floor with both legs extended and arms along the sides with your palms facing down. Pull your abs in, lift both shoulders off the floor and simultaneously bend your right knee. Pull the knee in toward your chest and hold your right ankle with your right hand and your right knee with your left hand. Slowly switch leg and hand positions and keep your extended leg raised a few inches off the floor with the toes pointed. Keep switching leg positions until the set is complete.	exercises/singleLegStretch.gif
49	Squat Thrust	30	Stand straight with your feet shoulder-width apart. Squat and place your hands in front of your feet. Jump back and get into a push-up position. Jump again, bringing the legs toward your palms, and stand up. Repeat until the set is complete.	exercises/squatThrust.gif
50	Run In Place	30	Stand straight with your feet shoulder-width apart and face forward, opening up your chest. Start pulling your knees up, and slowly land on the balls of your feet. Repeat until the set is complete.	exercises/runInPlace.gif
51	180 Jump Squat	30	Stand with your feet a little wider than shoulder-width apart, your toes pointing slightly outward, and sit back. Push through the heels to jump up, spinning to the left 180 degrees. Land on your toes with your knees slightly bent and squat. Quickly jump up, spinning to the right, and go back into the squat position. Repeat until the set is complete.	exercises/jumpSquat180.gif
52	High Knees	30	Stand straight with your feet shoulder-width apart. Face forward and open your chest. Bring your knees up to waist level and then slowly land on the balls of your feet. Repeat until the set is complete.	exercises/highKnees.gif
\.


--
-- Data for Name: api_workoutplan; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.api_workoutplan (id, name, image, status, created_at, updated_at, owner_id, description) FROM stdin;
8	LEG workout Intermediate	images/bradley-dunn-ACbu5AY5Tvk-unsplash_gMwpsCR.jpg	t	2022-02-15 02:24:26.67858+02	2022-02-15 03:12:41.182081+02	1	\N
10	ARM workout Begineer	images/pexels-marta-wave-6454196.jpg	t	2022-02-15 03:24:00.541586+02	2022-02-15 03:24:00.541605+02	1	\N
12	ARM workout Advanced	images/geert-pieters-3RnkZpDqsEI-unsplash.jpg	t	2022-02-15 03:27:34.800801+02	2022-02-15 03:27:34.800818+02	1	\N
13	BUTT workout Begineer	images/luke-aguaita-Nm5yy2sbgB8-unsplash.jpg	t	2022-02-15 03:37:09.013264+02	2022-02-15 03:37:09.013284+02	1	\N
14	BUTT workout Intermediate	images/sergio-pedemonte-pE5oWO__uDI-unsplash.jpg	t	2022-02-15 03:40:33.178049+02	2022-02-15 03:40:33.178073+02	1	\N
9	LEG workout Advanced	images/sergio-pedemonte-7Li2duPduew-unsplash.jpg	t	2022-02-15 03:22:04.857684+02	2022-02-15 03:44:23.502594+02	1	\N
16	ABS workout Begineer	images/pexels-marcus-aurelius-6787216.jpg	t	2022-02-15 03:46:49.861259+02	2022-02-15 03:46:49.861277+02	1	\N
18	ABS workout Advanced	images/istockphoto-930884708-1024x1024.jpg	t	2022-02-15 03:48:43.438128+02	2022-02-15 03:52:26.545633+02	1	\N
19	Weight Loss	images/tyler-nix-Y1drF0Y3Oe0-unsplash.jpg	t	2022-02-15 03:58:26.562223+02	2022-02-15 03:59:49.510904+02	1	\N
7	LEG workout Begineer	images/pexels-monstera-6311667_gtoOHKb_GXKiOj3.jpg	t	2022-02-15 02:23:25.492899+02	2022-02-17 18:06:58.556615+02	1	\N
11	ARM workout Intermediate	images/pexels-klaus-nielsen-6303478_q7mL0T7_xcvCBKR.jpg	t	2022-02-15 03:26:08.867354+02	2022-02-17 18:38:53.547159+02	1	\N
17	ABS workout Intermediate	images/pexels-photo-6019876_DYwGtNV.jpeg	t	2022-02-15 03:48:01.791951+02	2022-02-17 18:41:36.52904+02	1	\N
15	BUTT workout Advanced	images/butt-advanced.jpg	t	2022-02-15 03:43:22.742537+02	2022-02-18 00:26:18.130055+02	1	\N
\.


--
-- Data for Name: api_workoutplan_exercise; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.api_workoutplan_exercise (id, workoutplan_id, workoutexcercise_id) FROM stdin;
37	8	32
38	8	33
39	8	34
40	8	8
41	8	46
42	8	31
49	9	33
50	9	8
51	9	23
52	9	24
53	9	27
54	9	29
55	10	35
56	10	36
57	10	37
58	10	38
59	10	39
65	12	35
66	12	37
67	12	43
68	12	44
69	12	45
70	13	12
71	13	15
72	13	17
73	13	18
74	13	20
75	14	15
76	14	49
77	14	52
78	14	21
79	14	22
80	15	41
81	15	14
82	15	15
83	15	17
84	15	18
85	15	19
86	15	20
87	15	21
88	15	31
89	16	1
90	16	2
91	16	3
92	16	5
93	16	6
94	16	7
101	18	1
102	18	4
103	18	5
104	18	11
105	18	12
106	19	1
107	19	3
108	19	7
109	19	44
110	19	47
111	19	16
112	19	49
113	19	50
114	19	19
115	19	51
116	19	52
117	19	46
118	7	23
119	7	24
120	7	25
121	7	26
122	7	27
123	7	28
124	7	29
125	11	38
126	11	39
127	11	40
128	11	41
129	11	42
130	17	3
131	17	4
132	17	7
133	17	8
134	17	9
135	17	10
\.


--
-- Data for Name: api_yogaexercise; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.api_yogaexercise (id, name, details, duration, image, "createdAt", "updatedAt") FROM stdin;
1	Child’s Pose	1-Get on all fours on your mat.\r\n2-Spread your knees wide and position your big toes so that they’re touching.\r\n3-Let your stomach fall between your thighs and allow your forehead to drop toward the floor.\r\n4-Extend your arms in front of your body with your palms on the floor.\r\nBreathe deeply in and out here.	30	yogaexercises/childpose.gif	2022-02-14 09:35:46.032286+02	2022-02-14 10:01:04.519057+02
2	Happy Baby	Lie on your back on your mat.\r\nBend your knees and bring them to your stomach, gripping the outsides of your feet. Flex your heels and ankles.\r\nBreathe here, focusing on keeping your ankles directly above your knees while pushing against your hands with your feet.	30	yogaexercises/happybaby.gif	2022-02-14 09:37:08.39822+02	2022-02-14 10:01:24.828149+02
3	Cat-Cow	Get on all fours on your mat with yours hands under yours shoulders and knees under your hips.\r\nEngage your abs, exhale, and push your spine up toward the ceiling.\r\nAllow your head to fall toward your chest. Hold here for 10 seconds.\r\nInhale and let your spine fall back down, allowing your stomach to fall toward the ground while your head comes up and back. Hold here for 10 seconds	30	yogaexercises/catcow.gif	2022-02-14 09:38:09.10926+02	2022-02-14 10:01:44.951684+02
4	Cobra	Lie on your mat on your stomach with your legs shoulder-width apart and the tops of your feet on the mat.\r\nPlace your hands underneath your shoulders with your elbows tucked into your body.\r\nInhale and begin to straighten your arms, pushing through the tops of your feet.\r\nLift your chest off the floor and push your shoulders back.\r\nStop straightening your arms as soon as your pelvis loses contact with the ground — breathe in and out here for up to 30 seconds.	30	yogaexercises/copra.gif	2022-02-14 09:38:55.508471+02	2022-02-14 10:03:11.007308+02
6	Downward Dog	Get on all fours on your mat with your hands underneath your shoulders and your knees underneath your hips. Inhale.\r\nExhale and lift your knees away from the floor, pushing your heels down toward the floor. Lift your tailbone toward the ceiling. Do not lock your knees.\r\nDraw your shoulder blades toward your tailbone and keep your head between your arms.\r\nStay here, working on getting your feet in contact with the ground	30	yogaexercises/drowningdog.gif	2022-02-14 09:41:10.919127+02	2022-02-14 10:03:53.052571+02
5	Chair	Stand with your feet together and inhale, extending your arms directly overhead.\r\nExhale, begin to sit back into your hips, and bend your knees. Stop when your thighs are parallel to the ground.\r\nRoll your shoulders down and back and press your tailbone toward the ground. Breathe here.	30	yogaexercises/chair.gif	2022-02-14 09:39:40.556803+02	2022-02-14 10:03:35.694718+02
7	Warrior I	Stand with your feet together and arms at your side.\r\nStep with your left foot into a lunge, keeping your right leg straight and turning your right foot at a 45-degree angle.\r\nExtend your arms above your head.\r\nSqueeze your shoulder blades together and down, and lift your head to look up at your fingertips.	30	yogaexercises/warriorI.gif	2022-02-14 09:41:53.687348+02	2022-02-14 10:04:06.342662+02
8	Bridge	Lie on your back with your knees bent and feet flat on the ground.\r\nPlace your arms at your sides with your palms on the ground.\r\nInhale. Exhale and push up through your feet, pushing your hips up toward the s	30	yogaexercises/bridge.gif	2022-02-14 09:42:45.241647+02	2022-02-14 10:04:28.196501+02
10	Bow	Lay on your stomach with your arms extended by your sides and your palms up.\r\nBend your knees and reach back, grabbing hold of your ankles with your hands.\r\nKeep your knees in line with your hips.\r\nAs you inhale, lift your heels away from your butt while you lift your thighs off the ground.\r\nPress your shoulder blades back and look forward.	30	yogaexercises/bow.gif	2022-02-14 09:44:16.073113+02	2022-02-14 10:04:49.01747+02
11	Boat	Sit on your butt with your legs extended in front of you.\r\nLean back slightly with your hands on the ground supporting you.\r\nInhale and bring your knees toward your chest, stopping when your thighs are at a 45-degree angle to the ground.\r\nExtend your legs if possible — otherwise, keep them here.\r\nBring your arms out in front of you so they’re parallel to the floor. Hold he	30	yogaexercises/boat.gif	2022-02-14 09:45:13.033703+02	2022-02-14 10:05:09.367873+02
12	King Pigeon	Assume Pigeon Pose with your left knee bent in front of you and your right leg extended behind you.\r\nBend your right knee and bring your foot up toward your back.\r\nArch your back and drop your head down.\r\nReach your hands over your head and grab hold of your foot with both hands	30	yogaexercises/king.gif	2022-02-14 09:46:53.701198+02	2022-02-14 10:05:34.105349+02
14	Lord of the Dance	Stand with your feet together and arms down at your sides.\r\nBend your left knee, bringing your foot to your butt.\r\nGrab the outside of your foot with your left hand, pushing your tailbone down and your pelvis up toward your belly button.\r\nAllow your knee to extend slightly as it moves up toward the ceiling.\r\nExtend your right arm in front of you parallel to the floor.	30	yogaexercises/lordofdance.gif	2022-02-14 09:48:38.743906+02	2022-02-14 10:06:08.676306+02
13	Dove	Kneel on the floor with your arms down at your sides.\r\nWith your fingers facing forward, lean back onto your hands with your arms straight.\r\nLower down onto your forearms.\r\nBegin to push your thighs up and out, arching your back, dropping your head, and moving your hands as close to your feet as possible.	30	yogaexercises/dove.gif	2022-02-14 09:47:40.135277+02	2022-02-14 10:05:52.580804+02
15	Firefly	Squat down and lean your torso forward between your legs.\r\nPlace your hands on the floor inside your legs.\r\nBring your upper arms as close to your upper thigh as possible.\r\nBegin to lift yourself off the floor and push your weight into your hands.\r\nShift your center of gravity back, allowing your legs to straighten in front of you	30	yogaexercises/firefly.gif	2022-02-14 09:49:58.115856+02	2022-02-14 10:06:44.770708+02
16	Extended Side Angle Pose	Turn your right foot out so your toes are pointing to the short edge of the mat and turn your left toes in, about 45 degrees. You are looking for stability through both legs. \r\nAs you exhale, bend your right knee, thigh parallel to the floor, knee above the ankle \r\nTake a deep inhale and firm your lower abdomen in and up. \r\nAs you exhale, extend your body over the right leg, and bring your right arm down, either with your elbow on your right thigh or place your hand on the floor to the inside or the outside of the right foot – whatever feels right for your body.	30	yogaexercises/sideAngleLeft.gif	2022-02-14 09:53:51.351028+02	2022-02-14 10:07:06.271523+02
17	Extended Triangle Pose	From Tadasana (Mountain Pose), step or lightly jump your feet 3 to 4 feet apart. Raise your arms parallel to the floor and reach them actively to the sides, shoulder blades wide, palms down.\r\nTurn your left foot in slightly and your right foot out to 90 degrees. Align your right heel with your left heel. Firm your thighs and rotate your right thigh outward, so the center of your right kneecap is in line with the center of the right ankle.	30	yogaexercises/extendttraingle.gif	2022-02-14 10:12:53.799+02	2022-02-14 10:12:53.799027+02
9	Garland	Squat down with your feet as close together as you can get them, toes pointed out.\r\nLet your torso fall between your thighs, pressing your elbows against your knees.\r\nKeep your tailbone pressed toward the ground and your chest up, using the resistance of your knees to help you.	30	yogaexercises/graland.gif	2022-02-14 09:43:32.435727+02	2022-02-14 10:15:49.569582+02
\.


--
-- Data for Name: api_yogaplan; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.api_yogaplan (id, name, description, image, status, "createdAt", owner_id) FROM stdin;
2	Core Yoga	Focuses on different Twist moves to release stress	media/coreyoga_hKPTLOL.jpeg	t	2022-02-15 13:30:11.984686+02	1
3	Dynamic Yoga	Gives you inner energy	media/dynamicyoga_Oh7CNWB.jpeg	t	2022-02-15 13:33:56.764685+02	1
4	Twist Stretch Yoga	Helps you to extend all body parts	media/twiststretch_NL1gcor.jpeg	t	2022-02-15 13:52:43.157175+02	1
6	Heartbeat Yoga	Focuses on yoga postures	media/heartbeat_axSzzlk.jpeg	t	2022-02-15 13:59:31.532806+02	1
7	Be Continued Yoga	Maintain poses for an extended amount of time and improve your balance	media/becontinued_dw1Elx1.jpeg	t	2022-02-15 14:02:32.842712+02	1
8	Back Care Yoga	A routine to help relieve your back tightness	media/backyoga_k30Zw0l.jpeg	t	2022-02-15 14:09:30.664158+02	1
9	Yoga Balance	Calms your mind and makes you feel the peace	media/yogabalance_MAA14MX.jpeg	t	2022-02-15 14:12:40.288486+02	1
11	Yogi Angel Yoga	Light exercises to recharge your energy and spirit for new day	media/yogiangel.jpeg	t	2022-02-15 14:49:53.875608+02	1
12	Power Yoga	Strengthen and relax your body	media/poweryoga.jpeg	t	2022-02-15 14:54:50.50512+02	1
13	Just Be Yoga	Light exercises to active your body and decrease fatigue	media/justbeyoga.jpeg	t	2022-02-15 14:58:16.214262+02	1
15	Go To Flow Yoga	Breath And Relax	media/gotoflowyoga.jpeg	t	2022-02-15 15:09:50.922754+02	1
10	Yummy Yoga	Stretch your entire body with different angles and poses	media/yumyyoga_FkjPK14.jpg	t	2022-02-15 14:15:09.207329+02	1
1	Beginner Yoga	Yoga For Beginners with easy follow poses	media/beginner_lmmbaHo.jpg	t	2022-02-15 13:26:17.622635+02	1
5	White Heat Yoga	Focuses on Flexibility and Strength of muscles	media/whiteheat_u4Ja19p.jpg	t	2022-02-15 13:56:39.726471+02	1
14	Laughing Frog Yoga	Relaxing your body , make it breath	media/laughingg_DQKlyY2.jpeg	t	2022-02-15 15:02:12.783121+02	1
\.


--
-- Data for Name: api_yogaplan_exercises; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.api_yogaplan_exercises (id, yogaplan_id, yogaexercise_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	7
7	2	6
8	2	7
9	2	8
10	2	10
11	2	11
12	2	12
13	2	14
14	3	1
15	3	4
16	3	6
17	3	7
18	3	8
19	3	9
20	3	10
21	3	11
22	3	13
23	3	15
24	4	3
25	4	4
26	4	5
27	4	7
28	4	10
29	4	12
30	4	13
31	4	16
32	4	17
33	5	1
34	5	3
35	5	6
36	5	7
37	5	8
38	5	9
39	5	12
40	5	14
41	6	1
42	6	2
43	6	3
44	6	5
45	6	6
46	6	9
47	6	12
48	6	15
49	7	1
50	7	3
51	7	6
52	7	7
53	7	9
54	7	10
55	7	11
56	7	12
57	7	14
58	7	15
59	7	16
60	7	17
61	8	1
62	8	3
63	8	4
64	8	6
65	8	8
66	8	10
67	8	13
68	8	14
69	8	16
70	8	17
71	9	2
72	9	5
73	9	7
74	9	9
75	9	11
76	9	12
77	9	13
78	9	14
79	9	15
80	10	1
81	10	3
82	10	4
83	10	6
85	10	10
86	10	13
87	10	14
88	10	16
89	10	17
90	10	2
91	10	11
92	10	12
93	10	7
94	11	1
95	11	2
96	11	3
97	11	4
98	11	5
99	11	7
100	11	8
101	11	9
102	11	14
103	12	4
104	12	7
105	12	8
106	12	9
107	12	10
108	12	12
109	12	13
110	12	14
111	12	15
112	13	1
113	13	2
114	13	3
115	13	4
116	13	5
117	13	7
118	13	8
119	13	9
120	14	1
121	14	2
122	14	3
123	14	4
124	14	5
125	14	8
126	14	9
127	14	11
128	14	12
129	15	1
130	15	2
131	15	3
132	15	4
133	15	7
134	15	11
135	15	12
136	15	14
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add site	6	add_site
22	Can change site	6	change_site
23	Can delete site	6	delete_site
24	Can view site	6	view_site
25	Can add email address	7	add_emailaddress
26	Can change email address	7	change_emailaddress
27	Can delete email address	7	delete_emailaddress
28	Can view email address	7	view_emailaddress
29	Can add email confirmation	8	add_emailconfirmation
30	Can change email confirmation	8	change_emailconfirmation
31	Can delete email confirmation	8	delete_emailconfirmation
32	Can view email confirmation	8	view_emailconfirmation
33	Can add social account	9	add_socialaccount
34	Can change social account	9	change_socialaccount
35	Can delete social account	9	delete_socialaccount
36	Can view social account	9	view_socialaccount
37	Can add social application	10	add_socialapp
38	Can change social application	10	change_socialapp
39	Can delete social application	10	delete_socialapp
40	Can view social application	10	view_socialapp
41	Can add social application token	11	add_socialtoken
42	Can change social application token	11	change_socialtoken
43	Can delete social application token	11	delete_socialtoken
44	Can view social application token	11	view_socialtoken
45	Can add Token	12	add_token
46	Can change Token	12	change_token
47	Can delete Token	12	delete_token
48	Can view Token	12	view_token
49	Can add token	13	add_tokenproxy
50	Can change token	13	change_tokenproxy
51	Can delete token	13	delete_tokenproxy
52	Can view token	13	view_tokenproxy
53	Can add new user	14	add_newuser
54	Can change new user	14	change_newuser
55	Can delete new user	14	delete_newuser
56	Can view new user	14	view_newuser
57	Can add comment	15	add_comment
58	Can change comment	15	change_comment
59	Can delete comment	15	delete_comment
60	Can view comment	15	view_comment
61	Can add post	16	add_post
62	Can change post	16	change_post
63	Can delete post	16	delete_post
64	Can view post	16	view_post
65	Can add trainer	17	add_trainer
66	Can change trainer	17	change_trainer
67	Can delete trainer	17	delete_trainer
68	Can view trainer	17	view_trainer
69	Can add workout excercise	18	add_workoutexcercise
70	Can change workout excercise	18	change_workoutexcercise
71	Can delete workout excercise	18	delete_workoutexcercise
72	Can view workout excercise	18	view_workoutexcercise
73	Can add yoga exercise	19	add_yogaexercise
74	Can change yoga exercise	19	change_yogaexercise
75	Can delete yoga exercise	19	delete_yogaexercise
76	Can view yoga exercise	19	view_yogaexercise
77	Can add yoga plan	20	add_yogaplan
78	Can change yoga plan	20	change_yogaplan
79	Can delete yoga plan	20	delete_yogaplan
80	Can view yoga plan	20	view_yogaplan
81	Can add workout plan	21	add_workoutplan
82	Can change workout plan	21	change_workoutplan
83	Can delete workout plan	21	delete_workoutplan
84	Can view workout plan	21	view_workoutplan
85	Can add trainee	22	add_trainee
86	Can change trainee	22	change_trainee
87	Can delete trainee	22	delete_trainee
88	Can view trainee	22	view_trainee
89	Can add report post	23	add_reportpost
90	Can change report post	23	change_reportpost
91	Can delete report post	23	delete_reportpost
92	Can view report post	23	view_reportpost
93	Can add report comment	24	add_reportcomment
94	Can change report comment	24	change_reportcomment
95	Can delete report comment	24	delete_reportcomment
96	Can view report comment	24	view_reportcomment
97	Can add weight tracker	25	add_weighttracker
98	Can change weight tracker	25	change_weighttracker
99	Can delete weight tracker	25	delete_weighttracker
100	Can view weight tracker	25	view_weighttracker
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
32e558ce136110a7b6e4f4abf385d7b1c5b5959d	2022-02-20 01:18:39.476393+02	2
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	sites	site
7	account	emailaddress
8	account	emailconfirmation
9	socialaccount	socialaccount
10	socialaccount	socialapp
11	socialaccount	socialtoken
12	authtoken	token
13	authtoken	tokenproxy
14	users	newuser
15	api	comment
16	api	post
17	api	trainer
18	api	workoutexcercise
19	api	yogaexercise
20	api	yogaplan
21	api	workoutplan
22	api	trainee
23	api	reportpost
24	api	reportcomment
25	api	weighttracker
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-02-20 01:14:22.765918+02
2	contenttypes	0002_remove_content_type_name	2022-02-20 01:14:22.838686+02
3	auth	0001_initial	2022-02-20 01:14:23.040419+02
4	auth	0002_alter_permission_name_max_length	2022-02-20 01:14:23.309983+02
5	auth	0003_alter_user_email_max_length	2022-02-20 01:14:23.326196+02
6	auth	0004_alter_user_username_opts	2022-02-20 01:14:23.340359+02
7	auth	0005_alter_user_last_login_null	2022-02-20 01:14:23.361078+02
8	auth	0006_require_contenttypes_0002	2022-02-20 01:14:23.36678+02
9	auth	0007_alter_validators_add_error_messages	2022-02-20 01:14:23.395856+02
10	auth	0008_alter_user_username_max_length	2022-02-20 01:14:23.416444+02
11	auth	0009_alter_user_last_name_max_length	2022-02-20 01:14:23.427647+02
12	auth	0010_alter_group_name_max_length	2022-02-20 01:14:23.439736+02
13	auth	0011_update_proxy_permissions	2022-02-20 01:14:23.463448+02
14	auth	0012_alter_user_first_name_max_length	2022-02-20 01:14:23.483282+02
15	users	0001_initial	2022-02-20 01:14:23.728118+02
16	account	0001_initial	2022-02-20 01:14:24.232473+02
17	account	0002_email_max_length	2022-02-20 01:14:24.449137+02
18	admin	0001_initial	2022-02-20 01:14:24.549293+02
19	admin	0002_logentry_remove_auto_add	2022-02-20 01:14:24.650384+02
20	admin	0003_logentry_add_action_flag_choices	2022-02-20 01:14:24.664599+02
21	api	0001_initial	2022-02-20 01:14:25.781109+02
22	api	0002_auto_20220218_1024	2022-02-20 01:14:26.955769+02
23	api	0003_auto_20220218_1032	2022-02-20 01:14:27.0476+02
24	api	0004_auto_20220218_1040	2022-02-20 01:14:27.098477+02
25	api	0005_workoutplan_description	2022-02-20 01:14:27.123973+02
26	api	0006_auto_20220218_1046	2022-02-20 01:14:27.164017+02
27	api	0007_auto_20220218_1100	2022-02-20 01:14:27.223111+02
28	api	0008_auto_20220218_1200	2022-02-20 01:14:27.2935+02
29	api	0009_auto_20220218_1201	2022-02-20 01:14:27.325951+02
30	api	0010_auto_20220218_1255	2022-02-20 01:14:27.358244+02
31	api	0011_auto_20220218_1258	2022-02-20 01:14:27.391403+02
32	api	0012_remove_trainee_initialweight	2022-02-20 01:14:27.430085+02
33	api	0013_weighttracker	2022-02-20 01:14:27.497217+02
34	authtoken	0001_initial	2022-02-20 01:14:27.655402+02
35	authtoken	0002_auto_20160226_1747	2022-02-20 01:14:27.785603+02
36	authtoken	0003_tokenproxy	2022-02-20 01:14:27.796539+02
37	sessions	0001_initial	2022-02-20 01:14:27.877881+02
38	sites	0001_initial	2022-02-20 01:14:28.002595+02
39	sites	0002_alter_domain_unique	2022-02-20 01:14:28.093427+02
40	socialaccount	0001_initial	2022-02-20 01:14:28.496472+02
41	socialaccount	0002_token_max_lengths	2022-02-20 01:14:28.908978+02
42	socialaccount	0003_extra_data_default_dict	2022-02-20 01:14:28.934405+02
43	users	0002_auto_20220218_1201	2022-02-20 01:14:28.954037+02
44	api	0014_auto_20220219_2341	2022-02-20 01:41:52.804005+02
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
utpzoj83h17ezqdydsnbmc7r8bxlerre	.eJxljMsKwjAURP8l6xJMmkfj0r3fEG4e10ZjAm3jRvx3WymCuBqYc2aeBLyvrSz2EaeEKQYb75AyOZaWc_elbY4TORJOOmKhLeOnsCn8dw78LZYNhCuUS6W-lmVKjm4K3elMzzXEfNrdn4MR5nFda6MZj4qpNeTAtFKojeeSQ98jAofBo0HeIxNOMaOFP0jU3gQQ0vEoyOsNRfNIuA:1nLYzv:dKFyVTZYyB1pw-FIZUAhUoxiRVv9C_nZxO1OKN0St6I	2022-03-06 01:18:39.73524+02
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
\.


--
-- Data for Name: users_newuser; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.users_newuser (id, password, last_login, is_superuser, email, username, first_name, last_name, start_date, "createdAt", "updatedAt", is_staff, is_active) FROM stdin;
1	pbkdf2_sha256$216000$YtJ86sAwKRAv$/bOkvNLKmwIjFUQPTBBfrbmeFjbEmM5lj4ap9f6kCig=	\N	t	a@a.com	admin			2022-02-20 01:16:42.387126+02	2022-02-20 01:16:42.52166+02	2022-02-20 01:16:42.521673+02	t	t
2	pbkdf2_sha256$216000$CDbEW2w820sk$PDDQYvB17X3YNgyfPQCg4Ry2LLd/SP1+m8FuLn8fkKk=	2022-02-20 01:18:39.663253+02	f	lol@w.com	israa			2022-02-20 01:18:39.187529+02	2022-02-20 01:18:39.326027+02	2022-02-20 01:18:39.360702+02	t	t
\.


--
-- Data for Name: users_newuser_groups; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.users_newuser_groups (id, newuser_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_newuser_user_permissions; Type: TABLE DATA; Schema: public; Owner: djangos
--

COPY public.users_newuser_user_permissions (id, newuser_id, permission_id) FROM stdin;
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, true);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: api_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.api_comment_id_seq', 1, false);


--
-- Name: api_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.api_post_id_seq', 1, false);


--
-- Name: api_reportcomment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.api_reportcomment_id_seq', 1, false);


--
-- Name: api_reportpost_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.api_reportpost_id_seq', 1, false);


--
-- Name: api_trainee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.api_trainee_id_seq', 1, false);


--
-- Name: api_trainer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.api_trainer_id_seq', 1, true);


--
-- Name: api_weighttracker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.api_weighttracker_id_seq', 1, false);


--
-- Name: api_workoutexcercise_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.api_workoutexcercise_id_seq', 52, true);


--
-- Name: api_workoutplan_exercises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.api_workoutplan_exercises_id_seq', 1, false);


--
-- Name: api_workoutplan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.api_workoutplan_id_seq', 19, true);


--
-- Name: api_yogaexercise_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.api_yogaexercise_id_seq', 17, true);


--
-- Name: api_yogaplan_exercises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.api_yogaplan_exercises_id_seq', 136, true);


--
-- Name: api_yogaplan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.api_yogaplan_id_seq', 15, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 100, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 25, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 44, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 1, false);


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 1, false);


--
-- Name: users_newuser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.users_newuser_groups_id_seq', 1, false);


--
-- Name: users_newuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.users_newuser_id_seq', 2, true);


--
-- Name: users_newuser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangos
--

SELECT pg_catalog.setval('public.users_newuser_user_permissions_id_seq', 1, false);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: api_comment api_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_comment
    ADD CONSTRAINT api_comment_pkey PRIMARY KEY (id);


--
-- Name: api_post api_post_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_post
    ADD CONSTRAINT api_post_pkey PRIMARY KEY (id);


--
-- Name: api_reportcomment api_reportcomment_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_reportcomment
    ADD CONSTRAINT api_reportcomment_pkey PRIMARY KEY (id);


--
-- Name: api_reportpost api_reportpost_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_reportpost
    ADD CONSTRAINT api_reportpost_pkey PRIMARY KEY (id);


--
-- Name: api_trainee api_trainee_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_trainee
    ADD CONSTRAINT api_trainee_pkey PRIMARY KEY (id);


--
-- Name: api_trainee api_trainee_trainee_id_key; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_trainee
    ADD CONSTRAINT api_trainee_trainee_id_key UNIQUE (trainee_id);


--
-- Name: api_trainer api_trainer_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_trainer
    ADD CONSTRAINT api_trainer_pkey PRIMARY KEY (id);


--
-- Name: api_trainer api_trainer_trainer_id_key; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_trainer
    ADD CONSTRAINT api_trainer_trainer_id_key UNIQUE (trainer_id);


--
-- Name: api_weighttracker api_weighttracker_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_weighttracker
    ADD CONSTRAINT api_weighttracker_pkey PRIMARY KEY (id);


--
-- Name: api_workoutexcercise api_workoutexcercise_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_workoutexcercise
    ADD CONSTRAINT api_workoutexcercise_pkey PRIMARY KEY (id);


--
-- Name: api_workoutplan_exercise api_workoutplan_exercise_workoutplan_id_yogaexerc_09e8f624_uniq; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_workoutplan_exercise
    ADD CONSTRAINT api_workoutplan_exercise_workoutplan_id_yogaexerc_09e8f624_uniq UNIQUE (workoutplan_id, workoutexcercise_id);


--
-- Name: api_workoutplan_exercise api_workoutplan_exercises_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_workoutplan_exercise
    ADD CONSTRAINT api_workoutplan_exercises_pkey PRIMARY KEY (id);


--
-- Name: api_workoutplan api_workoutplan_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_workoutplan
    ADD CONSTRAINT api_workoutplan_pkey PRIMARY KEY (id);


--
-- Name: api_yogaexercise api_yogaexercise_name_key; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_yogaexercise
    ADD CONSTRAINT api_yogaexercise_name_key UNIQUE (name);


--
-- Name: api_yogaexercise api_yogaexercise_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_yogaexercise
    ADD CONSTRAINT api_yogaexercise_pkey PRIMARY KEY (id);


--
-- Name: api_yogaplan_exercises api_yogaplan_exercises_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_yogaplan_exercises
    ADD CONSTRAINT api_yogaplan_exercises_pkey PRIMARY KEY (id);


--
-- Name: api_yogaplan_exercises api_yogaplan_exercises_yogaplan_id_yogaexercise_a71c345c_uniq; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_yogaplan_exercises
    ADD CONSTRAINT api_yogaplan_exercises_yogaplan_id_yogaexercise_a71c345c_uniq UNIQUE (yogaplan_id, yogaexercise_id);


--
-- Name: api_yogaplan api_yogaplan_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_yogaplan
    ADD CONSTRAINT api_yogaplan_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_provider_uid_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialapp socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: users_newuser users_newuser_email_key; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.users_newuser
    ADD CONSTRAINT users_newuser_email_key UNIQUE (email);


--
-- Name: users_newuser_groups users_newuser_groups_newuser_id_group_id_df6b4b64_uniq; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.users_newuser_groups
    ADD CONSTRAINT users_newuser_groups_newuser_id_group_id_df6b4b64_uniq UNIQUE (newuser_id, group_id);


--
-- Name: users_newuser_groups users_newuser_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.users_newuser_groups
    ADD CONSTRAINT users_newuser_groups_pkey PRIMARY KEY (id);


--
-- Name: users_newuser users_newuser_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.users_newuser
    ADD CONSTRAINT users_newuser_pkey PRIMARY KEY (id);


--
-- Name: users_newuser_user_permissions users_newuser_user_permi_newuser_id_permission_id_5e320e13_uniq; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.users_newuser_user_permissions
    ADD CONSTRAINT users_newuser_user_permi_newuser_id_permission_id_5e320e13_uniq UNIQUE (newuser_id, permission_id);


--
-- Name: users_newuser_user_permissions users_newuser_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.users_newuser_user_permissions
    ADD CONSTRAINT users_newuser_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_newuser users_newuser_username_key; Type: CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.users_newuser
    ADD CONSTRAINT users_newuser_username_key UNIQUE (username);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: api_comment_owner_id_2ff90561; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX api_comment_owner_id_2ff90561 ON public.api_comment USING btree (owner_id);


--
-- Name: api_comment_post_id_251fc0c3; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX api_comment_post_id_251fc0c3 ON public.api_comment USING btree (post_id);


--
-- Name: api_post_owner_id_6f27474b; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX api_post_owner_id_6f27474b ON public.api_post USING btree (owner_id);


--
-- Name: api_reportcomment_comment_id_08462b15; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX api_reportcomment_comment_id_08462b15 ON public.api_reportcomment USING btree (comment_id);


--
-- Name: api_reportcomment_owner_id_96a54b36; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX api_reportcomment_owner_id_96a54b36 ON public.api_reportcomment USING btree (owner_id);


--
-- Name: api_reportpost_owner_id_491bb966; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX api_reportpost_owner_id_491bb966 ON public.api_reportpost USING btree (owner_id);


--
-- Name: api_reportpost_post_id_312a90fc; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX api_reportpost_post_id_312a90fc ON public.api_reportpost USING btree (post_id);


--
-- Name: api_trainee_trainerID_id_bfa02a5d; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX "api_trainee_trainerID_id_bfa02a5d" ON public.api_trainee USING btree ("trainerID_id");


--
-- Name: api_trainee_workoutPlan_id_5050c77c; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX "api_trainee_workoutPlan_id_5050c77c" ON public.api_trainee USING btree ("workoutPlan_id");


--
-- Name: api_trainee_yogaPlan_id_0290311e; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX "api_trainee_yogaPlan_id_0290311e" ON public.api_trainee USING btree ("yogaPlan_id");


--
-- Name: api_weighttracker_traineeID_id_d2a6bdc1; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX "api_weighttracker_traineeID_id_d2a6bdc1" ON public.api_weighttracker USING btree ("traineeID_id");


--
-- Name: api_workoutplan_exercises_workoutplan_id_c7482e82; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX api_workoutplan_exercises_workoutplan_id_c7482e82 ON public.api_workoutplan_exercise USING btree (workoutplan_id);


--
-- Name: api_workoutplan_exercises_yogaexercise_id_d0acd22e; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX api_workoutplan_exercises_yogaexercise_id_d0acd22e ON public.api_workoutplan_exercise USING btree (workoutexcercise_id);


--
-- Name: api_workoutplan_owner_id_d229fc87; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX api_workoutplan_owner_id_d229fc87 ON public.api_workoutplan USING btree (owner_id);


--
-- Name: api_yogaexercise_name_3adbabf4_like; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX api_yogaexercise_name_3adbabf4_like ON public.api_yogaexercise USING btree (name varchar_pattern_ops);


--
-- Name: api_yogaplan_exercises_yogaexercise_id_ec633ca8; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX api_yogaplan_exercises_yogaexercise_id_ec633ca8 ON public.api_yogaplan_exercises USING btree (yogaexercise_id);


--
-- Name: api_yogaplan_exercises_yogaplan_id_358172fa; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX api_yogaplan_exercises_yogaplan_id_358172fa ON public.api_yogaplan_exercises USING btree (yogaplan_id);


--
-- Name: api_yogaplan_owner_id_1d3e2521; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX api_yogaplan_owner_id_1d3e2521 ON public.api_yogaplan USING btree (owner_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: socialaccount_socialaccount_user_id_8146e70c; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_site_id_2579dee5; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX socialaccount_socialapp_sites_site_id_2579dee5 ON public.socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id_97fb6e7d; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX socialaccount_socialapp_sites_socialapp_id_97fb6e7d ON public.socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_account_id_951f210e; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_app_id_636a42d7; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);


--
-- Name: users_newuser_email_0b37614b_like; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX users_newuser_email_0b37614b_like ON public.users_newuser USING btree (email varchar_pattern_ops);


--
-- Name: users_newuser_groups_group_id_525a4e68; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX users_newuser_groups_group_id_525a4e68 ON public.users_newuser_groups USING btree (group_id);


--
-- Name: users_newuser_groups_newuser_id_7f6f4c4c; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX users_newuser_groups_newuser_id_7f6f4c4c ON public.users_newuser_groups USING btree (newuser_id);


--
-- Name: users_newuser_user_permissions_newuser_id_bb22b5b4; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX users_newuser_user_permissions_newuser_id_bb22b5b4 ON public.users_newuser_user_permissions USING btree (newuser_id);


--
-- Name: users_newuser_user_permissions_permission_id_72696cfa; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX users_newuser_user_permissions_permission_id_72696cfa ON public.users_newuser_user_permissions USING btree (permission_id);


--
-- Name: users_newuser_username_f6857a2c_like; Type: INDEX; Schema: public; Owner: djangos
--

CREATE INDEX users_newuser_username_f6857a2c_like ON public.users_newuser USING btree (username varchar_pattern_ops);


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_users_newuser_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_users_newuser_id FOREIGN KEY (user_id) REFERENCES public.users_newuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_comment api_comment_owner_id_2ff90561_fk_api_trainee_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_comment
    ADD CONSTRAINT api_comment_owner_id_2ff90561_fk_api_trainee_id FOREIGN KEY (owner_id) REFERENCES public.api_trainee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_comment api_comment_post_id_251fc0c3_fk_api_post_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_comment
    ADD CONSTRAINT api_comment_post_id_251fc0c3_fk_api_post_id FOREIGN KEY (post_id) REFERENCES public.api_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_post api_post_owner_id_6f27474b_fk_api_trainer_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_post
    ADD CONSTRAINT api_post_owner_id_6f27474b_fk_api_trainer_id FOREIGN KEY (owner_id) REFERENCES public.api_trainer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_reportcomment api_reportcomment_comment_id_08462b15_fk_api_comment_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_reportcomment
    ADD CONSTRAINT api_reportcomment_comment_id_08462b15_fk_api_comment_id FOREIGN KEY (comment_id) REFERENCES public.api_comment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_reportcomment api_reportcomment_owner_id_96a54b36_fk_api_trainee_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_reportcomment
    ADD CONSTRAINT api_reportcomment_owner_id_96a54b36_fk_api_trainee_id FOREIGN KEY (owner_id) REFERENCES public.api_trainee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_reportpost api_reportpost_owner_id_491bb966_fk_api_trainee_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_reportpost
    ADD CONSTRAINT api_reportpost_owner_id_491bb966_fk_api_trainee_id FOREIGN KEY (owner_id) REFERENCES public.api_trainee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_reportpost api_reportpost_post_id_312a90fc_fk_api_post_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_reportpost
    ADD CONSTRAINT api_reportpost_post_id_312a90fc_fk_api_post_id FOREIGN KEY (post_id) REFERENCES public.api_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_trainee api_trainee_trainee_id_41d31f0a_fk_users_newuser_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_trainee
    ADD CONSTRAINT api_trainee_trainee_id_41d31f0a_fk_users_newuser_id FOREIGN KEY (trainee_id) REFERENCES public.users_newuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_trainee api_trainee_trainerID_id_bfa02a5d_fk_api_trainer_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_trainee
    ADD CONSTRAINT "api_trainee_trainerID_id_bfa02a5d_fk_api_trainer_id" FOREIGN KEY ("trainerID_id") REFERENCES public.api_trainer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_trainee api_trainee_workoutPlan_id_5050c77c_fk_api_workoutplan_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_trainee
    ADD CONSTRAINT "api_trainee_workoutPlan_id_5050c77c_fk_api_workoutplan_id" FOREIGN KEY ("workoutPlan_id") REFERENCES public.api_workoutplan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_trainee api_trainee_yogaPlan_id_0290311e_fk_api_yogaplan_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_trainee
    ADD CONSTRAINT "api_trainee_yogaPlan_id_0290311e_fk_api_yogaplan_id" FOREIGN KEY ("yogaPlan_id") REFERENCES public.api_yogaplan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_trainer api_trainer_trainer_id_45cc16be_fk_users_newuser_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_trainer
    ADD CONSTRAINT api_trainer_trainer_id_45cc16be_fk_users_newuser_id FOREIGN KEY (trainer_id) REFERENCES public.users_newuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_weighttracker api_weighttracker_traineeID_id_d2a6bdc1_fk_api_trainee_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_weighttracker
    ADD CONSTRAINT "api_weighttracker_traineeID_id_d2a6bdc1_fk_api_trainee_id" FOREIGN KEY ("traineeID_id") REFERENCES public.api_trainee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_workoutplan_exercise api_workoutplan_exer_workoutexcercise_id_f9fc2237_fk_api_worko; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_workoutplan_exercise
    ADD CONSTRAINT api_workoutplan_exer_workoutexcercise_id_f9fc2237_fk_api_worko FOREIGN KEY (workoutexcercise_id) REFERENCES public.api_workoutexcercise(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_workoutplan_exercise api_workoutplan_exer_workoutplan_id_87b0963f_fk_api_worko; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_workoutplan_exercise
    ADD CONSTRAINT api_workoutplan_exer_workoutplan_id_87b0963f_fk_api_worko FOREIGN KEY (workoutplan_id) REFERENCES public.api_workoutplan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_workoutplan api_workoutplan_owner_id_d229fc87_fk_api_trainer_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_workoutplan
    ADD CONSTRAINT api_workoutplan_owner_id_d229fc87_fk_api_trainer_id FOREIGN KEY (owner_id) REFERENCES public.api_trainer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_yogaplan_exercises api_yogaplan_exercis_yogaexercise_id_ec633ca8_fk_api_yogae; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_yogaplan_exercises
    ADD CONSTRAINT api_yogaplan_exercis_yogaexercise_id_ec633ca8_fk_api_yogae FOREIGN KEY (yogaexercise_id) REFERENCES public.api_yogaexercise(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_yogaplan_exercises api_yogaplan_exercises_yogaplan_id_358172fa_fk_api_yogaplan_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_yogaplan_exercises
    ADD CONSTRAINT api_yogaplan_exercises_yogaplan_id_358172fa_fk_api_yogaplan_id FOREIGN KEY (yogaplan_id) REFERENCES public.api_yogaplan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_yogaplan api_yogaplan_owner_id_1d3e2521_fk_api_trainer_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.api_yogaplan
    ADD CONSTRAINT api_yogaplan_owner_id_1d3e2521_fk_api_trainer_id FOREIGN KEY (owner_id) REFERENCES public.api_trainer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_users_newuser_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_users_newuser_id FOREIGN KEY (user_id) REFERENCES public.users_newuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_newuser_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_newuser_id FOREIGN KEY (user_id) REFERENCES public.users_newuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_account_id_951f210e_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_account_id_951f210e_fk_socialacc FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_app_id_636a42d7_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_app_id_636a42d7_fk_socialacc FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_site_id_2579dee5_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc FOREIGN KEY (socialapp_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount socialaccount_social_user_id_8146e70c_fk_users_new; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_social_user_id_8146e70c_fk_users_new FOREIGN KEY (user_id) REFERENCES public.users_newuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_newuser_groups users_newuser_groups_group_id_525a4e68_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.users_newuser_groups
    ADD CONSTRAINT users_newuser_groups_group_id_525a4e68_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_newuser_groups users_newuser_groups_newuser_id_7f6f4c4c_fk_users_newuser_id; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.users_newuser_groups
    ADD CONSTRAINT users_newuser_groups_newuser_id_7f6f4c4c_fk_users_newuser_id FOREIGN KEY (newuser_id) REFERENCES public.users_newuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_newuser_user_permissions users_newuser_user_p_newuser_id_bb22b5b4_fk_users_new; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.users_newuser_user_permissions
    ADD CONSTRAINT users_newuser_user_p_newuser_id_bb22b5b4_fk_users_new FOREIGN KEY (newuser_id) REFERENCES public.users_newuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_newuser_user_permissions users_newuser_user_p_permission_id_72696cfa_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: djangos
--

ALTER TABLE ONLY public.users_newuser_user_permissions
    ADD CONSTRAINT users_newuser_user_p_permission_id_72696cfa_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

