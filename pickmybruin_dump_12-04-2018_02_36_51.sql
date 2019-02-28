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
    name character varying(100) NOT NULL
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
    major_id integer,
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
    notifications_enabled boolean NOT NULL
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
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
29	pbkdf2_sha256$36000$iubTpJc8JUBH$p3zXRHWIOqmup5o1rVtKhAZhagf9z7W0+yH0mp4HNhQ=	\N	f	rishub@g.ucla.edu			rishub@g.ucla.edu	f	t	2018-02-01 04:31:59.045081+00
30	pbkdf2_sha256$36000$ZI98BHWqGuN6$xatNeFsV3Oh2lvwU6b9Dl7fym6qsNoSs51HbyD6eF44=	\N	f	suntiancheng@g.ucla.edu	Christine	Sun	suntiancheng@g.ucla.edu	f	t	2018-02-01 05:05:36.583424+00
21	pbkdf2_sha256$36000$KiMCnDxHTPvR$gOg7DmfevNMaEXPtXcR6H3C9qWfayIuQ/ywJb3Ot1Gg=	\N	f	dinkarkhattar@g.ucla.edu	Dinkar	Khattar	dinkarkhattar@g.ucla.edu	f	t	2018-01-30 23:41:53.599157+00
38	pbkdf2_sha256$36000$FRKIkSMdDaQX$YwDf2lIbUZBEOsOs08YKtmveyEHQLbqSvcfvyHp5AsU=	\N	f	liwei1995@g.ucla.edu	Wei	Li	liwei1995@g.ucla.edu	f	t	2018-02-04 14:38:10.151952+00
31	pbkdf2_sha256$36000$EQhNAwS5y16m$MyirrLKzjem6Cv0AULthpwOcOlbaQrCYJI9+PZ20HUk=	\N	f	haejinjo@g.ucla.edu	Haejin	Jo	professionalhaejin@gmail.com	f	t	2018-02-01 07:26:39.654487+00
32	pbkdf2_sha256$36000$jpuvzKOJ6Jf2$qXZrxM2Ti79PHnJH4aAxeNznbJxI9Hy1nInziDsaSbg=	\N	f	alexlongerbeam@g.ucla.edu	Alex	Longerbeam	alexlongerbeam@g.ucla.edu	f	t	2018-02-01 07:37:26.849913+00
39	pbkdf2_sha256$36000$pOUWGDOsYqTb$UU5c+CQnvuHzZWwbrEcfhUnych9M7XZW5E5KitFeKdM=	\N	f	soumyadeep96@g.ucla.edu			soumyadeep96@g.ucla.edu	f	t	2018-02-05 16:57:02.785203+00
16	pbkdf2_sha256$36000$ZmhoKOQaOkYj$QqNstA8BWufnI15ub6Dl7aeYEmc8EAQ9gFmQldoRJEk=	\N	f	ramsgoli@g.ucla.edu	Ram	Goli	ramsgoli@gmail.com	f	t	2018-01-24 06:32:06.453691+00
24	pbkdf2_sha256$36000$iNEwvIBdniG4$i0ur9vzXCH10vDmyMJFf0Bfak6mSck6ZX/CaXxlO1vE=	\N	f	arjunpat03@g.ucla.edu	Arjun	Patel	arjunpat03@g.ucla.edu	f	t	2018-01-31 23:35:35.19159+00
28	pbkdf2_sha256$36000$cEcLXSgbfz03$8iV4egJPxOaWy5jvcGuicgghOlteHOePrIkxtESK3DM=	\N	f	chengyin@g.ucla.edu	Krystal	Xu	chengyin@g.ucla.edu	f	t	2018-02-01 00:49:35.335651+00
33	pbkdf2_sha256$36000$pf6YCjOk16cu$7Y0gYtiDnYmS2n5weFMp/IM2oijDAK5KeGXmH7DEczo=	\N	f	Sfblake@g.ucla.edu	Serafina	Blake	Sfblake@g.ucla.edu	f	t	2018-02-01 07:49:59.378443+00
40	pbkdf2_sha256$36000$BbVuYfSEY40S$NFC3FLDZKDEIU9P0Dj4+b5k9ZfXprt0WAY1ukrDflzQ=	\N	f	wdliu@g.ucla.edu	Wandi	Liu	wdliu@g.ucla.edu	f	t	2018-02-07 02:33:22.064857+00
34	pbkdf2_sha256$36000$6UmOlHl6PU87$WW9iiv+oNBfGsNDFkvBrKh+uLNOFG+86lDek2mGZdzA=	\N	f	laurajane2696@g.ucla.edu	Laura Jane	Yee	laurajane2696@g.ucla.edu	f	t	2018-02-01 08:15:27.643283+00
35	pbkdf2_sha256$36000$A6kOlJgKkVnp$Xef5R89zG2vG8Nju2hfKHf/hZEFLM1K5n4KmEhu9Gi4=	\N	f	sjmadsen@g.ucla.edu	Sarah	Madsen	sjmadsen@g.ucla.edu	f	t	2018-02-01 17:22:41.675682+00
41	pbkdf2_sha256$36000$Dfo6M4ooqkv0$3YCJiwb9brllmKLpcl4r5DKEG+OJlIWAzlAHHYQ1uWA=	\N	f	marktai@g.ucla.edu	Mark	Tai	marktai@g.ucla.edu	f	t	2018-02-08 04:28:08.974431+00
36	pbkdf2_sha256$36000$In4SCuoiFj6X$qZ18JR3JVczC9iaF+yGmKuKHqHOeJyDf/lrGQ2VzoUA=	\N	f	angelicapan@g.ucla.edu	Angelica	Pan	angelicapan@g.ucla.edu	f	t	2018-02-02 00:06:07.594093+00
37	pbkdf2_sha256$36000$UwifzQy9k8bW$hfgqJJriY/sG20TLlwHSSlYqlkT2VDzXphPxYxBLT28=	\N	f	ucla17ckl@g.ucla.edu	Christian	Klinteberg	ucla17ckl@g.ucla.edu	f	t	2018-02-02 00:36:43.694741+00
17	pbkdf2_sha256$36000$8gMcBmxbArHT$fsDPZNwX2XdPjv0RU14pWqIRR8zB6aYPS9NvizrwGLA=	\N	f	lineaba@g.ucla.edu	Linea Brink	Andersen	lineaba@gmail.com	f	t	2018-01-24 06:33:54.4572+00
42	pbkdf2_sha256$36000$O76ziJvHsp2h$FInMsb/nG14qYL9Wqr+Sqv3b0drsGnBARsLz9CI8xUI=	\N	f	cvmulia@g.ucla.edu			cvmulia@g.ucla.edu	f	t	2018-03-02 02:46:32.015295+00
43	pbkdf2_sha256$36000$0dSmlftfllF1$9H/jxmSUvwPxDjyOF44iaU4Xll2H5Pq5s0mERxkj1FI=	\N	f	natashakohli@g.ucla.edu			natashakohli@g.ucla.edu	f	t	2018-03-02 02:47:37.291085+00
44	pbkdf2_sha256$36000$SI8HqmFlLB2c$pCRlMql1Ze79G8HgzdGHvb82hOdsEkWFOPPmTCPQhQk=	\N	f	quiggc@g.ucla.edu			quiggc@g.ucla.edu	f	t	2018-03-02 02:47:52.750636+00
45	pbkdf2_sha256$36000$sJXleGSQ7qXx$mdCbe5rN2K9Zt0XyyUhMXgLB3TmQlaNHgQYsF71MUiQ=	\N	f	weiruili@g.ucla.edu			weiruili@g.ucla.edu	f	t	2018-03-02 03:46:08.736162+00
46	pbkdf2_sha256$36000$TsWjLKrm6BwZ$5cJ0jU4tLlSWTMY31rya0G/c+ZtRY7WYIdTTQa45wGM=	\N	f	changyuyan@g.ucla.edu	Changyu	Yan	changyuyan@g.ucla.edu	f	t	2018-03-02 03:46:09.980839+00
47	pbkdf2_sha256$36000$9KEvS2AuFaE6$rCmLYUhZhMnhWsge5u5J0IgEC4K9UBZePpPdAel9OWM=	\N	f	dwchen@g.ucla.edu	David	Chen	dwchen@g.ucla.edu	f	t	2018-03-02 04:16:24.740893+00
48	pbkdf2_sha256$36000$X1NwFMYgu62e$cGA2KtGH0jtpIVK/fYiTKN+6NZ6olWWu9JzltNsY+lY=	\N	f	jpalmanzasoto@g.ucla.edu	Juan-Pablo	Almanza-Soto	jpalmanzasoto@g.ucla.edu	f	t	2018-03-02 05:30:31.075036+00
53	pbkdf2_sha256$36000$OaF0s3i0qLp1$tHSX4qjZr6mZLgtirvMiVL3gK8Yy0t0QGtccgKb6Ipo=	\N	f	ram@g.ucla.edu			ram@g.ucla.edu	f	t	2018-03-15 01:19:40.995979+00
49	pbkdf2_sha256$36000$rdAWgD5oHsuc$jC3KqwJ6DGKucSmBq/FyenWp6Drx7R2vyvyjOPZsJXg=	\N	f	eric1997@g.ucla.edu			eric1997@g.ucla.edu	f	t	2018-03-14 18:57:11.903158+00
59	pbkdf2_sha256$36000$tO7Gx3IR7dTz$O8HpQkInoS8kepZY13n7WeUMajTYmy1BgdFnObd2yoA=	\N	f	katiecai@g.ucla.edu	Katie	Cai	katiecai@g.ucla.edu	f	t	2018-03-15 01:47:36.221675+00
60	pbkdf2_sha256$36000$XwGBCDGAeZDW$qjaan4Ty5qmOvRVIdMzU4JNVbUQ69ubVSP9sV4pv/DI=	\N	f	kfann285@g.ucla.edu	Karen	Fann	kfann285@g.ucla.edu	f	t	2018-03-15 01:51:03.193819+00
61	pbkdf2_sha256$36000$E18K4kiUyh1m$W9g1t9BkH1qeyMBGHO7XVNMh6++o4WVDnHWmEo6DUhc=	\N	f	mitrikyle@g.ucla.edu	Dmitri	Brereton	mitrikyle@g.ucla.edu	f	t	2018-03-15 02:17:33.814483+00
62	pbkdf2_sha256$36000$tBUS855UlhY4$2Pxh41ObZVkm753/b+inPHjLO22wQ/efFdDRs9OcWHw=	\N	f	rdeamici@g.ucla.edu	Richard	DeAmicis	rdeamici@g.ucla.edu	f	t	2018-03-29 16:56:24.646037+00
64	pbkdf2_sha256$36000$Z3oAWjftfWxY$7qCknLv6O+gy3ojZePmgc02sBV3kPmFWpkruH2Yz3fA=	\N	f	kunqian@g.ucla.edu	Kevin	Qian	kunqian@g.ucla.edu	f	t	2018-04-05 03:55:25.815234+00
63	pbkdf2_sha256$36000$XHruPVpmS93c$K/n7ux4kbKZvNZ31OSabwniR1ThnE1huOZ9u0+BlUsU=	\N	f	Kimeiga@g.ucla.edu	Hakan	Alpay	Kimeiga@g.ucla.edu	f	t	2018-04-05 03:43:49.084336+00
1	pbkdf2_sha256$36000$TIguTya1YR2Q$1Qv1eQ0pf+ANE8zGcmKbgMYCbyK8XCIx9FyJvC2sbj8=	2018-04-09 16:41:07.481097+00	t	root	mark	tai	mark@marktai.com	t	t	2017-10-25 23:32:49.234+00
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
\.


--
-- Data for Name: messaging_message; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY messaging_message (id, body, "timestamp", thread_id, unread, sender_id) FROM stdin;
\.


--
-- Data for Name: messaging_thread; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY messaging_thread (id, profile_1_id, profile_2_id) FROM stdin;
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

COPY users_mentor (id, bio, major_id, profile_id, active, clubs, cons, gpa, pros) FROM stdin;
9		\N	16	t			0.00	
13		92	21	t			0.00	
14		161	23	t			0.00	
20	adfsfsdafasdfaf	92	30	t			0.00	
19		20	28	t			0.00	
15	Major in Ethnomusicology, concentration in World Music. Minor in Music Industry and possibly VAPAE (Visual and Performing Arts Education). With this combination, I aim to work in non-profit arts organizations, in areas of music education, festival/camp programming, event planning, and/or arts development.\n\nI'm happy to answer questions about both the major and the possible career paths! See my LinkedIn for relevant work experience: https://www.linkedin.com/in/laurajane2696/	59	24	t			0.00	
18	I am awesome	118	27	t			0.00	
11	I survive on coffee and tea	168	18	t			0.00	
16	I am a second year Computational and Systems Biology Major, which means I have taken a lot of math, chem, physics and life science. I was admitted as a biochem major but changed to math/applied science before switching to CASB after "major shopping" around bit so I have lots of knowledge about quite a few majors. I'm here to help those like me who had a hard time choosing a major and found the counseling staff less than helpful!	31	25	t			0.00	
12		119	20	t			0.00	
17	Hello world	100	26	t			0.00	
26		34	49	t			0.00	
22		106	36	t			0.00	
28	I am  a 32 year old non traditional student. I transferred to UCLA from San Francisco city College.  I originally was a film major but changed to linguistics.  While taking prerequisites at my community college I took a computer science class and found I really enjoyed the coursework.  This is when I decided to add the CS portion of my degree. \n\nOutside of schoolwork I enjoy staying fit and recently comleted UCLAs ironbruin sprint triathlon.  I am a member of the running club and the environmental student network.  I hope to go to graduate school for something related to computer science and urban/transportation planning.	92	51	t			0.00	
27		35	50	t			0.00	
6	I can code, somewhat.	35	14	t			0.00	
8	I'm a second year CS major working at DevX on the BQuest team!	35	10	t			0.00	
24	HMU I'm friendly	117	38	t			0.00	
21	Hi. I know some things	35	31	t			0.00	
25	Hi	35	48	t			0.00	
29		\N	53	f			0.00	
30	Hi I'm a game programmer	\N	52	t			0.00	
23	I code things.	34	37	t			0.00	
5	My name is Linea, I am majoring in Linguistics. I would love to meet with you, if you would like to hear about my love for linguistics, and I'll try and answer any question you might have! I am an exchange student from Denmark, studying in Sweden, and currently enjoying L.A. Also, I am the PM for BQuest. If you have any questions or comments about our platform, please feel free to reach out to us at bquest.ucla@gmail.com	100	11	t			0.00	
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
107	20	59
108	20	60
113	6	1
114	6	2
115	6	3
116	6	61
117	6	4
124	8	8
125	8	52
126	8	4
127	8	7
128	8	2
129	8	3
130	8	62
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
176	5	9
177	5	13
178	5	14
179	5	11
180	5	10
181	5	12
182	5	98
183	5	99
184	5	100
185	5	101
\.


--
-- Data for Name: users_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users_profile (id, user_id, verification_code, verified, picture, year, phone_number, notifications_enabled) FROM stdin;
11	17	JS0N8RHF03	t	profile_pictures/wug2.jpg	3rd		t
14	21	AZQHFZQGKO	t	profile_pictures/default_pic.jpg	2nd		t
28	38	2OI026CV6E	t	profile_pictures/default_pic.jpg	4th		t
29	39	N1S4GT544M	f	profile_pictures/default_pic.jpg	1st		t
30	40	BRS2BNF57C	t	profile_pictures/clock_flat.png	3rd		t
31	41	PCVMU2GZQR	t	profile_pictures/mark-tai.png	4th		t
10	16	G5DHT63DOV	t	profile_pictures/profile_JFmaNuY.JPG	2nd		t
16	24	ZM5S5KSM0J	t	profile_pictures/default_pic.jpg	2nd		t
18	28	63LT69K0Z6	t	profile_pictures/daily_bruin_photo_Mc4cL0B.jpg	2nd		t
19	29	323RO01O0H	f	profile_pictures/default_pic.jpg	1st		t
20	30	AHZZRRF02K	t	profile_pictures/default_pic.jpg	4th		t
21	31	AJ8VVF1FEZ	t	profile_pictures/default_pic.jpg	3rd		t
23	33	C82W8EK3BQ	t	profile_pictures/default_pic.jpg	3rd		t
24	34	JN9TA6QP77	t	profile_pictures/default_pic.jpg	3rd		t
25	35	5R1JU0XYC1	t	profile_pictures/default_pic.jpg	2nd		t
26	36	SKQ2DQJL26	t	profile_pictures/default_pic.jpg	4th		t
27	37	1VRUNJRQGP	t	profile_pictures/portrait.jpg	3rd		t
32	42	SSJUASG1B0	f	profile_pictures/default_pic.jpg	1st		t
33	43	N7K40EA2NE	f	profile_pictures/default_pic.jpg	1st		t
34	44	UHBXFI5I4U	f	profile_pictures/default_pic.jpg	1st		t
35	45	VMCTR6O53U	f	profile_pictures/default_pic.jpg	1st		t
36	46	49AQ5NXP2M	t	profile_pictures/default_pic.jpg	3rd		t
38	48	PJ59758MZF	t	profile_pictures/Photo_on_3-1-18_at_9.31_PM.jpg	2nd		t
39	49	AZJ013GY8Q	f	profile_pictures/default_pic.jpg	1st		t
43	53	3Q0IYMRFK6	f	profile_pictures/default_pic.jpg	1st		t
48	59	F5BEOUYBA6	t	profile_pictures/default_pic.jpg	2nd		t
49	60	SVJTVW5JZA	t	profile_pictures/17E6F50F-A36E-4C6C-AC3B-394F09ABA31D.jpeg	2nd		t
50	61	IUCG9WFO8U	t	profile_pictures/default_pic.jpg	2nd		t
51	62	H8DA9FNDAY	t	profile_pictures/default_pic.jpg	4th		t
22	32	V94GPF08DQ	t	profile_pictures/prof.jpg	2nd		t
53	64	EIW6TNMSGJ	t	profile_pictures/default_pic.jpg	3rd		t
52	63	ZQ9EQES1EH	t	profile_pictures/default_pic.jpg	1st		t
37	47	ED3FE2HQSO	t	profile_pictures/IMG_3980.JPG	3rd		t
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

SELECT pg_catalog.setval('auth_permission_id_seq', 55, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 64, true);


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

SELECT pg_catalog.setval('django_admin_log_id_seq', 8, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 19, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 49, true);


--
-- Name: email_requests_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('email_requests_request_id_seq', 36, true);


--
-- Name: messaging_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('messaging_message_id_seq', 1, false);


--
-- Name: messaging_thread_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('messaging_thread_id_seq', 1, false);


--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oauth2_provider_accesstoken_id_seq', 166, true);


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

SELECT pg_catalog.setval('oauth2_provider_refreshtoken_id_seq', 166, true);


--
-- Name: users_classes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_classes_id_seq', 101, true);


--
-- Name: users_major_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_major_id_seq', 171, true);


--
-- Name: users_mentor_classes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_mentor_classes_id_seq', 185, true);


--
-- Name: users_mentor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_mentor_id_seq', 30, true);


--
-- Name: users_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_profile_id_seq', 53, true);


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
-- Name: users_mentor users_mentor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_mentor
    ADD CONSTRAINT users_mentor_pkey PRIMARY KEY (id);


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
-- Name: users_mentor_major_id_0cd7cb9f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_mentor_major_id_0cd7cb9f ON users_mentor USING btree (major_id);


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
-- Name: users_mentor users_mentor_major_id_0cd7cb9f_fk_users_major_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_mentor
    ADD CONSTRAINT users_mentor_major_id_0cd7cb9f_fk_users_major_id FOREIGN KEY (major_id) REFERENCES users_major(id) DEFERRABLE INITIALLY DEFERRED;


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

