--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases
--





--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;






--
-- Database creation
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: corsheaders_corsmodel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE corsheaders_corsmodel (
    id integer NOT NULL,
    cors character varying(255) NOT NULL
);


ALTER TABLE corsheaders_corsmodel OWNER TO postgres;

--
-- Name: corsheaders_corsmodel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE corsheaders_corsmodel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE corsheaders_corsmodel_id_seq OWNER TO postgres;

--
-- Name: corsheaders_corsmodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE corsheaders_corsmodel_id_seq OWNED BY corsheaders_corsmodel.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_admin_log (
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


ALTER TABLE django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO postgres;

--
-- Name: email_requests_request; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE email_requests_request (
    id integer NOT NULL,
    email_body text NOT NULL,
    preferred_mentee_email character varying(100) NOT NULL,
    phone character varying(20) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    mentee_id integer,
    mentor_id integer
);


ALTER TABLE email_requests_request OWNER TO postgres;

--
-- Name: email_requests_request_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE email_requests_request_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE email_requests_request_id_seq OWNER TO postgres;

--
-- Name: email_requests_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE email_requests_request_id_seq OWNED BY email_requests_request.id;


--
-- Name: messaging_message; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE messaging_message (
    id integer NOT NULL,
    body text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    thread_id integer,
    unread boolean NOT NULL,
    sender_id integer
);


ALTER TABLE messaging_message OWNER TO postgres;

--
-- Name: messaging_message_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE messaging_message_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE messaging_message_id_seq OWNER TO postgres;

--
-- Name: messaging_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE messaging_message_id_seq OWNED BY messaging_message.id;


--
-- Name: messaging_thread; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE messaging_thread (
    id integer NOT NULL,
    profile_1_id integer,
    profile_2_id integer
);


ALTER TABLE messaging_thread OWNER TO postgres;

--
-- Name: messaging_thread_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE messaging_thread_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE messaging_thread_id_seq OWNER TO postgres;

--
-- Name: messaging_thread_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE messaging_thread_id_seq OWNED BY messaging_thread.id;


--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oauth2_provider_accesstoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth2_provider_accesstoken_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_accesstoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE oauth2_provider_accesstoken (
    id bigint DEFAULT nextval('oauth2_provider_accesstoken_id_seq'::regclass) NOT NULL,
    token character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    scope text NOT NULL,
    application_id bigint,
    user_id integer,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE oauth2_provider_accesstoken OWNER TO postgres;

--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oauth2_provider_application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth2_provider_application_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_application; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE oauth2_provider_application (
    id bigint DEFAULT nextval('oauth2_provider_application_id_seq'::regclass) NOT NULL,
    client_id character varying(100) NOT NULL,
    redirect_uris text NOT NULL,
    client_type character varying(32) NOT NULL,
    authorization_grant_type character varying(32) NOT NULL,
    client_secret character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    user_id integer,
    skip_authorization boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE oauth2_provider_application OWNER TO postgres;

--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oauth2_provider_grant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth2_provider_grant_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_grant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE oauth2_provider_grant (
    id bigint DEFAULT nextval('oauth2_provider_grant_id_seq'::regclass) NOT NULL,
    code character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    redirect_uri character varying(255) NOT NULL,
    scope text NOT NULL,
    application_id bigint NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE oauth2_provider_grant OWNER TO postgres;

--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oauth2_provider_refreshtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth2_provider_refreshtoken_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_refreshtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE oauth2_provider_refreshtoken (
    id bigint DEFAULT nextval('oauth2_provider_refreshtoken_id_seq'::regclass) NOT NULL,
    token character varying(255) NOT NULL,
    access_token_id bigint NOT NULL,
    application_id bigint NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE oauth2_provider_refreshtoken OWNER TO postgres;

--
-- Name: users_course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users_course (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE users_course OWNER TO postgres;

--
-- Name: users_classes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_classes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_classes_id_seq OWNER TO postgres;

--
-- Name: users_classes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_classes_id_seq OWNED BY users_course.id;


--
-- Name: users_major; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users_major (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE users_major OWNER TO postgres;

--
-- Name: users_major_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_major_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_major_id_seq OWNER TO postgres;

--
-- Name: users_major_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_major_id_seq OWNED BY users_major.id;


--
-- Name: users_mentor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users_mentor (
    id integer NOT NULL,
    bio character varying(5000) NOT NULL,
    profile_id integer NOT NULL,
    active boolean NOT NULL,
    clubs character varying(500) NOT NULL,
    cons character varying(5000) NOT NULL,
    gpa numeric(4,2) NOT NULL,
    pros character varying(5000) NOT NULL
);


ALTER TABLE users_mentor OWNER TO postgres;

--
-- Name: users_mentor_courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users_mentor_courses (
    id integer NOT NULL,
    mentor_id integer NOT NULL,
    course_id integer NOT NULL
);


ALTER TABLE users_mentor_courses OWNER TO postgres;

--
-- Name: users_mentor_classes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_mentor_classes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_mentor_classes_id_seq OWNER TO postgres;

--
-- Name: users_mentor_classes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_mentor_classes_id_seq OWNED BY users_mentor_courses.id;


--
-- Name: users_mentor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_mentor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_mentor_id_seq OWNER TO postgres;

--
-- Name: users_mentor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_mentor_id_seq OWNED BY users_mentor.id;


--
-- Name: users_mentor_major; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users_mentor_major (
    id integer NOT NULL,
    mentor_id integer NOT NULL,
    major_id integer NOT NULL
);


ALTER TABLE users_mentor_major OWNER TO postgres;

--
-- Name: users_mentor_major_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_mentor_major_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_mentor_major_id_seq OWNER TO postgres;

--
-- Name: users_mentor_major_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_mentor_major_id_seq OWNED BY users_mentor_major.id;


--
-- Name: users_mentor_minor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users_mentor_minor (
    id integer NOT NULL,
    mentor_id integer NOT NULL,
    minor_id integer NOT NULL
);


ALTER TABLE users_mentor_minor OWNER TO postgres;

--
-- Name: users_mentor_minor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_mentor_minor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_mentor_minor_id_seq OWNER TO postgres;

--
-- Name: users_mentor_minor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_mentor_minor_id_seq OWNED BY users_mentor_minor.id;


--
-- Name: users_minor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users_minor (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE users_minor OWNER TO postgres;

--
-- Name: users_minor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_minor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_minor_id_seq OWNER TO postgres;

--
-- Name: users_minor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_minor_id_seq OWNED BY users_minor.id;


--
-- Name: users_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users_profile (
    id integer NOT NULL,
    user_id integer NOT NULL,
    verification_code character varying(10),
    verified boolean NOT NULL,
    picture character varying(100),
    year character varying(15) NOT NULL,
    phone_number character varying(13) NOT NULL,
    notifications_enabled boolean NOT NULL,
    password_reset_code character varying(20)
);


ALTER TABLE users_profile OWNER TO postgres;

--
-- Name: users_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_profile_id_seq OWNER TO postgres;

--
-- Name: users_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_profile_id_seq OWNED BY users_profile.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: corsheaders_corsmodel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY corsheaders_corsmodel ALTER COLUMN id SET DEFAULT nextval('corsheaders_corsmodel_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: email_requests_request id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY email_requests_request ALTER COLUMN id SET DEFAULT nextval('email_requests_request_id_seq'::regclass);


--
-- Name: messaging_message id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY messaging_message ALTER COLUMN id SET DEFAULT nextval('messaging_message_id_seq'::regclass);


--
-- Name: messaging_thread id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY messaging_thread ALTER COLUMN id SET DEFAULT nextval('messaging_thread_id_seq'::regclass);


--
-- Name: users_course id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_course ALTER COLUMN id SET DEFAULT nextval('users_classes_id_seq'::regclass);


--
-- Name: users_major id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_major ALTER COLUMN id SET DEFAULT nextval('users_major_id_seq'::regclass);


--
-- Name: users_mentor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_mentor ALTER COLUMN id SET DEFAULT nextval('users_mentor_id_seq'::regclass);


--
-- Name: users_mentor_courses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_mentor_courses ALTER COLUMN id SET DEFAULT nextval('users_mentor_classes_id_seq'::regclass);


--
-- Name: users_mentor_major id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_mentor_major ALTER COLUMN id SET DEFAULT nextval('users_mentor_major_id_seq'::regclass);


--
-- Name: users_mentor_minor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_mentor_minor ALTER COLUMN id SET DEFAULT nextval('users_mentor_minor_id_seq'::regclass);


--
-- Name: users_minor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_minor ALTER COLUMN id SET DEFAULT nextval('users_minor_id_seq'::regclass);


--
-- Name: users_profile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_profile ALTER COLUMN id SET DEFAULT nextval('users_profile_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add major	7	add_major
20	Can change major	7	change_major
21	Can delete major	7	delete_major
22	Can add profile	8	add_profile
23	Can change profile	8	change_profile
24	Can delete profile	8	delete_profile
25	Can add mentor	9	add_mentor
26	Can change mentor	9	change_mentor
27	Can delete mentor	9	delete_mentor
28	Can add application	10	add_application
29	Can change application	10	change_application
30	Can delete application	10	delete_application
31	Can add access token	11	add_accesstoken
32	Can change access token	11	change_accesstoken
33	Can delete access token	11	delete_accesstoken
34	Can add grant	12	add_grant
35	Can change grant	12	change_grant
36	Can delete grant	12	delete_grant
37	Can add refresh token	13	add_refreshtoken
38	Can change refresh token	13	change_refreshtoken
39	Can delete refresh token	13	delete_refreshtoken
40	Can add cors model	14	add_corsmodel
41	Can change cors model	14	change_corsmodel
42	Can delete cors model	14	delete_corsmodel
44	Can add request	16	add_request
45	Can change request	16	change_request
46	Can delete request	16	delete_request
47	Can add course	17	add_course
48	Can change course	17	change_course
49	Can delete course	17	delete_course
50	Can add message	18	add_message
51	Can change message	18	change_message
52	Can delete message	18	delete_message
53	Can add thread	19	add_thread
54	Can change thread	19	change_thread
55	Can delete thread	19	delete_thread
56	Can add minor	20	add_minor
57	Can change minor	20	change_minor
58	Can delete minor	20	delete_minor
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
38	pbkdf2_sha256$36000$FRKIkSMdDaQX$YwDf2lIbUZBEOsOs08YKtmveyEHQLbqSvcfvyHp5AsU=	\N	f	liwei1995@g.ucla.edu	Wei	Li	liwei1995@g.ucla.edu	f	t	2018-02-04 14:38:10.151952+00
31	pbkdf2_sha256$36000$EQhNAwS5y16m$MyirrLKzjem6Cv0AULthpwOcOlbaQrCYJI9+PZ20HUk=	\N	f	haejinjo@g.ucla.edu	Haejin	Jo	professionalhaejin@gmail.com	f	t	2018-02-01 07:26:39.654487+00
39	pbkdf2_sha256$36000$pOUWGDOsYqTb$UU5c+CQnvuHzZWwbrEcfhUnych9M7XZW5E5KitFeKdM=	\N	f	soumyadeep96@g.ucla.edu			soumyadeep96@g.ucla.edu	f	t	2018-02-05 16:57:02.785203+00
24	pbkdf2_sha256$36000$iNEwvIBdniG4$i0ur9vzXCH10vDmyMJFf0Bfak6mSck6ZX/CaXxlO1vE=	\N	f	arjunpat03@g.ucla.edu	Arjun	Patel	arjunpat03@g.ucla.edu	f	t	2018-01-31 23:35:35.19159+00
28	pbkdf2_sha256$36000$cEcLXSgbfz03$8iV4egJPxOaWy5jvcGuicgghOlteHOePrIkxtESK3DM=	\N	f	chengyin@g.ucla.edu	Krystal	Xu	chengyin@g.ucla.edu	f	t	2018-02-01 00:49:35.335651+00
33	pbkdf2_sha256$36000$pf6YCjOk16cu$7Y0gYtiDnYmS2n5weFMp/IM2oijDAK5KeGXmH7DEczo=	\N	f	Sfblake@g.ucla.edu	Serafina	Blake	Sfblake@g.ucla.edu	f	t	2018-02-01 07:49:59.378443+00
34	pbkdf2_sha256$36000$6UmOlHl6PU87$WW9iiv+oNBfGsNDFkvBrKh+uLNOFG+86lDek2mGZdzA=	\N	f	laurajane2696@g.ucla.edu	Laura Jane	Yee	laurajane2696@g.ucla.edu	f	t	2018-02-01 08:15:27.643283+00
35	pbkdf2_sha256$36000$A6kOlJgKkVnp$Xef5R89zG2vG8Nju2hfKHf/hZEFLM1K5n4KmEhu9Gi4=	\N	f	sjmadsen@g.ucla.edu	Sarah	Madsen	sjmadsen@g.ucla.edu	f	t	2018-02-01 17:22:41.675682+00
36	pbkdf2_sha256$36000$In4SCuoiFj6X$qZ18JR3JVczC9iaF+yGmKuKHqHOeJyDf/lrGQ2VzoUA=	\N	f	angelicapan@g.ucla.edu	Angelica	Pan	angelicapan@g.ucla.edu	f	t	2018-02-02 00:06:07.594093+00
37	pbkdf2_sha256$36000$UwifzQy9k8bW$hfgqJJriY/sG20TLlwHSSlYqlkT2VDzXphPxYxBLT28=	\N	f	ucla17ckl@g.ucla.edu	Christian	Klinteberg	ucla17ckl@g.ucla.edu	f	t	2018-02-02 00:36:43.694741+00
42	pbkdf2_sha256$36000$O76ziJvHsp2h$FInMsb/nG14qYL9Wqr+Sqv3b0drsGnBARsLz9CI8xUI=	\N	f	cvmulia@g.ucla.edu			cvmulia@g.ucla.edu	f	t	2018-03-02 02:46:32.015295+00
43	pbkdf2_sha256$36000$0dSmlftfllF1$9H/jxmSUvwPxDjyOF44iaU4Xll2H5Pq5s0mERxkj1FI=	\N	f	natashakohli@g.ucla.edu			natashakohli@g.ucla.edu	f	t	2018-03-02 02:47:37.291085+00
44	pbkdf2_sha256$36000$SI8HqmFlLB2c$pCRlMql1Ze79G8HgzdGHvb82hOdsEkWFOPPmTCPQhQk=	\N	f	quiggc@g.ucla.edu			quiggc@g.ucla.edu	f	t	2018-03-02 02:47:52.750636+00
45	pbkdf2_sha256$36000$sJXleGSQ7qXx$mdCbe5rN2K9Zt0XyyUhMXgLB3TmQlaNHgQYsF71MUiQ=	\N	f	weiruili@g.ucla.edu			weiruili@g.ucla.edu	f	t	2018-03-02 03:46:08.736162+00
46	pbkdf2_sha256$36000$TsWjLKrm6BwZ$5cJ0jU4tLlSWTMY31rya0G/c+ZtRY7WYIdTTQa45wGM=	\N	f	changyuyan@g.ucla.edu	Changyu	Yan	changyuyan@g.ucla.edu	f	t	2018-03-02 03:46:09.980839+00
48	pbkdf2_sha256$36000$X1NwFMYgu62e$cGA2KtGH0jtpIVK/fYiTKN+6NZ6olWWu9JzltNsY+lY=	\N	f	jpalmanzasoto@g.ucla.edu	Juan-Pablo	Almanza-Soto	jpalmanzasoto@g.ucla.edu	f	t	2018-03-02 05:30:31.075036+00
53	pbkdf2_sha256$36000$OaF0s3i0qLp1$tHSX4qjZr6mZLgtirvMiVL3gK8Yy0t0QGtccgKb6Ipo=	\N	f	ram@g.ucla.edu			ram@g.ucla.edu	f	t	2018-03-15 01:19:40.995979+00
49	pbkdf2_sha256$36000$rdAWgD5oHsuc$jC3KqwJ6DGKucSmBq/FyenWp6Drx7R2vyvyjOPZsJXg=	\N	f	eric1997@g.ucla.edu			eric1997@g.ucla.edu	f	t	2018-03-14 18:57:11.903158+00
59	pbkdf2_sha256$36000$tO7Gx3IR7dTz$O8HpQkInoS8kepZY13n7WeUMajTYmy1BgdFnObd2yoA=	\N	f	katiecai@g.ucla.edu	Katie	Cai	katiecai@g.ucla.edu	f	t	2018-03-15 01:47:36.221675+00
60	pbkdf2_sha256$36000$XwGBCDGAeZDW$qjaan4Ty5qmOvRVIdMzU4JNVbUQ69ubVSP9sV4pv/DI=	\N	f	kfann285@g.ucla.edu	Karen	Fann	kfann285@g.ucla.edu	f	t	2018-03-15 01:51:03.193819+00
61	pbkdf2_sha256$36000$E18K4kiUyh1m$W9g1t9BkH1qeyMBGHO7XVNMh6++o4WVDnHWmEo6DUhc=	\N	f	mitrikyle@g.ucla.edu	Dmitri	Brereton	mitrikyle@g.ucla.edu	f	t	2018-03-15 02:17:33.814483+00
62	pbkdf2_sha256$36000$tBUS855UlhY4$2Pxh41ObZVkm753/b+inPHjLO22wQ/efFdDRs9OcWHw=	\N	f	rdeamici@g.ucla.edu	Richard	DeAmicis	rdeamici@g.ucla.edu	f	t	2018-03-29 16:56:24.646037+00
17	pbkdf2_sha256$36000$8gMcBmxbArHT$fsDPZNwX2XdPjv0RU14pWqIRR8zB6aYPS9NvizrwGLA=	\N	t	lineaba@g.ucla.edu	Linea Brink	Andersen	lineaba@gmail.com	t	t	2018-01-24 06:33:54+00
63	pbkdf2_sha256$36000$XHruPVpmS93c$K/n7ux4kbKZvNZ31OSabwniR1ThnE1huOZ9u0+BlUsU=	\N	f	Kimeiga@g.ucla.edu	Hakan	Alpay	Kimeiga@g.ucla.edu	f	t	2018-04-05 03:43:49.084336+00
66	pbkdf2_sha256$36000$rcPtnAke1vsi$OGw8kYgSWL02FX9P59sJfwaZ/rf+sM9Kp3MHRDl4H4M=	\N	f	bad_account@g.ucla.edu			bad_account@g.ucla.edu	f	t	2018-05-04 07:00:01.701505+00
67	pbkdf2_sha256$36000$y156MWrKvHux$mAcr1B5iV0/nEC22TnLp3byUnHMd5x0bEexCio6dCQw=	\N	f	bad_account_2@g.ucla.edu			bad_account_2@g.ucla.edu	f	t	2018-05-04 07:05:02.48848+00
65	pbkdf2_sha256$36000$SNAtDodEQ3EC$6GuO5f15Hk63ZMCduC84qI5HYoHSRoxkZZ700v+vixI=	\N	f	jcherian@g.ucla.edu	Jahan Kuruvilla	Cherian	jcherian@g.ucla.edu	f	t	2018-04-12 04:22:54.100489+00
16	pbkdf2_sha256$36000$ZmhoKOQaOkYj$QqNstA8BWufnI15ub6Dl7aeYEmc8EAQ9gFmQldoRJEk=	2018-05-31 03:59:55.148974+00	t	ramsgoli@g.ucla.edu	Ram	Goli	ramsgoli@gmail.com	t	t	2018-01-24 06:32:06+00
30	pbkdf2_sha256$36000$ZI98BHWqGuN6$xatNeFsV3Oh2lvwU6b9Dl7fym6qsNoSs51HbyD6eF44=	\N	t	suntiancheng@g.ucla.edu	Christine	Sun	suntiancheng@g.ucla.edu	t	t	2018-02-01 05:05:36+00
40	pbkdf2_sha256$36000$BbVuYfSEY40S$NFC3FLDZKDEIU9P0Dj4+b5k9ZfXprt0WAY1ukrDflzQ=	\N	t	wdliu@g.ucla.edu	Wandi	Liu	lwd726@gmail.com	t	t	2018-02-07 02:33:22+00
29	pbkdf2_sha256$36000$iubTpJc8JUBH$p3zXRHWIOqmup5o1rVtKhAZhagf9z7W0+yH0mp4HNhQ=	\N	f	rishub@g.ucla.edu	Rishub	Kumar	rishub@g.ucla.edu	f	t	2018-02-01 04:31:59.045081+00
32	pbkdf2_sha256$36000$jpuvzKOJ6Jf2$qXZrxM2Ti79PHnJH4aAxeNznbJxI9Hy1nInziDsaSbg=	\N	t	alexlongerbeam@g.ucla.edu	Alex	Longerbeam	alexlongerbeam@g.ucla.edu	t	t	2018-02-01 07:37:26+00
1	pbkdf2_sha256$36000$TIguTya1YR2Q$1Qv1eQ0pf+ANE8zGcmKbgMYCbyK8XCIx9FyJvC2sbj8=	2018-05-24 03:05:08+00	f	root	mark	tai	mark@marktai.com	f	t	2017-10-25 23:32:49+00
21	pbkdf2_sha256$36000$KiMCnDxHTPvR$gOg7DmfevNMaEXPtXcR6H3C9qWfayIuQ/ywJb3Ot1Gg=	\N	f	dinkarkhattar@g.ucla.edu	Dinkar	Khattar	dinkarkhattar@g.ucla.edu	f	t	2018-01-30 23:41:53.599157+00
41	pbkdf2_sha256$36000$Dfo6M4ooqkv0$3YCJiwb9brllmKLpcl4r5DKEG+OJlIWAzlAHHYQ1uWA=	2018-05-25 01:26:49.376499+00	t	marktai@g.ucla.edu	Mark	Tai	marktai@g.ucla.edu	t	t	2018-02-08 04:28:08+00
47	pbkdf2_sha256$36000$9KEvS2AuFaE6$rCmLYUhZhMnhWsge5u5J0IgEC4K9UBZePpPdAel9OWM=	2018-11-13 21:26:29.096496+00	t	dwchen@g.ucla.edu	David	Chen	dwchen@g.ucla.edu	t	t	2018-03-02 04:16:24+00
76	pbkdf2_sha256$36000$PKp2y0RyVOi7$iHhvMuiiPbGUyXdxRqKGMejq48pdQpOZZhPDBTvmE5I=	\N	f	celiapj@g.ucla.edu	Celia	Janes	celiapj@g.ucla.edu	f	t	2018-05-22 06:49:44.644264+00
77	pbkdf2_sha256$36000$UgBb7eOUDAi6$Rzp6pN7pgPcorRTxTC4QaByx0W8oplXeM0KroX/La+E=	\N	f	rsimonian@g.ucla.edu			rsimonian@g.ucla.edu	f	t	2018-05-23 16:45:09.153902+00
78	pbkdf2_sha256$36000$FnecOM9NBXlI$jLE3lt587XzbGozzNhbSuhAQaf1wyiOByDrNKHosoxk=	\N	f	siow98@g.ucla.edu	Leo	Siow	siow98@g.ucla.edu	f	t	2018-05-23 17:32:41.530273+00
79	pbkdf2_sha256$36000$8sJEvJIhGEJk$BtcRtqdZGN9DyUPphQHYS9N5JQjaPnHZ6buthnbXHQ0=	\N	f	sanderson21@g.ucla.edu	Scott	Anderson	scott.n.anderson98@gmail.com	f	t	2018-05-23 19:39:36.730191+00
80	pbkdf2_sha256$36000$Xg9FVe3Gzwyf$/+NQ64A3hWI7j1hk6Zia2Xa7IBX2b2o3laaDC5oKbtY=	\N	f	yinmeichan@g.ucla.edu			yinmeichan@g.ucla.edu	f	t	2018-05-23 19:43:05.379841+00
81	pbkdf2_sha256$36000$24DcQnNaPKOP$CceeGJvTHLVpFoVH4iEy+TQSkrSBo6+7IraCoKlYG84=	\N	f	hwy19960708@g.ucla.edu			hwy19960708@g.ucla.edu	f	t	2018-05-23 19:44:23.022842+00
82	pbkdf2_sha256$36000$v0aXSeiPtloj$eBMZ6BFP0TUR9N5W/FI/aW89lmuB0YM/qbzGkk399SA=	\N	f	gfaour@g.ucla.edu	George Louis	Faour	gfaour@g.ucla.edu	f	t	2018-05-23 19:45:22.379784+00
83	pbkdf2_sha256$36000$jqauuDeF5Hr5$8avOInFL2qsq5V2IP9oCnnlzuqJVQPasNaalcHB6uug=	\N	f	aryanr@g.ucla.edu			aryanr@g.ucla.edu	f	t	2018-05-23 19:54:56.226181+00
86	pbkdf2_sha256$36000$HVkEsUGs5AvM$iSRWOjs7l0L8P2LTok1LWQrlUj+evBhK7QAG2LzxKu0=	\N	f	cindyortiz1127@g.ucla.edu			cindyortiz1127@g.ucla.edu	f	t	2018-05-23 19:55:39.862815+00
89	pbkdf2_sha256$36000$7uZKAD95Hr2B$aTP+egBdxOerqgpLdGWyIr2QDBApgTj8CVYt/kscsW8=	\N	f	alexmaltsev@g.ucla.edu			alexmaltsev@g.ucla.edu	f	t	2018-05-23 19:57:15.377945+00
90	pbkdf2_sha256$36000$EV0Zhz7uOX43$STebW8ar2W1fQH3Qx2QmXiMCue/yaLdQBxysZfrqeIg=	\N	f	adrikac@g.ucla.edu			adrikac@g.ucla.edu	f	t	2018-05-23 19:58:04.474989+00
119	pbkdf2_sha256$36000$Xc2JAGM9KW6q$riKlHLmeNmuhUQh9Bbd2ga32med3vVo8UguBJpnrocQ=	\N	f	jstox@g.ucla.edu			jstox@g.ucla.edu	f	t	2018-05-23 21:40:30.30978+00
93	pbkdf2_sha256$36000$OaCDglK4dKYq$6Ce4r+/LseLzw0Zt3g0YHRz61sKgAgK02Pm+EskJq68=	\N	f	echou9988@g.ucla.edu			echou9988@g.ucla.edu	f	t	2018-05-23 20:00:30.518422+00
94	pbkdf2_sha256$36000$yt4dfOpSsu2p$42wbE/YAaNxCKPnsFT28j+CgOv4dITS7KvD/4yEKAHA=	\N	f	brysonlevisay@g.ucla.edu			brysonlevisay@g.ucla.edu	f	t	2018-05-23 20:03:46.863954+00
95	pbkdf2_sha256$36000$vJeybFDidxZY$43zlok3aoHnC9/P8SSTOvRAXzpkcEDiRiLOb4bxCxVo=	\N	f	korozco@g.ucla.edu			korozco@g.ucla.edu	f	t	2018-05-23 20:05:20.679198+00
98	pbkdf2_sha256$36000$sRNEyGQMsg2D$nK146MiyrktV8sKnUE+ehnxODC+xL5hPO1BVdW7OoFQ=	\N	f	Lupitatr@g.ucla.edu	Maria Torres	Ramos	Lupitatr@g.ucla.edu	f	t	2018-05-23 20:06:28.132735+00
91	pbkdf2_sha256$36000$Md5oiZrf1MEw$TsqQCUjnNA/6JM6o85Cb5fJ281xPNqL7mRxZX9lt5Jw=	\N	f	rbax@g.ucla.edu	Rachel Elizabeth	Bax	rbax@g.ucla.edu	f	t	2018-05-23 19:58:19.487445+00
99	pbkdf2_sha256$36000$ahe3DLTgy35b$cqYwYlWOe7MkCfgPvodzuaYXLr2MiJ/LQB4+kUud+P4=	\N	f	sharonjohn@g.ucla.edu	Sharon	John	sharonjohn@g.ucla.edu	f	t	2018-05-23 20:20:20.399259+00
100	pbkdf2_sha256$36000$vUIuLILWT9jh$wd6dkSX0ykyVOTQM8//CbhI3rPHNnyudqlqtkPTYH7A=	\N	f	emiao15@g.ucla.edu	Elaine	Miao	emiao15@g.ucla.edu	f	t	2018-05-23 20:26:16.811932+00
102	pbkdf2_sha256$36000$4dxls1HeQ2kT$WcJAGxZ1DxkiwPPZmm8RAvBptDhUm70jdSlcIesnTeM=	\N	f	chasepage@g.ucla.edu	Chase	Page	chasepage@g.ucla.edu	f	t	2018-05-23 20:40:19.626329+00
103	pbkdf2_sha256$36000$xXOGQatNj2M3$VK9Rq5e12VBKOylAqZ994FIvoQOYJ6lIScKhSX0nQE0=	\N	f	heysamlee@g.ucla.edu	Samuel J.	Lee	heysamlee@g.ucla.edu	f	t	2018-05-23 20:43:49.83222+00
104	pbkdf2_sha256$36000$o2oBp1d9npaE$DKowFPG2dz6Q+zsRBRzd9n3YvOBwwvutbkfB7ZDmpw4=	\N	f	epatel6@g.ucla.edu			epatel6@g.ucla.edu	f	t	2018-05-23 20:47:22.564762+00
106	pbkdf2_sha256$36000$rqcrgenqXJJy$TAWMVoNUSc2jXH5Qa5gwtLQEIpNVNEA2uCPAD/PsCDU=	\N	f	acevans98@g.ucla.edu			acevans98@g.ucla.edu	f	t	2018-05-23 20:51:37.667628+00
107	pbkdf2_sha256$36000$wi4Fe8wgQLbw$Vn13brQrvI3zca42sYhdm5RcTjZLiwCgcgIzgjQvIQc=	\N	f	Kardia75@g.ucla.edu			Kardia75@g.ucla.edu	f	t	2018-05-23 20:52:22.926396+00
109	pbkdf2_sha256$36000$ZWwT0vsKsOSW$PO5+gigIRs3h2+JbmBjlVjTBlGG7uliARHoNjBWpB4Y=	\N	f	dianattejeda@g.ucla.edu			dianattejeda@g.ucla.edu	f	t	2018-05-23 20:54:51.915251+00
111	pbkdf2_sha256$36000$sDmfRGIBuj9O$6T0hwttAPzYZiX2QBbKM+Ny6MjklJygkxHF5nwQNJBg=	\N	f	Ptlee1@g.ucla.edu			Ptlee1@g.ucla.edu	f	t	2018-05-23 20:55:46.631714+00
110	pbkdf2_sha256$36000$Xxr4t7KomqTE$E9JAKjPze2YVlRAMjHbWuf2NiZBg9qmurRczJfUb5IA=	\N	f	seeratjajj@g.ucla.edu	Seerat	Jajj	seeratjajj@g.ucla.edu	f	t	2018-05-23 20:55:32.291817+00
123	pbkdf2_sha256$36000$6E90HpUmtLdj$A8TkjCaSrVbah768TSGqrEZl5onSZuDFVA3tNcU0LPc=	\N	f	buzzbuzzluke@g.ucla.edu	Luke	Luke	buzzbuzzluke@g.ucla.edu	f	t	2018-05-24 04:53:50.656951+00
108	pbkdf2_sha256$36000$IgsAPf3PuGzU$+ntHetGz1l1jepf4ZspPqi2eK8X9q3EvsKdjExCze/4=	\N	f	lifeofapancake@g.ucla.edu	Gavino	Marquez	lifeofapancake@g.ucla.edu	f	t	2018-05-23 20:52:24.131263+00
113	pbkdf2_sha256$36000$NZgiz0ahz4Nc$GiY//O+llTJ4AlvyEZJpvuCGWosHiv8gVsVpINj2F3E=	\N	f	mcheung10@g.ucla.edu	Matthew	Cheung	mcheung10@g.ucla.edu	f	t	2018-05-23 20:57:34.646219+00
112	pbkdf2_sha256$36000$Rl9bhzYdrf1r$kCUPxaeQpZ9oZeWldWYoNRagnJw9dmLkd3ZkbIjymhw=	\N	f	lawrencechen98@g.ucla.edu	Lawrence	Chen	lawrencechen98@g.ucla.edu	f	t	2018-05-23 20:56:55.493523+00
114	pbkdf2_sha256$36000$VttB7C7clRVb$BVXxPt7XUsq15GRjDK6Dfiz7BP5JO+9FWPgMuqSqXvQ=	\N	f	mrachamallu@g.ucla.edu	Meera	Rachamallu	mrachamallu@g.ucla.edu	f	t	2018-05-23 21:04:11.174257+00
115	pbkdf2_sha256$36000$sL8QEXzruiMX$6S3B8h50Bnpr317LfUIX/O1m/VmL9Sj3+8fvIOiS3PQ=	\N	f	ayushp@g.ucla.edu	Ayush	Patel	ayushp@g.ucla.edu	f	t	2018-05-23 21:04:20.495713+00
116	pbkdf2_sha256$36000$8IF13Y97gOxr$+z+rSwENf35wZ4jpZXYbKsitSjo6ylJ2SBnP9NN6SI4=	\N	f	zahrahajee712@g.ucla.edu			zahrahajee712@g.ucla.edu	f	t	2018-05-23 21:20:43.648739+00
117	pbkdf2_sha256$36000$pbooIzzDFS1V$izze+bgU4vAWVYsAFWFaEJ5yzF+n1cHiDpBDwsIKZNs=	\N	f	arianoosha7@g.ucla.edu			arianoosha7@g.ucla.edu	f	t	2018-05-23 21:23:16.833806+00
118	pbkdf2_sha256$36000$awDBK7YrPtT5$h0zQiF8S/Rr/7bPsLiq8AKdQzBnbXk3A7OXVK8H7/m8=	\N	f	abhattasali@g.ucla.edu			abhattasali@g.ucla.edu	f	t	2018-05-23 21:27:40.721941+00
92	pbkdf2_sha256$36000$N9lcCbwnOgHl$tqu39EmyO8kmzC8vs8r2AxN343/FCIPFtd77EBsYFPE=	\N	f	ycyvonne@g.ucla.edu	Yvonne	Chen	ycyvonne@g.ucla.edu	f	t	2018-05-23 19:59:21.251993+00
120	pbkdf2_sha256$36000$VQ7lwtlY5KJc$2JqyntyDcpWsSaBaJu1oLmiHhUUUInPT8YXrM3ifuUI=	\N	f	natebarrett98@g.ucla.edu	Nate	Barrett	natebarrett98@g.ucla.edu	f	t	2018-05-23 21:47:57.781914+00
64	pbkdf2_sha256$36000$Z3oAWjftfWxY$7qCknLv6O+gy3ojZePmgc02sBV3kPmFWpkruH2Yz3fA=	\N	t	kunqian@g.ucla.edu	Kevin	Qian	kunqian@g.ucla.edu	t	t	2018-04-05 03:55:25+00
121	pbkdf2_sha256$36000$Uzd8fIKWmIcN$prOSw4Sf1KdpRgrgf+imn7ZIA9aelgfPzQYAC9/DZHU=	\N	f	hyun9@g.ucla.edu	Jeffrey	Yun	hyun9@g.ucla.edu	f	t	2018-05-24 04:07:13.441024+00
122	pbkdf2_sha256$36000$Iw2oxAWjVMha$XYeSpOYvAOkw7JrhuNtMbXMJDmh09yRzw+Z8GRifCzk=	\N	f	rrkumar09@g.ucla.edu	Rohan	Kumar	rrkumar09@g.ucla.edu	f	t	2018-05-24 04:49:00.362514+00
124	pbkdf2_sha256$36000$WXMT4HBu8CaR$6yvM9vN7x89snJzgaAfr66/usRt1piHCK7UzfnCxGF0=	\N	f	jbarnett@g.ucla.edu			jbarnett@g.ucla.edu	f	t	2018-05-24 21:44:22.032784+00
125	pbkdf2_sha256$36000$5GknnRRmLtsU$0b8jN1eYPLxB6UUClIr+C8wikYVZKs0nB4fE692DuXM=	\N	f	Alexismalone@g.ucla.edu			Alexismalone@g.ucla.edu	f	t	2018-05-25 00:36:22.16533+00
126	pbkdf2_sha256$36000$S8fqbkUdbNJw$DB4siNxlQPeTH/Fi9jQ7PrE1Ke1qUrTJthuZDvMpTFQ=	\N	f	k8giannini@g.ucla.edu			k8giannini@g.ucla.edu	f	t	2018-05-25 02:44:08.787615+00
105	pbkdf2_sha256$36000$IbKvTLH2RF75$h0LVbZdI1Dj2bumnkngqeA14wEGI6RkVnKbz58dFJRY=	\N	f	clairekillian@g.ucla.edu	Claire	Killian	ckillian113@gmail.com	f	t	2018-05-23 20:50:49.002307+00
127	pbkdf2_sha256$36000$iq9TWGyY5Al6$FDo4JzDH+7+ooh/vPo7M7vGrS7g1uSl4k0NZ2psK3TE=	\N	f	tanzeelakhan@g.ucla.edu			tanzeelakhan@g.ucla.edu	f	t	2018-05-26 04:10:23.521625+00
128	pbkdf2_sha256$36000$SApbScQwokAe$dbk1Mgl1/EyAKWUDNtymo7Y3olVdZk5TqkbKqwLc1TY=	\N	f	donovanblair16@g.ucla.edu	Donovan	Blair	donovanblair16@g.ucla.edu	f	t	2018-05-26 04:45:04.949901+00
129	pbkdf2_sha256$36000$IC4oRgGm51Ky$nLP7KkRFNTMUceP9zNCJd8RJGlNkCrz3n+ejh+LQEDc=	\N	f	Tiffanyfeng@g.ucla.edu	Tiffany	Feng	Tiffanyfeng456@gmail.com	f	t	2018-05-26 07:07:01.596153+00
130	pbkdf2_sha256$36000$m9IuakYtsuUP$HAPUuBXYGYF4A3ihZbKAgJaFWUYOkGzzKl4FfQWI2ws=	\N	f	bensonhan@g.ucla.edu	Benson	Han	bensonhan@g.ucla.edu	f	t	2018-05-26 07:13:16.624066+00
131	pbkdf2_sha256$36000$nqfoVdlMANTT$BvQbPoJDHaVvf6wvOpzh78rqs+CryspokL7qVtyRY9g=	\N	f	pranavs99@g.ucla.edu			pranavs99@g.ucla.edu	f	t	2018-05-26 09:35:19.534436+00
132	pbkdf2_sha256$36000$Rb12201FUFZ3$n/b7vl32a3myxaw84qhm1rfsVe5+sAxVKopNiCg3KHk=	\N	f	jchang820@g.ucla.edu			jchang820@g.ucla.edu	f	t	2018-05-26 10:15:15.127211+00
133	pbkdf2_sha256$36000$AnUqwVcf6Omf$COb1EG7iZU8z86+IkHEyZN5pedeetLdX/KSdWK7Fxjk=	\N	f	yuhew0516@g.ucla.edu			yuhew0516@g.ucla.edu	f	t	2018-05-26 16:21:47.934378+00
146	pbkdf2_sha256$36000$5SBwTzctE6hT$l2vwXU5aWO/hcBamPxte9fyGOtfjnn7S0eJPo7eGN+0=	\N	f	Mmcmonigle@g.ucla.edu	Melinda	McMonigle	melindamcmonigle@gmail.com	f	t	2018-06-06 17:19:43.746565+00
135	pbkdf2_sha256$36000$jlg0hGaVMzAr$FR5MWjeNibfjo5hdwNzQkEnMBwu+fN5hoQJiXH9CVgE=	\N	f	richardsun29@g.ucla.edu			richardsun29@g.ucla.edu	f	t	2018-05-27 02:28:07.086822+00
147	pbkdf2_sha256$36000$hK0Vn45ffnqQ$vj/B3uINNuoAkubVmG+LsjRsJheUFxAEp9f32H27DqI=	\N	f	jamiely@g.ucla.edu			jamiely@g.ucla.edu	f	t	2018-06-07 03:46:16.365293+00
136	pbkdf2_sha256$36000$ybZk5Spq8P1m$aVRLcH3zVNrDX77a/WKS9z+K6BzHVMCXH5p5NvSRTug=	\N	f	jeffrey.tsou@g.ucla.edu	Jeffrey	Tsou	jeffrey.tsou@ucla.edu	f	t	2018-05-27 06:19:26.37076+00
134	pbkdf2_sha256$36000$OFR3BBJuGn7Q$L2aNwYAhjRE8fVqIG0Ar4ympSDokK3FwAF/KcYo/YIs=	\N	f	oozgur678@g.ucla.edu	Omar	Ozgur	oozgur217@gmail.com	f	t	2018-05-26 21:47:35.893111+00
137	pbkdf2_sha256$36000$6whkdPRytGZu$qPA1QBdSAhmJL38DHXSd11mTI0UHNFfYWy66vveoULY=	\N	f	arisweedler@g.ucla.edu	Ari	Sweedler	arisweedler@g.ucla.edu	f	t	2018-05-27 22:23:34.921485+00
138	pbkdf2_sha256$36000$rKVG7qV1BZjp$6antYq55Ce3bxASGHlB6zi7ZhMhxVw35Ie5b67Ro+2o=	\N	f	evanyang@g.ucla.edu	Evan	Yang	evanyang@g.ucla.edu	f	t	2018-05-29 23:49:33.765774+00
139	pbkdf2_sha256$36000$ferFYGxHxv8K$RhuYlJ0U9F2sJOTD8rGpQRbNvrFjC2EGc0BlCRNnI9U=	\N	f	bhaghighat@g.ucla.edu	Borzoo	Haghighat	bhaghighat@g.ucla.edu	f	t	2018-05-30 18:05:30.477925+00
140	pbkdf2_sha256$36000$C8IcgKIbMany$8hQdLVqO/h6aFRlPmjzpqjcZjWdRyDBQVQvxUanKqxQ=	\N	f	Lorena23@g.ucla.edu			Lorena23@g.ucla.edu	f	t	2018-05-30 20:57:48.784509+00
141	pbkdf2_sha256$36000$EAxJvd91cNlf$uisciAme4bRNPpDNzMsbA0pIG/vB/3o0xeUi9K62xmE=	\N	f	okunj@g.ucla.edu	Julie	Okun	okunj@g.ucla.edu	f	t	2018-05-31 15:32:16.858481+00
142	pbkdf2_sha256$36000$1Wxynwbowfc3$1A7b7mdSgFINV0Dt+oPSOdLCu97sb0thYo70OdyBzrI=	\N	f	aqchen@g.ucla.edu	Alexander	Chen	aqchen@g.ucla.edu	f	t	2018-05-31 17:23:16.380383+00
143	pbkdf2_sha256$36000$GggEYVpPSYNx$42mHshQQqCmwI087yowz0vuX0PpKQYdWOd6KdiVnzwY=	\N	f	mpratyusha@g.ucla.edu	Pratyusha	M	mpratyusha@g.ucla.edu	f	t	2018-05-31 21:51:06.931204+00
144	pbkdf2_sha256$36000$iJZPG2YWK90A$3QhMQKxVlgQyjw8hm3o6vFHDwMZBjL6KWWxNZT+c9uE=	\N	f	ashwinvivek@g.ucla.edu			ashwinvivek@g.ucla.edu	f	t	2018-06-02 05:54:51.989802+00
148	pbkdf2_sha256$36000$qGJp88EsZjbH$KOmWs8Ixl1M29x5e4ctTXSbyUiA5+nYbivD/x3z6Qac=	\N	f	mmxx@g.ucla.edu	Melissa	Cox	mmxx@g.ucla.edu	f	t	2018-06-07 07:56:15.306949+00
145	pbkdf2_sha256$36000$VyLhMU931fWv$W4yc3GOwGwrh2l4uRXgM92C+TEwM5kKPnnpjrwXihaM=	\N	f	michaelpeng510@g.ucla.edu	Michael	Peng	michaelpeng510@gmail.com	f	t	2018-06-04 01:28:02.133603+00
157	pbkdf2_sha256$36000$EOXfp5P6ljhh$QWO7yjwzYGGJarH+7MpyuEli4V6RE7XL8x1vUXGgIVU=	\N	f	bmont18@g.ucla.edu	Bradley	Mont	bmont18@g.ucla.edu	f	t	2018-10-06 05:49:04.36532+00
149	pbkdf2_sha256$36000$hOgGQWQ5x7Ik$1AJ82+9gqEL7R90u0OYdElhfIdyG2IpKRRA6CuGM3ik=	\N	f	coxs2020@g.ucla.edu	Sophie	C.	coxs2020@lawnet.ucla.edu	f	t	2018-06-15 18:32:47.621551+00
150	pbkdf2_sha256$36000$lXmHBlu81buf$HTMzXCuu6yhsByFxhscrqzc2rFZ/sGaScgmgk47pH+U=	\N	f	shailim@g.ucla.edu			shailim@g.ucla.edu	f	t	2018-07-18 01:00:02.362666+00
151	pbkdf2_sha256$36000$8CggDZjLcymc$jF9ohf7emTfQ3M6w0Yrgho27tQ4BtbXwKvlsfZAz6kc=	\N	f	mackenziemurphy@g.ucla.edu	Mackenzie	M	mackenziemurphy@g.ucla.edu	f	t	2018-08-29 22:07:01.511884+00
152	pbkdf2_sha256$36000$PQcNBuLX4MeF$U1a+qNKEkmOTD2wsTUo6x8sDoy3BplVO8zX4zOzV88M=	\N	f	misheel921@g.ucla.edu			misheel921@g.ucla.edu	f	t	2018-10-01 22:18:32.750391+00
153	pbkdf2_sha256$36000$IclY1YMCtWiL$ufLBdLrVhHkLntcpB4skdrhZ8cPYqR+h8/e7n9+bOrY=	\N	f	andrewzhou@g.ucla.edu			andrewzhou@g.ucla.edu	f	t	2018-10-04 20:42:24.720046+00
154	pbkdf2_sha256$36000$8lGtoeF67CJK$NEfrQooJXmOPGUe+9ydpnP9ZQy1UzvLw/xTGTN2HZSM=	\N	f	april980123@g.ucla.edu			april980123@g.ucla.edu	f	t	2018-10-04 23:42:13.604346+00
155	pbkdf2_sha256$36000$A7urKwPAPXGr$pfZnNjwO4qT7A+uPB6Isv8UqFUmjqh6DYqMBEZaIrd4=	\N	f	shsu282@g.ucla.edu			shsu282@g.ucla.edu	f	t	2018-10-05 01:10:06.002235+00
158	pbkdf2_sha256$36000$MmIUDKdLGwrU$siLk4YVlVpQYbhe0Mct3B2tevM/YW01HYhlu5IP3bX8=	\N	f	giovannim@g.ucla.edu	Giovanni	Moya	giovannim@g.ucla.edu	f	t	2018-10-09 20:22:02.798169+00
159	pbkdf2_sha256$36000$eudwRSzwu2ki$sjwJooPm+6f4I0mKWQ5qz7he3PpJ1dIdbul9M7kCxz8=	\N	f	dengnaizheng@g.ucla.edu	Naomi	Deng	dengnaizheng@g.ucla.edu	f	t	2018-10-16 04:37:45.561454+00
160	pbkdf2_sha256$36000$aNyIgfADzxsU$DXqKKdw/sPwWAFvSPv/au5C/G82m43WfibQekwH5UNI=	\N	f	cscotttaakan@g.ucla.edu			cscotttaakan@g.ucla.edu	f	t	2018-10-23 13:56:15.235098+00
161	pbkdf2_sha256$36000$ToqoI1BiL6Wi$QsgmHVNBIa0CqGZ5/Fo6Skf640tpYtwsD18CJOyKfhQ=	\N	f	lamjes42@g.ucla.edu	Jessica	Lam	lamjes42@gmail.com	f	t	2018-10-28 02:43:21.030677+00
156	pbkdf2_sha256$36000$fu5OQTFC8dsP$kGj65pgP3myAT/2i49ykJTyagsXN2aFX4u/efbiqBws=	\N	f	jhan25@g.ucla.edu	banana	abcd	justinhan1997@gmail.com	f	t	2018-10-05 04:27:26.747497+00
162	pbkdf2_sha256$36000$ONWaLhTnkbua$kbA56fPJ+qSgTDoOqwuQlCfxjtf4NMdpXKOdbJpIGVk=	\N	f	helarabawy@g.ucla.edu	Hannah	Elarabawy	helarabawy@g.ucla.edu	f	t	2018-10-28 23:11:37.231337+00
163	pbkdf2_sha256$36000$s5vxE32m4nID$911RYEWfNjFb2kD26d6ouAgRBrXaSv1xa89s9LsmPsU=	\N	f	aybeshlikyan@g.ucla.edu	Arpi	Beshlikyan	aybeshlikyan@g.ucla.edu	f	t	2018-11-03 23:26:54.416089+00
165	pbkdf2_sha256$36000$p2otSy2Qpo8e$zIobyXMfiTvSgpg0UaXOgJ6dcH5QI59SETikPwRwhGs=	\N	f	mattschaupp@g.ucla.edu	Matthew	Schaupp	mattschaupp@g.ucla.edu	f	t	2018-11-03 23:33:43.242147+00
166	pbkdf2_sha256$36000$2TioxftZBCHB$9GSIdgCcS98w9S0mBS8uIxkq9I+so9JBzvzRCoK3v9s=	\N	f	yhoshw@g.ucla.edu	Yhoshua	Wug	yhoshw@g.ucla.edu	f	t	2018-11-10 18:44:25.957406+00
167	pbkdf2_sha256$36000$EGNxUiYoaOcW$pqQydFxAhhlnNtkgGGyHPsTA0cEQfhcUWLXyo68Yduo=	\N	f	frendzy321@g.ucla.edu			frendzy321@g.ucla.edu	f	t	2018-11-10 19:08:42.822245+00
168	pbkdf2_sha256$36000$F5CtnTqdCWgl$M5djSm4JjyZ+2bzz0hE5iSxWByQ4iSpLoEyai20g+iY=	\N	f	nburger00@g.ucla.edu			nburger00@g.ucla.edu	f	t	2018-11-10 19:20:28.251519+00
169	pbkdf2_sha256$36000$c6bvF6mVSlfc$VaZtZMyR191c7qdxb1decVD/uiJoSJjojvjx34RSRHo=	\N	f	areeban@g.ucla.edu	Areeba	Nadeem	areeban@g.ucla.edu	f	t	2018-11-10 22:15:31.968477+00
170	pbkdf2_sha256$36000$kWphLxc1OI4j$Wv5tYJO2ns2qhqdttL0OyfVQ3V58rb/DcgozCJYKViM=	\N	f	braiyen@g.ucla.edu			braiyen@g.ucla.edu	f	t	2018-11-13 01:22:37.317415+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: corsheaders_corsmodel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY corsheaders_corsmodel (id, cors) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
2	2018-02-01 00:48:50.168962+00	27	chengyin@g.ucla.edu	3		4	1
3	2018-02-28 04:04:27.047977+00	20	.@g.ucla.edu	3		4	1
4	2018-02-28 04:04:27.052365+00	8	Dinkarkhattar@ucla.edu	3		4	1
5	2018-02-28 04:04:27.053981+00	12	alexlongerbeam@ucla.edu	3		4	1
6	2018-02-28 04:04:27.055685+00	11	dinkarkhattar@ucla.edu	3		4	1
7	2018-02-28 04:04:27.057371+00	10	marktai@ucla.edu	3		4	1
8	2018-02-28 04:04:27.059133+00	6	test@marktai.com	3		4	1
9	2018-05-24 02:45:55.419466+00	41	marktai@g.ucla.edu	2	[{"changed": {"fields": ["is_staff", "is_superuser"]}}]	4	1
10	2018-05-24 03:52:35.617904+00	16	ramsgoli@g.ucla.edu	2	[{"changed": {"fields": ["is_staff", "is_superuser"]}}]	4	41
11	2018-05-24 03:52:43.930425+00	30	suntiancheng@g.ucla.edu	2	[{"changed": {"fields": ["is_staff", "is_superuser"]}}]	4	41
12	2018-05-24 03:52:50.482479+00	47	dwchen@g.ucla.edu	2	[{"changed": {"fields": ["is_staff", "is_superuser"]}}]	4	41
13	2018-05-24 03:52:58.527046+00	32	alexlongerbeam@g.ucla.edu	2	[{"changed": {"fields": ["is_staff", "is_superuser"]}}]	4	41
14	2018-05-24 03:53:15.061834+00	1	root	2	[{"changed": {"fields": ["is_staff", "is_superuser"]}}]	4	41
15	2018-05-24 03:53:48.431239+00	17	lineaba@g.ucla.edu	2	[{"changed": {"fields": ["is_staff", "is_superuser"]}}]	4	41
16	2018-05-24 03:55:53.668208+00	40	wdliu@g.ucla.edu	2	[{"changed": {"fields": ["is_staff", "is_superuser"]}}]	4	41
17	2018-05-24 03:56:20.984717+00	64	kunqian@g.ucla.edu	2	[{"changed": {"fields": ["is_staff", "is_superuser"]}}]	4	41
18	2018-05-24 04:04:19.164815+00	19	rishub@g.ucla.edu	2	[{"changed": {"fields": ["verification_code"]}}]	8	47
19	2018-05-24 04:05:10.172495+00	19	rishub@g.ucla.edu	2	[{"changed": {"fields": ["verified"]}}]	8	47
20	2018-05-24 04:57:27.978246+00	97	buzzbuzzluke@g.ucla.edu	2	[{"changed": {"fields": ["verified"]}}]	8	47
21	2018-06-07 03:47:38.660513+00	121	jamiely@g.ucla.edu	2	[{"changed": {"fields": ["verified"]}}]	8	47
22	2018-09-28 02:53:08.154359+00	37	dwchen@g.ucla.edu	2	[{"changed": {"fields": ["year"]}}]	8	47
23	2018-10-02 16:55:44.873263+00	37	dwchen@g.ucla.edu	2	[{"changed": {"fields": ["year"]}}]	8	47
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	users	major
8	users	profile
9	users	mentor
10	oauth2_provider	application
11	oauth2_provider	accesstoken
12	oauth2_provider	grant
13	oauth2_provider	refreshtoken
14	corsheaders	corsmodel
16	email_requests	request
17	users	course
18	messaging	message
19	messaging	thread
20	users	minor
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-10-25 22:10:17.134972+00
2	auth	0001_initial	2017-10-25 22:10:17.792263+00
3	admin	0001_initial	2017-10-25 22:10:18.066933+00
4	admin	0002_logentry_remove_auto_add	2017-10-25 22:10:18.233448+00
5	contenttypes	0002_remove_content_type_name	2017-10-25 22:10:18.621833+00
6	auth	0002_alter_permission_name_max_length	2017-10-25 22:10:18.772225+00
7	auth	0003_alter_user_email_max_length	2017-10-25 22:10:18.972423+00
8	auth	0004_alter_user_username_opts	2017-10-25 22:10:19.120617+00
9	auth	0005_alter_user_last_login_null	2017-10-25 22:10:19.270855+00
10	auth	0006_require_contenttypes_0002	2017-10-25 22:10:19.273339+00
11	auth	0007_alter_validators_add_error_messages	2017-10-25 22:10:19.427851+00
12	auth	0008_alter_user_username_max_length	2017-10-25 22:10:19.601167+00
13	sessions	0001_initial	2017-10-25 22:10:19.701747+00
14	users	0001_initial	2017-10-25 23:11:35.355958+00
15	users	0002_mentor_active	2017-10-25 23:38:06.879303+00
16	oauth2_provider	0001_initial	2017-10-26 00:08:28.972306+00
17	oauth2_provider	0002_08_updates	2017-10-26 00:08:29.073066+00
18	oauth2_provider	0003_auto_20160316_1503	2017-10-26 00:08:29.098027+00
19	oauth2_provider	0004_auto_20160525_1623	2017-10-26 00:08:29.183548+00
20	oauth2_provider	0005_auto_20170514_1141	2017-10-26 00:08:29.834376+00
21	users	0003_auto_20171026_0516	2017-10-26 05:16:42.493777+00
22	corsheaders	0001_initial	2017-11-01 02:56:22.796205+00
24	users	0004_remove_profile_bio	2017-12-06 06:44:01.279961+00
25	email_requests	0001_initial	2017-12-06 06:44:01.318414+00
26	email_requests	0002_auto_20171116_0415	2017-12-06 06:44:01.330341+00
27	users	0005_auto_20171108_0410	2017-12-06 06:44:01.373309+00
28	users	0006_profile_picture	2017-12-06 06:44:01.388397+00
29	users	0007_auto_20171125_0037	2017-12-06 06:44:01.40453+00
30	users	0008_auto_20171128_0118	2017-12-06 06:44:01.428501+00
31	users	0009_auto_20171206_0548	2017-12-06 06:44:01.575678+00
32	users	0010_auto_20171206_0608	2017-12-06 06:44:01.590494+00
33	users	0011_profile_year	2018-01-18 04:54:27.732967+00
34	users	0012_auto_20171206_1736	2018-01-18 04:54:27.758841+00
35	users	0013_auto_20180108_2130	2018-01-18 04:54:27.78057+00
36	users	0013_auto_20180110_0108	2018-01-22 07:30:21.8935+00
37	users	0014_auto_20180111_0126	2018-01-22 07:30:21.981068+00
38	users	0015_auto_20180111_0412	2018-01-22 07:30:22.03526+00
39	users	0016_auto_20180112_2031	2018-01-22 07:30:22.111299+00
40	users	0017_merge_20180112_2237	2018-01-22 07:30:22.113988+00
41	users	0018_profile_phone_number	2018-02-28 03:45:26.164121+00
42	users	0019_auto_20180202_2213	2018-02-28 03:45:26.19896+00
43	users	0018_profile_notification	2018-02-28 03:45:26.228481+00
44	users	0020_merge_20180202_2235	2018-02-28 03:45:26.231464+00
45	users	0021_auto_20180204_0040	2018-02-28 03:45:26.254343+00
46	messaging	0001_initial	2018-03-15 01:21:29.87455+00
47	messaging	0002_auto_20180221_0446	2018-03-15 01:21:29.902833+00
48	messaging	0003_message_sender	2018-03-15 01:21:29.931391+00
49	messaging	0004_auto_20180305_2306	2018-03-15 01:21:29.963+00
50	users	0022_profile_password_reset_code	2018-05-24 02:42:23.471484+00
51	users	0023_auto_20180314_1346	2018-05-24 02:42:23.52182+00
52	users	0024_auto_20180324_0125	2018-05-24 02:42:23.578436+00
53	users	0025_auto_20180425_2214	2018-05-24 02:42:23.661138+00
54	users	0026_auto_20180425_2215	2018-05-24 02:42:23.681126+00
55	users	0027_auto_20180425_2217	2018-05-24 02:42:23.761564+00
56	users	0028_auto_20180425_2223	2018-05-24 02:42:23.829954+00
57	users	0029_auto_20180515_1045	2018-05-24 02:42:23.901906+00
58	users	0030_auto_20180515_1053	2018-05-24 02:42:23.910803+00
59	users	0031_auto_20180521_2123	2018-05-24 02:42:23.936375+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
0stomv2iy38s1c214i83kovwmj80wfjr	Y2IwYWI4ZGQxNjJjNzI2YmJlMmU4ZDI5YmMwMzU5MTUxOWM3YjMyNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjODI2NWIxM2Y3NGRlZTdmZWIzNDNmMDBlYmMzYjVmYmM2YjYxZjUzIn0=	2017-11-09 04:27:25.642+00
76chuz4m0m1jmiasur86p7gxphbiwsh3	Yzc0YWM5MzQyYjUxNDFmYWMwZDEwNjBmYTI4MjU5ZTQ0NGMzYmU4ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxYWI2N2M2NjUxZjI1YmQ0OWEzOTA4ZmE5M2M1YmNjNTk1Yjg1NzM3In0=	2017-11-15 02:37:44.077+00
z4iwiuyuz64qj5tzdxacsaya2h8rcbvw	Y2IwYWI4ZGQxNjJjNzI2YmJlMmU4ZDI5YmMwMzU5MTUxOWM3YjMyNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjODI2NWIxM2Y3NGRlZTdmZWIzNDNmMDBlYmMzYjVmYmM2YjYxZjUzIn0=	2017-11-09 04:55:50.53+00
8g73wu8505on5e059fl639e0ei8dkk5r	Yzc0YWM5MzQyYjUxNDFmYWMwZDEwNjBmYTI4MjU5ZTQ0NGMzYmU4ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxYWI2N2M2NjUxZjI1YmQ0OWEzOTA4ZmE5M2M1YmNjNTk1Yjg1NzM3In0=	2017-11-16 08:00:40.971391+00
yiq0ejpwx92g612pfgftj39sxnn4h4ys	Yzc0YWM5MzQyYjUxNDFmYWMwZDEwNjBmYTI4MjU5ZTQ0NGMzYmU4ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxYWI2N2M2NjUxZjI1YmQ0OWEzOTA4ZmE5M2M1YmNjNTk1Yjg1NzM3In0=	2017-12-20 06:48:41.256342+00
jngdcx6h75e643cafnycl7jcslxijymy	Yzc0YWM5MzQyYjUxNDFmYWMwZDEwNjBmYTI4MjU5ZTQ0NGMzYmU4ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxYWI2N2M2NjUxZjI1YmQ0OWEzOTA4ZmE5M2M1YmNjNTk1Yjg1NzM3In0=	2018-02-08 00:06:41.149719+00
1nl5fxesj3cx3p2nafxrvgk4zgedp1a8	Yzc0YWM5MzQyYjUxNDFmYWMwZDEwNjBmYTI4MjU5ZTQ0NGMzYmU4ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxYWI2N2M2NjUxZjI1YmQ0OWEzOTA4ZmE5M2M1YmNjNTk1Yjg1NzM3In0=	2018-02-09 13:21:08.664235+00
2tekksdj2x6fsqd33f0ejqvzglovtjms	Yzc0YWM5MzQyYjUxNDFmYWMwZDEwNjBmYTI4MjU5ZTQ0NGMzYmU4ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxYWI2N2M2NjUxZjI1YmQ0OWEzOTA4ZmE5M2M1YmNjNTk1Yjg1NzM3In0=	2018-02-15 01:11:36.595198+00
8r1x1ds5h2lcbwgqxl64es5n5n1kvmjw	Yzc0YWM5MzQyYjUxNDFmYWMwZDEwNjBmYTI4MjU5ZTQ0NGMzYmU4ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxYWI2N2M2NjUxZjI1YmQ0OWEzOTA4ZmE5M2M1YmNjNTk1Yjg1NzM3In0=	2018-02-15 02:40:33.515524+00
133fow36stpscsixw9sm1e2yr8wlfrsa	Yzc0YWM5MzQyYjUxNDFmYWMwZDEwNjBmYTI4MjU5ZTQ0NGMzYmU4ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxYWI2N2M2NjUxZjI1YmQ0OWEzOTA4ZmE5M2M1YmNjNTk1Yjg1NzM3In0=	2018-02-15 04:01:47.606421+00
g1ic33xdb0di4zrkyqlpndjfqtimxxcd	Yzc0YWM5MzQyYjUxNDFmYWMwZDEwNjBmYTI4MjU5ZTQ0NGMzYmU4ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxYWI2N2M2NjUxZjI1YmQ0OWEzOTA4ZmE5M2M1YmNjNTk1Yjg1NzM3In0=	2018-02-22 04:27:33.760102+00
gcacwn405dx5esclw2j0o7snb98gaeuw	Yzc0YWM5MzQyYjUxNDFmYWMwZDEwNjBmYTI4MjU5ZTQ0NGMzYmU4ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxYWI2N2M2NjUxZjI1YmQ0OWEzOTA4ZmE5M2M1YmNjNTk1Yjg1NzM3In0=	2018-03-14 03:46:04.632399+00
sudn0j5y9hcvm848154l02g3dlgfh56g	Yzc0YWM5MzQyYjUxNDFmYWMwZDEwNjBmYTI4MjU5ZTQ0NGMzYmU4ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxYWI2N2M2NjUxZjI1YmQ0OWEzOTA4ZmE5M2M1YmNjNTk1Yjg1NzM3In0=	2018-03-16 16:40:50.902813+00
m2ysra04mhvqvhvwfxlzdfvjldq1lq12	Yzc0YWM5MzQyYjUxNDFmYWMwZDEwNjBmYTI4MjU5ZTQ0NGMzYmU4ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxYWI2N2M2NjUxZjI1YmQ0OWEzOTA4ZmE5M2M1YmNjNTk1Yjg1NzM3In0=	2018-03-21 03:37:45.707688+00
6rnyegn38nax6178ykqe2b15z35ffnqh	Yzc0YWM5MzQyYjUxNDFmYWMwZDEwNjBmYTI4MjU5ZTQ0NGMzYmU4ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxYWI2N2M2NjUxZjI1YmQ0OWEzOTA4ZmE5M2M1YmNjNTk1Yjg1NzM3In0=	2018-04-05 03:14:03.210259+00
757n8xgeueas2kjewoz4ypqvqhohuvuu	Yzc0YWM5MzQyYjUxNDFmYWMwZDEwNjBmYTI4MjU5ZTQ0NGMzYmU4ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxYWI2N2M2NjUxZjI1YmQ0OWEzOTA4ZmE5M2M1YmNjNTk1Yjg1NzM3In0=	2018-04-07 09:04:35.876935+00
mhlie5xpxe2czznm5ls78ui39o7nkv3y	Yzc0YWM5MzQyYjUxNDFmYWMwZDEwNjBmYTI4MjU5ZTQ0NGMzYmU4ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxYWI2N2M2NjUxZjI1YmQ0OWEzOTA4ZmE5M2M1YmNjNTk1Yjg1NzM3In0=	2018-04-23 16:41:07.48588+00
a9aoi2t3obdx7f895prr0mz2by0hmlf7	Yzc0YWM5MzQyYjUxNDFmYWMwZDEwNjBmYTI4MjU5ZTQ0NGMzYmU4ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxYWI2N2M2NjUxZjI1YmQ0OWEzOTA4ZmE5M2M1YmNjNTk1Yjg1NzM3In0=	2018-04-26 02:37:48.214206+00
hjmq2veytlw10pv55wg3xon7lz9sw4j5	Yzc0YWM5MzQyYjUxNDFmYWMwZDEwNjBmYTI4MjU5ZTQ0NGMzYmU4ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxYWI2N2M2NjUxZjI1YmQ0OWEzOTA4ZmE5M2M1YmNjNTk1Yjg1NzM3In0=	2018-05-16 02:38:59.981784+00
rl7f0onyalrq27dyml1pgk1b60tbub0c	YjU4ZWUyY2ZmMTQzODM3YmJkZjM5OWM5ZWU0Y2IwYzk0NGQzMzQ0Nzp7Il9hdXRoX3VzZXJfaWQiOiI0MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiODRlMmJkMDhlMzIzN2U4ZGNmODJkOWVkODAyYmVhM2ZlNDRjNGM1MCJ9	2018-06-07 02:56:11.024636+00
t7319jvqpqknl8ytu435x5nuwjmzgp0r	Yzc0YWM5MzQyYjUxNDFmYWMwZDEwNjBmYTI4MjU5ZTQ0NGMzYmU4ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxYWI2N2M2NjUxZjI1YmQ0OWEzOTA4ZmE5M2M1YmNjNTk1Yjg1NzM3In0=	2018-06-07 03:05:08.357048+00
iki3e69p2z0p6caa1tgcdr3k18m2wiw1	NDdiZGViYjYxNTc2NTEyYTM5NTU0ZGUzNDcyMDA4OTM1NDkwYjI5NDp7Il9hdXRoX3VzZXJfaWQiOiI0NyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDdjMDIxZWVkN2MzYTk3NDRhZmE2NGY4YThkYjA1YjliODQxZjMwYSJ9	2018-06-07 03:55:07.61155+00
mf9daxopevo9kluj46bro9q66jgk9678	YjU4ZWUyY2ZmMTQzODM3YmJkZjM5OWM5ZWU0Y2IwYzk0NGQzMzQ0Nzp7Il9hdXRoX3VzZXJfaWQiOiI0MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiODRlMmJkMDhlMzIzN2U4ZGNmODJkOWVkODAyYmVhM2ZlNDRjNGM1MCJ9	2018-06-08 01:26:49.378818+00
3lm0lbvq0s48c1458a15uu7rabioa1tm	YzJiYTdlOGUyZTBkYTYyZDM3M2E0ODNhYmEzNzMyMTVmNDU4MzdlMzp7Il9hdXRoX3VzZXJfaWQiOiIxNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDQ3NzIwZTI1NWVkYTVhODg2ZjkwZjJhZmMyNzkyNTVlOWY2YjA3NiJ9	2018-06-14 03:59:55.151333+00
qq9273kw2glps9gnzdmqy7ror9ed1e3z	NDdiZGViYjYxNTc2NTEyYTM5NTU0ZGUzNDcyMDA4OTM1NDkwYjI5NDp7Il9hdXRoX3VzZXJfaWQiOiI0NyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDdjMDIxZWVkN2MzYTk3NDRhZmE2NGY4YThkYjA1YjliODQxZjMwYSJ9	2018-07-21 00:51:56.426309+00
65tznkimlfx53sx7o5nr5hxwifbj1r6t	NDdiZGViYjYxNTc2NTEyYTM5NTU0ZGUzNDcyMDA4OTM1NDkwYjI5NDp7Il9hdXRoX3VzZXJfaWQiOiI0NyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDdjMDIxZWVkN2MzYTk3NDRhZmE2NGY4YThkYjA1YjliODQxZjMwYSJ9	2018-08-06 20:29:43.671684+00
4prwnmtp06v1d537yx4sikf62m5etaje	NDdiZGViYjYxNTc2NTEyYTM5NTU0ZGUzNDcyMDA4OTM1NDkwYjI5NDp7Il9hdXRoX3VzZXJfaWQiOiI0NyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDdjMDIxZWVkN2MzYTk3NDRhZmE2NGY4YThkYjA1YjliODQxZjMwYSJ9	2018-10-09 01:53:31.733034+00
ihcqgmdtrbi6x9ink5zavk4tfjs60sek	NDdiZGViYjYxNTc2NTEyYTM5NTU0ZGUzNDcyMDA4OTM1NDkwYjI5NDp7Il9hdXRoX3VzZXJfaWQiOiI0NyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDdjMDIxZWVkN2MzYTk3NDRhZmE2NGY4YThkYjA1YjliODQxZjMwYSJ9	2018-10-09 20:43:43.233898+00
49dfd1mr3pls1gia2ee1dfir1f8zeqz6	NDdiZGViYjYxNTc2NTEyYTM5NTU0ZGUzNDcyMDA4OTM1NDkwYjI5NDp7Il9hdXRoX3VzZXJfaWQiOiI0NyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDdjMDIxZWVkN2MzYTk3NDRhZmE2NGY4YThkYjA1YjliODQxZjMwYSJ9	2018-10-12 03:03:41.547491+00
bi47g86yp1939b2fbzmet8o1dbbv43xw	NDdiZGViYjYxNTc2NTEyYTM5NTU0ZGUzNDcyMDA4OTM1NDkwYjI5NDp7Il9hdXRoX3VzZXJfaWQiOiI0NyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDdjMDIxZWVkN2MzYTk3NDRhZmE2NGY4YThkYjA1YjliODQxZjMwYSJ9	2018-10-25 19:51:55.136656+00
swv0p7nra87bo92rgqrhe5sf3zjwbqlc	NDdiZGViYjYxNTc2NTEyYTM5NTU0ZGUzNDcyMDA4OTM1NDkwYjI5NDp7Il9hdXRoX3VzZXJfaWQiOiI0NyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDdjMDIxZWVkN2MzYTk3NDRhZmE2NGY4YThkYjA1YjliODQxZjMwYSJ9	2018-11-27 21:26:29.099012+00
\.


--
-- Data for Name: email_requests_request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY email_requests_request (id, email_body, preferred_mentee_email, phone, date_created, mentee_id, mentor_id) FROM stdin;
1	hey wuggy	lineaba@g.ucla.edu		2018-02-01 00:15:44.753282+00	11	5
2	Hey, just testing this out! Do you recieve notifications, and do everything look right on your end? Also, try and send me a request back, please! (major Linguistics B.A.)	lineaba@g.ucla.edu		2018-02-01 00:23:00.066374+00	11	8
3	Everything looks good to me! BTW you have two profiles somehow. Maybe Mark can fix that..? :)	ramsgoli@gmail.com		2018-02-01 00:24:02.963698+00	10	5
4	Hey DK, just testing! Everything looks great! You should be able to add a profile photo now if you want	lineaba@g.ucla.edu		2018-02-01 00:28:20.574102+00	11	6
6	Yo what's up big DK ill buy you a coffee for some gud time	ramsgoli@gmail.com		2018-02-01 00:43:19.819368+00	10	6
5	hiii	chengyin@g.ucla.edu		2018-02-01 00:41:33.494038+00	\N	8
7	hi test test	chengyin@g.ucla.edu		2018-02-01 00:52:08.234443+00	18	5
8	Yay, it works! Really great job!!	lineaba@g.ucla.edu		2018-02-01 01:02:21.909787+00	11	11
9	hi!!!!	chengyin@g.ucla.edu		2018-02-01 04:25:56.395883+00	18	6
10	hello linea	suntiancheng@g.ucla.edu		2018-02-01 05:12:33.827949+00	20	5
11	hey, this is the test	lineaba@g.ucla.edu		2018-02-01 05:14:08.859446+00	11	12
12	Hi can u mentor me pls	alexlongerbeam@g.ucla.edu		2018-02-01 07:40:17.894532+00	22	8
13		rishub@g.ucla.edu		2018-02-01 09:31:07.59145+00	19	8
14	Hi! I'm super interested in ling, could we meet up some time to talk about the major please?	angelicapan@g.ucla.edu		2018-02-02 00:28:42.412973+00	26	5
15	Hi linea! I need guidance 	ucla17ckl@g.ucla.edu		2018-02-02 00:47:45.143301+00	27	5
16	Test for the sendgrid account change	alexlongerbeam@g.ucla.edu		2018-02-08 03:52:40.6545+00	22	6
17	Test for sendgrid account change	alexlongerbeam@g.ucla.edu		2018-02-08 04:08:50.901182+00	22	5
18	Test again	alexlongerbeam@g.ucla.edu		2018-02-08 04:17:07.728188+00	22	6
19	khgujyfg	lineaba@gmail.com		2018-03-02 03:22:06.792396+00	11	6
20	khgujyfg	lineaba@gmail.com		2018-03-02 03:22:06.811656+00	11	6
21	khgujyfg	lineaba@gmail.com		2018-03-02 03:22:06.852865+00	11	6
22	khgujyfg	lineaba@gmail.com		2018-03-02 03:22:07.010121+00	11	6
23		dwchen@g.ucla.edu		2018-03-02 04:29:51.158094+00	37	21
24		dwchen@g.ucla.edu		2018-03-02 04:31:57.179248+00	37	5
25	Hey man I'd love to chat with you sometime about your hot sexy major :)	ramsgoli@gmail.com		2018-03-02 05:36:34.927691+00	10	24
26	Hey big boy why don't you show me your RAM	jpalmanzasoto@g.ucla.edu		2018-03-02 05:38:33.715837+00	38	8
27		marktai@g.ucla.edu		2018-03-15 01:31:47.049297+00	31	8
28	Test	alexlongerbeam@g.ucla.edu		2018-03-15 01:44:14.422992+00	22	5
29	Test test 	alexlongerbeam@g.ucla.edu		2018-03-15 01:46:32.667637+00	22	8
30	hi Karen we should get dinner sometime	katiecai@g.ucla.edu		2018-03-15 01:52:34.602972+00	48	26
31	hi ram, nice work	kfann285@g.ucla.edu		2018-03-15 01:53:58.786665+00	49	8
32		lineaba@gmail.com		2018-03-15 02:13:42.916464+00	11	8
33		lineaba@gmail.com		2018-03-15 02:13:42.965994+00	11	8
34	please teach me oh legendary one	lineaba@gmail.com		2018-03-15 02:15:22.719818+00	11	8
35	sedfrjukol	lineaba@gmail.com		2018-03-15 02:39:31.317927+00	11	21
36	Test for changing the sendgrid account on the deployed server. We have over 100 emails/day now!	alexlongerbeam@g.ucla.edu		2018-03-16 02:30:22.516091+00	22	8
37	TEST	kunqian@g.ucla.edu		2018-04-12 03:57:08.652217+00	53	5
38	hey whatsup	ycyvonne@g.ucla.edu		2018-05-23 21:32:42.69863+00	69	31
\.


--
-- Data for Name: messaging_message; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY messaging_message (id, body, "timestamp", thread_id, unread, sender_id) FROM stdin;
1	Hello	2018-05-24 04:23:56.311663+00	1	t	37
2	Hey man!	2018-05-24 04:24:34.877094+00	1	t	10
3	Hello~	2018-05-24 04:28:43.891095+00	2	t	37
4	Hey Linea! Would love to talk to you about the linguistics major! Are you free to meet for coffee sometime? Thanks!	2018-05-24 04:29:04.113788+00	3	t	10
5	well, hellooooooooo	2018-05-24 04:31:10.649856+00	2	t	11
6	hi! 	2018-05-24 04:58:10.44876+00	4	t	96
7	Hey Rohan!	2018-05-24 20:05:08.763032+00	4	t	10
8	Hi	2018-05-24 22:00:49.68531+00	5	t	22
9	This is hype af	2018-05-24 22:00:57.148953+00	5	t	22
10	Boom	2018-05-24 22:01:15.751781+00	5	t	22
11	Bang	2018-05-24 22:01:17.55582+00	5	t	22
12	Dope	2018-05-24 22:01:18.759929+00	5	t	22
13	the new designs :o	2018-05-26 04:04:05.864546+00	6	t	14
14	Test for messaging	2018-05-26 04:48:00.093704+00	7	t	102
15	Hey how does this work	2018-05-26 04:48:40.334144+00	7	t	22
16	Test for websockets	2018-05-26 04:50:24.281906+00	7	t	22
17	Working or nah	2018-05-26 04:50:32.334347+00	7	t	22
18	Other way?	2018-05-26 04:50:45.705405+00	7	t	102
19	Test again	2018-05-26 04:52:07.154322+00	7	t	102
20	Let's see	2018-05-26 04:59:03.26213+00	7	t	22
21	Try	2018-05-26 04:59:15.138369+00	7	t	102
22	Not working?	2018-05-26 05:00:09.617378+00	7	t	22
23	Try again	2018-05-26 05:00:52.36452+00	7	t	22
24	test	2018-05-26 05:01:25.975992+00	7	t	22
25	yo what's up haoyu	2018-05-26 06:52:06.712383+00	8	t	31
26	Hi, sweet product :')))	2018-05-27 22:26:06.055203+00	9	t	111
27	Thanks Ari! 😜	2018-05-27 22:30:13.23796+00	9	t	10
28	Test	2018-05-31 03:56:58.66502+00	1	t	37
29	yo its live!	2018-05-31 03:57:04.06812+00	1	t	10
30	wow i want to meet you	2018-05-31 03:58:08.960357+00	10	t	49
31	yo lets meet!	2018-05-31 03:58:15.519395+00	10	t	10
32	new slack	2018-05-31 03:58:34.803997+00	10	t	10
33	this is cute	2018-05-31 03:58:57.625697+00	10	t	49
34	Uhhh	2018-05-31 04:29:20.083986+00	1	t	10
35	Hello?	2018-05-31 04:30:08.668252+00	1	t	37
36	message	2018-05-31 04:30:18.525194+00	1	t	37
37	lolololl	2018-05-31 04:30:47.373942+00	1	t	10
38	oh fuck	2018-05-31 04:31:54.299442+00	1	t	10
39	hmmm	2018-05-31 04:32:23.496758+00	1	t	10
40	weird	2018-05-31 04:32:32.38561+00	1	t	37
41	hmm	2018-05-31 04:32:44.677525+00	1	t	10
42	Test	2018-05-31 04:33:18.414854+00	2	t	11
43	test	2018-05-31 04:33:52.095527+00	1	t	37
44	w	2018-05-31 04:33:58.464795+00	1	t	37
45	jump	2018-05-31 04:34:02.032397+00	1	t	37
46	jump	2018-05-31 04:34:09.80726+00	1	t	37
47	test	2018-05-31 04:34:15.699006+00	1	t	37
48	hey	2018-05-31 04:34:23.150942+00	1	t	10
49	idk man	2018-05-31 04:34:34.68296+00	1	t	10
50	jump	2018-05-31 04:36:39.487923+00	2	t	37
51	test	2018-05-31 04:36:59.471413+00	2	t	37
52	Try me	2018-05-31 04:38:52.005908+00	2	t	11
53	Boo!	2018-05-31 04:39:08.296168+00	2	t	11
54	jumo	2018-05-31 04:39:29.480703+00	2	t	37
55	Hey	2018-05-31 04:40:11.65673+00	3	t	11
56	Horse 	2018-05-31 04:40:28.467656+00	2	t	11
57	Bird	2018-05-31 04:43:27.886907+00	2	t	11
58	Worm	2018-05-31 04:43:53.387455+00	2	t	11
59	Pig 	2018-05-31 04:44:01.298665+00	2	t	11
60	jump	2018-05-31 04:45:10.070092+00	1	t	37
61	Horse 	2018-05-31 04:45:42.362188+00	3	t	11
62	asdfghjklqwertyuiopzxcvbnm	2018-05-31 04:47:00.987315+00	2	t	37
63	asdfghjklqwertyuiopzxcvbnm asdfghjklqwertyuiopzxcvbnm asdfghjklqwertyuiopzxcvbnm	2018-05-31 04:47:19.843455+00	2	t	37
64	asdfghjklqwertyuiopzxcvbnmasdfghjklqwertyuiopzxcvbnmasdfghjklqwertyuiopzxcvbnm	2018-05-31 04:47:46.019156+00	2	t	37
65	suuup im trying out bquest features rn	2018-05-31 17:25:51.057935+00	11	t	116
66	Hello. Let's meet up	2018-06-02 22:09:30.424924+00	12	t	89
67	Hellooooo	2018-06-07 03:59:18.765969+00	2	t	11
68	u have been a bad bad boy toda	2018-06-07 03:59:39.628844+00	3	t	11
69	y	2018-06-07 03:59:39.819943+00	3	t	11
70	Haha, someone had fun with messages during demo :p	2018-06-07 05:39:49.647499+00	3	t	11
71	Test	2018-10-01 19:59:00.299755+00	2	t	37
72	Hi, I'd like to talk and this is basically m testing something. DOn't worry about it.	2018-10-03 19:26:21.261545+00	2	t	37
73	Hi, I'd like to meet an talk about and this is basically m testing something. DOn't worry about it.	2018-10-03 19:27:05.704319+00	2	t	37
74	Hi, I'd like to meet and talk about and this is basically m testing something. DOn't worry about it.	2018-10-03 19:27:40.16848+00	2	t	37
75	Sure	2018-10-03 19:27:58.93855+00	1	t	37
76	Hey Wandi, I'm considering studying Linguistics, but I'm really unsure, since I'm also interested in Anthropology. I'm also a little worried I won't be that good in linguistics since I only speak English. Do you have any time this week to give me some advice on what to do? -David	2018-10-03 19:32:28.248364+00	13	t	37
77	hi	2018-10-05 04:08:52.161132+00	14	t	37
78	hi	2018-10-05 04:30:08.201135+00	14	t	37
79	l	2018-10-05 04:31:18.928062+00	1	t	37
80	how do you recommend to study for cs m51a? 	2018-10-09 20:30:01.364776+00	15	t	132
81	Go to discussion sections, cause the TAs provide a lot of examples of what the actual tests are like. And just practice practice practice problems from the textbook :)	2018-10-10 16:51:13.219683+00	15	t	10
82	I love you bb	2018-10-28 00:45:45.33477+00	16	t	97
83	u sexy thang	2018-10-28 00:46:00.295245+00	16	t	97
84	i sent you nudes respond	2018-10-28 00:46:06.712293+00	16	t	97
85	test test	2018-10-28 00:46:46.327799+00	16	t	97
86	send	2018-10-28 00:47:02.991656+00	16	t	97
87	asdf	2018-11-06 08:24:51.150261+00	17	t	130
88	Establishing causality means to show than an outcome is effected by some treatment. • Treatment group: individuals who receive the treatment of interest in an experiment	2018-11-11 21:58:08.681202+00	18	t	136
\.


--
-- Data for Name: messaging_thread; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY messaging_thread (id, profile_1_id, profile_2_id) FROM stdin;
1	37	10
2	37	11
3	10	11
4	96	10
5	22	10
6	14	10
7	102	22
8	31	95
9	111	10
10	49	10
11	116	95
12	89	10
13	37	30
14	37	31
15	132	10
16	97	37
17	130	30
18	136	10
\.


--
-- Data for Name: oauth2_provider_accesstoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oauth2_provider_accesstoken (id, token, expires, scope, application_id, user_id, created, updated) FROM stdin;
45	yX6RnJyT318SVVfDgyowrY2v1mTkhA	2018-01-24 16:32:07.132892+00	read write groups	1	16	2018-01-24 06:32:07.133289+00	2018-01-24 06:32:07.133303+00
46	qJhWSInzzCeOa0cD6R4iOH43m3v5Py	2018-01-24 16:33:55.124045+00	read write groups	1	17	2018-01-24 06:33:55.124392+00	2018-01-24 06:33:55.124407+00
48	UneDzaMeKslU7VB0ilcNYKhQXkX1aR	2018-01-25 07:37:01.276081+00	read write groups	1	17	2018-01-24 21:37:01.29029+00	2018-01-24 21:37:01.290319+00
49	UWnrNU8ARal4cewFmlE91S1kcaVUzj	2018-01-25 11:51:18.535335+00	read write groups	1	16	2018-01-25 01:51:18.535849+00	2018-01-25 01:51:18.535864+00
50	VyyLdK6ym3sDuQMAYwFnggq6NPJRA3	2018-01-29 03:40:41.803702+00	read write groups	1	17	2018-01-28 17:40:41.804121+00	2018-01-28 17:40:41.804137+00
51	q2NzJPUH9pgHc5KWov7v8Uq6AxBJ1h	2018-01-30 12:38:42.388429+00	read write groups	1	16	2018-01-30 02:38:42.388806+00	2018-01-30 02:38:42.388821+00
52	6bqL5o4Ej3a3T8cOPxoFJIRYOfKuBW	2018-01-30 12:40:08.234145+00	read write groups	1	17	2018-01-30 02:40:08.234521+00	2018-01-30 02:40:08.234536+00
53	B9agvgTKT8x9vFqBKnE4xtY3MUIZgR	2018-01-31 09:41:54.387752+00	read write groups	1	21	2018-01-30 23:41:54.391271+00	2018-01-30 23:41:54.391287+00
54	zLq81MgYKxgFBMcverXBkZuPLA7zee	2018-01-31 11:44:14.472937+00	read write groups	1	17	2018-01-31 01:44:14.47334+00	2018-01-31 01:44:14.473355+00
56	PXO6CQYTNX94gcLUQot0hoOYZqdUKz	2018-02-01 08:09:07.612669+00	read write groups	1	17	2018-01-31 22:09:07.613073+00	2018-01-31 22:09:07.613088+00
57	nB6RxlIBvlcjQs7EriCWvv8TJIpbsi	2018-02-01 09:27:39.309736+00	read write groups	1	16	2018-01-31 23:27:39.310647+00	2018-01-31 23:27:39.310665+00
58	qIqbethlj8O320uApbR2sZ1BHn8TKH	2018-02-01 09:35:35.802594+00	read write groups	1	24	2018-01-31 23:35:35.802947+00	2018-01-31 23:35:35.802963+00
59	VtLq2mp5f7tykYrCC3HLFab5xRsM8H	2018-02-01 10:08:05.704057+00	read write groups	1	17	2018-02-01 00:08:05.704456+00	2018-02-01 00:08:05.704472+00
60	71r6QRqNwtrfbEecYNWNHXhp5Q0Guj	2018-02-01 10:12:48.029726+00	read write groups	1	17	2018-02-01 00:12:48.030102+00	2018-02-01 00:12:48.030117+00
61	5LBkli0OYwZksd2jiVdD4Z1N9JgjhQ	2018-02-01 10:21:55.091092+00	read write groups	1	17	2018-02-01 00:21:55.091477+00	2018-02-01 00:21:55.091494+00
62	UthshHvmyT6d5nio4jvdOAcXKHPDwa	2018-02-01 10:29:27.743195+00	read write groups	1	16	2018-02-01 00:29:27.743573+00	2018-02-01 00:29:27.74359+00
63	SDfshPHtC9tB8xi6tEaIMr9ioR1tEe	2018-02-01 10:30:33.603045+00	read write groups	1	17	2018-02-01 00:30:33.603447+00	2018-02-01 00:30:33.603464+00
64	NB9WsLUkuNHgFx5Xe3Y2bqwKWGvcIQ	2018-02-01 10:30:48.765988+00	read write groups	1	16	2018-02-01 00:30:48.766376+00	2018-02-01 00:30:48.766391+00
65	MpJjeeZVvTwcpplNjxH3qj7FiFdOeI	2018-02-01 10:32:12.719827+00	read write groups	1	17	2018-02-01 00:32:12.720171+00	2018-02-01 00:32:12.7202+00
68	pCtzAXelPuDT7YaVkflS1NTYuSYBDo	2018-02-01 10:49:35.606705+00	read write groups	1	28	2018-02-01 00:49:35.607118+00	2018-02-01 00:49:35.607133+00
69	JKD9D5a3f5sc0DRSdr8ZkZM3mSmDIP	2018-02-01 12:39:02.278503+00	read write groups	1	16	2018-02-01 02:39:02.278919+00	2018-02-01 02:39:02.27894+00
70	BK82EkHFKZir4sGsjn4HQCADmFAqFM	2018-02-01 13:58:39.564453+00	read write groups	1	28	2018-02-01 03:58:39.564885+00	2018-02-01 03:58:39.564902+00
71	tlJW1xenefh6Cb5Dm3Wh0CcDyaL5Ga	2018-02-01 14:24:43.521025+00	read write groups	1	28	2018-02-01 04:24:43.521438+00	2018-02-01 04:24:43.521454+00
72	PGKelNoqiTicrn1HNtFervqiTQrFft	2018-02-01 14:27:09.332769+00	read write groups	1	28	2018-02-01 04:27:09.333194+00	2018-02-01 04:27:09.33321+00
73	ukBwZTCupp94VWo2fmH8qCh8UPlcuD	2018-02-01 14:27:39.37922+00	read write groups	1	28	2018-02-01 04:27:39.379619+00	2018-02-01 04:27:39.379635+00
74	s17pZLToakW39SA6GGMWC0TPy00Dt6	2018-02-01 14:31:59.418231+00	read write groups	1	29	2018-02-01 04:31:59.418624+00	2018-02-01 04:31:59.41864+00
75	EDiz3ub4jOZuAVoN4SguIimur9vGA7	2018-02-01 15:05:36.927538+00	read write groups	1	30	2018-02-01 05:05:36.927892+00	2018-02-01 05:05:36.927909+00
76	bgGYb7iSneAOdxQtMlLCYI2ERKkmmy	2018-02-01 15:05:57.132209+00	read write groups	1	28	2018-02-01 05:05:57.132601+00	2018-02-01 05:05:57.132617+00
77	9jhdcHMS1ImukzUcyLBLS4WurFf23k	2018-02-01 16:27:53.423493+00	read write groups	1	28	2018-02-01 06:27:53.423974+00	2018-02-01 06:27:53.42399+00
78	CE4jLv0xINB8MJyv8miStpnsFysa85	2018-02-01 17:26:40.098384+00	read write groups	1	31	2018-02-01 07:26:40.098783+00	2018-02-01 07:26:40.0988+00
79	ZmvLijo9ezi6MsOK3HG1Q2YSurgkGU	2018-02-01 17:37:27.130363+00	read write groups	1	32	2018-02-01 07:37:27.13073+00	2018-02-01 07:37:27.130757+00
80	0n4yJvwn5yfb5yiVxSy1p0cApxzydW	2018-02-01 17:41:09.364509+00	read write groups	1	32	2018-02-01 07:41:09.364919+00	2018-02-01 07:41:09.364935+00
81	CvMUZ9iBSYQkLuKYI6t74KVHGW7fKp	2018-02-01 17:49:59.684667+00	read write groups	1	33	2018-02-01 07:49:59.68502+00	2018-02-01 07:49:59.685036+00
82	JpjPwv0544gh6mCOfIJVs6SB0R04lX	2018-02-01 18:15:27.910026+00	read write groups	1	34	2018-02-01 08:15:27.910435+00	2018-02-01 08:15:27.91045+00
83	krxa2infVPFRTEbswuoq2jQWkS68ez	2018-02-01 19:30:34.733683+00	read write groups	1	29	2018-02-01 09:30:34.734019+00	2018-02-01 09:30:34.734034+00
84	7133jKMBbPw3zMzqSfFxAr6N1QX7yy	2018-02-02 03:22:42.055504+00	read write groups	1	35	2018-02-01 17:22:42.055893+00	2018-02-01 17:22:42.055908+00
85	xwrRhWlsr6PQoSrtLQqxBW2A2EZG7U	2018-02-02 04:58:09.947175+00	read write groups	1	34	2018-02-01 18:58:09.947537+00	2018-02-01 18:58:09.947553+00
86	ueqx8SMhcCoKHoKtnnxKgnXpUlxkRm	2018-02-02 10:06:07.846173+00	read write groups	1	36	2018-02-02 00:06:07.84652+00	2018-02-02 00:06:07.846536+00
87	4BwlcaKqHK23csXss19CZU8PUJZrBu	2018-02-02 10:36:44.702048+00	read write groups	1	37	2018-02-02 00:36:44.702411+00	2018-02-02 00:36:44.702427+00
88	zehTnYQR65fIfGi9yRZ6TxwugkFZRZ	2018-02-04 14:24:29.230649+00	read write groups	1	35	2018-02-04 04:24:29.231059+00	2018-02-04 04:24:29.231074+00
89	qKKmmNNWsdH0JSwX9doAZqQcPpJsi7	2018-02-04 16:35:46.961018+00	read write groups	1	17	2018-02-04 06:35:46.961349+00	2018-02-04 06:35:46.961364+00
90	8GNOq8Gb7nGEOncHgsmWlQbY0CrtDC	2018-02-04 20:21:42.59426+00	read write groups	1	21	2018-02-04 10:21:42.594622+00	2018-02-04 10:21:42.594638+00
91	0Z5t54b9giBRDhl7rykt7WEs8ziPmC	2018-02-05 00:38:10.509807+00	read write groups	1	38	2018-02-04 14:38:10.510191+00	2018-02-04 14:38:10.510206+00
92	UcLGoRBbZkefLCRv1KdXL8Su98o0aH	2018-02-05 10:48:03.156023+00	read write groups	1	21	2018-02-05 00:48:03.15641+00	2018-02-05 00:48:03.156425+00
93	IdluETKFIHWwN6cFSmp0yVqxvyV566	2018-02-05 11:20:56.096355+00	read write groups	1	16	2018-02-05 01:20:56.096746+00	2018-02-05 01:20:56.096762+00
94	C8frEAKtRoeqD5OJY8QOriAEP8SdB0	2018-02-06 02:57:03.106985+00	read write groups	1	39	2018-02-05 16:57:03.107387+00	2018-02-05 16:57:03.107403+00
95	RnJvM0S1tZn0pRWg7hn7LQ7UcVpvNr	2018-02-06 08:47:23.467361+00	read write groups	1	32	2018-02-05 22:47:23.467759+00	2018-02-05 22:47:23.467774+00
96	VE2HajjWVXJ8Ue02qFLyb5iAfsMI1c	2018-02-07 12:33:22.52404+00	read write groups	1	40	2018-02-07 02:33:22.52461+00	2018-02-07 02:33:22.524627+00
97	nXShjQDJCjXcpsPF5LoqjtpVgfHpLR	2018-02-07 12:49:47.692983+00	read write groups	1	40	2018-02-07 02:49:47.693337+00	2018-02-07 02:49:47.693352+00
98	ECpcFhbz5saeSZtVO1kkvwiTQiY0N8	2018-02-07 14:03:01.610583+00	read write groups	1	32	2018-02-07 04:03:01.610987+00	2018-02-07 04:03:01.611003+00
99	71MBahSpFPhMCFvblFasMJCp5qigyN	2018-02-07 14:03:42.543676+00	read write groups	1	17	2018-02-07 04:03:42.544002+00	2018-02-07 04:03:42.544018+00
100	Fze3gR8fIfdKDTWtmtsVJZKhOEk74W	2018-02-07 14:04:07.103791+00	read write groups	1	32	2018-02-07 04:04:07.104198+00	2018-02-07 04:04:07.104214+00
101	sv4uIpGP6T9TxZmpOl61kNqht0QJgz	2018-02-08 13:52:03.87877+00	read write groups	1	32	2018-02-08 03:52:03.90862+00	2018-02-08 03:52:03.908646+00
102	LhEaNWbCedkNrGGQ17oGU7Q1F4n57Y	2018-02-08 14:08:02.155821+00	read write groups	1	32	2018-02-08 04:08:02.156367+00	2018-02-08 04:08:02.156382+00
103	JTj5c9VeariFwZiEW2UjqnqbDr6qmr	2018-02-08 14:28:09.399212+00	read write groups	1	41	2018-02-08 04:28:09.399775+00	2018-02-08 04:28:09.399791+00
104	gtaOv4lyUb6mZKyn6q5kHTZNEkzRvX	2018-02-28 13:45:56.571425+00	read write groups	1	41	2018-02-28 03:45:56.571986+00	2018-02-28 03:45:56.572002+00
105	igq0o7dn3UlNQdh3MuLFEb7LFlpedj	2018-02-28 13:46:02.952675+00	read write groups	1	21	2018-02-28 03:46:02.953043+00	2018-02-28 03:46:02.953058+00
106	HS4LrabtdIstLBZUs9avhPcapSDH69	2018-02-28 13:51:58.757839+00	read write groups	1	21	2018-02-28 03:51:58.758276+00	2018-02-28 03:51:58.75829+00
107	W7ocGl4x6VHahpyolEDwPfpB3zn6Em	2018-03-02 04:50:23.407058+00	read write groups	1	17	2018-03-01 18:50:23.407486+00	2018-03-01 18:50:23.407502+00
108	QhopEW0JGhSqpXk4WzHvUh7DgYnHIp	2018-03-02 12:24:30.267417+00	read write groups	1	17	2018-03-02 02:24:30.267835+00	2018-03-02 02:24:30.26785+00
109	Yy4vxGTqRJNQ62foQDWwGzSJZB2Dic	2018-03-02 12:26:38.131984+00	read write groups	1	17	2018-03-02 02:26:38.132389+00	2018-03-02 02:26:38.132404+00
110	abF48JjXHR3H5ES4BWQmqweJ3d37LI	2018-03-02 12:46:32.525373+00	read write groups	1	42	2018-03-02 02:46:32.525705+00	2018-03-02 02:46:32.525721+00
111	J8LhPJ1whVcnqUltW1VhrSpZHYLMn5	2018-03-02 12:47:37.697817+00	read write groups	1	43	2018-03-02 02:47:37.69816+00	2018-03-02 02:47:37.698175+00
112	yqIhLet5e33eSWBPTq1roelrKtlnlZ	2018-03-02 12:47:41.188013+00	read write groups	1	17	2018-03-02 02:47:41.188454+00	2018-03-02 02:47:41.188469+00
113	RMWb0XaFulSzUhxtOSlPFvDLgxndAu	2018-03-02 12:47:53.131176+00	read write groups	1	44	2018-03-02 02:47:53.131579+00	2018-03-02 02:47:53.131594+00
114	aUZbQcxF50EyNBKkER6tpUco2ByNBR	2018-03-02 13:19:36.040694+00	read write groups	1	17	2018-03-02 03:19:36.041042+00	2018-03-02 03:19:36.041056+00
115	vSMTlkaepePK38qadcvo1pbkIldDjj	2018-03-02 13:46:09.299044+00	read write groups	1	45	2018-03-02 03:46:09.299428+00	2018-03-02 03:46:09.299443+00
116	wiae6woPv07ypzxkph1EyY3GE4ozWm	2018-03-02 13:46:10.503782+00	read write groups	1	46	2018-03-02 03:46:10.50419+00	2018-03-02 03:46:10.504206+00
117	LPLm9xPxaosijnTeDGUU9mqpfZ2uNt	2018-03-02 13:52:54.757881+00	read write groups	1	17	2018-03-02 03:52:54.758302+00	2018-03-02 03:52:54.758318+00
118	YjvJWp3ye43hJgPkdO4PnILcEDmJ9P	2018-03-02 14:07:08.2991+00	read write groups	1	41	2018-03-02 04:07:08.299516+00	2018-03-02 04:07:08.299532+00
119	LdB57OOraWB4bBGK8QEkLWsEgP1b1G	2018-03-02 14:16:25.301192+00	read write groups	1	47	2018-03-02 04:16:25.301575+00	2018-03-02 04:16:25.301591+00
120	5yJnb87QVjX9apyPWNwWRp17RbiLnF	2018-03-02 14:26:27.030376+00	read write groups	1	47	2018-03-02 04:26:27.030711+00	2018-03-02 04:26:27.030727+00
121	z6ol2hsXNrvdUCZwClewmRBd9tZYg1	2018-03-02 15:25:09.243157+00	read write groups	1	16	2018-03-02 05:25:09.243572+00	2018-03-02 05:25:09.243587+00
122	n2kGs3bhYA9mkemf4zJz0y6nWBVwuj	2018-03-02 15:30:31.416381+00	read write groups	1	48	2018-03-02 05:30:31.416753+00	2018-03-02 05:30:31.416769+00
123	axjEMVRzjQxONgyHeRjZQA1gMSqDGM	2018-03-07 13:50:40.977618+00	read write groups	1	16	2018-03-07 03:50:40.977951+00	2018-03-07 03:50:40.977966+00
124	PNXPFJ4fmcJ2Ev4N52as34enunoWDh	2018-03-07 13:52:15.690318+00	read write groups	1	21	2018-03-07 03:52:15.690713+00	2018-03-07 03:52:15.69073+00
125	CrPHOrNGQod7aJTQr4jD4oX08XLWIT	2018-03-07 13:52:22.359019+00	read write groups	1	17	2018-03-07 03:52:22.359408+00	2018-03-07 03:52:22.359423+00
126	krVMxiQkhvkGYE6ZvWU8p3HsM2j4Ez	2018-03-07 13:52:47.649715+00	read write groups	1	32	2018-03-07 03:52:47.650117+00	2018-03-07 03:52:47.650133+00
127	GV0USGplZlLXLZzSf3C5zflR0vBYUQ	2018-03-07 14:01:38.976449+00	read write groups	1	16	2018-03-07 04:01:38.976781+00	2018-03-07 04:01:38.976797+00
128	CbWoAHdSb4Qhc0I7eVOQY5QnKQHz25	2018-03-08 09:58:29.990124+00	read write groups	1	47	2018-03-07 23:58:29.990494+00	2018-03-07 23:58:29.99051+00
129	rZDVe0Gfu9YEJuaUhfkAmifVAukWTJ	2018-03-09 04:37:26.667831+00	read write groups	1	16	2018-03-08 18:37:26.668163+00	2018-03-08 18:37:26.668179+00
130	Ft8ZUhgo1c0OZLgz8rrlC5DjQaklyA	2018-03-10 11:23:52.809321+00	read write groups	1	17	2018-03-10 01:23:52.809678+00	2018-03-10 01:23:52.809694+00
131	Uv7PfwGIorjb9aL9Fh0lps2VYH0xfi	2018-03-15 04:57:12.347815+00	read write groups	1	49	2018-03-14 18:57:12.348123+00	2018-03-14 18:57:12.348138+00
132	gPQqQaB8oRMzKvvrpQT5CGSqFy9y2z	2018-03-15 09:59:32.858935+00	read write groups	1	16	2018-03-14 23:59:32.859286+00	2018-03-14 23:59:32.859302+00
133	AiBirqiRsrOTBWTp3y5rjTkfppczon	2018-03-15 11:08:23.702046+00	read write groups	1	17	2018-03-15 01:08:23.702566+00	2018-03-15 01:08:23.702582+00
134	cEUrkyhl1YaDzasPi0vou3SqClQPiS	2018-03-15 11:08:39.528987+00	read write groups	1	32	2018-03-15 01:08:39.529345+00	2018-03-15 01:08:39.529359+00
135	Q3vM8yV69NUBl1XCfx8AoHHQGVK7hv	2018-03-15 11:19:00.416256+00	read write groups	1	16	2018-03-15 01:19:00.41659+00	2018-03-15 01:19:00.416605+00
136	9ICYJiFXsy6KWQIzbOtwOHYPXZyd0o	2018-03-15 11:19:41.326938+00	read write groups	1	53	2018-03-15 01:19:41.327251+00	2018-03-15 01:19:41.327266+00
137	d8IxjexAZJi5iTrjHnnoCbQT2sMhdR	2018-03-15 11:28:28.530617+00	read write groups	1	41	2018-03-15 01:28:28.531109+00	2018-03-15 01:28:28.531138+00
138	4PyFgQ9Tlql8FwBQggRoyLFFoV1yjg	2018-03-15 11:44:01.054937+00	read write groups	1	32	2018-03-15 01:44:01.055431+00	2018-03-15 01:44:01.055447+00
139	zbhHjbf1abEo2dv3o4reZuIBAIKCmA	2018-03-15 11:47:36.569976+00	read write groups	1	59	2018-03-15 01:47:36.570277+00	2018-03-15 01:47:36.570291+00
140	oM5SSAWT30MDiRyrw37EARpUIgcee8	2018-03-15 11:49:12.449114+00	read write groups	1	59	2018-03-15 01:49:12.449483+00	2018-03-15 01:49:12.449505+00
141	PeuHWx74OnKjujStgwPYPPCVLMlfX2	2018-03-15 11:51:03.800152+00	read write groups	1	60	2018-03-15 01:51:03.800459+00	2018-03-15 01:51:03.800475+00
142	md3ceUKIcMFFw7MKmFic3P73UbSKIv	2018-03-15 11:51:40.918908+00	read write groups	1	60	2018-03-15 01:51:40.919218+00	2018-03-15 01:51:40.919232+00
143	e8MWWpIknqGEph3GRmfGjLMcJU5MdI	2018-03-15 11:57:10.498968+00	read write groups	1	17	2018-03-15 01:57:10.49934+00	2018-03-15 01:57:10.499356+00
144	5nQg3rcmREp47TrkUzKmyWOMaR6rRY	2018-03-15 12:17:34.127708+00	read write groups	1	61	2018-03-15 02:17:34.128055+00	2018-03-15 02:17:34.128069+00
145	OucTleY3P8ORUEyjyjqHtc9EpmkCaP	2018-03-15 12:18:20.308769+00	read write groups	1	61	2018-03-15 02:18:20.309059+00	2018-03-15 02:18:20.309077+00
146	ocgubPiJMVQt1V1DB1x215odBGVrYq	2018-03-15 12:18:54.605596+00	read write groups	1	17	2018-03-15 02:18:54.605936+00	2018-03-15 02:18:54.605951+00
147	B3zxhzbuF33l1QUhc4uwDHKTt2Eufk	2018-03-16 12:28:10.575545+00	read write groups	1	32	2018-03-16 02:28:10.576099+00	2018-03-16 02:28:10.576115+00
148	wGzCPX8rmflkAg0A1Iww8LhHBFc6QF	2018-03-16 12:29:33.568968+00	read write groups	1	32	2018-03-16 02:29:33.56929+00	2018-03-16 02:29:33.569305+00
149	u8qQLCimG8zmXnThitd7Wo2d9FZEYm	2018-03-30 02:56:26.008627+00	read write groups	1	62	2018-03-29 16:56:26.009037+00	2018-03-29 16:56:26.009052+00
150	QG8W3pmp8jgNzD9xkhqQMx3E813LAn	2018-03-30 09:33:48.866731+00	read write groups	1	16	2018-03-29 23:33:48.86704+00	2018-03-29 23:33:48.867055+00
151	x9zZ5aMZYx1jzRhuExTSWeePquhsIt	2018-03-31 10:44:11.316625+00	read write groups	1	17	2018-03-31 00:44:11.316989+00	2018-03-31 00:44:11.317003+00
152	ZsXA7PtGGXZoAzN5L30XQC0RlbUiIT	2018-03-31 10:44:11.327258+00	read write groups	1	17	2018-03-31 00:44:11.327497+00	2018-03-31 00:44:11.327511+00
153	2UCNWNt2tJMQ74XOx1kYPbmttWG7jM	2018-03-31 10:44:24.282023+00	read write groups	1	17	2018-03-31 00:44:24.282352+00	2018-03-31 00:44:24.282366+00
154	tIuXcdxJNwWf5bSU7iSRMody62FyXK	2018-04-04 14:44:31.210685+00	read write groups	1	32	2018-04-04 04:44:31.211262+00	2018-04-04 04:44:31.211278+00
155	TDiMAtWrUcKO1CX26iYwV4QWxJf7Ez	2018-04-04 14:51:55.344887+00	read write groups	1	32	2018-04-04 04:51:55.345207+00	2018-04-04 04:51:55.345221+00
156	TGfA3TiTHdtK4AdL3M5eT4znNfHFyx	2018-04-05 13:43:50.744407+00	read write groups	1	63	2018-04-05 03:43:50.744742+00	2018-04-05 03:43:50.744756+00
157	AcUDr6zzRZyZcYNz6L9Nlt7ugtC298	2018-04-05 13:55:27.159905+00	read write groups	1	64	2018-04-05 03:55:27.160197+00	2018-04-05 03:55:27.160211+00
158	IYtimWiDD8buqsHYhq5hdgoYQNV0fM	2018-04-05 13:59:19.685248+00	read write groups	1	47	2018-04-05 03:59:19.685609+00	2018-04-05 03:59:19.685624+00
159	Rb7NPGD3t2mWbjS1WSyAIzYMtbtoWG	2018-04-07 15:07:41.067373+00	read write groups	1	16	2018-04-07 05:07:41.067704+00	2018-04-07 05:07:41.06772+00
160	VROE2UdcMMNJxMC4mdSfaDr4EfpfMq	2018-04-09 14:03:26.450228+00	read write groups	1	32	2018-04-09 04:03:26.450568+00	2018-04-09 04:03:26.450583+00
161	KiW2y1MdbZWZJZNnKxNiHvyi6WEmkM	2018-04-10 02:42:13.81168+00	read write groups	1	47	2018-04-09 16:42:13.812069+00	2018-04-09 16:42:13.812085+00
162	QjaUszeBj2kTMoq8nemr3FhsNCVdOa	2018-04-10 09:05:25.757424+00	read write groups	1	17	2018-04-09 23:05:25.757798+00	2018-04-09 23:05:25.757814+00
163	Bb5SGOTkiQpwbQnPbbRXPXkhyMoQAO	2018-04-10 09:29:13.558517+00	read write groups	1	17	2018-04-09 23:29:13.558936+00	2018-04-09 23:29:13.558952+00
164	e53cpFBNCmNZfoDZwYGQydz5QNq6PX	2018-04-10 09:39:03.069108+00	read write groups	1	17	2018-04-09 23:39:03.069439+00	2018-04-09 23:39:03.069455+00
165	Jg0Hgv5jRHIXO9kZfpkaRovlQQyjvP	2018-04-10 09:47:39.226775+00	read write groups	1	17	2018-04-09 23:47:39.227077+00	2018-04-09 23:47:39.227092+00
166	kS3hCqmkiJrdYlfEjFzGSHj1qbG6OW	2018-04-12 06:56:40.507771+00	read write groups	1	47	2018-04-11 20:56:40.508137+00	2018-04-11 20:56:40.508151+00
167	zOVgY3q2M3lphWcWeg7B2j4SlhUC7Y	2018-04-12 12:37:31.857459+00	read write groups	1	41	2018-04-12 02:37:31.857869+00	2018-04-12 02:37:31.857883+00
168	KMT2fQD0YnNMyoAQAMLidEDYM9Abjl	2018-04-12 12:37:37.147407+00	read write groups	1	17	2018-04-12 02:37:37.147727+00	2018-04-12 02:37:37.147741+00
169	WjNPO99WJogubzVKbZTxz2pDOkPDT9	2018-04-12 12:39:26.120565+00	read write groups	1	21	2018-04-12 02:39:26.120981+00	2018-04-12 02:39:26.120996+00
170	PeVBG4ojk9WFxo6k7NSgZmRQAMqN00	2018-04-12 12:47:57.908087+00	read write groups	1	21	2018-04-12 02:47:57.908434+00	2018-04-12 02:47:57.908449+00
171	i6ZTy1gNKLjcUh86DjHG68WWZWaILI	2018-04-12 13:56:35.715593+00	read write groups	1	64	2018-04-12 03:56:35.715983+00	2018-04-12 03:56:35.715997+00
172	jPUTBN5CXFBb1Eg7bIHQJSUalvvAXw	2018-04-12 14:22:54.697136+00	read write groups	1	65	2018-04-12 04:22:54.697545+00	2018-04-12 04:22:54.697561+00
173	J1vPMrf15ORIj0n7w7q4J9XmGQ9zFW	2018-04-12 15:16:37.363664+00	read write groups	1	16	2018-04-12 05:16:37.364025+00	2018-04-12 05:16:37.364053+00
174	7ebxqA8kx76DNOXmRGAU1OHO08n7Hv	2018-04-14 09:23:32.86494+00	read write groups	1	21	2018-04-13 23:23:32.865314+00	2018-04-13 23:23:32.865329+00
175	bfndgiXaxwa4JELkbADf4WMRl0deEs	2018-04-17 15:13:30.779959+00	read write groups	1	17	2018-04-17 05:13:30.78028+00	2018-04-17 05:13:30.780296+00
176	1WAXWwkPlhzTGiVBJhEAG0hYRfPhol	2018-04-18 13:24:06.81649+00	read write groups	1	17	2018-04-18 03:24:06.816903+00	2018-04-18 03:24:06.816918+00
177	n1kCpNwkUk9HjKSJmXIdRjwcJlYDQ5	2018-04-23 11:29:47.569557+00	read write groups	1	16	2018-04-23 01:29:47.569908+00	2018-04-23 01:29:47.569923+00
178	wZ57Vv3Tvj1LGwyNqkJtr77J7lBOEA	2018-04-24 02:40:47.945644+00	read write groups	1	40	2018-04-23 16:40:47.945995+00	2018-04-23 16:40:47.946011+00
179	dbwk7fT8Mo6brrSK4ctoZaJRILaYXN	2018-04-25 11:59:56.566171+00	read write groups	1	16	2018-04-25 01:59:56.566474+00	2018-04-25 01:59:56.566487+00
180	m3eJfm4UOmr1uHqBfvz9lxf0nc7Mmq	2018-04-25 13:32:01.193012+00	read write groups	1	16	2018-04-25 03:32:01.19342+00	2018-04-25 03:32:01.193435+00
181	h7Bn5Ww8vTeCGXqQlKvS00NEEdRczp	2018-05-01 07:59:33.083914+00	read write groups	1	40	2018-04-30 21:59:33.084242+00	2018-04-30 21:59:33.084257+00
182	1PlPUSBUlI54aTQhEizQZGS51SjeJo	2018-05-01 11:34:04.74511+00	read write groups	1	40	2018-05-01 01:34:04.745418+00	2018-05-01 01:34:04.745433+00
183	IqfAk0MJqZSxTInvS4AjpBxbKy3tl1	2018-05-01 16:11:49.292879+00	read write groups	1	21	2018-05-01 06:11:49.29321+00	2018-05-01 06:11:49.293226+00
184	BQYBShVVmpd0u5DWrUf1wZEdZrnoQI	2018-05-04 00:52:20.554062+00	read write groups	1	16	2018-05-03 14:52:20.554451+00	2018-05-03 14:52:20.554466+00
185	jSn9w0BgAJYdhCtmBmPHOUGGos4Air	2018-05-04 16:51:13.001111+00	read write groups	1	64	2018-05-04 06:51:13.001553+00	2018-05-04 06:51:13.001568+00
186	W6kJbqPlkIlzqsgbyu4kAaYu1E5Igs	2018-05-04 17:00:03.497214+00	read write groups	1	66	2018-05-04 07:00:03.497684+00	2018-05-04 07:00:03.4977+00
187	F3TM4Jd6JIkkogLOJ4iWz2woAxlHhR	2018-05-04 17:05:02.979317+00	read write groups	1	67	2018-05-04 07:05:02.97973+00	2018-05-04 07:05:02.979746+00
188	Cwneo6DaU2VoSlUFw67c12kJFL6wgP	2018-05-11 01:47:42.316089+00	read write groups	1	16	2018-05-10 15:47:42.318816+00	2018-05-10 15:47:42.318851+00
189	rLMY0uRmUmztIy4MfrQMsIqAVc9uGi	2018-05-16 12:34:42.060233+00	read write groups	1	16	2018-05-16 02:34:42.06061+00	2018-05-16 02:34:42.060626+00
190	zruCSaFZVm3NR8MGWQVF0tUQTfmkCB	2018-05-16 12:36:04.58654+00	read write groups	1	17	2018-05-16 02:36:04.586874+00	2018-05-16 02:36:04.58689+00
191	c3VFEK4wOzChGR6I7E5NudPjkME3Cw	2018-05-16 12:37:21.527685+00	read write groups	1	64	2018-05-16 02:37:21.527994+00	2018-05-16 02:37:21.52801+00
192	ay3K1OIT2t8dZ4u1Pc9HfcX3vtdOgp	2018-05-19 05:06:13.770418+00	read write groups	1	47	2018-05-18 19:06:13.770762+00	2018-05-18 19:06:13.770776+00
193	vHWAsjuo4S9tcDr163Z9k5j8eMOFGi	2018-05-22 03:49:43.810991+00	read write groups	1	17	2018-05-21 17:49:43.811291+00	2018-05-21 17:49:43.811305+00
194	mlGbHG1P7c7rY4dnwQ1JYkhEFCaor5	2018-05-22 07:48:08.430948+00	read write groups	1	32	2018-05-21 21:48:08.431302+00	2018-05-21 21:48:08.431318+00
195	nIgAwgoP5268d4vfTAtQxSsUpReYft	2018-05-22 16:49:45.224891+00	read write groups	1	76	2018-05-22 06:49:45.225239+00	2018-05-22 06:49:45.225255+00
196	KBb25Tvr99BJOmLLgHAoX5nDmOLuDU	2018-05-24 02:45:10.024149+00	read write groups	1	77	2018-05-23 16:45:10.024438+00	2018-05-23 16:45:10.024452+00
197	wCcR3F1CE8O3XUTolMY5KjZZggCVcR	2018-05-24 03:32:41.952061+00	read write groups	1	78	2018-05-23 17:32:41.952414+00	2018-05-23 17:32:41.95243+00
198	ESLY2IO3YKLL4VquE533FrNSgJlu2v	2018-05-24 05:39:37.368507+00	read write groups	1	79	2018-05-23 19:39:37.368841+00	2018-05-23 19:39:37.368857+00
199	COdc8UcLEPeDtSPZVgANwsIGQUrKLY	2018-05-24 05:43:06.078889+00	read write groups	1	80	2018-05-23 19:43:06.079232+00	2018-05-23 19:43:06.079247+00
200	cdx7Cov9nR4FKXc0NXE7lnQ95JFyxU	2018-05-24 05:44:02.052582+00	read write groups	1	80	2018-05-23 19:44:02.052909+00	2018-05-23 19:44:02.052923+00
201	DIxvFXy8KevsD6xAswmsxeiBLHBjXz	2018-05-24 05:44:23.584511+00	read write groups	1	81	2018-05-23 19:44:23.58483+00	2018-05-23 19:44:23.584844+00
202	bczoGv5gKFpxswgTuAaZcez6PnMgsY	2018-05-24 05:45:23.138048+00	read write groups	1	82	2018-05-23 19:45:23.138356+00	2018-05-23 19:45:23.138371+00
203	vZmW6lH6l1e0IA4Y6ymEYmMG4GrkyN	2018-05-24 05:46:22.594589+00	read write groups	1	82	2018-05-23 19:46:22.594917+00	2018-05-23 19:46:22.594933+00
204	cazvB0uYteQgAuMUNBDRJFGBURJKrw	2018-05-24 05:51:49.485624+00	read write groups	1	82	2018-05-23 19:51:49.485915+00	2018-05-23 19:51:49.485928+00
205	ZGPs9UjwtiKeESR9Ew6bDdrMPpekMJ	2018-05-24 05:54:56.937358+00	read write groups	1	83	2018-05-23 19:54:56.937698+00	2018-05-23 19:54:56.937713+00
206	OYC5cubdSkymDOvFk9iG3XQNY1cRQu	2018-05-24 05:55:40.422283+00	read write groups	1	86	2018-05-23 19:55:40.422595+00	2018-05-23 19:55:40.422611+00
207	yRanWKRKBgV3PmomPJ0jZ4uwFugvHe	2018-05-24 05:57:15.947667+00	read write groups	1	89	2018-05-23 19:57:15.94798+00	2018-05-23 19:57:15.947994+00
208	ROQCOmACVdGQ7Hp2ANgqdqs20kWD92	2018-05-24 05:58:04.900757+00	read write groups	1	90	2018-05-23 19:58:04.901061+00	2018-05-23 19:58:04.901076+00
209	0Bfr211OiXeE63h9PtsEbiCIpWRjnK	2018-05-24 05:58:20.350317+00	read write groups	1	91	2018-05-23 19:58:20.350608+00	2018-05-23 19:58:20.350622+00
210	T49RJmFXoVRDaLR2XYFRoNKagHaHZn	2018-05-24 05:59:21.611115+00	read write groups	1	92	2018-05-23 19:59:21.611438+00	2018-05-23 19:59:21.611452+00
211	yAmukGmHkt4TFBbywCu96maMOGlRLL	2018-05-24 06:00:08.325427+00	read write groups	1	92	2018-05-23 20:00:08.325793+00	2018-05-23 20:00:08.325808+00
212	KdplHp7E0HVqwWQvuWOyj3fUcfs8KY	2018-05-24 06:00:31.01907+00	read write groups	1	93	2018-05-23 20:00:31.019393+00	2018-05-23 20:00:31.019409+00
213	of2fO6hMCnHH79K15hw6UMgrHlYXMC	2018-05-24 06:03:47.329668+00	read write groups	1	94	2018-05-23 20:03:47.329953+00	2018-05-23 20:03:47.329967+00
214	NHB8MKc41rlMrDJMHMRk0hh0DqoUqa	2018-05-24 06:05:21.033114+00	read write groups	1	95	2018-05-23 20:05:21.033524+00	2018-05-23 20:05:21.03354+00
215	C6pzCdw5WAPIX3RfwNELKTqQk84kw9	2018-05-24 06:06:28.724897+00	read write groups	1	98	2018-05-23 20:06:28.725211+00	2018-05-23 20:06:28.725227+00
216	XzBLIZOdYHq2rSw8vZGD4LqlVOfWTQ	2018-05-24 06:07:00.18534+00	read write groups	1	98	2018-05-23 20:07:00.185653+00	2018-05-23 20:07:00.185667+00
217	GObh1c0J4bRbGJmDVBfqUp95v6lJNu	2018-05-24 06:11:47.480666+00	read write groups	1	91	2018-05-23 20:11:47.481067+00	2018-05-23 20:11:47.481083+00
218	ce2yUNoae5GVXUhvYBw24SGXyEBJ9K	2018-05-24 06:20:20.925291+00	read write groups	1	99	2018-05-23 20:20:20.925722+00	2018-05-23 20:20:20.925737+00
219	g9UmhnWEDuZr4d2Vgv7UADm51B3RTE	2018-05-24 06:21:26.628652+00	read write groups	1	99	2018-05-23 20:21:26.629011+00	2018-05-23 20:21:26.629026+00
220	Nb8fAx9296Vn1LXUJBsvs2i4mX3rHH	2018-05-24 06:22:05.617928+00	read write groups	1	99	2018-05-23 20:22:05.618251+00	2018-05-23 20:22:05.618266+00
221	YL02SPbOh7nM8xmbyxtM5VJAOiaq9i	2018-05-24 06:26:17.075006+00	read write groups	1	100	2018-05-23 20:26:17.075362+00	2018-05-23 20:26:17.075377+00
222	URwmDfXIU4RuU5WkDFObWIPlQMCRUc	2018-05-24 06:27:11.657056+00	read write groups	1	100	2018-05-23 20:27:11.657486+00	2018-05-23 20:27:11.657505+00
223	bLKm7fkhyusMGl34SnpHkzo8jeuX6n	2018-05-24 06:40:20.195164+00	read write groups	1	102	2018-05-23 20:40:20.195502+00	2018-05-23 20:40:20.195518+00
224	BDVp1ZNUaDlcevGWJOcogwFHNEdENk	2018-05-24 06:43:50.095273+00	read write groups	1	103	2018-05-23 20:43:50.095617+00	2018-05-23 20:43:50.095632+00
225	2gLY39mDHhtudUakn9Spi6pHZ4YlOx	2018-05-24 06:45:42.497253+00	read write groups	1	103	2018-05-23 20:45:42.497583+00	2018-05-23 20:45:42.497599+00
226	dwW41L4me5VsAKDvvXBoHtNajI922v	2018-05-24 06:47:25.167652+00	read write groups	1	104	2018-05-23 20:47:25.168+00	2018-05-23 20:47:25.168023+00
227	temH7JNnRMVxgek7vp0jTKcFefvmLn	2018-05-24 06:50:50.181746+00	read write groups	1	105	2018-05-23 20:50:50.182074+00	2018-05-23 20:50:50.18209+00
228	BJQcleCAHyU5PchwivlEBXrEvUW0qA	2018-05-24 06:51:38.112207+00	read write groups	1	106	2018-05-23 20:51:38.112575+00	2018-05-23 20:51:38.112592+00
229	dyJvgFvPAfALP9KjBAyvBKpNz3leZ4	2018-05-24 06:51:38.589835+00	read write groups	1	105	2018-05-23 20:51:38.59016+00	2018-05-23 20:51:38.590174+00
230	aeItnx4zSMoHMXCi1CS0XFBO1DyUp8	2018-05-24 06:52:23.270386+00	read write groups	1	107	2018-05-23 20:52:23.2707+00	2018-05-23 20:52:23.270716+00
231	6vcUpXNjZrtIdIghXoMOTbcrNxU23j	2018-05-24 06:52:24.483137+00	read write groups	1	108	2018-05-23 20:52:24.483483+00	2018-05-23 20:52:24.483498+00
232	zU7P7TnzfnwwNo3pr9H9vbMZzguAmj	2018-05-24 06:54:52.189351+00	read write groups	1	109	2018-05-23 20:54:52.1897+00	2018-05-23 20:54:52.189715+00
233	83nhaAOH08rJA3V1imvGTVAKRoynRN	2018-05-24 06:55:32.616108+00	read write groups	1	110	2018-05-23 20:55:32.616417+00	2018-05-23 20:55:32.616432+00
234	FkQMyXL2VisKBgcCnNxCJcgmmagL0s	2018-05-24 06:55:46.998948+00	read write groups	1	111	2018-05-23 20:55:46.999286+00	2018-05-23 20:55:46.999302+00
235	fnXnRs1Yf4iHklZ4dfGeffKhRDoHYv	2018-05-24 06:56:16.141175+00	read write groups	1	110	2018-05-23 20:56:16.141544+00	2018-05-23 20:56:16.141561+00
236	MlG11thwRPQHpEOXl3ZbDs59rK3qQE	2018-05-24 06:56:25.362846+00	read write groups	1	108	2018-05-23 20:56:25.363183+00	2018-05-23 20:56:25.363198+00
237	SlBzJzo0MgQgTpZC373VbNG9AmIlVv	2018-05-24 06:56:55.854722+00	read write groups	1	112	2018-05-23 20:56:55.855089+00	2018-05-23 20:56:55.855105+00
238	tXWg1BMmX5Td6Ae08QZ5EsoOs6PWsl	2018-05-24 06:57:34.99053+00	read write groups	1	113	2018-05-23 20:57:34.990842+00	2018-05-23 20:57:34.990857+00
239	0SYpz3xvugtQcArww9DT2XWzHpXhXt	2018-05-24 06:58:16.50753+00	read write groups	1	113	2018-05-23 20:58:16.50785+00	2018-05-23 20:58:16.507865+00
240	aLLZOCt8lQuT0VD10xjYnHOX6Q5PVj	2018-05-24 06:59:21.920147+00	read write groups	1	112	2018-05-23 20:59:21.920528+00	2018-05-23 20:59:21.920543+00
241	u3LqFpfz21fWTjd0KtYM5jIZZvUgVK	2018-05-24 07:04:11.593586+00	read write groups	1	114	2018-05-23 21:04:11.593927+00	2018-05-23 21:04:11.593941+00
242	k6GbgmjAyiQ4Oh4JYE5Aeep9jKO8ze	2018-05-24 07:04:21.013904+00	read write groups	1	115	2018-05-23 21:04:21.014198+00	2018-05-23 21:04:21.014213+00
243	0cIYZlnauBH4KLY4kuvRv5aIhpHjqQ	2018-05-24 07:05:03.33926+00	read write groups	1	115	2018-05-23 21:05:03.339631+00	2018-05-23 21:05:03.339646+00
244	3iMW5A94nkIX2uG88yIMnhMRE0WimX	2018-05-24 07:17:21.032858+00	read write groups	1	103	2018-05-23 21:17:21.033182+00	2018-05-23 21:17:21.033196+00
245	6Dn8WaDzz6nDS6qNFzHYVFSv6EHWw9	2018-05-24 07:20:44.006153+00	read write groups	1	116	2018-05-23 21:20:44.006486+00	2018-05-23 21:20:44.006515+00
246	jX5YENxRxXNajaMbPVj6BXyW6nyrDO	2018-05-24 07:23:17.422278+00	read write groups	1	117	2018-05-23 21:23:17.42262+00	2018-05-23 21:23:17.422635+00
247	Oh9esQ0OWuIHqXCYxur4JPPMHPC2dv	2018-05-24 07:27:41.091394+00	read write groups	1	118	2018-05-23 21:27:41.091709+00	2018-05-23 21:27:41.091725+00
248	N879te5YiIb4jUl7ySsMeuVxY1nmyu	2018-05-24 07:31:46.030829+00	read write groups	1	92	2018-05-23 21:31:46.031167+00	2018-05-23 21:31:46.03118+00
249	sHixWe0mWNNW0z3RFztHGyRZzG1Bhi	2018-05-24 07:40:30.650725+00	read write groups	1	119	2018-05-23 21:40:30.651081+00	2018-05-23 21:40:30.651095+00
250	MgDLVwlvadEmJg7xqlkCgcjoYyGDGW	2018-05-24 07:47:58.15233+00	read write groups	1	120	2018-05-23 21:47:58.152649+00	2018-05-23 21:47:58.152665+00
251	rhnTimn3AUykQpLeTxbP2FXDjkiwm9	2018-05-24 08:24:01.684287+00	read write groups	1	105	2018-05-23 22:24:01.684683+00	2018-05-23 22:24:01.684699+00
252	zQdOcgTXsH1E8U5Bz9cpaVR2p9WrZk	2018-05-24 12:43:37.41697+00	read write groups	1	41	2018-05-24 02:43:37.417559+00	2018-05-24 02:43:37.417576+00
253	zmdCPakFvy4V03TE5o3rnA0EVU6ocb	2018-05-24 12:43:58.222505+00	read write groups	1	47	2018-05-24 02:43:58.222821+00	2018-05-24 02:43:58.222835+00
254	ZVh6N1C3XsQuotP9ymxZj4fpMUMMGH	2018-05-24 12:44:22.650559+00	read write groups	1	16	2018-05-24 02:44:22.650961+00	2018-05-24 02:44:22.650977+00
255	QQTmYogDZ8od28HPpehDPyFXxuxli5	2018-05-24 13:44:46.51975+00	read write groups	1	64	2018-05-24 03:44:46.520167+00	2018-05-24 03:44:46.520194+00
256	Vx6AenUF2QILNtecyVCdUZA4JtMjHl	2018-05-24 13:45:28.21836+00	read write groups	1	16	2018-05-24 03:45:28.218692+00	2018-05-24 03:45:28.218707+00
257	7gS89jfj2yuRiBc99tp8kF1dr79UJr	2018-05-24 14:02:48.283023+00	read write groups	1	29	2018-05-24 04:02:48.283479+00	2018-05-24 04:02:48.283495+00
258	1oXKgHAfyw0J08110qy6gX6TwaL1gm	2018-05-24 14:03:41.130641+00	read write groups	1	29	2018-05-24 04:03:41.130968+00	2018-05-24 04:03:41.130983+00
259	zpkfiLcyrb4Bgj5EkwM7DcA0iWCvrL	2018-05-24 14:05:12.344423+00	read write groups	1	29	2018-05-24 04:05:12.344737+00	2018-05-24 04:05:12.344752+00
260	L5w4BZQUlsalsjtPUkLhnUD0YCeA9W	2018-05-24 14:07:14.040666+00	read write groups	1	121	2018-05-24 04:07:14.040994+00	2018-05-24 04:07:14.041008+00
261	LUXPLrhinue2Ga4VVJPA6dwTryLiVR	2018-05-24 14:07:58.407214+00	read write groups	1	16	2018-05-24 04:07:58.407557+00	2018-05-24 04:07:58.407572+00
262	oRycGYarHifiJk2dsJUcEEzsDZij3p	2018-05-24 14:08:00.37328+00	read write groups	1	121	2018-05-24 04:08:00.373641+00	2018-05-24 04:08:00.373657+00
263	jibRjYvuJhmw4fH5ZexxzoXurOWB0l	2018-05-24 14:23:43.228005+00	read write groups	1	17	2018-05-24 04:23:43.228374+00	2018-05-24 04:23:43.228388+00
264	qFdIAyBp68klzFUIjmQPAGtPAZFRa4	2018-05-24 14:49:00.714178+00	read write groups	1	122	2018-05-24 04:49:00.714506+00	2018-05-24 04:49:00.714522+00
265	yHo1nA0SU8lGvg3aMPwn1ILlbDjhzu	2018-05-24 14:53:51.168832+00	read write groups	1	123	2018-05-24 04:53:51.169158+00	2018-05-24 04:53:51.169171+00
266	0BOIarPQrCfz4lWsVj5LxQ2onPg8VC	2018-05-24 16:13:50.317122+00	read write groups	1	16	2018-05-24 06:13:50.317948+00	2018-05-24 06:13:50.317964+00
267	pNT1pevDXI86K7ROkXlT7glOSK1Rol	2018-05-25 03:33:41.610212+00	read write groups	1	16	2018-05-24 17:33:41.611092+00	2018-05-24 17:33:41.611108+00
268	0lThzk4jqrtEusrK9ELFk7Pof9KEC9	2018-05-25 06:03:19.370694+00	read write groups	1	16	2018-05-24 20:03:19.371026+00	2018-05-24 20:03:19.371042+00
269	eox9D37iLFb6egYNj4H27WHeyWesIx	2018-05-25 07:44:22.419618+00	read write groups	1	124	2018-05-24 21:44:22.419939+00	2018-05-24 21:44:22.419955+00
270	S7UjijWzVAhDTUoObuHUfgwrjqoRls	2018-05-25 07:49:50.601735+00	read write groups	1	32	2018-05-24 21:49:50.602026+00	2018-05-24 21:49:50.60204+00
271	fzBxrVtLkxo830tgZMG63Wubq6mtPu	2018-05-25 08:00:12.443638+00	read write groups	1	32	2018-05-24 22:00:12.443979+00	2018-05-24 22:00:12.443995+00
272	yi3xiZRjXaqUfYDESdA68nkub5HuCo	2018-05-25 08:11:27.928736+00	read write groups	1	29	2018-05-24 22:11:27.929173+00	2018-05-24 22:11:27.929188+00
273	nVKdj1E8t4ty65Ddk9eojLKZ2xCsn3	2018-05-25 09:52:54.799383+00	read write groups	1	17	2018-05-24 23:52:54.799707+00	2018-05-24 23:52:54.799721+00
274	B3B1PO7YcM4Ajt7I8aZLBjqtrIdyws	2018-05-25 10:36:22.780774+00	read write groups	1	125	2018-05-25 00:36:22.781198+00	2018-05-25 00:36:22.781213+00
275	L3UoAASrmRluUzZUC7HgZiE4DFoweK	2018-05-25 12:44:09.648561+00	read write groups	1	126	2018-05-25 02:44:09.648979+00	2018-05-25 02:44:09.648993+00
276	9YWYTwiPIZJgFdUqFrP9bSWs0JiHC1	2018-05-25 13:22:02.343081+00	read write groups	1	47	2018-05-25 03:22:02.343429+00	2018-05-25 03:22:02.343443+00
277	Y2lDLC1qSBLTHu8GdBbvVdMV8ZuNIt	2018-05-25 14:42:37.445806+00	read write groups	1	114	2018-05-25 04:42:37.446139+00	2018-05-25 04:42:37.446154+00
278	VQOwXFXzDsIDEIQnumzRyaO1OPuM1J	2018-05-25 14:47:42.18806+00	read write groups	1	16	2018-05-25 04:47:42.18836+00	2018-05-25 04:47:42.188375+00
279	ZpHAnSuqsNuZlStp4cpB4odKDLzaEs	2018-05-25 15:06:20.944751+00	read write groups	1	40	2018-05-25 05:06:20.945097+00	2018-05-25 05:06:20.945111+00
280	nBr5GslZMYTMlBwtBE3ltuX8a8NaCB	2018-05-25 15:10:56.117832+00	read write groups	1	105	2018-05-25 05:10:56.11823+00	2018-05-25 05:10:56.118245+00
281	5aac1yhK7v4ozozg2VBgBOrXlvd8Cq	2018-05-26 02:34:51.105414+00	read write groups	1	16	2018-05-25 16:34:51.105798+00	2018-05-25 16:34:51.105814+00
282	mak5KIOZC22i546es3C6vna3Mqeljy	2018-05-26 05:19:17.628468+00	read write groups	1	32	2018-05-25 19:19:17.628792+00	2018-05-25 19:19:17.628806+00
283	ernhnjV68hksBKAP55Pm9Zfyvi0vh4	2018-05-26 14:01:42.038403+00	read write groups	1	21	2018-05-26 04:01:42.038754+00	2018-05-26 04:01:42.03877+00
284	A6NwRO0NDRydcveMEcy4OQBh0KvsqC	2018-05-26 14:10:24.223212+00	read write groups	1	127	2018-05-26 04:10:24.223545+00	2018-05-26 04:10:24.22356+00
285	twxasR9Nd4v8J2Z8hGdAL2j5MFsBJa	2018-05-26 14:41:17.472617+00	read write groups	1	16	2018-05-26 04:41:17.473054+00	2018-05-26 04:41:17.47307+00
286	Og4quwWeP5QqsJIch1N9ZoNzZmdxM4	2018-05-26 14:45:05.817111+00	read write groups	1	128	2018-05-26 04:45:05.81756+00	2018-05-26 04:45:05.817576+00
287	1RrOHwQcWOmsDeNM5UqMiTfvXTtX0F	2018-05-26 14:46:31.440588+00	read write groups	1	128	2018-05-26 04:46:31.4409+00	2018-05-26 04:46:31.440914+00
288	JiTJeGw88HKA4KdBk2wn82XRlX4sRb	2018-05-26 14:50:11.633143+00	read write groups	1	128	2018-05-26 04:50:11.633573+00	2018-05-26 04:50:11.633589+00
289	EQcIkIs7YVgDtikzaFFk6CR4F9Mn93	2018-05-26 14:53:08.839222+00	read write groups	1	16	2018-05-26 04:53:08.839658+00	2018-05-26 04:53:08.839674+00
290	St3GGtjsxxiuOu9qWOM91tLTXirhAk	2018-05-26 16:49:47.467435+00	read write groups	1	41	2018-05-26 06:49:47.467892+00	2018-05-26 06:49:47.467907+00
291	cWjQ7mLRJ5oiBsKyVzNno6oZ64FpEk	2018-05-26 17:07:02.336698+00	read write groups	1	129	2018-05-26 07:07:02.337005+00	2018-05-26 07:07:02.337019+00
292	tO7TlXQteo3ejbLbzT0lF3uKHlejDU	2018-05-26 17:08:05.733023+00	read write groups	1	129	2018-05-26 07:08:05.733408+00	2018-05-26 07:08:05.733423+00
293	3xfz7J5liNIraiybrMnvdbxrCYS298	2018-05-26 17:13:17.179787+00	read write groups	1	130	2018-05-26 07:13:17.180106+00	2018-05-26 07:13:17.180121+00
294	PctfEsX99OvkUKKW50D2E2X87ZV8qY	2018-05-26 19:35:20.150719+00	read write groups	1	131	2018-05-26 09:35:20.151132+00	2018-05-26 09:35:20.151147+00
295	2nYDFhZGy08J4NsWcPBW2GsosoUoRd	2018-05-26 19:36:05.554815+00	read write groups	1	131	2018-05-26 09:36:05.555176+00	2018-05-26 09:36:05.555203+00
296	pVlQ9hHMSupmSc7FihpegyW2XHGYDR	2018-05-26 20:15:15.73862+00	read write groups	1	132	2018-05-26 10:15:15.738957+00	2018-05-26 10:15:15.738972+00
297	lPYevp8uy2rb6EryIbXHDHNXvmOjzr	2018-05-26 20:16:20.997617+00	read write groups	1	132	2018-05-26 10:16:20.998068+00	2018-05-26 10:16:20.998083+00
298	9c2y37qTiJ2GD78ubkTz5r87Ucx4hq	2018-05-27 02:21:48.680794+00	read write groups	1	133	2018-05-26 16:21:48.681127+00	2018-05-26 16:21:48.681143+00
299	UoHfKaYjhPzIlLAW8ZPoyuoagEcUZa	2018-05-27 06:24:49.216282+00	read write groups	1	16	2018-05-26 20:24:49.216606+00	2018-05-26 20:24:49.216621+00
300	rglMVBDZgbqIhGu4pDDLnFNi2JEsEI	2018-05-27 07:47:36.49648+00	read write groups	1	134	2018-05-26 21:47:36.496815+00	2018-05-26 21:47:36.496828+00
301	kACSzPykitPIEYIAv7gjrHdVVqiG36	2018-05-27 12:28:07.660515+00	read write groups	1	135	2018-05-27 02:28:07.660835+00	2018-05-27 02:28:07.660859+00
302	hD0Eu4w91CDB27XYqlcoDdaFYlkKTe	2018-05-27 12:39:56.699474+00	read write groups	1	135	2018-05-27 02:39:56.69985+00	2018-05-27 02:39:56.699866+00
303	vW3ewabVF8FdsdvlIWHx9xtxt5UQpn	2018-05-27 16:06:00.805282+00	read write groups	1	16	2018-05-27 06:06:00.805663+00	2018-05-27 06:06:00.80569+00
304	bLy5n4dBuJHdMw6KWcsQaEyrmbmkvT	2018-05-27 16:19:26.720292+00	read write groups	1	136	2018-05-27 06:19:26.720609+00	2018-05-27 06:19:26.720623+00
305	RFFUNdrNoRKYg3Fs0diCpDkvoPi9y1	2018-05-28 04:03:19.279771+00	read write groups	1	64	2018-05-27 18:03:19.280176+00	2018-05-27 18:03:19.280192+00
306	T586OsiQJjIRy7cNfPrO2Z9XOiBOyO	2018-05-28 08:23:35.32918+00	read write groups	1	137	2018-05-27 22:23:35.32955+00	2018-05-27 22:23:35.329564+00
307	RtfySgoKuEU5CytQilr6UalPMR3wTA	2018-05-28 08:26:37.282139+00	read write groups	1	16	2018-05-27 22:26:37.282443+00	2018-05-27 22:26:37.282462+00
308	6U4miNzRECPKZlO6v4gcHfj08KwSfa	2018-05-28 08:41:16.58848+00	read write groups	1	106	2018-05-27 22:41:16.588767+00	2018-05-27 22:41:16.588781+00
309	lWggAeXKTQ3BP7aVpXlYZjwfmoWWGU	2018-05-28 12:01:11.712569+00	read write groups	1	134	2018-05-28 02:01:11.712928+00	2018-05-28 02:01:11.712943+00
310	1CKCRA66UbAQPeBgOFnVbVytsP5kH9	2018-05-29 08:47:28.680598+00	read write groups	1	134	2018-05-28 22:47:28.681081+00	2018-05-28 22:47:28.681097+00
311	C2KkbVP839lMqYrWBJLlQuEu6Vskjf	2018-05-29 13:56:57.56452+00	read write groups	1	21	2018-05-29 03:56:57.564879+00	2018-05-29 03:56:57.564894+00
312	nef2l7qFq5XuHpMUjuPd39dPOjlFsJ	2018-05-30 09:49:34.197915+00	read write groups	1	138	2018-05-29 23:49:34.19822+00	2018-05-29 23:49:34.198236+00
313	OAXhyB9W7i0rZUmPNleglo1aNj9iGI	2018-05-30 09:51:41.716442+00	read write groups	1	138	2018-05-29 23:51:41.716807+00	2018-05-29 23:51:41.716823+00
314	vLdFQemqp05xtlCUJlSVJk6MIK6s6c	2018-05-30 15:18:34.169331+00	read write groups	1	16	2018-05-30 05:18:34.169679+00	2018-05-30 05:18:34.169696+00
315	SbAFd39Gv5MSdyU2MLTFtEeof34jlb	2018-05-31 04:05:30.996084+00	read write groups	1	139	2018-05-30 18:05:30.996447+00	2018-05-30 18:05:30.996461+00
316	4jrGzLTMO0XySo66e976AAdZNudcN6	2018-05-31 06:57:49.223819+00	read write groups	1	140	2018-05-30 20:57:49.224215+00	2018-05-30 20:57:49.224234+00
317	9eLtIgH421hHgGsh6z9XQ7Q0BCbWEM	2018-05-31 11:34:22.343234+00	read write groups	1	64	2018-05-31 01:34:22.343538+00	2018-05-31 01:34:22.343552+00
318	IgfokoXuc9AluV3R53Uf6PHoDsUC4I	2018-05-31 13:17:41.462508+00	read write groups	1	17	2018-05-31 03:17:41.462911+00	2018-05-31 03:17:41.462927+00
319	2KAQPCuOKlXvfLuVEFm547eaFufRl6	2018-05-31 13:17:45.303201+00	read write groups	1	47	2018-05-31 03:17:45.303615+00	2018-05-31 03:17:45.303632+00
320	0W3hzMX1MReJLyeVZ7FODGEsWfqmFt	2018-05-31 13:34:43.298379+00	read write groups	1	16	2018-05-31 03:34:43.298704+00	2018-05-31 03:34:43.29872+00
321	yelKl5VvEK7YZTlDR5iph5cFw3JCkt	2018-05-31 13:56:34.974034+00	read write groups	1	16	2018-05-31 03:56:34.974528+00	2018-05-31 03:56:34.974547+00
322	MK23JLk2QimC7VDE5TyXggpFqdrgV2	2018-05-31 13:57:41.468001+00	read write groups	1	60	2018-05-31 03:57:41.468342+00	2018-05-31 03:57:41.468357+00
323	LzQUvRFDhJOnMMqCWoyqGC8lszfKes	2018-05-31 14:25:08.700235+00	read write groups	1	16	2018-05-31 04:25:08.700649+00	2018-05-31 04:25:08.700664+00
324	Km4DVeaQZTvXNbnxMEm6wyO8GBVb4o	2018-05-31 14:26:42.724631+00	read write groups	1	47	2018-05-31 04:26:42.724942+00	2018-05-31 04:26:42.724956+00
325	WQuzrxCeAu1rG4yg9GTnCdDiJz5BPs	2018-05-31 14:38:31.194962+00	read write groups	1	47	2018-05-31 04:38:31.195306+00	2018-05-31 04:38:31.195321+00
326	BrxTwbvO74t2JG8rVXj2XJ2SUX3g09	2018-05-31 14:38:39.555463+00	read write groups	1	17	2018-05-31 04:38:39.5558+00	2018-05-31 04:38:39.555815+00
327	Uo3Ox5MXfa3JVu4ytrOKJv3jgBXNFp	2018-05-31 14:50:56.953512+00	read write groups	1	47	2018-05-31 04:50:56.953835+00	2018-05-31 04:50:56.953849+00
328	pn8cw8KQKVa6GufROSzPyFSlMaDnur	2018-05-31 14:55:48.293182+00	read write groups	1	16	2018-05-31 04:55:48.293553+00	2018-05-31 04:55:48.293568+00
329	4lpiHPJtYfXePPvDz2rnnQcE6juslr	2018-05-31 14:57:14.861224+00	read write groups	1	16	2018-05-31 04:57:14.861665+00	2018-05-31 04:57:14.86168+00
330	RS6gtUwkt5etoZI7uPHVP79ft83HQl	2018-06-01 01:32:17.12116+00	read write groups	1	141	2018-05-31 15:32:17.121488+00	2018-05-31 15:32:17.121506+00
331	zt6kl5V4tQorivoLJR50mmObz7x1Cz	2018-06-01 01:33:59.709739+00	read write groups	1	141	2018-05-31 15:33:59.71005+00	2018-05-31 15:33:59.710064+00
332	lJyU57xPLPt3oEh7jzbMoZQoZsWIRD	2018-06-01 03:23:16.826373+00	read write groups	1	142	2018-05-31 17:23:16.826717+00	2018-05-31 17:23:16.826732+00
333	gxaKRmkwT8Wtui5dnlKhNJJBJOR4UI	2018-06-01 03:23:51.224286+00	read write groups	1	142	2018-05-31 17:23:51.224608+00	2018-05-31 17:23:51.224622+00
334	1sMItDbYkVpvsLx4JXY8pCgXfodp3x	2018-06-01 07:51:07.360408+00	read write groups	1	143	2018-05-31 21:51:07.360752+00	2018-05-31 21:51:07.360767+00
335	vfbEZ6bzz33C7xkcPpNrkHRdiNE8n6	2018-06-02 15:54:52.904639+00	read write groups	1	144	2018-06-02 05:54:52.904971+00	2018-06-02 05:54:52.904987+00
336	D45NUbk57mr0LaPvLwYggBjj7xuhOi	2018-06-03 05:47:11.230011+00	read write groups	1	16	2018-06-02 19:47:11.230315+00	2018-06-02 19:47:11.230329+00
337	7EnoF8jgp4FqkzPUalkJc6nr8vNRky	2018-06-03 08:07:50.252353+00	read write groups	1	115	2018-06-02 22:07:50.252681+00	2018-06-02 22:07:50.252697+00
338	rAe26fOlWgr1zSbzl9NELuoIl9vh3H	2018-06-04 11:28:02.743487+00	read write groups	1	145	2018-06-04 01:28:02.743879+00	2018-06-04 01:28:02.743894+00
339	LG7ktKJkOX6ywJHza5d5xiHQNlTXIl	2018-06-04 11:30:56.043219+00	read write groups	1	16	2018-06-04 01:30:56.043558+00	2018-06-04 01:30:56.043574+00
340	wpvqdD1OeKVKOoVQxRUEYqwccTkxuR	2018-06-05 07:06:24.523202+00	read write groups	1	64	2018-06-04 21:06:24.523567+00	2018-06-04 21:06:24.523582+00
341	95oY8UUuXI6GjF9uQsKvEErJPPeUNe	2018-06-06 10:55:06.304447+00	read write groups	1	17	2018-06-06 00:55:06.304842+00	2018-06-06 00:55:06.304858+00
342	pIqutvEDspZ953Rt1qthmZzupSeM1L	2018-06-07 03:19:44.227384+00	read write groups	1	146	2018-06-06 17:19:44.22778+00	2018-06-06 17:19:44.227796+00
343	lE6AUorzeARWXmWjIaFQCKdYoql23H	2018-06-07 12:33:11.226701+00	read write groups	1	17	2018-06-07 02:33:11.227084+00	2018-06-07 02:33:11.227099+00
344	sQ0mUdEJAslqImJ3FWGeTikrCZsvgU	2018-06-07 12:33:57.822121+00	read write groups	1	47	2018-06-07 02:33:57.822495+00	2018-06-07 02:33:57.822509+00
345	nQYQrMPD1rIUf3xs7ydic7ojP0YRJq	2018-06-07 13:46:16.684261+00	read write groups	1	147	2018-06-07 03:46:16.68461+00	2018-06-07 03:46:16.684623+00
346	ngtipVwHTlv1VcTL3fU8ymyWt099XN	2018-06-07 17:56:15.827043+00	read write groups	1	148	2018-06-07 07:56:15.827345+00	2018-06-07 07:56:15.827359+00
347	gDf3xEE3gtRPGOebQzNjtT6rxgRDlc	2018-06-07 18:04:05.875998+00	read write groups	1	148	2018-06-07 08:04:05.876405+00	2018-06-07 08:04:05.87642+00
348	5LX7qKqBYH9vCqSJMGOjxVkPcudRda	2018-06-08 08:53:20.180347+00	read write groups	1	16	2018-06-07 22:53:20.180705+00	2018-06-07 22:53:20.180719+00
349	7zV36oxYEBI6WQqQjC923fxMDncDBq	2018-06-10 13:22:45.895973+00	read write groups	1	21	2018-06-10 03:22:45.896362+00	2018-06-10 03:22:45.896377+00
350	axCQalVsMmr5tbkhENnazRhsd52e24	2018-06-11 16:30:33.938557+00	read write groups	1	21	2018-06-11 06:30:33.938901+00	2018-06-11 06:30:33.938916+00
351	361DQVSfoFdAGscK6y8fwR54oFS9Ya	2018-06-16 04:32:48.35094+00	read write groups	1	149	2018-06-15 18:32:48.351249+00	2018-06-15 18:32:48.351264+00
352	P8UwoA30l7163WlD6uzODiPDftQeJt	2018-06-28 08:47:47.379639+00	read write groups	1	21	2018-06-27 22:47:47.380064+00	2018-06-27 22:47:47.380079+00
353	npXOz94sniUflK9sHqscUPf8JV1Krr	2018-07-07 10:51:32.920641+00	read write groups	1	47	2018-07-07 00:51:32.933191+00	2018-07-07 00:51:32.933212+00
354	MAPvXTpSeYQtX8UH0irYkxEYsn8fcZ	2018-07-16 04:02:32.578846+00	read write groups	1	64	2018-07-15 18:02:32.579721+00	2018-07-15 18:02:32.579747+00
355	dbbQ6ls4HX0w3EYo2JN2ORHUBFUgHk	2018-07-18 11:00:03.259537+00	read write groups	1	150	2018-07-18 01:00:03.25996+00	2018-07-18 01:00:03.259975+00
356	V10XdXI1zLylEfcO8X6i52pXGmduDz	2018-07-28 12:28:07.588684+00	read write groups	1	32	2018-07-28 02:28:07.589046+00	2018-07-28 02:28:07.58906+00
357	D4RMgrMac8cHSGyHy05BLH6juMivGe	2018-08-23 14:48:02.778573+00	read write groups	1	32	2018-08-23 04:48:02.803202+00	2018-08-23 04:48:02.803228+00
358	qA0Tk81Zm8n0codm647LtGUSQ556Nm	2018-08-30 08:07:02.693125+00	read write groups	1	151	2018-08-29 22:07:02.69346+00	2018-08-29 22:07:02.693499+00
359	VYPtdsmFo6jblRsm8d3wF3cFE6u95y	2018-09-26 06:43:27.304854+00	read write groups	1	47	2018-09-25 20:43:27.305288+00	2018-09-25 20:43:27.305303+00
360	JqXamtFUTXiqm78htUR2Ov1uygLTqR	2018-09-28 12:59:14.604802+00	read write groups	1	47	2018-09-28 02:59:14.605392+00	2018-09-28 02:59:14.605408+00
361	YmiCeZZixvmfA7l1onpbc3I0mlui0w	2018-09-28 12:59:31.231196+00	read write groups	1	47	2018-09-28 02:59:31.231628+00	2018-09-28 02:59:31.231644+00
362	CWtBPHV7XYsM5Shs1FrgK5PtInYgn7	2018-09-28 12:59:51.353806+00	read write groups	1	47	2018-09-28 02:59:51.354128+00	2018-09-28 02:59:51.354145+00
363	XN9ne6bVtxxGOqZBSn8AU7nBunDuuQ	2018-09-28 13:00:18.028516+00	read write groups	1	47	2018-09-28 03:00:18.028904+00	2018-09-28 03:00:18.02892+00
364	nNfTSPHn8ArCCbdRTQqQshinm3FGy5	2018-09-28 13:00:58.45425+00	read write groups	1	47	2018-09-28 03:00:58.454671+00	2018-09-28 03:00:58.454688+00
365	K9e3TBHm0Jjn5jlv98JPjh43KDYyhz	2018-09-28 13:08:17.329268+00	read write groups	1	47	2018-09-28 03:08:17.329666+00	2018-09-28 03:08:17.329683+00
366	K807X8VAU6jyb1jk5sn9Cha6K6MG7j	2018-09-28 13:16:27.135259+00	read write groups	1	47	2018-09-28 03:16:27.135599+00	2018-09-28 03:16:27.135615+00
367	MUWwT45MC1EiMunqAkYDKLAQ9sn69k	2018-09-28 13:22:45.156071+00	read write groups	1	47	2018-09-28 03:22:45.156415+00	2018-09-28 03:22:45.156431+00
368	sAbz6jOJZYxFbWxHBDGKtLHlQkYX3w	2018-09-28 13:28:02.784725+00	read write groups	1	47	2018-09-28 03:28:02.785412+00	2018-09-28 03:28:02.78543+00
369	wgC270pPEoqZO3gemw5EPWYbqZzFGd	2018-09-28 13:28:51.170038+00	read write groups	1	47	2018-09-28 03:28:51.17035+00	2018-09-28 03:28:51.170365+00
370	pZHNlJDltYa7zuSss8mKik9A9FY205	2018-09-28 13:58:07.094487+00	read write groups	1	47	2018-09-28 03:58:07.0949+00	2018-09-28 03:58:07.094916+00
371	9mm7pufM9jkPo13RttGKnpN5ze2EzH	2018-09-29 05:20:28.775495+00	read write groups	1	47	2018-09-28 19:20:28.775864+00	2018-09-28 19:20:28.77588+00
372	g2bvcDsWsxd2ZP09dDi5DoDVwsBKmF	2018-10-02 03:44:29.863234+00	read write groups	1	47	2018-10-01 17:44:29.863632+00	2018-10-01 17:44:29.863648+00
373	fbzgT7SJqJf3jlBDZ4Cl2T3LM0TFE3	2018-10-02 08:18:33.906307+00	read write groups	1	152	2018-10-01 22:18:33.906603+00	2018-10-01 22:18:33.906617+00
374	mW3pHAjitmtjOLMYzrFPMN0zPUwUvd	2018-10-02 08:19:01.660524+00	read write groups	1	152	2018-10-01 22:19:01.660917+00	2018-10-01 22:19:01.660933+00
375	DklT9PPvLJLDYeO7UGd2I8cTcaQz4L	2018-10-03 12:29:38.660913+00	read write groups	1	21	2018-10-03 02:29:38.661249+00	2018-10-03 02:29:38.661265+00
376	77yoMFZ8BJBlQIuOFfHtcoxGtrFjLf	2018-10-04 05:22:48.211636+00	read write groups	1	47	2018-10-03 19:22:48.211979+00	2018-10-03 19:22:48.211994+00
377	DQXCPBMQzZaeoPct4pIq8N3wOOtlmm	2018-10-05 06:42:25.905862+00	read write groups	1	153	2018-10-04 20:42:25.906272+00	2018-10-04 20:42:25.906287+00
378	htnBvy0rUnOnwheRjleUNEu26XMmlR	2018-10-05 09:42:14.191274+00	read write groups	1	154	2018-10-04 23:42:14.191686+00	2018-10-04 23:42:14.191702+00
379	9rIwimq6iijsBlxSkNeLsm6AVMgt5t	2018-10-05 10:53:49.461199+00	read write groups	1	47	2018-10-05 00:53:49.461641+00	2018-10-05 00:53:49.461657+00
380	fQmPdfE9kLzBRRA0ViyqGaLLxeN2Na	2018-10-05 10:53:49.885825+00	read write groups	1	47	2018-10-05 00:53:49.886134+00	2018-10-05 00:53:49.886148+00
381	UZhtPJRJAzpsZK4qcPnsXqfHt30XzI	2018-10-05 11:10:06.501066+00	read write groups	1	155	2018-10-05 01:10:06.501411+00	2018-10-05 01:10:06.501425+00
382	sNhuikQ6WiampbjMOyeTAvOznc4gki	2018-10-05 14:27:27.108122+00	read write groups	1	156	2018-10-05 04:27:27.108501+00	2018-10-05 04:27:27.108516+00
383	64w3WxE0cp9c9IJf9YpnKsQeDKB0l8	2018-10-06 06:21:27.501435+00	read write groups	1	64	2018-10-05 20:21:27.501871+00	2018-10-05 20:21:27.501887+00
384	VhcWjw6WNHGCb6henzDqRv47vEM1PO	2018-10-06 15:49:04.69521+00	read write groups	1	157	2018-10-06 05:49:04.69558+00	2018-10-06 05:49:04.695596+00
385	9orx5fF2oTEf2UYx9VZNR4n9rcAK9S	2018-10-09 11:04:34.07829+00	read write groups	1	155	2018-10-09 01:04:34.078651+00	2018-10-09 01:04:34.078668+00
386	Qqbe7vqcjf4MvEmLVon7AcRoV5ZVce	2018-10-10 06:22:03.472124+00	read write groups	1	158	2018-10-09 20:22:03.472433+00	2018-10-09 20:22:03.472448+00
387	dqpSDeOu2kk1v2u7rNXmqaBQGuGVSB	2018-10-11 02:50:15.83811+00	read write groups	1	16	2018-10-10 16:50:15.838456+00	2018-10-10 16:50:15.838472+00
388	Wp0SDyeL2o4FfxGJk8OvHKL3VPOO7l	2018-10-12 05:51:37.604603+00	read write groups	1	47	2018-10-11 19:51:37.604905+00	2018-10-11 19:51:37.604919+00
389	ZxEtcQFNgfs9WN6T5a9uB9EIBOndah	2018-10-12 06:15:02.417046+00	read write groups	1	156	2018-10-11 20:15:02.417516+00	2018-10-11 20:15:02.417533+00
390	jwWn42Juplox01RUjNvaArf8GKDHYC	2018-10-16 14:37:47.341573+00	read write groups	1	159	2018-10-16 04:37:47.341949+00	2018-10-16 04:37:47.341964+00
391	4QyKIML8rGZSSJ6ZdOZM2IARta9Lpm	2018-10-19 15:37:51.753346+00	read write groups	1	156	2018-10-19 05:37:51.753754+00	2018-10-19 05:37:51.75377+00
392	mlIgxDqka0xKjBjxwzTI5IJ2y9DIAl	2018-10-22 09:39:30.680257+00	read write groups	1	16	2018-10-21 23:39:30.68061+00	2018-10-21 23:39:30.680626+00
393	PNLHQrIYBtxCgpK3L8ukzWRygx0Q7N	2018-10-22 09:50:05.426664+00	read write groups	1	16	2018-10-21 23:50:05.427077+00	2018-10-21 23:50:05.427093+00
394	aHqWu3MtwQdmCpdQzESymCdGWP3Yj4	2018-10-23 11:32:27.171728+00	read write groups	1	156	2018-10-23 01:32:27.172144+00	2018-10-23 01:32:27.172161+00
395	eVB5s6QxFiLguAtSpYqMCVcWnAHkNk	2018-10-23 23:56:15.792332+00	read write groups	1	160	2018-10-23 13:56:15.792736+00	2018-10-23 13:56:15.792752+00
396	mDspyXCAokyqU1eGkdC3foo37Fil2F	2018-10-27 15:16:47.566784+00	read write groups	1	156	2018-10-27 05:16:47.567196+00	2018-10-27 05:16:47.567211+00
397	D2MWjCyk70KNM91zmZjHcSYGIZtumg	2018-10-28 10:34:07.279673+00	read write groups	1	123	2018-10-28 00:34:07.280109+00	2018-10-28 00:34:07.280125+00
398	HJMLaJ8IgRz8bwqPRttcsNAmWnAIzp	2018-10-28 12:43:21.395486+00	read write groups	1	161	2018-10-28 02:43:21.395866+00	2018-10-28 02:43:21.395882+00
399	IAx46gKFWlKfO3AEjfnGwJfSwaZO5F	2018-10-29 09:10:03.401727+00	read write groups	1	156	2018-10-28 23:10:03.402149+00	2018-10-28 23:10:03.402165+00
400	Lhq73n8JWVThQdO3hhnqNdnV12JmYJ	2018-10-29 09:10:21.828454+00	read write groups	1	47	2018-10-28 23:10:21.828846+00	2018-10-28 23:10:21.828862+00
401	xlrpmzTNMBSVtklb7oROZsqh0Qt94W	2018-10-29 09:10:24.030168+00	read write groups	1	160	2018-10-28 23:10:24.030584+00	2018-10-28 23:10:24.030599+00
402	aURlNlKgOkGtdcmMCN9YTuq7TBH7FI	2018-10-29 09:11:36.159801+00	read write groups	1	158	2018-10-28 23:11:36.160121+00	2018-10-28 23:11:36.160137+00
403	0HIopulFyc4W92i8ncXvuXGIsr132F	2018-10-29 09:11:37.814842+00	read write groups	1	162	2018-10-28 23:11:37.815255+00	2018-10-28 23:11:37.815271+00
404	LYOKYTyIOOxEXo7NzMPabsCaNAntg7	2018-10-29 09:12:32.865564+00	read write groups	1	161	2018-10-28 23:12:32.865878+00	2018-10-28 23:12:32.865893+00
405	xIIvlpy5LTMkFbZb0I6trEFU9uHVLU	2018-11-01 12:42:55.433832+00	read write groups	1	160	2018-11-01 02:42:55.434247+00	2018-11-01 02:42:55.434264+00
406	lQUyRlaHtABURMFwRtYBxZPP0P9gHo	2018-11-01 14:23:27.897211+00	read write groups	1	161	2018-11-01 04:23:27.897571+00	2018-11-01 04:23:27.897605+00
407	gvNflSZ2T1gdhTthRMi9URB15EB8Xf	2018-11-04 09:20:50.035904+00	read write groups	1	158	2018-11-03 23:20:50.036301+00	2018-11-03 23:20:50.036317+00
408	REfSenX0QIdTA0TSwSRmK0VFojP64a	2018-11-04 09:26:55.583108+00	read write groups	1	163	2018-11-03 23:26:55.583505+00	2018-11-03 23:26:55.583521+00
409	nGxdlPlJHKkGLXsTmCRlPXmwTXJ9cG	2018-11-04 09:33:43.757901+00	read write groups	1	165	2018-11-03 23:33:43.75831+00	2018-11-03 23:33:43.758327+00
410	12tboaF5uCwsc5aUJ5Wa2MYtXE7a7H	2018-11-04 19:03:41.508176+00	read write groups	1	161	2018-11-04 09:03:41.508556+00	2018-11-04 09:03:41.508571+00
411	CEZ6fJtbVG9ZxQdn1gzVPCVWBIZ1mW	2018-11-06 10:26:09.237833+00	read write groups	1	162	2018-11-06 00:26:09.238182+00	2018-11-06 00:26:09.238196+00
412	KXlw203tA8dF3iW1hQe8WqnCEl5cM3	2018-11-06 18:23:32.195747+00	read write groups	1	156	2018-11-06 08:23:32.196118+00	2018-11-06 08:23:32.196135+00
413	xKWMxiqThXjV658zr1Pi3MjcN14mAc	2018-11-08 09:00:27.804358+00	read write groups	1	156	2018-11-07 23:00:27.804754+00	2018-11-07 23:00:27.804769+00
414	4qU0r8Ud5uWh9W3RzTQe8Lst5XL2lX	2018-11-08 11:03:18.406709+00	read write groups	1	158	2018-11-08 01:03:18.407122+00	2018-11-08 01:03:18.407137+00
415	u3jAaJnIZzkIouCd3bq8tVGO3Ifcqg	2018-11-10 08:02:30.142591+00	read write groups	1	32	2018-11-09 22:02:30.143008+00	2018-11-09 22:02:30.143026+00
416	4kQKb1HT1t7sUQPOFQUPW52RgjQ9Qw	2018-11-10 14:29:37.10996+00	read write groups	1	158	2018-11-10 04:29:37.110405+00	2018-11-10 04:29:37.110421+00
417	IP0wVaBZtE65Q0eX7RnBfCU1frbwrL	2018-11-11 02:04:34.064731+00	read write groups	1	16	2018-11-10 16:04:34.065076+00	2018-11-10 16:04:34.065091+00
418	KLAENGp6BkXAHQ8whX3EdDTMhnPwCr	2018-11-11 04:44:26.943376+00	read write groups	1	166	2018-11-10 18:44:26.94378+00	2018-11-10 18:44:26.943795+00
419	TkTt7L96Xzq9cknWsJC57tz6jRZKKI	2018-11-11 04:45:10.515375+00	read write groups	1	166	2018-11-10 18:45:10.515799+00	2018-11-10 18:45:10.515815+00
420	r4R77qNQGrqzePDdLeUCKJd90puE68	2018-11-11 04:45:13.318747+00	read write groups	1	166	2018-11-10 18:45:13.319156+00	2018-11-10 18:45:13.319171+00
421	ANXSs4cs7FG3ZyKWgbHsxTTdE8lRh4	2018-11-11 04:50:11.745859+00	read write groups	1	166	2018-11-10 18:50:11.746283+00	2018-11-10 18:50:11.746299+00
422	YYois8Ox78xefzrMrpWx8voKeQiIkr	2018-11-11 04:50:11.900847+00	read write groups	1	166	2018-11-10 18:50:11.901234+00	2018-11-10 18:50:11.90125+00
423	Xifr5MkpFcAUJHIf5kH6SiU30LNkUQ	2018-11-11 04:50:11.979391+00	read write groups	1	166	2018-11-10 18:50:11.979828+00	2018-11-10 18:50:11.979844+00
424	9iEzA0BxuZFu7pCMBSpuKcnPBpaG7k	2018-11-11 04:50:12.186653+00	read write groups	1	166	2018-11-10 18:50:12.187043+00	2018-11-10 18:50:12.187059+00
425	CD3PfDwJh4pxXsIr1goRuTHl8VIlE1	2018-11-11 05:08:43.467289+00	read write groups	1	167	2018-11-10 19:08:43.46769+00	2018-11-10 19:08:43.467706+00
426	qjfP5372JCG3NfV5cXyewXFtGOVAuJ	2018-11-11 05:10:11.950403+00	read write groups	1	167	2018-11-10 19:10:11.950846+00	2018-11-10 19:10:11.950862+00
427	ankd8LhSkr8P3koRpIqxk4EN3uJJjj	2018-11-11 05:20:28.708237+00	read write groups	1	168	2018-11-10 19:20:28.708692+00	2018-11-10 19:20:28.708708+00
428	1p2AaqxMmrUZw37qxBUsMQW1NvSk9h	2018-11-11 08:15:32.657231+00	read write groups	1	169	2018-11-10 22:15:32.657669+00	2018-11-10 22:15:32.657685+00
429	iDnipQ896lUkKpvgB9YcAgdy67ixil	2018-11-12 07:56:46.895491+00	read write groups	1	162	2018-11-11 21:56:46.895824+00	2018-11-11 21:56:46.895838+00
430	8fFy5rNOViSNIrKmuXcOsNyFtvO1v4	2018-11-13 11:22:37.88473+00	read write groups	1	170	2018-11-13 01:22:37.885105+00	2018-11-13 01:22:37.885121+00
431	COC6M2lu43TNLvWdjkEa32eIGaTyeg	2018-11-13 21:14:30.757144+00	read write groups	1	47	2018-11-13 11:14:30.757596+00	2018-11-13 11:14:30.757616+00
432	m0TQT0tlgf1NYrK6x8vsN8XZwmbLuo	2018-11-15 07:21:06.939102+00	read write groups	1	156	2018-11-14 21:21:06.939497+00	2018-11-14 21:21:06.939513+00
433	ZjykmMNh2CYaDcioLvNGmdSphH14zb	2018-11-15 18:46:37.2463+00	read write groups	1	161	2018-11-15 08:46:37.246714+00	2018-11-15 08:46:37.24673+00
434	H2qOgAg6dh7iT52espJ4TLNlvKBkhm	2018-11-16 18:33:24.479096+00	read write groups	1	156	2018-11-16 08:33:24.479452+00	2018-11-16 08:33:24.479469+00
435	bqPTGaaa5wCl8bOt5sVoU9xup66ZwI	2018-11-16 19:26:22.612437+00	read write groups	1	156	2018-11-16 09:26:22.612846+00	2018-11-16 09:26:22.612863+00
436	34eRUXC6o9K07FKtSaXGJ8sDIujFSg	2018-11-16 20:11:09.271533+00	read write groups	1	156	2018-11-16 10:11:09.271911+00	2018-11-16 10:11:09.271927+00
437	vrRAvRHNW6lgK9BC1hzHnhuAODH47a	2018-11-17 17:10:16.712019+00	read write groups	1	64	2018-11-17 07:10:16.712419+00	2018-11-17 07:10:16.712435+00
438	MrTqnn8pWkU7adsAw5atKgqN2j2T5w	2018-11-18 13:49:04.994016+00	read write groups	1	161	2018-11-18 03:49:04.994336+00	2018-11-18 03:49:04.994351+00
439	qCyH4edxpBNkHuN096JJ1W9pjyhEfd	2018-11-20 05:06:40.791504+00	read write groups	1	161	2018-11-19 19:06:40.791904+00	2018-11-19 19:06:40.791921+00
440	cs72Ehq4Ikc8moDZGKhjt2O3EA4xXJ	2018-12-01 12:11:40.998369+00	read write groups	1	156	2018-12-01 02:11:40.998767+00	2018-12-01 02:11:40.998783+00
\.


--
-- Data for Name: oauth2_provider_application; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oauth2_provider_application (id, client_id, redirect_uris, client_type, authorization_grant_type, client_secret, name, user_id, skip_authorization, created, updated) FROM stdin;
1	web		confidential	password	sMXrq4RV2muu07ERhrllW1uCfH12U4ZNeqyM0L8bmaF9P59prjkIe5mhJJAt47Kod14yhRdg96gEf1m183sblRzyC175eLd7NzsyWS9w6QTyVPdczvTmeHiGBJJPjhGf	pickmybruin web access	\N	f	2017-10-26 00:16:28.897+00	2017-11-02 07:56:52.99572+00
\.


--
-- Data for Name: oauth2_provider_grant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oauth2_provider_grant (id, code, expires, redirect_uri, scope, application_id, user_id, created, updated) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_refreshtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oauth2_provider_refreshtoken (id, token, access_token_id, application_id, user_id, created, updated) FROM stdin;
45	HNOwz2wwDshlvNlSJJit5p2Zk6tmsi	45	1	16	2018-01-24 06:32:07.134495+00	2018-01-24 06:32:07.134515+00
46	1a2JI2RgB9Facu6Yyln4jzLDo7fDT5	46	1	17	2018-01-24 06:33:55.125453+00	2018-01-24 06:33:55.1255+00
48	PGqISweMVFzas9DzFwZ4R6Y54dbn25	48	1	17	2018-01-24 21:37:01.295123+00	2018-01-24 21:37:01.295144+00
49	iP0NFgf2kMMEK2uoHMtbDXNlWJsDI3	49	1	16	2018-01-25 01:51:18.547059+00	2018-01-25 01:51:18.547084+00
50	C9KkBJDOHXhX8RsrG728cjdbJxeV5o	50	1	17	2018-01-28 17:40:41.80818+00	2018-01-28 17:40:41.808204+00
51	xa1ZuL4vdPPFkmrdcXkxGYuQgnuvDx	51	1	16	2018-01-30 02:38:42.391172+00	2018-01-30 02:38:42.391191+00
52	dLU9PZtNM6z9JJV4W4Di2Fo8zDp8xp	52	1	17	2018-01-30 02:40:08.2357+00	2018-01-30 02:40:08.235718+00
53	wh8ZRndqFcBwe94puaK98MPjSGqVMs	53	1	21	2018-01-30 23:41:54.395121+00	2018-01-30 23:41:54.395141+00
54	A20vvQP88v5d3kJnuD5FIBruWGw5dA	54	1	17	2018-01-31 01:44:14.475136+00	2018-01-31 01:44:14.475156+00
56	sXG1jXhkqhXqgqti55zBXJ2jWjW9yc	56	1	17	2018-01-31 22:09:07.618134+00	2018-01-31 22:09:07.618153+00
57	b2qB4LsMXdJf8V1jLw2DlAENUiwIbH	57	1	16	2018-01-31 23:27:39.317448+00	2018-01-31 23:27:39.317497+00
58	Kur4Z5sJthzxIsjCOJRh9rTU60lznS	58	1	24	2018-01-31 23:35:35.804106+00	2018-01-31 23:35:35.804125+00
59	3t8WPqLrPjUyDUJWYzAcw1G3dBsVeO	59	1	17	2018-02-01 00:08:05.705755+00	2018-02-01 00:08:05.705775+00
60	3OqnfC0RPg7t4pLoZi5dFtfrYl15Po	60	1	17	2018-02-01 00:12:48.031257+00	2018-02-01 00:12:48.031276+00
61	UkONd9LS1UHcUiIiB735suI4NzsbyL	61	1	17	2018-02-01 00:21:55.092599+00	2018-02-01 00:21:55.092618+00
62	A7CGfdCkkFNZpnQlCTAnQNcrKVkbTU	62	1	16	2018-02-01 00:29:27.744694+00	2018-02-01 00:29:27.744713+00
63	jdtQgzWXb96hXgGIPO5eQrRL4f2r2Z	63	1	17	2018-02-01 00:30:33.604542+00	2018-02-01 00:30:33.604562+00
64	d5tOU3hMmxBK8NOOPz1t7har2AVbmP	64	1	16	2018-02-01 00:30:48.767511+00	2018-02-01 00:30:48.767531+00
65	c27krkRiBiopphZJfWCmOJn9l9wChJ	65	1	17	2018-02-01 00:32:12.721247+00	2018-02-01 00:32:12.721267+00
68	JWCS1AFjoafk9frSl5jkpZYZYSjCKp	68	1	28	2018-02-01 00:49:35.608385+00	2018-02-01 00:49:35.608404+00
69	LaZMOWfUyzRxBM9uO9dkxr9zRAhVOd	69	1	16	2018-02-01 02:39:02.280152+00	2018-02-01 02:39:02.280172+00
70	PEYDmoekWv0D886oQM0OQZwF7tX893	70	1	28	2018-02-01 03:58:39.566225+00	2018-02-01 03:58:39.566245+00
71	dS9A8Ev1ISKmb5x75KaagRzAptLE5x	71	1	28	2018-02-01 04:24:43.522718+00	2018-02-01 04:24:43.522743+00
72	8mMPPjmXMSY5py7aHeLXuQAHqLsT6W	72	1	28	2018-02-01 04:27:09.334525+00	2018-02-01 04:27:09.334544+00
73	IJIM3eV2AhmNWtD5Hu15RIh9FaVQi1	73	1	28	2018-02-01 04:27:39.386459+00	2018-02-01 04:27:39.386478+00
74	FPeB5PJLwNQNJGdsaqHI5NxzQmxTlR	74	1	29	2018-02-01 04:31:59.41984+00	2018-02-01 04:31:59.419859+00
75	rkVQUuReTWUzHnL5skCUDimSUM1IDA	75	1	30	2018-02-01 05:05:36.92904+00	2018-02-01 05:05:36.929059+00
76	3Terodf2VJkd8apYM64M8LU4DEVzpX	76	1	28	2018-02-01 05:05:57.133989+00	2018-02-01 05:05:57.134008+00
77	GsXB1ITQOMaDxjMHAXJzO1I0SMLSfl	77	1	28	2018-02-01 06:27:53.43019+00	2018-02-01 06:27:53.43021+00
78	JYiEk6MISUFRfqHMeGdrYyzU9E7Ay3	78	1	31	2018-02-01 07:26:40.102592+00	2018-02-01 07:26:40.102611+00
79	3t6XvKZ5x60jZZBFKXswTE01sChXm4	79	1	32	2018-02-01 07:37:27.131869+00	2018-02-01 07:37:27.131888+00
80	TaTB2yqpWeg7x7tJnxBPLNzoEKcmeZ	80	1	32	2018-02-01 07:41:09.366172+00	2018-02-01 07:41:09.366192+00
81	MtyF7hzYGrFH7TejuU1wLpq4LA02kN	81	1	33	2018-02-01 07:49:59.686118+00	2018-02-01 07:49:59.686138+00
82	UI5DLYa4TOhoqglGzX70PAlx1XKl9l	82	1	34	2018-02-01 08:15:27.911712+00	2018-02-01 08:15:27.91173+00
83	BAN3uYgAFE85Fl1BKbM57QeYB0BFPI	83	1	29	2018-02-01 09:30:34.73506+00	2018-02-01 09:30:34.73508+00
84	6WoS0dKm0PxtmyCMDlDBx87FxfI5xn	84	1	35	2018-02-01 17:22:42.057104+00	2018-02-01 17:22:42.057122+00
85	jWmUlf0v0QmFke3KxQmCKoTxjP2WSb	85	1	34	2018-02-01 18:58:09.94868+00	2018-02-01 18:58:09.948699+00
86	WzU9EfNNIsJL44E62z8U7mPiL5JTtz	86	1	36	2018-02-02 00:06:07.847613+00	2018-02-02 00:06:07.847632+00
87	DB8sSxSe16sOPhksLsn8wak8qO6JBU	87	1	37	2018-02-02 00:36:44.703538+00	2018-02-02 00:36:44.703557+00
88	H7EjYW06mNxIJXiU7Ik4dgWZcjFEKu	88	1	35	2018-02-04 04:24:29.232342+00	2018-02-04 04:24:29.232361+00
89	MxuvPSCLpo6i8gHJ4euffOJSo2GbMK	89	1	17	2018-02-04 06:35:46.962389+00	2018-02-04 06:35:46.962408+00
90	4t6AdJKjr8VtJMrYf6Fp7g85qRsWls	90	1	21	2018-02-04 10:21:42.595751+00	2018-02-04 10:21:42.59577+00
91	tnWf0cX7ddSV8lcmugdC1VzJQhjvuA	91	1	38	2018-02-04 14:38:10.51138+00	2018-02-04 14:38:10.511399+00
92	umiykWjbLzcmBIkAsxoEUXeV58SOg8	92	1	21	2018-02-05 00:48:03.157627+00	2018-02-05 00:48:03.157646+00
93	AGUzM8SFq5tkMipA9V9oKmzSfqkSjM	93	1	16	2018-02-05 01:20:56.098002+00	2018-02-05 01:20:56.098022+00
94	pHJxx6xF3lAs39HdZxVo30Dsz4byQ6	94	1	39	2018-02-05 16:57:03.108604+00	2018-02-05 16:57:03.108623+00
95	MNCCehrenXuXcMeY59691lcNOIg8r2	95	1	32	2018-02-05 22:47:23.468974+00	2018-02-05 22:47:23.468993+00
96	GjqXFRmoJKVAl5mwVRy2Y17qnQR4hY	96	1	40	2018-02-07 02:33:22.529135+00	2018-02-07 02:33:22.529155+00
97	Iqdqg3EksZPVkytJ164od9q6wHrBJg	97	1	40	2018-02-07 02:49:47.694415+00	2018-02-07 02:49:47.694434+00
98	Bzwdf6PV0Z8n6Te2ecVYnsKINvMLGP	98	1	32	2018-02-07 04:03:01.612231+00	2018-02-07 04:03:01.612249+00
99	vqrMYfEvY8kv0Z1rhZZPbdHjoL7hxn	99	1	17	2018-02-07 04:03:42.545004+00	2018-02-07 04:03:42.545023+00
100	ArcRrAVqVdHrl6KrVLGR0oeEPjeARG	100	1	32	2018-02-07 04:04:07.105637+00	2018-02-07 04:04:07.105656+00
101	JW25mjdBWDzA8cC96IhEgLxad7n8ph	101	1	32	2018-02-08 03:52:03.929322+00	2018-02-08 03:52:03.929353+00
102	ML8KUjAOX8qycYbwVc9yX6QAZV72wG	102	1	32	2018-02-08 04:08:02.161452+00	2018-02-08 04:08:02.161494+00
103	56VMxuTiDe5a73l7gBWhZmosvZrTbD	103	1	41	2018-02-08 04:28:09.402295+00	2018-02-08 04:28:09.402316+00
104	PxZTmnLZb6woIgOcuFs1eCpRFG0HsX	104	1	41	2018-02-28 03:45:56.573246+00	2018-02-28 03:45:56.573264+00
105	8rZVaMHn2nUPnwBwuaQqrVMvAk0XGw	105	1	21	2018-02-28 03:46:02.954136+00	2018-02-28 03:46:02.954154+00
106	S3nbza8IXJmrlyENZ4taSczdbkwXj5	106	1	21	2018-02-28 03:51:58.762039+00	2018-02-28 03:51:58.762071+00
107	8YoIMyFSEwhc95pUnLQwdylE5dnWex	107	1	17	2018-03-01 18:50:23.408744+00	2018-03-01 18:50:23.408763+00
108	CL6H1bll6lk5JcJMIIlP4yowTyS6VO	108	1	17	2018-03-02 02:24:30.272266+00	2018-03-02 02:24:30.272286+00
109	9gTuCnorCWvCTfSi4AHfHANLJgvsD1	109	1	17	2018-03-02 02:26:38.133552+00	2018-03-02 02:26:38.133571+00
110	9lAqW34fQz2PC8eWKneG2gvjXigKk4	110	1	42	2018-03-02 02:46:32.526738+00	2018-03-02 02:46:32.526758+00
111	PkznMZL7lz9mMPaYz9vg9pDLUiUDCx	111	1	43	2018-03-02 02:47:37.699212+00	2018-03-02 02:47:37.699231+00
112	aXsWfyu5aGWI06rT8FKM7CnK3RjSZg	112	1	17	2018-03-02 02:47:41.189701+00	2018-03-02 02:47:41.18972+00
113	QgRysIvTFr5uKAkDL3sneEeVro1eec	113	1	44	2018-03-02 02:47:53.132621+00	2018-03-02 02:47:53.132638+00
114	zTHyS0gJSZi2eP44knEW6ZV8H5Tq0X	114	1	17	2018-03-02 03:19:36.04213+00	2018-03-02 03:19:36.042149+00
115	8wGxmyjmA0wFfDaLDOBd5G8u3FHBzY	115	1	45	2018-03-02 03:46:09.300585+00	2018-03-02 03:46:09.300603+00
116	FLO1VjLPNJAiXJpXBDhcwxbS2E4VAP	116	1	46	2018-03-02 03:46:10.505388+00	2018-03-02 03:46:10.505407+00
117	lXjh39w5RbSMiOQ5GtINlm5vA23CfR	117	1	17	2018-03-02 03:52:54.759565+00	2018-03-02 03:52:54.759585+00
118	4j7VrL3uFbr83osaX3lWLb0nKMOCrd	118	1	41	2018-03-02 04:07:08.300773+00	2018-03-02 04:07:08.300792+00
119	zjnGy62mVqILGQkyCPkLWOWU7KIwvm	119	1	47	2018-03-02 04:16:25.302786+00	2018-03-02 04:16:25.302807+00
120	hkIJmRnR5tth8Epk2RtEd6mMY4bB1U	120	1	47	2018-03-02 04:26:27.031729+00	2018-03-02 04:26:27.031749+00
121	gJK5kd4IauZFObYFP98ivbePu3VYCq	121	1	16	2018-03-02 05:25:09.244791+00	2018-03-02 05:25:09.244815+00
122	NEbS8cYQ0prx8eaOjopMukNrvgbo9M	122	1	48	2018-03-02 05:30:31.417907+00	2018-03-02 05:30:31.417926+00
123	Bvkz0kFCU1fnOU3F37yfLXaxoPs8f4	123	1	16	2018-03-07 03:50:40.980173+00	2018-03-07 03:50:40.980193+00
124	qPZxN960PeayqcdPlvdPsYDHrDGQXR	124	1	21	2018-03-07 03:52:15.691874+00	2018-03-07 03:52:15.691893+00
125	9Oo3x9oWpGuDGZvXYIaVPaUy0COipi	125	1	17	2018-03-07 03:52:22.360603+00	2018-03-07 03:52:22.360623+00
126	pP4eF27Jl0W33Vjwt7F4GAhAoQp1DQ	126	1	32	2018-03-07 03:52:47.65125+00	2018-03-07 03:52:47.65127+00
127	au1uKqFYiICWWZm3H9CS1yMDS2krV7	127	1	16	2018-03-07 04:01:38.977872+00	2018-03-07 04:01:38.977904+00
128	uAwzopVybKdTEsiXU7ru20USjOT7AU	128	1	47	2018-03-07 23:58:29.991622+00	2018-03-07 23:58:29.99164+00
129	Vb0apnjkl1EBML8luthIPzTPJYxfza	129	1	16	2018-03-08 18:37:26.669261+00	2018-03-08 18:37:26.66928+00
130	lJv4qe27P2UUzLqYcZ774krxnXnjGD	130	1	17	2018-03-10 01:23:52.810762+00	2018-03-10 01:23:52.810782+00
131	fVUNdOiFjs850PO7RM7Z5RSCicLQ9V	131	1	49	2018-03-14 18:57:12.349707+00	2018-03-14 18:57:12.349729+00
132	bJNGpnWRQj06vY76xABcbgWZ0EdzC6	132	1	16	2018-03-14 23:59:32.860307+00	2018-03-14 23:59:32.860326+00
133	fRFJArxOWFwiXs7J0XaaJ5YwlBGpgA	133	1	17	2018-03-15 01:08:23.716655+00	2018-03-15 01:08:23.716679+00
134	MjTttICAA6h30NIQOuxuLafqFEl0Xw	134	1	32	2018-03-15 01:08:39.530562+00	2018-03-15 01:08:39.530581+00
135	GIrdG49X7v8i025GaOnKk9niAFDCxO	135	1	16	2018-03-15 01:19:00.417639+00	2018-03-15 01:19:00.417658+00
136	q1pdegy7p9oIPo2g7c3uQuGU14Q4Pj	136	1	53	2018-03-15 01:19:41.328263+00	2018-03-15 01:19:41.328282+00
137	26NgSLNdMhZdLwX0itbJIyu2pbRSSk	137	1	41	2018-03-15 01:28:28.532461+00	2018-03-15 01:28:28.532481+00
138	wsOPPFmnRHxzeqKXS6xFRAz13Z6iw7	138	1	32	2018-03-15 01:44:01.056843+00	2018-03-15 01:44:01.056862+00
139	3EhpnvmkIWmEjfQ3lqOHRiorbtDEy0	139	1	59	2018-03-15 01:47:36.571235+00	2018-03-15 01:47:36.571253+00
140	myWuxjvQYgVkvtwwOzFI8kfdlUbSG0	140	1	59	2018-03-15 01:49:12.45054+00	2018-03-15 01:49:12.45056+00
141	6qsFOMMnLnL2t2tm1ld54zvIKVaMpJ	141	1	60	2018-03-15 01:51:03.801449+00	2018-03-15 01:51:03.801489+00
142	6xyzXNRjjs60VpH5zs8SZ3MbkQ01P3	142	1	60	2018-03-15 01:51:40.920185+00	2018-03-15 01:51:40.920203+00
143	qaP5O7wsmVQPDrDxo2U8ldHZwr6fEW	143	1	17	2018-03-15 01:57:10.500507+00	2018-03-15 01:57:10.500527+00
144	dVVUkoSPQLbAdiv9iQf0e2doSV9XXN	144	1	61	2018-03-15 02:17:34.129022+00	2018-03-15 02:17:34.129041+00
145	HROeK5grRE0WknR0ytMfvexNqf7xRH	145	1	61	2018-03-15 02:18:20.310036+00	2018-03-15 02:18:20.310053+00
146	mdTksoo3QUQBpzuBy013Jdk3yJnt6w	146	1	17	2018-03-15 02:18:54.606968+00	2018-03-15 02:18:54.606988+00
147	gUu6JNJW3LdvArOGSSjwNUrw2b1XdS	147	1	32	2018-03-16 02:28:10.586444+00	2018-03-16 02:28:10.586461+00
148	9ouXb97fttkqJxuswzeB41lICmckW7	148	1	32	2018-03-16 02:29:33.570277+00	2018-03-16 02:29:33.570294+00
149	7kqToujfdTHUbTkyivu1ZnG0oB30tD	149	1	62	2018-03-29 16:56:26.010361+00	2018-03-29 16:56:26.01038+00
150	tpNAEGQlJS0jV0yhCZVJ5iGFyULuXU	150	1	16	2018-03-29 23:33:48.868004+00	2018-03-29 23:33:48.868023+00
151	56dZx7suXCpis2CoHCmTLQcaNy5nDt	151	1	17	2018-03-31 00:44:11.318618+00	2018-03-31 00:44:11.318637+00
152	GN6KWFZE09nM7fViRtDsLn2Gy35T8U	152	1	17	2018-03-31 00:44:11.328473+00	2018-03-31 00:44:11.328492+00
153	1xqEyhbofoOSy26qS9OvJTTIwm7T0o	153	1	17	2018-03-31 00:44:24.283397+00	2018-03-31 00:44:24.283416+00
154	3z5ZPWbeQBuS499Luhha6FjhpFu0JQ	154	1	32	2018-04-04 04:44:31.213747+00	2018-04-04 04:44:31.213766+00
155	ZzEk54X4vgthx1hWQDcnTOJjRjpKJJ	155	1	32	2018-04-04 04:51:55.346234+00	2018-04-04 04:51:55.346253+00
156	5VFKzMfaRMXeosTt8uV7ZbcZOnzjnL	156	1	63	2018-04-05 03:43:50.745841+00	2018-04-05 03:43:50.74586+00
157	1RuRJ20jiRaBH9KtuvOKySm8vF7C3W	157	1	64	2018-04-05 03:55:27.161139+00	2018-04-05 03:55:27.161157+00
158	MgCZwEBz4ToBFrELE57BmP8QL3nzR9	158	1	47	2018-04-05 03:59:19.686629+00	2018-04-05 03:59:19.686648+00
159	vDBtwGpTLz9wMaZU5ScY6gXnggAOfJ	159	1	16	2018-04-07 05:07:41.070689+00	2018-04-07 05:07:41.070709+00
160	i4HidspPh9b0jgeDCwq0jvOGwHbYgw	160	1	32	2018-04-09 04:03:26.455988+00	2018-04-09 04:03:26.456006+00
161	rSDLDEBYlLzoF77xhMMiwyGoefu1nv	161	1	47	2018-04-09 16:42:13.813258+00	2018-04-09 16:42:13.813278+00
162	JT9cV1JrO4nsSOKkiIsadQ3NpLFe8Y	162	1	17	2018-04-09 23:05:25.758866+00	2018-04-09 23:05:25.758885+00
163	G41mllOsmgHNqsvibjnEOTDQJeAeJ2	163	1	17	2018-04-09 23:29:13.560223+00	2018-04-09 23:29:13.560242+00
164	9Jva5o5RjeFEJtPIveEYcfSoftwhZ9	164	1	17	2018-04-09 23:39:03.070487+00	2018-04-09 23:39:03.070506+00
165	V7cSvX79IRo0iwaYqwkKJRl5IXD6N8	165	1	17	2018-04-09 23:47:39.228027+00	2018-04-09 23:47:39.228045+00
166	8O3f9AbGWdlx5HlGxH13t2XL1tG4xJ	166	1	47	2018-04-11 20:56:40.514336+00	2018-04-11 20:56:40.514353+00
167	al1H7YLe8uzcf8aPb4kwHqszJm6gxe	167	1	41	2018-04-12 02:37:31.859099+00	2018-04-12 02:37:31.85912+00
168	pJFqQZBrl7FlMGyZo6KPhU1LpBpQx6	168	1	17	2018-04-12 02:37:37.148699+00	2018-04-12 02:37:37.148717+00
169	3sQDc71dZJVRXKZfXUjGlr1K5bpUWF	169	1	21	2018-04-12 02:39:26.122246+00	2018-04-12 02:39:26.122264+00
170	pNxX7IpxmP1Dp36qlgb0ndgDqgmDGf	170	1	21	2018-04-12 02:47:57.909434+00	2018-04-12 02:47:57.909454+00
171	6bzA1klUAcEJVNWzrJ9KEAJuZk1QEe	171	1	64	2018-04-12 03:56:35.717937+00	2018-04-12 03:56:35.717955+00
172	zl3mfFTc2LFdSvM2RAVQxPLA9df593	172	1	65	2018-04-12 04:22:54.698734+00	2018-04-12 04:22:54.698754+00
173	om6P3YWLzHjI77iD5z20Z1JGOflaPn	173	1	16	2018-04-12 05:16:37.365147+00	2018-04-12 05:16:37.365167+00
174	CljVjiTtbO7l4hRnFaqmdtuIQJVcxo	174	1	21	2018-04-13 23:23:32.866352+00	2018-04-13 23:23:32.86637+00
175	Fi9winpTmpaIHoM0L6RSvQje0RV7MC	175	1	17	2018-04-17 05:13:30.781324+00	2018-04-17 05:13:30.781344+00
176	J1Mc8fCa73dowxbPqcLmDFlJOj56J3	176	1	17	2018-04-18 03:24:06.81977+00	2018-04-18 03:24:06.819789+00
177	ejbUGJ7C2ZGOpWU6wVe1J9yMgCfUOD	177	1	16	2018-04-23 01:29:47.577793+00	2018-04-23 01:29:47.577813+00
178	z7CgSWrwKTpChBwdxGeClSG03GUtQE	178	1	40	2018-04-23 16:40:47.948152+00	2018-04-23 16:40:47.948172+00
179	qqWzxNixqzBQmok9CBSqpIaankngGE	179	1	16	2018-04-25 01:59:56.568664+00	2018-04-25 01:59:56.568683+00
180	dXBDyeNdoOCn4wMwyaSuMql3mqD1c5	180	1	16	2018-04-25 03:32:01.195222+00	2018-04-25 03:32:01.195242+00
181	AOAI9s2F6IkTyF9F4YQ8rgEFy2sfyG	181	1	40	2018-04-30 21:59:33.0853+00	2018-04-30 21:59:33.085345+00
182	hUOLKSmrIfaRRS7GE3ff5WXukcKZ4j	182	1	40	2018-05-01 01:34:04.746489+00	2018-05-01 01:34:04.746508+00
183	NgL9s366XyZwJANnUiYq36xgc5QXSR	183	1	21	2018-05-01 06:11:49.295646+00	2018-05-01 06:11:49.295665+00
184	IzYg8yTzpUCq7DrZ7KUNbHn1bY5v2p	184	1	16	2018-05-03 14:52:20.557405+00	2018-05-03 14:52:20.557424+00
185	Nmv00jbEEFVz13zv8y9n1ADFPrwz6H	185	1	64	2018-05-04 06:51:13.007077+00	2018-05-04 06:51:13.007102+00
186	Ueg5NllQg5aK3vsTNF1Lvj8MRT4B3t	186	1	66	2018-05-04 07:00:03.500199+00	2018-05-04 07:00:03.500222+00
187	PqcWJJbb32NjrBhL2NYjopeyzSGFzC	187	1	67	2018-05-04 07:05:02.982563+00	2018-05-04 07:05:02.982581+00
188	BEG3G908NrWxcD4mVL23b05OIL6nNI	188	1	16	2018-05-10 15:47:42.324297+00	2018-05-10 15:47:42.324316+00
189	UhQKYECMwhpR0tLHTIZrgVPGdghHRg	189	1	16	2018-05-16 02:34:42.065105+00	2018-05-16 02:34:42.065124+00
190	5DJkXodRMrVmCGRcusVLMx2848cPyK	190	1	17	2018-05-16 02:36:04.587876+00	2018-05-16 02:36:04.587896+00
191	nNfzM4E8x2vgSLZSAKBEmiaobFMEK3	191	1	64	2018-05-16 02:37:21.528997+00	2018-05-16 02:37:21.529017+00
192	V0d0dKE40uGErIRBoqBzwIBVvtLG9a	192	1	47	2018-05-18 19:06:13.77463+00	2018-05-18 19:06:13.774662+00
193	iSdQm2lyp1fR9zs9u3asqELByMYv7R	193	1	17	2018-05-21 17:49:43.81509+00	2018-05-21 17:49:43.815109+00
194	kBtGvMVsBIdJ4qPo7Q6D7VWl0lDNQj	194	1	32	2018-05-21 21:48:08.434827+00	2018-05-21 21:48:08.434848+00
195	4uu9GjIDTJ9KDtgy4vt571fKy0ctcY	195	1	76	2018-05-22 06:49:45.232149+00	2018-05-22 06:49:45.23218+00
196	amPiDBKDNmotJl1qif6n3H9OuR3kns	196	1	77	2018-05-23 16:45:10.028561+00	2018-05-23 16:45:10.028581+00
197	YhJgWCUS7A8VJRyCgBWAi4qrrlSH1l	197	1	78	2018-05-23 17:32:41.95356+00	2018-05-23 17:32:41.953579+00
198	oMIRiibIeNH6oY16P23Hi5VjyDHspg	198	1	79	2018-05-23 19:39:37.371222+00	2018-05-23 19:39:37.371241+00
199	S2OvBvW330escXHJpWkruxzjDHFavE	199	1	80	2018-05-23 19:43:06.082735+00	2018-05-23 19:43:06.082754+00
200	Pt3GuzlBz2f2pDYymrqBnqFWmvoOtU	200	1	80	2018-05-23 19:44:02.053959+00	2018-05-23 19:44:02.053978+00
201	63wtFWh2nb0YiwVsenvlDffwhHcfeO	201	1	81	2018-05-23 19:44:23.585817+00	2018-05-23 19:44:23.585835+00
202	tonURSzzs1m2bVt1NTNjpDs9r2n8yT	202	1	82	2018-05-23 19:45:23.13935+00	2018-05-23 19:45:23.139369+00
203	7KwchKK9u6ZjJs8l66eGp1IIQVW4Yw	203	1	82	2018-05-23 19:46:22.59672+00	2018-05-23 19:46:22.596739+00
204	dxG7ZtKil40YaIsA118Wt84wezVHVa	204	1	82	2018-05-23 19:51:49.48898+00	2018-05-23 19:51:49.488999+00
205	q1O8MOnfD5yrB9S6TiOJcOIp6d8Ig7	205	1	83	2018-05-23 19:54:56.938811+00	2018-05-23 19:54:56.938829+00
206	BdsyJdUMAcGp3OU0FKsGkChucdukWC	206	1	86	2018-05-23 19:55:40.423606+00	2018-05-23 19:55:40.423626+00
207	eSMgJZNjsv3zpL4BJjn7aISXiYX11q	207	1	89	2018-05-23 19:57:15.950106+00	2018-05-23 19:57:15.950124+00
208	fv9SOrweGVveqXLkW8IlbC4RgdDOV7	208	1	90	2018-05-23 19:58:04.902022+00	2018-05-23 19:58:04.902041+00
209	63hezdQYPm8WULNarsPYeFmPRfMDFo	209	1	91	2018-05-23 19:58:20.351584+00	2018-05-23 19:58:20.351602+00
210	xJs9MtkNeAxq6NFvjzd9d0eEjk2iiv	210	1	92	2018-05-23 19:59:21.612439+00	2018-05-23 19:59:21.612457+00
211	jacJS3puSRj63dNoeyIj1dGD6h5ey5	211	1	92	2018-05-23 20:00:08.326893+00	2018-05-23 20:00:08.326913+00
212	gYvDXEScOcShozXMGlcKD0hPF9Q5sR	212	1	93	2018-05-23 20:00:31.020408+00	2018-05-23 20:00:31.020428+00
213	vvRf5VYgnQRR9hHk3HyvfDjVlEFpIg	213	1	94	2018-05-23 20:03:47.333975+00	2018-05-23 20:03:47.333993+00
214	OWd0SUamzqm76PHTYpK6oR8B6e1aQT	214	1	95	2018-05-23 20:05:21.034733+00	2018-05-23 20:05:21.034753+00
215	ujdY05VFdpIiwk6tDZKy7nMGj3NZyo	215	1	98	2018-05-23 20:06:28.728034+00	2018-05-23 20:06:28.728053+00
216	AS2iLaH91HRaDVc8dACCk2Ke6u27KS	216	1	98	2018-05-23 20:07:00.186635+00	2018-05-23 20:07:00.186653+00
217	LNTZVIpt5x1tPbxWPSfiR8PU3KOu2v	217	1	91	2018-05-23 20:11:47.483936+00	2018-05-23 20:11:47.483955+00
218	90tVyIvzN5U7wgEykFjRxc5MKHZiST	218	1	99	2018-05-23 20:20:20.93012+00	2018-05-23 20:20:20.93014+00
219	MqjfSSG3cM5wXMBMQGgxTis7EUBCHy	219	1	99	2018-05-23 20:21:26.631971+00	2018-05-23 20:21:26.63199+00
220	YwSjcNATdRNGgZnc6Hoi7xI0cUpAAT	220	1	99	2018-05-23 20:22:05.619243+00	2018-05-23 20:22:05.619263+00
221	vSJIYbsE4cRnj2FcXRI98x4huwv7c3	221	1	100	2018-05-23 20:26:17.0789+00	2018-05-23 20:26:17.07892+00
222	tZJCRTkNY0wT7ldT162w9nBzPcHsud	222	1	100	2018-05-23 20:27:11.659081+00	2018-05-23 20:27:11.659101+00
223	d27p0zpl53KX8hid3qkqP4l2LBpiMF	223	1	102	2018-05-23 20:40:20.198698+00	2018-05-23 20:40:20.198717+00
224	XsMLgVaVrxVOBsa1aHN3GSInC1ZCpt	224	1	103	2018-05-23 20:43:50.098461+00	2018-05-23 20:43:50.098481+00
225	pjtaTITHSj9lBSH74rX6sZmkWfh6qY	225	1	103	2018-05-23 20:45:42.498592+00	2018-05-23 20:45:42.498612+00
226	SHA2mw1LXXs1g4VBD0rXLTUu0b2ouW	226	1	104	2018-05-23 20:47:25.170265+00	2018-05-23 20:47:25.170284+00
227	b3g29OqgmPGTZjjxwnviy3M7VlREnu	227	1	105	2018-05-23 20:50:50.183108+00	2018-05-23 20:50:50.183126+00
228	TOEEsfuq3SYHqnUESIujdn74GZASkh	228	1	106	2018-05-23 20:51:38.114767+00	2018-05-23 20:51:38.114785+00
229	E88B1HPR0PbanVwk2GmhP8i3a2b5W7	229	1	105	2018-05-23 20:51:38.591193+00	2018-05-23 20:51:38.591212+00
230	bcHM6oplDSV07TzWEGxTVc5tBUxXAU	230	1	107	2018-05-23 20:52:23.271693+00	2018-05-23 20:52:23.271711+00
231	QKVLcpwb2jI2DGpUKM7ysGEWkiyeCo	231	1	108	2018-05-23 20:52:24.484597+00	2018-05-23 20:52:24.484616+00
232	FrV0L3uuQ2MOxE3huhm1P1slCE0aqF	232	1	109	2018-05-23 20:54:52.191397+00	2018-05-23 20:54:52.191416+00
233	0df2OTfXp60jUMC9RcaRSrGlceah0Q	233	1	110	2018-05-23 20:55:32.621595+00	2018-05-23 20:55:32.621614+00
234	SUEN3xBg2CRPsRR6nBqZaaNq8Ji1GN	234	1	111	2018-05-23 20:55:47.001003+00	2018-05-23 20:55:47.001021+00
235	5ag3bk2d40FZe13Tk0fa4K5a3LNaiv	235	1	110	2018-05-23 20:56:16.143233+00	2018-05-23 20:56:16.143254+00
236	IdWgXsNJcPLjdS8E53RfIT33LfJVBq	236	1	108	2018-05-23 20:56:25.36422+00	2018-05-23 20:56:25.364239+00
237	eQ0fQgpBs9IqGX4eVMYjq6hUd3aggL	237	1	112	2018-05-23 20:56:55.856212+00	2018-05-23 20:56:55.856232+00
238	nhZHp034WTb28oEGxFekZdX8NXut63	238	1	113	2018-05-23 20:57:34.991919+00	2018-05-23 20:57:34.991939+00
239	Q4FbEabgA28Gvp8rI6jJ47C7IT6EeL	239	1	113	2018-05-23 20:58:16.508886+00	2018-05-23 20:58:16.508906+00
240	QKq57h4t1JqQbz9cGfFqEPwtAv5RWT	240	1	112	2018-05-23 20:59:21.921646+00	2018-05-23 20:59:21.921679+00
241	DIOVFTv65nXCoAUlQqefaE0cdY5zYE	241	1	114	2018-05-23 21:04:11.596142+00	2018-05-23 21:04:11.59616+00
242	GHfgkcmGn01xEmNfK6ReFpmyGaq4i7	242	1	115	2018-05-23 21:04:21.015179+00	2018-05-23 21:04:21.015198+00
243	O2Tgg8Qs55zziPBvEMjTEnDp3m2rTx	243	1	115	2018-05-23 21:05:03.340741+00	2018-05-23 21:05:03.340761+00
244	e5OuE3CesmL5uuWJV6REZcviGOlgxy	244	1	103	2018-05-23 21:17:21.037025+00	2018-05-23 21:17:21.037044+00
245	dXhSFSaj2OKqMBTpyBfq9vBIMr3Szp	245	1	116	2018-05-23 21:20:44.007533+00	2018-05-23 21:20:44.007552+00
246	fVEtfby1QTRNLKA5v6FKC2REDEzluN	246	1	117	2018-05-23 21:23:17.425846+00	2018-05-23 21:23:17.425865+00
247	YLkHHwTeAOTciQPEgTCrVSS110A0mc	247	1	118	2018-05-23 21:27:41.093272+00	2018-05-23 21:27:41.09329+00
248	vookWR2h89KRhbaGaOrMweb4nkP5ax	248	1	92	2018-05-23 21:31:46.033428+00	2018-05-23 21:31:46.033447+00
249	xyLVVVPEghJbjMSzBZmMJ9A1wKUVZx	249	1	119	2018-05-23 21:40:30.653757+00	2018-05-23 21:40:30.653775+00
250	dZCIY20McUZmctc2ibpT3eyF8kz0uh	250	1	120	2018-05-23 21:47:58.154742+00	2018-05-23 21:47:58.154763+00
251	LTMgtGeJ8CnwF32wxS4Q457O7eUsRc	251	1	105	2018-05-23 22:24:01.687513+00	2018-05-23 22:24:01.687532+00
252	iSIb9SSF19RI3V23fJdOpqpGXm5pbq	252	1	41	2018-05-24 02:43:37.428338+00	2018-05-24 02:43:37.428357+00
253	0kg2bFWOG0UHzmG1TmHgqZnV3I8Zro	253	1	47	2018-05-24 02:43:58.223789+00	2018-05-24 02:43:58.223807+00
254	vT2pmoG0XqEngRADJtdnAMPHDjW2KQ	254	1	16	2018-05-24 02:44:22.652404+00	2018-05-24 02:44:22.652423+00
255	MUlM65eZCsjShIDfvRjJgdQ6abMmJj	255	1	64	2018-05-24 03:44:46.521812+00	2018-05-24 03:44:46.52183+00
256	gP4skWrBsJg4scRkJfx433URVTjXyQ	256	1	16	2018-05-24 03:45:28.219727+00	2018-05-24 03:45:28.219746+00
257	Ioqg3zrO5PGxRkUiF9v3HW6xEAMVr4	257	1	29	2018-05-24 04:02:48.286808+00	2018-05-24 04:02:48.286827+00
258	ooiCCSXoG9yn66OM81ZnIZVgxAvNFf	258	1	29	2018-05-24 04:03:41.131984+00	2018-05-24 04:03:41.132003+00
259	z30hB6DdpiXsOePSM5wUTFMwX6EMTn	259	1	29	2018-05-24 04:05:12.345932+00	2018-05-24 04:05:12.34595+00
260	MhbkdcMWs0aoigwWZK4YxHRjxZPeK2	260	1	121	2018-05-24 04:07:14.049358+00	2018-05-24 04:07:14.049378+00
261	2eDVDaA9xcImiICiRvkBcQiY6IJf2D	261	1	16	2018-05-24 04:07:58.408587+00	2018-05-24 04:07:58.408606+00
262	MQwGz1cBcXpJ4DGOyU7EDp9HYfKsGl	262	1	121	2018-05-24 04:08:00.374877+00	2018-05-24 04:08:00.374896+00
263	4tENRKFbUtnoGd1WDvkrtZqdXwSDOn	263	1	17	2018-05-24 04:23:43.229586+00	2018-05-24 04:23:43.229606+00
264	sf6jT98iWuFIg7nGP6MM6najbQJ3d8	264	1	122	2018-05-24 04:49:00.715522+00	2018-05-24 04:49:00.715541+00
265	RBnf3a69aUnZQnpNeKan2WNFY0NyLP	265	1	123	2018-05-24 04:53:51.170122+00	2018-05-24 04:53:51.17014+00
266	okeY2dCdSjeHl6686wnC0ZWWlQyNJG	266	1	16	2018-05-24 06:13:50.327218+00	2018-05-24 06:13:50.327237+00
267	uhDadiVFLYiCN9nCN27ByiWNXVl6rP	267	1	16	2018-05-24 17:33:41.614113+00	2018-05-24 17:33:41.614145+00
268	6mc9v7fYdlKpWK0qqM4VxtVT85PRLn	268	1	16	2018-05-24 20:03:19.372136+00	2018-05-24 20:03:19.372153+00
269	fPzjqvXynSHY8hRPj6eieatA4HE0XQ	269	1	124	2018-05-24 21:44:22.420996+00	2018-05-24 21:44:22.421016+00
270	BoPqtAt5maWptwK3CFPiuxjsRvNAer	270	1	32	2018-05-24 21:49:50.603074+00	2018-05-24 21:49:50.603091+00
271	RMiukkGbxFql5BqMSNZxO2ZHbLsMp8	271	1	32	2018-05-24 22:00:12.445079+00	2018-05-24 22:00:12.445098+00
272	0kJALGmqwg0TvyxrnSQr2qvTcFvVHp	272	1	29	2018-05-24 22:11:27.931606+00	2018-05-24 22:11:27.931625+00
273	AW3bpOL86xfdt1P4QEGEuh9NRYFN7A	273	1	17	2018-05-24 23:52:54.800711+00	2018-05-24 23:52:54.800729+00
274	32GTECN5cdybejtcl5D0rMGmEavQim	274	1	125	2018-05-25 00:36:22.782515+00	2018-05-25 00:36:22.782534+00
275	du5K2t8JjKP2ZuLGj3gEuB0OwyDTB7	275	1	126	2018-05-25 02:44:09.650368+00	2018-05-25 02:44:09.650387+00
276	HpnLtjxB0l7pgrkgghslHon3hLvp16	276	1	47	2018-05-25 03:22:02.344501+00	2018-05-25 03:22:02.34452+00
277	iVUUAN8YyynSvYtxnJCcQOzkhBpLHX	277	1	114	2018-05-25 04:42:37.447167+00	2018-05-25 04:42:37.447187+00
278	AethIq4X3dOMdj4Xd7HeZ8GC6vmuTu	278	1	16	2018-05-25 04:47:42.189424+00	2018-05-25 04:47:42.189444+00
279	6xoCcMJZjhm21JB8pINrQ86rbFV7yE	279	1	40	2018-05-25 05:06:20.9462+00	2018-05-25 05:06:20.946219+00
280	9dueOV8OXHI8cvCJJwi9KMXlCjl9D3	280	1	105	2018-05-25 05:10:56.119435+00	2018-05-25 05:10:56.119453+00
281	8xwIXLPvNrHOc66Iww40Ehf7KBIQjP	281	1	16	2018-05-25 16:34:51.109238+00	2018-05-25 16:34:51.109257+00
282	0EQz2jUrhLAZoS30j3gxXLIXvjjWTz	282	1	32	2018-05-25 19:19:17.629998+00	2018-05-25 19:19:17.630019+00
283	P4tUeObybYdmKyR6RdOhucBtvuLPZQ	283	1	21	2018-05-26 04:01:42.039833+00	2018-05-26 04:01:42.039853+00
284	NPjwvc0ROe6S88oEhEDIMblxIZikha	284	1	127	2018-05-26 04:10:24.224602+00	2018-05-26 04:10:24.224621+00
285	Dhe4vAq4TgDrehsjDoIq9JajFTgLLw	285	1	16	2018-05-26 04:41:17.494987+00	2018-05-26 04:41:17.495006+00
286	i9xpBVKZ9PeRsgThrQG0nTqUpkpjbj	286	1	128	2018-05-26 04:45:05.818851+00	2018-05-26 04:45:05.818871+00
287	dDOczxUDSzW2oBEZTS0FSMVTzRyRNe	287	1	128	2018-05-26 04:46:31.441886+00	2018-05-26 04:46:31.441905+00
288	XA0g1qxDTAIOAQTcNSH5EBcfi8TsTE	288	1	128	2018-05-26 04:50:11.634771+00	2018-05-26 04:50:11.634791+00
289	nuuL0H2mbBr6HabG9kYSD5Nc7oMyr9	289	1	16	2018-05-26 04:53:08.840907+00	2018-05-26 04:53:08.840926+00
290	JrR4PBIsOpA3zEpXJShNduuFDRHo1a	290	1	41	2018-05-26 06:49:47.473035+00	2018-05-26 06:49:47.473053+00
291	vEnsmoF7kyKXECohb5xTO17TXGlgnB	291	1	129	2018-05-26 07:07:02.33802+00	2018-05-26 07:07:02.338038+00
292	cFeRPcdK6Y85CyahkyluFUAlY4zmL7	292	1	129	2018-05-26 07:08:05.734704+00	2018-05-26 07:08:05.734723+00
293	WYdCG8iM2YdnpknkJQjhHBm9LvMGXD	293	1	130	2018-05-26 07:13:17.181947+00	2018-05-26 07:13:17.181966+00
294	Ra7TkdngcXPXlFfL76kMxAVQz5Uuzr	294	1	131	2018-05-26 09:35:20.152425+00	2018-05-26 09:35:20.152443+00
295	7Mx2uJKWLZymzxBb19SvVJ38aPYz4K	295	1	131	2018-05-26 09:36:05.556535+00	2018-05-26 09:36:05.556555+00
296	PlWstt33gCm5UlasMZ08j8SxUFSxBN	296	1	132	2018-05-26 10:15:15.740017+00	2018-05-26 10:15:15.740048+00
297	5oOOldQtmjES55MzCRoQd4VxQKoQOl	297	1	132	2018-05-26 10:16:20.999384+00	2018-05-26 10:16:20.999401+00
298	2KHayDVoHhKeT3oiLYouIkryhyAlsS	298	1	133	2018-05-26 16:21:48.682255+00	2018-05-26 16:21:48.682273+00
299	mxiK1odoYT1NwvoLTFBPTESa3Bq9EU	299	1	16	2018-05-26 20:24:49.217651+00	2018-05-26 20:24:49.217671+00
300	88CSOXWko9QX0SpcOmpM1OHtfNNqj8	300	1	134	2018-05-26 21:47:36.497879+00	2018-05-26 21:47:36.497898+00
301	IcskGCowZALfRUypXdr0FqkpLqveC1	301	1	135	2018-05-27 02:28:07.661883+00	2018-05-27 02:28:07.661901+00
302	sePurVHXsN1H1RGtEjCAKQ4Slnd2uu	302	1	135	2018-05-27 02:39:56.701061+00	2018-05-27 02:39:56.701079+00
303	RVMiHiPhRPpW1e3rsjvBU43wJKnGY0	303	1	16	2018-05-27 06:06:00.807859+00	2018-05-27 06:06:00.807878+00
304	1Nsf2tUMHh7zR0J7iv1E6H4xTiLfdW	304	1	136	2018-05-27 06:19:26.721702+00	2018-05-27 06:19:26.721732+00
305	DAwVaBdRAYD6x3llyyqofi69MZCzvm	305	1	64	2018-05-27 18:03:19.281414+00	2018-05-27 18:03:19.281433+00
306	q7bNKdWO0QZO7MPey7hE0AR6UFgtJv	306	1	137	2018-05-27 22:23:35.33067+00	2018-05-27 22:23:35.330689+00
307	2GypEyHNj01fxiMDPFZXDYudUXMNJ8	307	1	16	2018-05-27 22:26:37.283448+00	2018-05-27 22:26:37.283467+00
308	I3aHHdtLehOTgyIJLFB1T9IxmF5QAq	308	1	106	2018-05-27 22:41:16.589808+00	2018-05-27 22:41:16.589839+00
309	16PFAQXBaodhFXerei9ZMoBrg5ghYg	309	1	134	2018-05-28 02:01:11.714101+00	2018-05-28 02:01:11.71412+00
310	0zOmRx9F8sXpgkXugj4Ln5AmnwVGVg	310	1	134	2018-05-28 22:47:28.689422+00	2018-05-28 22:47:28.68944+00
311	3hnlbCn1qWjxVo1OoKVf5UGxZieX1q	311	1	21	2018-05-29 03:56:57.565931+00	2018-05-29 03:56:57.56595+00
312	52o7oHevf73lgTl6AgL5S7NY9mNe8U	312	1	138	2018-05-29 23:49:34.19947+00	2018-05-29 23:49:34.199489+00
313	U1Uv1x3AW5JH8yE9ezIMCfPeIf56jK	313	1	138	2018-05-29 23:51:41.717959+00	2018-05-29 23:51:41.717979+00
314	meNwiFzreR1dlf9T5l5PKSPtnfEVn2	314	1	16	2018-05-30 05:18:34.172645+00	2018-05-30 05:18:34.172666+00
315	MJu1FclTUvHseqIhcTTNUe8u4jtiD6	315	1	139	2018-05-30 18:05:30.997586+00	2018-05-30 18:05:30.997606+00
316	uBdIJwoUtjXZxnJQAb5RWjY42Kg5Vj	316	1	140	2018-05-30 20:57:49.225494+00	2018-05-30 20:57:49.225519+00
317	aXjvlznv5M1xr1D7tEsOmXdHqpjLnL	317	1	64	2018-05-31 01:34:22.345297+00	2018-05-31 01:34:22.345316+00
318	2MlktDZmwICWLPNQxrNNKSQgmzWgYV	318	1	17	2018-05-31 03:17:41.464118+00	2018-05-31 03:17:41.464138+00
319	44UbG2c1N4uLuKGF4BzFXm7cIVBEkl	319	1	47	2018-05-31 03:17:45.304853+00	2018-05-31 03:17:45.304873+00
320	YtFotYccWrwIPlvpswfSCMSB1iCWel	320	1	16	2018-05-31 03:34:43.299692+00	2018-05-31 03:34:43.299713+00
321	jEyYJiOsbT4cEsdISSOLLwNnXOIiQz	321	1	16	2018-05-31 03:56:34.985533+00	2018-05-31 03:56:34.985554+00
322	D3ZHWKjj1IygG4Meswzex2XpBHDm6a	322	1	60	2018-05-31 03:57:41.46945+00	2018-05-31 03:57:41.469492+00
323	rJtTn7nj1yE4SS5RoNYLEyFChJWVko	323	1	16	2018-05-31 04:25:08.701916+00	2018-05-31 04:25:08.701935+00
324	ZvLqZMkfIL5h61ZsGopvJKSm0U9t3E	324	1	47	2018-05-31 04:26:42.726007+00	2018-05-31 04:26:42.726024+00
325	sIremVRNHG9yuFv930YF1PeKhZUzsV	325	1	47	2018-05-31 04:38:31.196737+00	2018-05-31 04:38:31.196758+00
326	sZdEYuXzMDrSsESbjKcLqtFY6pmcYz	326	1	17	2018-05-31 04:38:39.556961+00	2018-05-31 04:38:39.55698+00
327	7lnPwHvi6GtgdPLZn1tsGIL7BYiAPr	327	1	47	2018-05-31 04:50:56.954865+00	2018-05-31 04:50:56.954884+00
328	VF4aGJPBUb0bJTxKXLcIseHsAz9Im0	328	1	16	2018-05-31 04:55:48.294564+00	2018-05-31 04:55:48.294583+00
329	vMbDyKpIRK2eqL44fzP3hNyg1IS8L7	329	1	16	2018-05-31 04:57:14.862964+00	2018-05-31 04:57:14.862982+00
330	ZZsYkvkzD8jh7dsT2mKm7t5HwZPXwG	330	1	141	2018-05-31 15:32:17.122529+00	2018-05-31 15:32:17.122548+00
331	WBnDVaI6Hsu4bbDOo9HEnPehcMfuel	331	1	141	2018-05-31 15:33:59.711104+00	2018-05-31 15:33:59.711121+00
332	plCa8zlGD8leIhkgerb8RVb6MvUIRQ	332	1	142	2018-05-31 17:23:16.827861+00	2018-05-31 17:23:16.827879+00
333	EckJLxbBYIN3zUA3Hs44U6fB3kPlfe	333	1	142	2018-05-31 17:23:51.22564+00	2018-05-31 17:23:51.225657+00
334	JX0Amw4UElgkm1AjbSNGBQdR25M1mo	334	1	143	2018-05-31 21:51:07.361887+00	2018-05-31 21:51:07.361919+00
335	ivTGfScCIHhaUtK4t1gYlFmSLC4w1H	335	1	144	2018-06-02 05:54:52.906009+00	2018-06-02 05:54:52.906027+00
336	fTc9xx4TYTOKwi3iE3fvxZ94x9eZS2	336	1	16	2018-06-02 19:47:11.231314+00	2018-06-02 19:47:11.231331+00
337	Dkm6FlXKfH0ISkvnjKoJod69ImkcTL	337	1	115	2018-06-02 22:07:50.253798+00	2018-06-02 22:07:50.253817+00
338	IPM5cnEsrLXS8X23Z73FoqsdaXlkLi	338	1	145	2018-06-04 01:28:02.745139+00	2018-06-04 01:28:02.745157+00
339	K0kJWyRiJoBg1qJng3zXw9G1BZruf2	339	1	16	2018-06-04 01:30:56.044672+00	2018-06-04 01:30:56.044691+00
340	CHMa31PKELdsD01mxvNKEloCKfB0Dv	340	1	64	2018-06-04 21:06:24.524724+00	2018-06-04 21:06:24.524741+00
341	zax6rdS11XaA1ieYeMSHW48Dc5DUOv	341	1	17	2018-06-06 00:55:06.306625+00	2018-06-06 00:55:06.306643+00
342	efb7SRFYxXnq4Tljvftar1bkDtvDYO	342	1	146	2018-06-06 17:19:44.229025+00	2018-06-06 17:19:44.229044+00
343	UrIQFVyNcXIplkfwVli9TrhcJLrSuQ	343	1	17	2018-06-07 02:33:11.228374+00	2018-06-07 02:33:11.228393+00
344	BbrbppoBKISSvaQbmU5NjYcERE3Kqn	344	1	47	2018-06-07 02:33:57.823677+00	2018-06-07 02:33:57.823695+00
345	6A8c1NBzk7CIJe2fSCd2IcHHQpJeRO	345	1	147	2018-06-07 03:46:16.685659+00	2018-06-07 03:46:16.685676+00
346	XVXBgDx2ULzl0cFLiinFuCRzTVIkG0	346	1	148	2018-06-07 07:56:15.828324+00	2018-06-07 07:56:15.828343+00
347	31IBmMDleh864t7WjxxlPArUKJqlV9	347	1	148	2018-06-07 08:04:05.877754+00	2018-06-07 08:04:05.877773+00
348	CYYUxa86bovqAneKJICOOU5WrwwVst	348	1	16	2018-06-07 22:53:20.181833+00	2018-06-07 22:53:20.181852+00
349	nfwyoAzlzROeFuifprPMEBOVfMldHm	349	1	21	2018-06-10 03:22:45.897669+00	2018-06-10 03:22:45.897686+00
350	8OYMeXP6heLWlD8QijAIAaiZ7beOhn	350	1	21	2018-06-11 06:30:33.942051+00	2018-06-11 06:30:33.942068+00
351	uk6p0ryz7BV78fQqZ5YdEpv3opaTI9	351	1	149	2018-06-15 18:32:48.353229+00	2018-06-15 18:32:48.353248+00
352	kAztDulAG4uTd269lmUmeWRk5cj0wP	352	1	21	2018-06-27 22:47:47.386602+00	2018-06-27 22:47:47.386619+00
353	YPr7Y6p3yaQw7mI5hC0Xeji5EzLw5d	353	1	47	2018-07-07 00:51:32.94725+00	2018-07-07 00:51:32.947271+00
354	9HtFK2dCQW51mTKmkllhZqAwzF9ACc	354	1	64	2018-07-15 18:02:32.586263+00	2018-07-15 18:02:32.586281+00
355	LGS19LsE91DIkIr06GnBSqL2UEcTQp	355	1	150	2018-07-18 01:00:03.263903+00	2018-07-18 01:00:03.263923+00
356	iHR25AMPnmJSPUN0a6jxRq4Y9ydvoX	356	1	32	2018-07-28 02:28:07.592856+00	2018-07-28 02:28:07.592875+00
357	bCjQJuJU38hKEOLT1IxFlJNnfpbDxC	357	1	32	2018-08-23 04:48:02.814612+00	2018-08-23 04:48:02.814631+00
358	BcaE4e6ibCCWknXqVHg2gGVKkdRdMK	358	1	151	2018-08-29 22:07:02.696974+00	2018-08-29 22:07:02.696994+00
359	cmlhvZwRdd9CQsbhxPSpPMw2FrpD7u	359	1	47	2018-09-25 20:43:27.311702+00	2018-09-25 20:43:27.31172+00
360	jn9ZOresygTu6fUgChdmZaXItG2vWA	360	1	47	2018-09-28 02:59:14.610055+00	2018-09-28 02:59:14.610077+00
361	OSXYznnm8D2GDV0Qb2WsOGEboGVFig	361	1	47	2018-09-28 02:59:31.233539+00	2018-09-28 02:59:31.233559+00
362	eY3EvRsMGlKuxZrpbwzihCNFFyld6J	362	1	47	2018-09-28 02:59:51.355196+00	2018-09-28 02:59:51.355214+00
363	zDs4PAUY1s7s9se3ZLnESkzLkC1zFE	363	1	47	2018-09-28 03:00:18.03018+00	2018-09-28 03:00:18.030198+00
364	dnYW3AVeMKceRwYoDfDvEmvnmvsz2n	364	1	47	2018-09-28 03:00:58.45587+00	2018-09-28 03:00:58.45589+00
365	14No3mHTe4R2rFeJtfWL5H2msZcpIR	365	1	47	2018-09-28 03:08:17.330827+00	2018-09-28 03:08:17.330847+00
366	Zkv4AfRQacAx8UbTh5vmFyqx67pjHB	366	1	47	2018-09-28 03:16:27.141814+00	2018-09-28 03:16:27.141834+00
367	ZYwET4W7nRqzxMdFptAxPYzSJo3ADl	367	1	47	2018-09-28 03:22:45.157574+00	2018-09-28 03:22:45.157593+00
368	vR489mmIBp3sCrJuJ8h33SKISIpCkj	368	1	47	2018-09-28 03:28:02.79584+00	2018-09-28 03:28:02.795858+00
369	wM8ASX2M1ReBQu78v1PMvlIKBzCs5j	369	1	47	2018-09-28 03:28:51.172695+00	2018-09-28 03:28:51.172715+00
370	zmVRLxMxZeOZmpI6dI3fWbP7ndSE5h	370	1	47	2018-09-28 03:58:07.096133+00	2018-09-28 03:58:07.096153+00
371	96vz7Q1ZcH4HRLsyFIoHHXJZA0OHd0	371	1	47	2018-09-28 19:20:28.777231+00	2018-09-28 19:20:28.777249+00
372	Ci0Sg14yEVPODYWXAfgX3BRHEo3SvV	372	1	47	2018-10-01 17:44:29.864846+00	2018-10-01 17:44:29.864866+00
373	NsOU2XH5l1ch27KfXw0paDrvPUlhbK	373	1	152	2018-10-01 22:18:33.90758+00	2018-10-01 22:18:33.907612+00
374	VuOWn39hZGg1Tpdtcz9jzS6ynBXyMe	374	1	152	2018-10-01 22:19:01.662125+00	2018-10-01 22:19:01.662145+00
375	WvpHVPz6n9uRRrk0fu7IXXkZasEAuS	375	1	21	2018-10-03 02:29:38.662302+00	2018-10-03 02:29:38.662322+00
376	K3iztSN1HekfR597Y6R3dUNL18BvPB	376	1	47	2018-10-03 19:22:48.213035+00	2018-10-03 19:22:48.213055+00
377	TMLbEh2KTz6xbIXQHSoklV2buVp0qD	377	1	153	2018-10-04 20:42:25.907525+00	2018-10-04 20:42:25.907545+00
378	GawXrNyTSW3J9WCQAFV2zB6Lo56Ut0	378	1	154	2018-10-04 23:42:14.192909+00	2018-10-04 23:42:14.192929+00
379	BWZmWMFgrnzWzDxKA0uOFZjZbMvDCm	379	1	47	2018-10-05 00:53:49.462901+00	2018-10-05 00:53:49.462921+00
380	xGYm6C5NJXIqnOUKnX1F4PqLmTa1GG	380	1	47	2018-10-05 00:53:49.887149+00	2018-10-05 00:53:49.887168+00
381	fmzAnoApShbSlHV78QSpkXOlHPFp88	381	1	155	2018-10-05 01:10:06.502566+00	2018-10-05 01:10:06.502585+00
382	poG2aiQb7g9EuAePBpNizIAepQmh8F	382	1	156	2018-10-05 04:27:27.109802+00	2018-10-05 04:27:27.109834+00
383	Ytzb2lRrNdz7JzNuaYVY7Q85dKdHjr	383	1	64	2018-10-05 20:21:27.503075+00	2018-10-05 20:21:27.503095+00
384	KJjVTDssymjzcksuMwoyQNMsZmZfxX	384	1	157	2018-10-06 05:49:04.696766+00	2018-10-06 05:49:04.696786+00
385	jyUrxJ7u1o0ARUdqsBI1ol2YHTJxfr	385	1	155	2018-10-09 01:04:34.079807+00	2018-10-09 01:04:34.079825+00
386	ZGoZGnwOJArvKzPwcukQh77WDjjWTR	386	1	158	2018-10-09 20:22:03.473513+00	2018-10-09 20:22:03.473533+00
387	znqfUSHXUqyQAesSVqqEwdLNsO5d4c	387	1	16	2018-10-10 16:50:15.839549+00	2018-10-10 16:50:15.839569+00
388	lPeVQM7JZetqz8NpoBt0pSPEThMdN7	388	1	47	2018-10-11 19:51:37.605924+00	2018-10-11 19:51:37.605956+00
389	MInEYSqXyRLK90XPbv41aIFC0mAg8D	389	1	156	2018-10-11 20:15:02.418788+00	2018-10-11 20:15:02.418808+00
390	7IBxwc2zWmzyGAe5xMWl2qYcvkLhpy	390	1	159	2018-10-16 04:37:47.343139+00	2018-10-16 04:37:47.343159+00
391	z0NiyJVdmu71U7DfEiuYI0kqth6CCQ	391	1	156	2018-10-19 05:37:51.754978+00	2018-10-19 05:37:51.754998+00
392	ovQCDHZlKO2CkOuhZ4aFzI2zEkauyB	392	1	16	2018-10-21 23:39:30.681716+00	2018-10-21 23:39:30.681736+00
393	XActomTwjldvYZO4MV2E8nRNRnbo8k	393	1	16	2018-10-21 23:50:05.42835+00	2018-10-21 23:50:05.428376+00
394	OhjjJyrY2cKhDfaNX4L9wZ9b7RCrxh	394	1	156	2018-10-23 01:32:27.173359+00	2018-10-23 01:32:27.17338+00
395	k0U4F5tJgXmVpdHkdhIHTg9ZYURRrC	395	1	160	2018-10-23 13:56:15.794022+00	2018-10-23 13:56:15.79404+00
396	dpmg72Wpkq4D6WaDOL6VRekjwTTEMQ	396	1	156	2018-10-27 05:16:47.568483+00	2018-10-27 05:16:47.568503+00
397	u6WTzdE0RSp84cGvopkT2uMsPtpnCq	397	1	123	2018-10-28 00:34:07.281451+00	2018-10-28 00:34:07.281494+00
398	mpvvv5hqpWrXBmDv3jyMESXlSPKN5U	398	1	161	2018-10-28 02:43:21.397024+00	2018-10-28 02:43:21.397044+00
399	mq0goX7GVeiE60FvEteEDH8eDFva67	399	1	156	2018-10-28 23:10:03.403434+00	2018-10-28 23:10:03.403453+00
400	yQpKa4uLTC3KGfFdTCLcNf69asO9wT	400	1	47	2018-10-28 23:10:21.830053+00	2018-10-28 23:10:21.830073+00
401	nizn0XYdqAT4ohVdJKpSXumtgILWJm	401	1	160	2018-10-28 23:10:24.031842+00	2018-10-28 23:10:24.031862+00
402	QShSuGkdOMKN5EVPGcizvIaWnZW2Cl	402	1	158	2018-10-28 23:11:36.161147+00	2018-10-28 23:11:36.16118+00
403	yIA2B6mRhnBmUmPQUIhWeZM0dl9o8n	403	1	162	2018-10-28 23:11:37.816529+00	2018-10-28 23:11:37.816548+00
404	mB1vZZowFAcm6vh1nQVYnoHuawjZZs	404	1	161	2018-10-28 23:12:32.866872+00	2018-10-28 23:12:32.866892+00
405	EJuc1nKcnhinTSSOkb1FgkyaGMwFc3	405	1	160	2018-11-01 02:42:55.435502+00	2018-11-01 02:42:55.435522+00
406	gMXIEuaBsuXJ2Q7aWO2mwcCrrOt6R8	406	1	161	2018-11-01 04:23:27.898671+00	2018-11-01 04:23:27.898691+00
407	AwvEl2EWz2pU3CY4HUpoNu0rZB7jdp	407	1	158	2018-11-03 23:20:50.037544+00	2018-11-03 23:20:50.037565+00
408	18WfHuh5lwgAlEeHncX821WiGJD3QF	408	1	163	2018-11-03 23:26:55.584746+00	2018-11-03 23:26:55.584765+00
409	fmFvbwO9d5GH32ZoW74IVWDvPE9rjQ	409	1	165	2018-11-03 23:33:43.759551+00	2018-11-03 23:33:43.75957+00
410	E82XlDfzDx3liE61fxJlvXpMoK31mr	410	1	161	2018-11-04 09:03:41.509777+00	2018-11-04 09:03:41.509797+00
411	yqWFYptSwtotyVkNCEEilophr9h7Gf	411	1	162	2018-11-06 00:26:09.239274+00	2018-11-06 00:26:09.239293+00
412	kJBa0PKX2rbGh8o1kVDB9FQj7RFmyC	412	1	156	2018-11-06 08:23:32.19724+00	2018-11-06 08:23:32.19726+00
413	cI8Ex8nSUvdFHgSk8awIl8wrcQGoek	413	1	156	2018-11-07 23:00:27.805963+00	2018-11-07 23:00:27.805983+00
414	CfjhXGWhlqWjlKfyPfUCyTdcFZGLfS	414	1	158	2018-11-08 01:03:18.40831+00	2018-11-08 01:03:18.40833+00
415	udCLiTfYJphLnCuqs5XTQA2sTckBkr	415	1	32	2018-11-09 22:02:30.145611+00	2018-11-09 22:02:30.145636+00
416	PgiY7mpi7bV8gnyTbdnn9cY8OKgocH	416	1	158	2018-11-10 04:29:37.111733+00	2018-11-10 04:29:37.111753+00
417	QmhxIqAKdIq8PGKKet2iz4M1CYVOoK	417	1	16	2018-11-10 16:04:34.066183+00	2018-11-10 16:04:34.066203+00
418	H9mJUv94X2HBOJKW7TFesTFrCpG2YU	418	1	166	2018-11-10 18:44:26.945091+00	2018-11-10 18:44:26.945111+00
419	QEYKBZfmRV7NPyf1vqwkamjMuOEv0o	419	1	166	2018-11-10 18:45:10.517043+00	2018-11-10 18:45:10.517063+00
420	aK2bUMBu4YMa3DtMK0azlbQThBC5y5	420	1	166	2018-11-10 18:45:13.320436+00	2018-11-10 18:45:13.320456+00
421	UZo7dThlKrt3HaUmbT9E9Fz9X6Pamd	421	1	166	2018-11-10 18:50:11.747519+00	2018-11-10 18:50:11.74754+00
422	XcbCGlKJTA9yINaOSgZllBItMH6QPv	422	1	166	2018-11-10 18:50:11.910416+00	2018-11-10 18:50:11.910442+00
423	hLonyZdTVif4jNdQwsHpuHro85L4ae	423	1	166	2018-11-10 18:50:11.981132+00	2018-11-10 18:50:11.981153+00
424	EWcvaaZGrbiYP6CLAhfzsxC1iBihMk	424	1	166	2018-11-10 18:50:12.188254+00	2018-11-10 18:50:12.188274+00
425	2zT4CTJDz6eALm2PcdJ2RWOzJiWt4u	425	1	167	2018-11-10 19:08:43.468966+00	2018-11-10 19:08:43.468986+00
426	YBjkxad3TXr8mw0tFjJe3g6WKeyJiA	426	1	167	2018-11-10 19:10:11.952156+00	2018-11-10 19:10:11.952176+00
427	bWSuReIgwtOPVJDUG4pgjWBwihVLSW	427	1	168	2018-11-10 19:20:28.709947+00	2018-11-10 19:20:28.70998+00
428	MCLrpznZ0GT1qilx4SSVSt4QFepRXY	428	1	169	2018-11-10 22:15:32.658954+00	2018-11-10 22:15:32.658974+00
429	B8c5XCsXZsoDa8kHBaMO32h510ZD2v	429	1	162	2018-11-11 21:56:46.896849+00	2018-11-11 21:56:46.896868+00
430	EQiSgN4mmCpBPlhNT5ayBFQ489blSQ	430	1	170	2018-11-13 01:22:37.886301+00	2018-11-13 01:22:37.886322+00
431	v2KQJwAd1mkCb6PmY6Y3nIhxO1kOLZ	431	1	47	2018-11-13 11:14:30.758881+00	2018-11-13 11:14:30.758901+00
432	kGg8oqkDXlvLg3Xw7YXCBVyXcYlTNY	432	1	156	2018-11-14 21:21:06.940725+00	2018-11-14 21:21:06.940746+00
433	eHvUfsPtwmpWj6UGOjpoRZG2LfIQJJ	433	1	161	2018-11-15 08:46:37.249437+00	2018-11-15 08:46:37.249457+00
434	XuJE0nLM4smhz0jYXdFj86eJjBr7UL	434	1	156	2018-11-16 08:33:24.480614+00	2018-11-16 08:33:24.480635+00
435	iHPTg3UV4j1NCTkNam9DYnSyTwVOMd	435	1	156	2018-11-16 09:26:22.614117+00	2018-11-16 09:26:22.614138+00
436	s0qYzhTtQkJbNT00Dc68hrXe2kHrx2	436	1	156	2018-11-16 10:11:09.273145+00	2018-11-16 10:11:09.273165+00
437	SvHsnpGeRI6ftv8ZfRmFMfmjh9XkQo	437	1	64	2018-11-17 07:10:16.713643+00	2018-11-17 07:10:16.713663+00
438	E2z5Qjc95ipz5kAevp3kdDc9ZzovL6	438	1	161	2018-11-18 03:49:04.995331+00	2018-11-18 03:49:04.99535+00
439	5MQ1bJZdmHEEesObnsgpUBdEuWCpu9	439	1	161	2018-11-19 19:06:40.793129+00	2018-11-19 19:06:40.793149+00
440	gIxYPmcD6KBHXysD6WRBSMyI9iI79X	440	1	156	2018-12-01 02:11:41.000005+00	2018-12-01 02:11:41.000025+00
\.


--
-- Data for Name: users_course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users_course (id, name) FROM stdin;
1	cs31
2	cs32
3	cs33
4	cs111
5	cs35L
6	csm51a
7	cs180
8	anthro10
9	ling132
10	pic10b
11	pic10a
12	pic16
13	phil31
14	philc127b
15	anthro199
16	Math33A
17	Stats100A
18	Stats102A
19	Math32B
20	ling 120a
21	Optimisation
22	Machine Learning
23	Polisci135
24	hello
25	philC127B
26	pic10A
27	pic10B
28	ewk;f
29	;xejne
30	WFEDwdc
31	SDCJK
32	SCDCN
33	math32a
34	math33a
35	math32b
36	hellw
37	Review
38	Reviewa
39	Reviewb
40	Reviewc
41	Reviewf
42	Reviewg
43	Reviewn
44	Reviewj
45	Reviewl
46	Reviewk
47	ReviewhReview
48	ReviewReview
49	ReviewReviewReview
50	ReviewReviewReviewReviewReview
51	another
52	class
53	one
54	two
55	three
56	four
57	five
58	six
59	cs131
60	ling120a
61	cs35l
62	csM51a
63	Math 31b,32A/B,33A
64	MAE 82,101,102,105A
65	Physics 1ABC
66	introduction to linguistics ling 20
67	introduction to phonetics ling 103
68	experimental phonetics ling 104
69	Phonology I ling 119A
70	syntax 1 ling 120A
71	Semantics 1 ling 120C
72	syntax 2 ling 165B
73	Computational Linguistics ling 185A
74	computer science 31
75	Computer Science 32
76	Computer science 35L
77	Computer Science 31
78	Ling 20 - Intro to linguistics
79	Ling 103 - intro to phonetics
80	Ling 104 - Expermintal Phonetics
81	Ling 119A - Phonology 1
82	Ling 120B - Syntax 1
83	Ling 120C - semantics 1
84	Ling 165B - Syntax 2
85	Ling 185A - Computational Linguistics
86	Math 31B - calculus 2
87	Philosophy 31 - symbolic logic
88	Psych 100A - Psychological statistics
89	Psych 85 - Intro to Cognitive Science
90	lsdkkl2
91	kasf
92	lksnf
93	sakfjnsd
94	sdl.kfndfn
95	sd;vfkndcv
96	sdjbnc
97	akl;jdsfc
98	phil127a
99	phil138
100	phil8
101	comm113
102	CS 131
103	cs118
104	cs143
105	Hist 1A
106	Hist 1C
107	Hist 116B
108	Hist 139A
109	Hist 115
110	Hist 129A
111	Hist 140A
112	Biology
113	Chemistry
114	Physics
115	Math 31A
116	Math 31B
117	Math 32A
118	PIC 10A
119	Hist 20
120	Italian 46
121	Philosophy 31
122	Philosophy 7
123	EngComp 3
124	Math 33A
125	Math 32AH, 32B, 33AB, 61, 115A, 116, 131AB, 180
126	PIC 10AB
127	Physics 4AL
128	Chemistry 20L
129	Physics 1A
130	Physics 1B
131	Physics 1C
132	Chemistry 20A
133	Chemistry 20B
134	Math 32B
135	MECH&AE 82
136	MECH&AE 103
137	MECH&AE 105A
138	CEE M20
139	CEE 91
140	CEE 102
141	CEE 108
142	CEE 103
143	CEE 110
144	MSE 104
145	AUD 30
146	CEE 1
147	CEE 180
148	EPS SCI 15
149	CS31
150	Most Required CSE Classes
151	cs 33
152	cs 131
153	ling 120b
154	ling 120c
155	ling 20
156	ling 130
157	ling 185a
158	cs 161
159	cs 145
160	cs 181
161	cs 180
162	cs 188
163	cs 199
164	cs 35l
165	ling 103
166	CS32
167	CS33
168	CSM51A
169	CS35L
170	CS111
171	CS174A
172	CS188
173	CSM152A
174	CS118
175	CS131
176	CS180
177	CSM151B
178	CSM117
179	CS130
180	CS161
181	CS181
182	CS CM122
183	CS168
184	CSM146
185	CS143
186	CS144
187	Math 115AH
188	Math 131AH
189	Math 131BH
190	Math 110ABC
191	Math 164
192	eng111
193	Math 31A/B
194	Math 32A/B
195	Math 33A/B
196	Stats 10
197	Stats 20
198	CS 31
199	CS 32
200	CS 33
201	C&SB 199
202	Chem 20 A
203	Chem 20 B
204	Cluster 21B
205	Cluster 21C
206	English Composition 3D
207	Undergraduate Science Journal
208	Student Research Forum
209	Cluster 21A
210	CS 35L
211	CS 180
212	Math 61
213	Political Science 40
214	Many!
\.


--
-- Data for Name: users_major; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users_major (id, name) FROM stdin;
1	CS
2	African American Studies B.A.
3	American Indian Studies B.A.
4	Anthropology B.A.
5	Anthropology B.S.
6	Architectural Studies B.A.
7	Art B.A.
8	Art History B.A.
9	Asian American Studies B.A.
10	Asian Humanities B.A.
11	Asian Languages and Linguistics BA
12	Asian Religions B.A.
13	Chinese B.A.
14	Japanese B.A.
15	Korean B.A.
16	Atmospheric, Oceanic, and Environmental Sciences B.S.
17	Bioengineering B.S.
18	Chemical Engineering B.S.
19	Biochemistry B.S.
20	Chemistry B.S.
21	Chemistry/Materials Science B.S.
22	General Chemistry B.S.
23	Chicana and Chicano Studies B.A.
24	Civil Engineering B.S.
25	Classical Civilization B.A.
26	Greek and Latin B.A.
27	Greek B.A.
28	Latin B.A.
29	Communication Studies B.A.
30	Comparative Literature B.A.
31	Computational and Systems Biology B.S.
32	Precomputational and Systems Biology
33	Computer Engineering B.S.
34	Computer Science and Engineering B.S.
35	Computer Science B.S.
36	Design | Media Arts B.A.
37	Earth and Environmental Science B.A.
38	Engineering Geology B.S.
39	Geology B.S.
40	Geology/Engineering Geology B.S.
41	Geology/Paleobiology B.S.
42	Geophysics B.S.
43	Geophysics/Applied Geophysics B.S.
44	Geophysics/Geophysics and Space Physics B.S.
45	Biology B.S.
46	Ecology, Behavior, and Evolution B.S.
47	Marine Biology B.S.
48	Business Economics B.A.
49	Economics B.A.
50	Prebusiness Economics
51	Preeconomics
53	Electrical Engineering B.S.
54	Engineering B.S.
55	Undeclared-Engineering and Applied Science
56	American Literature and Culture B.A.
57	English B.A.
58	Environmental Science B.S.
59	Ethnomusicology B.A.
60	Film and Television B.A.
61	French and Linguistics B.A.
62	French B.A.
63	Gender Studies B.A.
64	Geography B.A.
65	Geography/Environmental Studies B.A.
66	German B.A.
67	Global Studies B.A.
68	Preglobal Studies
69	History B.A.
70	Prehistory
71	Undeclared-Humanities
72	Physiological Science B.S.
73	African and Middle Eastern Studies B.A.
74	Asian Studies B.A.
75	European Studies B.A.
76	Latin American Studies B.A.
77	Preafrican and Middle Eastern Studies
78	Preasian Studies
79	Preeuropean Studies
80	Prelatin American Studies
81	International Development Studies B.A.
82	Preinternational Development Studies
83	Italian and Special Fields B.A.
84	Italian B.A.
85	Individual Field of Concentration B.A.
86	Individual Field of Concentration B.S.
87	Undeclared
88	Undeclared-Life Science
89	Applied Linguistics B.A.
90	Linguistics and Anthropology B.A.
91	Linguistics and Asian Languages and Cultures B.A.
92	Linguistics and Computer Science B.A.
93	Linguistics and English B.A.
94	Linguistics and French B.A.
95	Linguistics and Italian B.A.
96	Linguistics and Philosophy B.A.
97	Linguistics and Psychology B.A.
98	Linguistics and Scandinavian Languages B.A.
99	Linguistics and Spanish B.A.
100	Linguistics B.A.
101	Materials Engineering B.S.
102	Applied Mathematics B.S.
103	Financial Actuarial Mathematics B.S.
104	Mathematics B.S.
105	Mathematics For Teaching B.S.
106	Mathematics of Computation B.S.
107	Mathematics/Applied Science B.S.
108	Preapplied Mathematics
109	Prefinancial Actuarial Mathematics
110	Premathematics
111	Premathematics For Teaching
112	Premathematics of Computation
113	Premathematics/Applied Science
114	Mathematics/Atmospheric and Oceanic Sciences B.S.
115	Mathematics/Economics B.S.
116	Premathematics/Economics
117	Aerospace Engineering B.S.
118	Mechanical Engineering B.S.
119	Microbiology, Immunology, and Molecular Genetics B.S.
120	Premicrobiology, Immunology, & Molecular Genetics
121	Molecular, Cell, and Developmental Biology B.S.
122	Music B.A.
123	Music History B.A.
124	Ancient Near East and Egyptology B.A.
125	Arabic B.A.
126	Iranian Studies B.A.
127	Jewish Studies B.A.
128	Middle Eastern Studies B.A.
129	Neuroscience B.S.
130	Nursing B.S.
131	Nursing-Prelicensure B.S.
132	Philosophy B.A.
133	Undeclared-Physical Science
134	Astrophysics B.S.
135	Biophysics B.S.
136	Physics B.A.
137	Physics B.S.
138	Political Science B.A.
139	Prepolitical Science
140	Cognitive Science B.A.
141	Cognitive Science B.S.
142	Precognitive Science
143	Prepsychobiology
144	Prepsychology
145	Psychobiology B.A.
146	Psychobiology B.S.
147	Psychology B.A.
148	Study of Religion B.A.
149	Nordic Studies B.A.
150	Scandinavian Languages and Cultures B.A.
151	Scandinavian Languages B.A.
152	Central and East European Languages and Cultures B.A.
153	Russian Language and Literature B.A.
154	Russian Studies B.A.
155	Undeclared-Social Science
156	Human Biology and Society B.A.
157	Human Biology and Society B.S.
158	Prehuman Biology and Society
159	Prehuman Biology and Society
160	Presociology
161	Sociology B.A.
162	Portuguese B.A.
163	Spanish and Community and Culture B.A.
164	Spanish and Linguistics B.A.
165	Spanish and Portuguese B.A.
166	Spanish B.A.
167	Prestatistics
168	Statistics B.S.
169	Theater B.A.
170	Dance B.A.
171	World Arts and Cultures B.A.
\.


--
-- Data for Name: users_mentor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users_mentor (id, bio, profile_id, active, clubs, cons, gpa, pros) FROM stdin;
9		16	t			0.00	
13		21	t			0.00	
14		23	t			0.00	
19		28	t			0.00	
15	Major in Ethnomusicology, concentration in World Music. Minor in Music Industry and possibly VAPAE (Visual and Performing Arts Education). With this combination, I aim to work in non-profit arts organizations, in areas of music education, festival/camp programming, event planning, and/or arts development.\n\nI'm happy to answer questions about both the major and the possible career paths! See my LinkedIn for relevant work experience: https://www.linkedin.com/in/laurajane2696/	24	t			0.00	
18	I am awesome	27	t			0.00	
11	I survive on coffee and tea	18	t			0.00	
16	I am a second year Computational and Systems Biology Major, which means I have taken a lot of math, chem, physics and life science. I was admitted as a biochem major but changed to math/applied science before switching to CASB after "major shopping" around bit so I have lots of knowledge about quite a few majors. I'm here to help those like me who had a hard time choosing a major and found the counseling staff less than helpful!	25	t			0.00	
12		20	t			0.00	
17	Hello world	26	t			0.00	
22		36	t			0.00	
28	I am  a 32 year old non traditional student. I transferred to UCLA from San Francisco city College.  I originally was a film major but changed to linguistics.  While taking prerequisites at my community college I took a computer science class and found I really enjoyed the coursework.  This is when I decided to add the CS portion of my degree. \n\nOutside of schoolwork I enjoy staying fit and recently comleted UCLAs ironbruin sprint triathlon.  I am a member of the running club and the environmental student network.  I hope to go to graduate school for something related to computer science and urban/transportation planning.	51	t			0.00	
27		50	t			0.00	
8	I'm a third-year CS major working at DevX on the Bquest team! Hope you find this product useful, hit me up with any questions about CS or life	10	t			0.00	
24	HMU I'm friendly	38	t			0.00	
25	Hi	48	t			0.00	
77		136	t			0.00	
30	Hi I'm a game programmer	52	t			0.00	
34		59	t			0.00	
23	I code things. I'm in Creative Labs, DevX, IEEE, etc. Feel free to ask me whatever question you may have about CS or CSE (and whether it's right for you).	37	t			0.00	
79		139	t			0.00	
20	I love my major! Hmu and I'll tell you why.	30	t			0.00	
81		143	f			0.00	
46		69	t			0.00	
40		84	t			0.00	
35	Hi! I'm just finishing up my second year at UCLA, and I will be graduating next year with a BA in history. I really enjoy history and I'm happy to help out anyone who's curious about the major.	60	t			0.00	
26		49	t			0.00	
51	I am a second year Computer Science student , and one of the developers on BQuest. I am also involved in consulting organizations on campus. Reach out if you want to talk!	22	t			0.00	
31	Fourth year CS major going to Uber for full time Software Engineering. Hit me up with any questions about CS and UCLA in general :)	54	t			0.00	
48	Really passionate about tech + design. Currently the Creative Intern at Wonderspaces, Media Strategist at UCLA Housing, President of Creative Labs UCLA, Advisor of Bruin Entrepreneurs, and an organizer at LA Hacks.	96	t			0.00	
6	I can code, somewhat.	14	t			0.00	
32		55	t			0.00	
36	Understanding the ecological and evolutionary background of how we function as humans and how we interact with the environment around us is something of my expertise	63	t			0.00	
33		57	t			0.00	
50		88	t			0.00	
41	Ask me about majoring in Math or Philosophy!	82	t			0.00	
37	I declared Engineering as a 1st year and would love to help anyone thinking of moving into the Engineering school or my own discipline.	68	t			0.00	
38	Looking to help incoming students!	74	t			0.00	
42		86	t			0.00	
49	4th year CS	19	t			0.00	
54		109	t			0.00	
52		105	t			0.00	
47	Hi! I'm an ICPC competitor.	95	t			0.00	
59	I have a BA in World History with an emphasis in French, speak, read and write from Mount Saint Mary's college	115	t			0.00	
57	Hi!	112	t			0.00	
43		87	t			0.00	
55		110	t			0.00	
45	Looking to help incoming CS students! :)	77	t			0.00	
56		111	t			0.00	
53	I've done stuff and can help you do stuff too	108	t			0.00	
39	Hi I'm a junior studying civil engineering and am very involved in the American Society of Civil Engineers chapter at UCLA!	79	t			0.00	
58	My name is Borzoo Haghighat. I	113	t			0.00	
60		116	t			0.00	
21	Hi. I know some things	31	t			0.00	
61	Second-year Statistics student with an interest in pursuing a career in data analytics	117	t			0.00	
44	DevX	89	t			0.00	
62		118	t			0.00	
5	My name is Linea, I am majoring in Linguistics. I would love to meet with you, if you would like to hear about my love for linguistics, and I'll try to answer any question you might have! I am an exchange student from Denmark, studying in Sweden, and currently enjoying L.A. Also, I am the PM for BQuest. If you have any questions or comments about our platform, please feel free to send me a message or reach out to us at bquest.ucla@gmail.com	11	t			0.00	
63		119	t			0.00	
64		120	t			0.00	
66		123	t			0.00	
65	Hello! I enjoy listening to music, gaming, crocheting, designing and viewing memes. Ask me anything about CS or college!	122	t			0.00	
29	I am an average CS student. Member of Daily Bruin Online and DevX.	53	t			0.00	
69		126	t			0.00	
70	Interested in pursuring a career in data analytics.	128	t			0.00	
71		129	t			0.00	
67	I'm an undergraduate in the Computational and Systems Biology major, and I'm interested in combining quantitative and mathematicial techniques to understand biological systems, particularly evolutionary systems. I have been working on research projects with Dr. Van Savage and Dr. Pamela Yeh since the beginning of my freshman year.  I would love to chat about the major! :)	124	t			0.00	
68	I'm a 4th year cog sci major / ling minor. I'm on the spirit squad and the ski and snowboard team, and I love to help!	125	t			0.00	
76	Was once, MIMG, now am political science! Can help with North Campus questions OR South Campus questions!\nWas once ROTC as well!	97	t			0.00	
75		134	t			0.00	
78	I like listening to music and building things.	137	t			0.00	
72	As someone who knows what it's like to feel lost in regards to what major to pursue, I'd love to help out anyone even remotely considering CS!	131	t			0.00	
80		142	t			0.00	
74		133	t			0.00	
73	I am currently a 4th-year CS major, focusing on front-end web development. Feel free to contact me! :)	130	t			0.00	
\.


--
-- Data for Name: users_mentor_courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users_mentor_courses (id, mentor_id, course_id) FROM stdin;
22	11	16
23	11	17
24	11	18
25	11	19
26	17	20
27	18	21
28	18	22
29	18	23
309	53	149
310	53	166
311	53	167
312	53	168
313	53	169
314	53	170
315	53	171
316	53	172
317	53	173
318	53	174
319	53	175
320	53	176
321	53	177
322	53	178
323	53	179
324	53	180
325	53	181
326	53	182
327	53	183
328	29	170
133	24	64
134	24	63
135	24	65
147	28	75
148	28	76
149	28	77
150	28	78
151	28	79
152	28	80
153	28	81
154	28	82
155	28	83
156	28	84
157	28	85
158	28	86
159	28	87
160	28	88
161	28	89
329	29	175
330	29	174
331	29	171
332	29	180
333	29	149
334	29	166
335	29	167
336	29	169
337	29	176
338	29	181
339	29	168
340	29	177
341	29	173
342	29	184
343	29	185
344	29	186
345	57	166
346	57	187
347	57	188
348	57	189
349	57	190
350	57	191
351	8	8
352	8	52
353	8	4
354	8	59
355	8	104
356	8	7
357	8	2
358	8	3
359	8	62
360	8	192
361	61	193
362	61	194
196	21	102
363	61	195
364	61	196
365	61	197
366	62	198
367	62	199
368	62	200
369	67	115
204	35	105
205	35	106
206	35	107
207	35	108
208	35	109
209	35	110
210	35	111
211	36	112
212	36	113
213	36	114
214	41	115
215	41	116
216	41	117
217	41	118
218	41	119
219	41	120
220	41	121
221	41	122
222	41	123
223	41	124
224	43	125
225	43	126
226	43	65
227	39	127
228	39	128
229	39	129
230	39	130
231	39	131
232	39	132
233	39	133
234	39	117
235	39	134
236	39	124
237	39	135
238	39	136
239	39	137
240	39	138
241	39	139
242	39	140
243	39	141
244	39	142
245	39	143
246	39	144
247	39	145
248	39	146
249	39	147
250	39	148
370	67	124
252	5	101
253	5	9
254	5	98
255	5	99
256	5	13
257	5	100
258	5	14
259	5	11
260	5	10
261	5	12
371	67	201
372	67	202
373	67	203
374	67	198
375	67	199
376	67	204
377	67	205
378	67	206
279	23	150
379	67	207
380	67	208
381	67	209
382	72	198
284	20	59
285	20	60
286	20	151
287	20	152
288	20	20
289	20	153
290	20	154
291	20	155
292	20	156
293	20	157
294	20	158
295	20	159
296	20	160
297	20	161
298	20	162
299	20	163
300	20	164
301	20	165
302	6	4
303	6	103
304	6	104
305	6	1
306	6	2
307	6	3
308	6	61
383	72	199
384	72	200
385	72	210
386	72	211
387	72	116
388	72	117
389	72	134
390	72	212
391	72	129
392	72	130
393	72	131
395	76	214
\.


--
-- Data for Name: users_mentor_major; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users_mentor_major (id, mentor_id, major_id) FROM stdin;
1	8	35
3	21	35
4	23	34
6	47	35
7	47	104
10	48	141
12	49	35
13	50	35
14	20	92
15	51	35
16	6	35
17	52	92
18	53	35
20	54	35
21	55	53
22	29	35
23	56	35
24	57	106
25	58	63
26	26	34
27	59	8
28	60	35
29	61	168
30	62	35
31	44	35
32	63	9
33	5	100
34	64	65
35	65	35
36	67	31
37	68	141
38	69	53
41	70	141
42	70	49
43	72	35
44	73	35
45	74	161
48	76	138
49	76	119
50	77	34
51	78	34
52	79	137
54	80	64
55	81	137
\.


--
-- Data for Name: users_mentor_minor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users_mentor_minor (id, mentor_id, minor_id) FROM stdin;
1	47	1
2	59	2
3	62	3
5	67	5
6	68	6
7	81	5
\.


--
-- Data for Name: users_minor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users_minor (id, name) FROM stdin;
1	Computational and Systems Biology B.S.
2	French B.A.
3	Film and Television B.A.
4	Gender Studies B.A.
5	Mathematics B.S.
6	Linguistics B.A.
\.


--
-- Data for Name: users_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users_profile (id, user_id, verification_code, verified, picture, year, phone_number, notifications_enabled, password_reset_code) FROM stdin;
28	38	2OI026CV6E	t	profile_pictures/default_pic.jpg	4th		t	\N
29	39	N1S4GT544M	f	profile_pictures/default_pic.jpg	1st		t	\N
31	41	PCVMU2GZQR	t	profile_pictures/mark-tai.png	4th		t	\N
16	24	ZM5S5KSM0J	t	profile_pictures/default_pic.jpg	2nd		t	\N
18	28	63LT69K0Z6	t	profile_pictures/daily_bruin_photo_Mc4cL0B.jpg	2nd		t	\N
20	30	AHZZRRF02K	t	profile_pictures/default_pic.jpg	4th		t	\N
21	31	AJ8VVF1FEZ	t	profile_pictures/default_pic.jpg	3rd		t	\N
23	33	C82W8EK3BQ	t	profile_pictures/default_pic.jpg	3rd		t	\N
24	34	JN9TA6QP77	t	profile_pictures/default_pic.jpg	3rd		t	\N
25	35	5R1JU0XYC1	t	profile_pictures/default_pic.jpg	2nd		t	\N
26	36	SKQ2DQJL26	t	profile_pictures/default_pic.jpg	4th		t	\N
27	37	1VRUNJRQGP	t	profile_pictures/portrait.jpg	3rd		t	\N
32	42	SSJUASG1B0	f	profile_pictures/default_pic.jpg	1st		t	\N
33	43	N7K40EA2NE	f	profile_pictures/default_pic.jpg	1st		t	\N
34	44	UHBXFI5I4U	f	profile_pictures/default_pic.jpg	1st		t	\N
35	45	VMCTR6O53U	f	profile_pictures/default_pic.jpg	1st		t	\N
36	46	49AQ5NXP2M	t	profile_pictures/default_pic.jpg	3rd		t	\N
38	48	PJ59758MZF	t	profile_pictures/Photo_on_3-1-18_at_9.31_PM.jpg	2nd		t	\N
39	49	AZJ013GY8Q	f	profile_pictures/default_pic.jpg	1st		t	\N
43	53	3Q0IYMRFK6	f	profile_pictures/default_pic.jpg	1st		t	\N
48	59	F5BEOUYBA6	t	profile_pictures/default_pic.jpg	2nd		t	\N
50	61	IUCG9WFO8U	t	profile_pictures/default_pic.jpg	2nd		t	\N
51	62	H8DA9FNDAY	t	profile_pictures/default_pic.jpg	4th		t	\N
22	32	V94GPF08DQ	t	profile_pictures/prof.jpg	2nd		t	\N
70	93	0KP5ACXPWJ	f	profile_pictures/default_pic.jpg	1st		t	\N
71	94	0L8W6TFPFL	f	profile_pictures/default_pic.jpg	1st		t	\N
52	63	ZQ9EQES1EH	t	profile_pictures/default_pic.jpg	1st		t	\N
10	16	G5DHT63DOV	t	profile_pictures/profile_8XXD3ni.JPG	3rd		t	\N
72	95	PJZCRNHNP7	f	profile_pictures/default_pic.jpg	1st		t	\N
73	98	ICC6YQ41DY	t	profile_pictures/default_pic.jpg	3rd		t	\N
94	120	X7B7GZY0C2	t	profile_pictures/default_pic.jpg	2nd		t	\N
68	91	A1A4PGDB66	t	profile_pictures/default_pic.jpg	4th		t	\N
54	65	S62P8WRJQW	t	profile_pictures/27628602_10212811580777752_7616272270474259902_o.jpg	4th		t	\N
101	127	8BXPL30BA4	f	profile_pictures/default_pic.jpg	Incoming		t	\N
55	66	ZNYVOMX5WO	f	profile_pictures/default_pic.jpg	1st		t	\N
56	67	W48AMORCRR	f	profile_pictures/default_pic.jpg	1st		t	\N
88	114	UV0ORZFDRD	t	profile_pictures/default_pic.jpg	2nd		t	\N
97	123	KTJ0FUYFNJ	t	profile_pictures/default_pic.jpg	4th		t	\N
74	99	7DV0XGSU5R	t	profile_pictures/default_pic.jpg	2nd		t	\N
57	76	X4M85UPU6T	t	profile_pictures/default_pic.jpg	2nd		t	\N
58	77	OSNV1YI5S6	t	profile_pictures/default_pic.jpg	1st		t	\N
59	78	QTKEGKK5GW	t	profile_pictures/default_pic.jpg	2nd		t	\N
84	110	88BT1FIGAT	t	profile_pictures/default_pic.jpg	2nd		t	\N
75	100	IYSXKCFD0K	t	profile_pictures/default_pic.jpg	3rd		t	\N
60	79	UKDWWXSI2E	t	profile_pictures/default_pic.jpg	3rd		t	\N
61	80	RRJ97XHDC0	t	profile_pictures/default_pic.jpg	1st		t	\N
62	81	2X28602TLB	f	profile_pictures/default_pic.jpg	1st		t	\N
95	121	IHNVOUSEWH	t	profile_pictures/default_pic.jpg	2nd		t	\N
76	102	EVKJSIPCYX	t	profile_pictures/default_pic.jpg	2nd		t	\N
63	82	PNABG3OY6X	t	profile_pictures/default_pic.jpg	3rd		t	\N
64	83	0W7EXJESG7	f	profile_pictures/default_pic.jpg	1st		t	\N
65	86	RNR0JDR7TN	f	profile_pictures/default_pic.jpg	1st		t	\N
66	89	1BDZEPV0T8	f	profile_pictures/default_pic.jpg	1st		t	\N
67	90	1895JKHM9M	f	profile_pictures/default_pic.jpg	1st		t	\N
82	108	MJK6FZPU3Q	t	profile_pictures/default_pic.jpg	1st		t	\N
77	103	KY0040JRFJ	t	profile_pictures/default_pic.jpg	1st		t	\N
78	104	ELMDD62OSV	f	profile_pictures/default_pic.jpg	1st		t	\N
80	106	N47P0QEFD7	f	profile_pictures/default_pic.jpg	1st		t	\N
89	115	64JU13ORZY	t	profile_pictures/default_pic.jpg	2nd		t	\N
81	107	HPH0MI91GX	f	profile_pictures/default_pic.jpg	1st		t	\N
83	109	0052ZZB6B9	f	profile_pictures/default_pic.jpg	1st		t	\N
85	111	I2DD3YYH3S	f	profile_pictures/default_pic.jpg	1st		t	\N
90	116	14C1O5TRKP	f	profile_pictures/default_pic.jpg	1st		t	\N
87	113	EFBAFLSCJV	t	profile_pictures/default_pic.jpg	2nd		t	\N
91	117	SSTUYL53Y6	f	profile_pictures/default_pic.jpg	1st		t	\N
86	112	AXLTC3X4HX	t	profile_pictures/default_pic.jpg	2nd		t	\N
92	118	4E8V3N6KCU	f	profile_pictures/default_pic.jpg	1st		t	\N
14	21	AZQHFZQGKO	t	profile_pictures/default_pic.jpg	3rd		t	\N
69	92	GIWVND3H73	t	profile_pictures/default_pic.jpg	2nd		t	\N
93	119	J1303DNPEH	f	profile_pictures/default_pic.jpg	1st		t	\N
19	29	rishub	t	profile_pictures/default_pic.jpg	4th		t	\N
53	64	EIW6TNMSGJ	t	profile_pictures/new_avatar	4th		t	\N
98	124	WEWNHFBCP0	f	profile_pictures/default_pic.jpg	Incoming		t	\N
96	122	OTNAUOYQE3	t	profile_pictures/rohan2.png	2nd		t	\N
99	125	702M037LSS	f	profile_pictures/default_pic.jpg	Incoming		t	\N
100	126	4806QB2D47	f	profile_pictures/default_pic.jpg	Incoming		t	\N
37	47	ED3FE2HQSO	t	profile_pictures/IMG_3980.JPG	4th		t	\N
30	40	BRS2BNF57C	t	profile_pictures/IMG_7773-2.jpg	3rd		t	\N
79	105	LEP979DFCR	t	profile_pictures/default_pic.jpg	3rd		t	\N
102	128	X4WYWYN32R	t	profile_pictures/default_pic.jpg	2nd		t	\N
103	129	CEL0XB9PYI	t	profile_pictures/default_pic.jpg	1st		t	\N
104	130	9YFJ0Q0ML3	t	profile_pictures/default_pic.jpg	3rd		t	\N
11	17	JS0N8RHF03	t	profile_pictures/wug2.jpg	3rd		t	\N
105	131	XUHJCDQ8EB	t	profile_pictures/default_pic.jpg	1st		t	\N
106	132	RO1AJAHE3D	t	profile_pictures/default_pic.jpg	4th		t	\N
107	133	W73MGP1PTI	f	profile_pictures/default_pic.jpg	Incoming		t	\N
124	150	YA9ARDBWXZ	t	profile_pictures/default_pic.jpg	2nd		t	\N
140	167	BDLE07D4V8	t	profile_pictures/default_pic.jpg	4th		t	\N
109	135	5OVEP2I5E5	t	profile_pictures/default_pic.jpg	4th		t	\N
125	151	64EDQEUF39	t	profile_pictures/FB_IMG_1534275428050.jpg	4th		t	\N
110	136	NNMY9A7OFF	t	profile_pictures/default_pic.jpg	3rd		t	\N
108	134	AQ4DC5GZ48	t	profile_pictures/profile.jpg	4th		t	\N
141	168	GR8TV9AUUY	t	profile_pictures/default_pic.jpg	4th		t	\N
111	137	3KW0AE8TC8	t	profile_pictures/default_pic.jpg	2nd		t	\N
126	152	0JTRB61ZEJ	t	profile_pictures/default_pic.jpg	4th		t	\N
112	138	NH08RP3RBQ	t	profile_pictures/default_pic.jpg	3rd		t	\N
127	153	VSNLFI55PU	t	profile_pictures/default_pic.jpg	1st		t	\N
113	139	1P0981XMLM	t	profile_pictures/default_pic.jpg	4th		t	\N
114	140	O64M78B5AT	f	profile_pictures/default_pic.jpg	Incoming		t	\N
49	60	SVJTVW5JZA	t	profile_pictures/17E6F50F-A36E-4C6C-AC3B-394F09ABA31D.jpeg	2nd		t	\N
128	154	IMJX0O19RW	t	profile_pictures/default_pic.jpg	3rd		t	\N
115	141	74BOV83WU0	t	profile_pictures/default_pic.jpg	2nd		t	\N
142	169	X92QH0O1HQ	t	profile_pictures/default_pic.jpg	3rd		t	\N
116	142	8FS0MZ48W3	t	profile_pictures/default_pic.jpg	2nd		t	\N
117	143	DZ0EPLAJO4	t	profile_pictures/default_pic.jpg	2nd		t	\N
118	144	GNA5RG7923	t	profile_pictures/default_pic.jpg	2nd		t	\N
143	170	KP5INMCELX	t	profile_pictures/default_pic.jpg	4th		t	\N
131	157	K0V6KLD49Y	t	profile_pictures/default_pic.jpg	2nd		t	\N
119	145	AKHO1FV9R5	t	profile_pictures/default_pic.jpg	2nd		t	\N
129	155	P82ET8U9EV	t	profile_pictures/default_pic.jpg	3rd		t	\N
120	146	1T0QW9K1OC	t	profile_pictures/default_pic.jpg	2nd		t	\N
121	147	V0RB9E955U	t	profile_pictures/default_pic.jpg	Incoming		t	\N
130	156	59YZ7V4895	t	profile_pictures/default_pic.jpg	4th		t	\N
122	148	ARYUFXTX4C	t	profile_pictures/pinkpowderpuffsmoller.png	2nd		t	\N
123	149	XCVO3L5R2D	t	profile_pictures/default_pic.jpg	4th		t	\N
132	158	S9R51QPWVB	t	profile_pictures/IMG_0628.jpg	2nd		t	\N
133	159	UU2S0BU30J	t	profile_pictures/default_pic.jpg	3rd		t	\N
134	160	QHC8I5KOSF	t	profile_pictures/default_pic.jpg	4th		t	\N
137	163	JLY2QISJKC	t	profile_pictures/photo-small.jpg	3rd		t	\N
138	165	80GVKH9CNT	t	profile_pictures/default_pic.jpg	3rd		t	\N
135	161	V9PIA11U9M	t	profile_pictures/default_pic.jpg	1st		t	\N
136	162	RDT2TFFCG9	t	profile_pictures/default_pic.jpg	3rd		t	\N
139	166	EEX6WEG1A6	t	profile_pictures/default_pic.jpg	4th		t	\N
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 58, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 170, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Name: corsheaders_corsmodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('corsheaders_corsmodel_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 23, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 20, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 59, true);


--
-- Name: email_requests_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('email_requests_request_id_seq', 38, true);


--
-- Name: messaging_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('messaging_message_id_seq', 88, true);


--
-- Name: messaging_thread_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('messaging_thread_id_seq', 18, true);


--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oauth2_provider_accesstoken_id_seq', 440, true);


--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oauth2_provider_application_id_seq', 1, true);


--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oauth2_provider_grant_id_seq', 1, false);


--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oauth2_provider_refreshtoken_id_seq', 440, true);


--
-- Name: users_classes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_classes_id_seq', 214, true);


--
-- Name: users_major_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_major_id_seq', 171, true);


--
-- Name: users_mentor_classes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_mentor_classes_id_seq', 395, true);


--
-- Name: users_mentor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_mentor_id_seq', 81, true);


--
-- Name: users_mentor_major_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_mentor_major_id_seq', 55, true);


--
-- Name: users_mentor_minor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_mentor_minor_id_seq', 7, true);


--
-- Name: users_minor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_minor_id_seq', 6, true);


--
-- Name: users_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_profile_id_seq', 143, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: corsheaders_corsmodel corsheaders_corsmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY corsheaders_corsmodel
    ADD CONSTRAINT corsheaders_corsmodel_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: email_requests_request email_requests_request_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY email_requests_request
    ADD CONSTRAINT email_requests_request_pkey PRIMARY KEY (id);


--
-- Name: messaging_message messaging_message_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY messaging_message
    ADD CONSTRAINT messaging_message_pkey PRIMARY KEY (id);


--
-- Name: messaging_thread messaging_thread_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY messaging_thread
    ADD CONSTRAINT messaging_thread_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_token_8af090f8_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_token_8af090f8_uniq UNIQUE (token);


--
-- Name: oauth2_provider_application oauth2_provider_application_client_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_client_id_key UNIQUE (client_id);


--
-- Name: oauth2_provider_application oauth2_provider_application_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_grant oauth2_provider_grant_code_49ab4ddf_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_code_49ab4ddf_uniq UNIQUE (code);


--
-- Name: oauth2_provider_grant oauth2_provider_grant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_access_token_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_access_token_id_key UNIQUE (access_token_id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_token_d090daa4_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_token_d090daa4_uniq UNIQUE (token);


--
-- Name: users_course users_classes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_course
    ADD CONSTRAINT users_classes_pkey PRIMARY KEY (id);


--
-- Name: users_major users_major_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_major
    ADD CONSTRAINT users_major_pkey PRIMARY KEY (id);


--
-- Name: users_mentor_courses users_mentor_classes_mentor_id_classes_id_184b0b32_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_mentor_courses
    ADD CONSTRAINT users_mentor_classes_mentor_id_classes_id_184b0b32_uniq UNIQUE (mentor_id, course_id);


--
-- Name: users_mentor_courses users_mentor_classes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_mentor_courses
    ADD CONSTRAINT users_mentor_classes_pkey PRIMARY KEY (id);


--
-- Name: users_mentor_major users_mentor_major_mentor_id_major_id_862a0c38_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_mentor_major
    ADD CONSTRAINT users_mentor_major_mentor_id_major_id_862a0c38_uniq UNIQUE (mentor_id, major_id);


--
-- Name: users_mentor_major users_mentor_major_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_mentor_major
    ADD CONSTRAINT users_mentor_major_pkey PRIMARY KEY (id);


--
-- Name: users_mentor_minor users_mentor_minor_mentor_id_minor_id_8d23563c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_mentor_minor
    ADD CONSTRAINT users_mentor_minor_mentor_id_minor_id_8d23563c_uniq UNIQUE (mentor_id, minor_id);


--
-- Name: users_mentor_minor users_mentor_minor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_mentor_minor
    ADD CONSTRAINT users_mentor_minor_pkey PRIMARY KEY (id);


--
-- Name: users_mentor users_mentor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_mentor
    ADD CONSTRAINT users_mentor_pkey PRIMARY KEY (id);


--
-- Name: users_minor users_minor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_minor
    ADD CONSTRAINT users_minor_pkey PRIMARY KEY (id);


--
-- Name: users_profile users_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_profile
    ADD CONSTRAINT users_profile_pkey PRIMARY KEY (id);


--
-- Name: users_profile users_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_profile
    ADD CONSTRAINT users_profile_user_id_key UNIQUE (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: email_requests_request_mentee_id_2856839e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX email_requests_request_mentee_id_2856839e ON email_requests_request USING btree (mentee_id);


--
-- Name: email_requests_request_mentor_id_f9150d59; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX email_requests_request_mentor_id_f9150d59 ON email_requests_request USING btree (mentor_id);


--
-- Name: messaging_message_sender_id_7a7088e6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX messaging_message_sender_id_7a7088e6 ON messaging_message USING btree (sender_id);


--
-- Name: messaging_message_thread_id_f689027f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX messaging_message_thread_id_f689027f ON messaging_message USING btree (thread_id);


--
-- Name: messaging_thread_profile_1_id_3db6b458; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX messaging_thread_profile_1_id_3db6b458 ON messaging_thread USING btree (profile_1_id);


--
-- Name: messaging_thread_profile_2_id_19bdddca; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX messaging_thread_profile_2_id_19bdddca ON messaging_thread USING btree (profile_2_id);


--
-- Name: oauth2_provider_accesstoken_application_id_b22886e1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_accesstoken_application_id_b22886e1 ON oauth2_provider_accesstoken USING btree (application_id);


--
-- Name: oauth2_provider_accesstoken_token_8af090f8_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_accesstoken_token_8af090f8_like ON oauth2_provider_accesstoken USING btree (token varchar_pattern_ops);


--
-- Name: oauth2_provider_accesstoken_user_id_6e4c9a65; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_accesstoken_user_id_6e4c9a65 ON oauth2_provider_accesstoken USING btree (user_id);


--
-- Name: oauth2_provider_application_client_id_03f0cc84_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_client_id_03f0cc84_like ON oauth2_provider_application USING btree (client_id varchar_pattern_ops);


--
-- Name: oauth2_provider_application_client_secret_53133678; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_client_secret_53133678 ON oauth2_provider_application USING btree (client_secret);


--
-- Name: oauth2_provider_application_client_secret_53133678_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_client_secret_53133678_like ON oauth2_provider_application USING btree (client_secret varchar_pattern_ops);


--
-- Name: oauth2_provider_application_user_id_79829054; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_user_id_79829054 ON oauth2_provider_application USING btree (user_id);


--
-- Name: oauth2_provider_grant_application_id_81923564; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_grant_application_id_81923564 ON oauth2_provider_grant USING btree (application_id);


--
-- Name: oauth2_provider_grant_code_49ab4ddf_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_grant_code_49ab4ddf_like ON oauth2_provider_grant USING btree (code varchar_pattern_ops);


--
-- Name: oauth2_provider_grant_user_id_e8f62af8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_grant_user_id_e8f62af8 ON oauth2_provider_grant USING btree (user_id);


--
-- Name: oauth2_provider_refreshtoken_application_id_2d1c311b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_refreshtoken_application_id_2d1c311b ON oauth2_provider_refreshtoken USING btree (application_id);


--
-- Name: oauth2_provider_refreshtoken_token_d090daa4_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_refreshtoken_token_d090daa4_like ON oauth2_provider_refreshtoken USING btree (token varchar_pattern_ops);


--
-- Name: oauth2_provider_refreshtoken_user_id_da837fce; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_refreshtoken_user_id_da837fce ON oauth2_provider_refreshtoken USING btree (user_id);


--
-- Name: users_mentor_classes_classes_id_2383af3f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_mentor_classes_classes_id_2383af3f ON users_mentor_courses USING btree (course_id);


--
-- Name: users_mentor_classes_mentor_id_ab38907c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_mentor_classes_mentor_id_ab38907c ON users_mentor_courses USING btree (mentor_id);


--
-- Name: users_mentor_major_major_id_b4f010d6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_mentor_major_major_id_b4f010d6 ON users_mentor_major USING btree (major_id);


--
-- Name: users_mentor_major_mentor_id_91a1ef0b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_mentor_major_mentor_id_91a1ef0b ON users_mentor_major USING btree (mentor_id);


--
-- Name: users_mentor_minor_mentor_id_8ba826dd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_mentor_minor_mentor_id_8ba826dd ON users_mentor_minor USING btree (mentor_id);


--
-- Name: users_mentor_minor_minor_id_8b872568; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_mentor_minor_minor_id_8b872568 ON users_mentor_minor USING btree (minor_id);


--
-- Name: users_mentor_profile_id_494baacd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_mentor_profile_id_494baacd ON users_mentor USING btree (profile_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: email_requests_request email_requests_request_mentee_id_2856839e_fk_users_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY email_requests_request
    ADD CONSTRAINT email_requests_request_mentee_id_2856839e_fk_users_profile_id FOREIGN KEY (mentee_id) REFERENCES users_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: email_requests_request email_requests_request_mentor_id_f9150d59_fk_users_mentor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY email_requests_request
    ADD CONSTRAINT email_requests_request_mentor_id_f9150d59_fk_users_mentor_id FOREIGN KEY (mentor_id) REFERENCES users_mentor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: messaging_message messaging_message_sender_id_7a7088e6_fk_users_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY messaging_message
    ADD CONSTRAINT messaging_message_sender_id_7a7088e6_fk_users_profile_id FOREIGN KEY (sender_id) REFERENCES users_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: messaging_message messaging_message_thread_id_f689027f_fk_messaging_thread_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY messaging_message
    ADD CONSTRAINT messaging_message_thread_id_f689027f_fk_messaging_thread_id FOREIGN KEY (thread_id) REFERENCES messaging_thread(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: messaging_thread messaging_thread_profile_1_id_3db6b458_fk_users_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY messaging_thread
    ADD CONSTRAINT messaging_thread_profile_1_id_3db6b458_fk_users_profile_id FOREIGN KEY (profile_1_id) REFERENCES users_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: messaging_thread messaging_thread_profile_2_id_19bdddca_fk_users_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY messaging_thread
    ADD CONSTRAINT messaging_thread_profile_2_id_19bdddca_fk_users_profile_id FOREIGN KEY (profile_2_id) REFERENCES users_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_application_id_b22886e1_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_application_id_b22886e1_fk FOREIGN KEY (application_id) REFERENCES oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_application oauth2_provider_application_user_id_79829054_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_user_id_79829054_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth2_provider_grant_application_id_81923564_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_application_id_81923564_fk FOREIGN KEY (application_id) REFERENCES oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_access_token_id_775e84e8_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_access_token_id_775e84e8_fk FOREIGN KEY (access_token_id) REFERENCES oauth2_provider_accesstoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_application_id_2d1c311b_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_application_id_2d1c311b_fk FOREIGN KEY (application_id) REFERENCES oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_mentor_courses users_mentor_courses_course_id_bdd6b30a_fk_users_course_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_mentor_courses
    ADD CONSTRAINT users_mentor_courses_course_id_bdd6b30a_fk_users_course_id FOREIGN KEY (course_id) REFERENCES users_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_mentor_courses users_mentor_courses_mentor_id_20d56ef4_fk_users_mentor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_mentor_courses
    ADD CONSTRAINT users_mentor_courses_mentor_id_20d56ef4_fk_users_mentor_id FOREIGN KEY (mentor_id) REFERENCES users_mentor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_mentor_major users_mentor_major_major_id_b4f010d6_fk_users_major_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_mentor_major
    ADD CONSTRAINT users_mentor_major_major_id_b4f010d6_fk_users_major_id FOREIGN KEY (major_id) REFERENCES users_major(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_mentor_major users_mentor_major_mentor_id_91a1ef0b_fk_users_mentor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_mentor_major
    ADD CONSTRAINT users_mentor_major_mentor_id_91a1ef0b_fk_users_mentor_id FOREIGN KEY (mentor_id) REFERENCES users_mentor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_mentor_minor users_mentor_minor_mentor_id_8ba826dd_fk_users_mentor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_mentor_minor
    ADD CONSTRAINT users_mentor_minor_mentor_id_8ba826dd_fk_users_mentor_id FOREIGN KEY (mentor_id) REFERENCES users_mentor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_mentor_minor users_mentor_minor_minor_id_8b872568_fk_users_minor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_mentor_minor
    ADD CONSTRAINT users_mentor_minor_minor_id_8b872568_fk_users_minor_id FOREIGN KEY (minor_id) REFERENCES users_minor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_mentor users_mentor_profile_id_494baacd_fk_users_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_mentor
    ADD CONSTRAINT users_mentor_profile_id_494baacd_fk_users_profile_id FOREIGN KEY (profile_id) REFERENCES users_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_profile users_profile_user_id_2112e78d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_profile
    ADD CONSTRAINT users_profile_user_id_2112e78d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

