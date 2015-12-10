--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: account; Type: TABLE; Schema: public; Owner: florian; Tablespace: 
--

CREATE TABLE account (
    id bigint NOT NULL,
    creationdate timestamp without time zone,
    creationuser character varying(255),
    lastupdate timestamp without time zone,
    lastupdateuser character varying(255),
    version bigint,
    authenticationkey character varying(255),
    email character varying(255) NOT NULL,
    firstname character varying(255),
    gender character varying(255),
    lang character varying(255) DEFAULT 'en'::character varying NOT NULL,
    lastname character varying(255) NOT NULL,
    role character varying(255)
);


ALTER TABLE account OWNER TO florian;

--
-- Name: account_id_seq; Type: SEQUENCE; Schema: public; Owner: florian
--

CREATE SEQUENCE account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_id_seq OWNER TO florian;

--
-- Name: account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: florian
--

ALTER SEQUENCE account_id_seq OWNED BY account.id;


--
-- Name: facebookcredential; Type: TABLE; Schema: public; Owner: florian; Tablespace: 
--

CREATE TABLE facebookcredential (
    id bigint NOT NULL,
    creationdate timestamp without time zone,
    creationuser character varying(255),
    lastupdate timestamp without time zone,
    lastupdateuser character varying(255),
    version bigint,
    firstname character varying(255),
    lastname character varying(255),
    userid character varying(255) NOT NULL,
    account_id bigint NOT NULL
);


ALTER TABLE facebookcredential OWNER TO florian;

--
-- Name: facebookcredential_id_seq; Type: SEQUENCE; Schema: public; Owner: florian
--

CREATE SEQUENCE facebookcredential_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE facebookcredential_id_seq OWNER TO florian;

--
-- Name: facebookcredential_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: florian
--

ALTER SEQUENCE facebookcredential_id_seq OWNED BY facebookcredential.id;


--
-- Name: logincredential; Type: TABLE; Schema: public; Owner: florian; Tablespace: 
--

CREATE TABLE logincredential (
    id bigint NOT NULL,
    creationdate timestamp without time zone,
    creationuser character varying(255),
    lastupdate timestamp without time zone,
    lastupdateuser character varying(255),
    version bigint,
    password character varying(255) NOT NULL,
    account_id bigint NOT NULL
);


ALTER TABLE logincredential OWNER TO florian;

--
-- Name: logincredential_id_seq; Type: SEQUENCE; Schema: public; Owner: florian
--

CREATE SEQUENCE logincredential_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE logincredential_id_seq OWNER TO florian;

--
-- Name: logincredential_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: florian
--

ALTER SEQUENCE logincredential_id_seq OWNED BY logincredential.id;


--
-- Name: session; Type: TABLE; Schema: public; Owner: florian; Tablespace: 
--

CREATE TABLE session (
    id bigint NOT NULL,
    creationdate timestamp without time zone,
    creationuser character varying(255),
    lastupdate timestamp without time zone,
    lastupdateuser character varying(255),
    version bigint,
    connectiondate timestamp without time zone,
    source character varying(255),
    account_id bigint NOT NULL
);


ALTER TABLE session OWNER TO florian;

--
-- Name: session_id_seq; Type: SEQUENCE; Schema: public; Owner: florian
--

CREATE SEQUENCE session_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE session_id_seq OWNER TO florian;

--
-- Name: session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: florian
--

ALTER SEQUENCE session_id_seq OWNED BY session.id;


--
-- Name: storedfile; Type: TABLE; Schema: public; Owner: florian; Tablespace: 
--

CREATE TABLE storedfile (
    id bigint NOT NULL,
    creationdate timestamp without time zone,
    creationuser character varying(255),
    lastupdate timestamp without time zone,
    lastupdateuser character varying(255),
    version bigint,
    comment text,
    fileorder integer DEFAULT 0,
    height integer,
    isimage boolean NOT NULL,
    originalname character varying(255) NOT NULL,
    size integer,
    storedname character varying(255) NOT NULL,
    storednameoriginalsize character varying(255),
    width integer,
    account_id bigint NOT NULL
);


ALTER TABLE storedfile OWNER TO florian;

--
-- Name: storedfile_id_seq; Type: SEQUENCE; Schema: public; Owner: florian
--

CREATE SEQUENCE storedfile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE storedfile_id_seq OWNER TO florian;

--
-- Name: storedfile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: florian
--

ALTER SEQUENCE storedfile_id_seq OWNED BY storedfile.id;


--
-- Name: translation; Type: TABLE; Schema: public; Owner: florian; Tablespace: 
--

CREATE TABLE translation (
    id bigint NOT NULL,
    creationdate timestamp without time zone,
    creationuser character varying(255),
    lastupdate timestamp without time zone,
    lastupdateuser character varying(255),
    version bigint
);


ALTER TABLE translation OWNER TO florian;

--
-- Name: translation_id_seq; Type: SEQUENCE; Schema: public; Owner: florian
--

CREATE SEQUENCE translation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE translation_id_seq OWNER TO florian;

--
-- Name: translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: florian
--

ALTER SEQUENCE translation_id_seq OWNED BY translation.id;


--
-- Name: translationvalue; Type: TABLE; Schema: public; Owner: florian; Tablespace: 
--

CREATE TABLE translationvalue (
    id bigint NOT NULL,
    creationdate timestamp without time zone,
    creationuser character varying(255),
    lastupdate timestamp without time zone,
    lastupdateuser character varying(255),
    version bigint,
    content text NOT NULL,
    lang character varying(255) DEFAULT 'en'::character varying NOT NULL,
    searchablecontent character varying(255) NOT NULL,
    translation_id bigint
);


ALTER TABLE translationvalue OWNER TO florian;

--
-- Name: translationvalue_id_seq; Type: SEQUENCE; Schema: public; Owner: florian
--

CREATE SEQUENCE translationvalue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE translationvalue_id_seq OWNER TO florian;

--
-- Name: translationvalue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: florian
--

ALTER SEQUENCE translationvalue_id_seq OWNED BY translationvalue.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: florian
--

ALTER TABLE ONLY account ALTER COLUMN id SET DEFAULT nextval('account_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: florian
--

ALTER TABLE ONLY facebookcredential ALTER COLUMN id SET DEFAULT nextval('facebookcredential_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: florian
--

ALTER TABLE ONLY logincredential ALTER COLUMN id SET DEFAULT nextval('logincredential_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: florian
--

ALTER TABLE ONLY session ALTER COLUMN id SET DEFAULT nextval('session_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: florian
--

ALTER TABLE ONLY storedfile ALTER COLUMN id SET DEFAULT nextval('storedfile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: florian
--

ALTER TABLE ONLY translation ALTER COLUMN id SET DEFAULT nextval('translation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: florian
--

ALTER TABLE ONLY translationvalue ALTER COLUMN id SET DEFAULT nextval('translationvalue_id_seq'::regclass);


--
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: florian
--

COPY account (id, creationdate, creationuser, lastupdate, lastupdateuser, version, authenticationkey, email, firstname, gender, lang, lastname, role) FROM stdin;
1	2015-12-09 19:20:53.193	\N	2015-12-09 19:20:53.197	\N	0	3XHemIYc3KCA4Z7hr7qZz5/Gg/zxnZEkI9VESUVV3pttbwwMm99PmZKvzOJ1fSSz	florian.jeanmart@gmail.com	flo	MALE	fr	rian	USER
\.


--
-- Name: account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: florian
--

SELECT pg_catalog.setval('account_id_seq', 1, true);


--
-- Data for Name: facebookcredential; Type: TABLE DATA; Schema: public; Owner: florian
--

COPY facebookcredential (id, creationdate, creationuser, lastupdate, lastupdateuser, version, firstname, lastname, userid, account_id) FROM stdin;
\.


--
-- Name: facebookcredential_id_seq; Type: SEQUENCE SET; Schema: public; Owner: florian
--

SELECT pg_catalog.setval('facebookcredential_id_seq', 1, false);


--
-- Data for Name: logincredential; Type: TABLE DATA; Schema: public; Owner: florian
--

COPY logincredential (id, creationdate, creationuser, lastupdate, lastupdateuser, version, password, account_id) FROM stdin;
1	2015-12-09 19:20:53.333	\N	2015-12-09 19:20:53.333	\N	0	U+qpp4jr60y33EXqwVgccSd66lz8W+HNvUvvPOqFTWP1gA0XmkfuVHSamJwOvU4D	1
\.


--
-- Name: logincredential_id_seq; Type: SEQUENCE SET; Schema: public; Owner: florian
--

SELECT pg_catalog.setval('logincredential_id_seq', 1, true);


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: florian
--

COPY session (id, creationdate, creationuser, lastupdate, lastupdateuser, version, connectiondate, source, account_id) FROM stdin;
1	2015-12-09 19:20:53.395	\N	2015-12-09 19:20:53.395	\N	0	2015-12-09 19:20:53.395	WEBSITE	1
2	2015-12-09 19:22:04.299	\N	2015-12-09 19:22:04.299	\N	0	2015-12-09 19:22:04.299	WEBSITE	1
\.


--
-- Name: session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: florian
--

SELECT pg_catalog.setval('session_id_seq', 2, true);


--
-- Data for Name: storedfile; Type: TABLE DATA; Schema: public; Owner: florian
--

COPY storedfile (id, creationdate, creationuser, lastupdate, lastupdateuser, version, comment, fileorder, height, isimage, originalname, size, storedname, storednameoriginalsize, width, account_id) FROM stdin;
\.


--
-- Name: storedfile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: florian
--

SELECT pg_catalog.setval('storedfile_id_seq', 1, false);


--
-- Data for Name: translation; Type: TABLE DATA; Schema: public; Owner: florian
--

COPY translation (id, creationdate, creationuser, lastupdate, lastupdateuser, version) FROM stdin;
\.


--
-- Name: translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: florian
--

SELECT pg_catalog.setval('translation_id_seq', 1, false);


--
-- Data for Name: translationvalue; Type: TABLE DATA; Schema: public; Owner: florian
--

COPY translationvalue (id, creationdate, creationuser, lastupdate, lastupdateuser, version, content, lang, searchablecontent, translation_id) FROM stdin;
\.


--
-- Name: translationvalue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: florian
--

SELECT pg_catalog.setval('translationvalue_id_seq', 1, false);


--
-- Name: account_pkey; Type: CONSTRAINT; Schema: public; Owner: florian; Tablespace: 
--

ALTER TABLE ONLY account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);


--
-- Name: facebookcredential_pkey; Type: CONSTRAINT; Schema: public; Owner: florian; Tablespace: 
--

ALTER TABLE ONLY facebookcredential
    ADD CONSTRAINT facebookcredential_pkey PRIMARY KEY (id);


--
-- Name: logincredential_pkey; Type: CONSTRAINT; Schema: public; Owner: florian; Tablespace: 
--

ALTER TABLE ONLY logincredential
    ADD CONSTRAINT logincredential_pkey PRIMARY KEY (id);


--
-- Name: session_pkey; Type: CONSTRAINT; Schema: public; Owner: florian; Tablespace: 
--

ALTER TABLE ONLY session
    ADD CONSTRAINT session_pkey PRIMARY KEY (id);


--
-- Name: storedfile_pkey; Type: CONSTRAINT; Schema: public; Owner: florian; Tablespace: 
--

ALTER TABLE ONLY storedfile
    ADD CONSTRAINT storedfile_pkey PRIMARY KEY (id);


--
-- Name: translation_pkey; Type: CONSTRAINT; Schema: public; Owner: florian; Tablespace: 
--

ALTER TABLE ONLY translation
    ADD CONSTRAINT translation_pkey PRIMARY KEY (id);


--
-- Name: translationvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: florian; Tablespace: 
--

ALTER TABLE ONLY translationvalue
    ADD CONSTRAINT translationvalue_pkey PRIMARY KEY (id);


--
-- Name: uk_cs5bnaggwuluahrdh8mbs1rpe; Type: CONSTRAINT; Schema: public; Owner: florian; Tablespace: 
--

ALTER TABLE ONLY account
    ADD CONSTRAINT uk_cs5bnaggwuluahrdh8mbs1rpe UNIQUE (email);


--
-- Name: uk_lb4s0fxvqona00ffc0w0ft9sq; Type: CONSTRAINT; Schema: public; Owner: florian; Tablespace: 
--

ALTER TABLE ONLY logincredential
    ADD CONSTRAINT uk_lb4s0fxvqona00ffc0w0ft9sq UNIQUE (account_id);


--
-- Name: uk_mskwv9nr8fd3pb70tlpex5oiu; Type: CONSTRAINT; Schema: public; Owner: florian; Tablespace: 
--

ALTER TABLE ONLY facebookcredential
    ADD CONSTRAINT uk_mskwv9nr8fd3pb70tlpex5oiu UNIQUE (userid);


--
-- Name: uk_qwghpx5s01gxmpfoh05umhsxf; Type: CONSTRAINT; Schema: public; Owner: florian; Tablespace: 
--

ALTER TABLE ONLY facebookcredential
    ADD CONSTRAINT uk_qwghpx5s01gxmpfoh05umhsxf UNIQUE (account_id);


--
-- Name: fk_10na602yh2ycnfpw4nr1bd0du; Type: FK CONSTRAINT; Schema: public; Owner: florian
--

ALTER TABLE ONLY session
    ADD CONSTRAINT fk_10na602yh2ycnfpw4nr1bd0du FOREIGN KEY (account_id) REFERENCES account(id);


--
-- Name: fk_dg4435wwm356vbnwi3m6gh8m9; Type: FK CONSTRAINT; Schema: public; Owner: florian
--

ALTER TABLE ONLY storedfile
    ADD CONSTRAINT fk_dg4435wwm356vbnwi3m6gh8m9 FOREIGN KEY (account_id) REFERENCES account(id);


--
-- Name: fk_hkc0jqlfcippaislqsib4wo2w; Type: FK CONSTRAINT; Schema: public; Owner: florian
--

ALTER TABLE ONLY translationvalue
    ADD CONSTRAINT fk_hkc0jqlfcippaislqsib4wo2w FOREIGN KEY (translation_id) REFERENCES translation(id);


--
-- Name: fk_lb4s0fxvqona00ffc0w0ft9sq; Type: FK CONSTRAINT; Schema: public; Owner: florian
--

ALTER TABLE ONLY logincredential
    ADD CONSTRAINT fk_lb4s0fxvqona00ffc0w0ft9sq FOREIGN KEY (account_id) REFERENCES account(id);


--
-- Name: fk_qwghpx5s01gxmpfoh05umhsxf; Type: FK CONSTRAINT; Schema: public; Owner: florian
--

ALTER TABLE ONLY facebookcredential
    ADD CONSTRAINT fk_qwghpx5s01gxmpfoh05umhsxf FOREIGN KEY (account_id) REFERENCES account(id);


--
-- PostgreSQL database dump complete
--

