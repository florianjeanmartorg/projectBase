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
-- Name: abstractpublication; Type: TABLE; Schema: public; Owner: play; Tablespace: 
--

CREATE TABLE abstractpublication (
    dtype character varying(31) NOT NULL,
    id bigint NOT NULL,
    creationdate timestamp without time zone,
    creationuser character varying(255),
    lastupdate timestamp without time zone,
    lastupdateuser character varying(255),
    version bigint,
    description text,
    enddate timestamp without time zone NOT NULL,
    searchabletitle character varying(255) NOT NULL,
    startdate timestamp without time zone NOT NULL,
    title character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    minimalquantity double precision,
    offpercent double precision,
    originalprice double precision,
    quantity double precision,
    unit character varying(255),
    business_id bigint NOT NULL,
    interest_id bigint
);


ALTER TABLE public.abstractpublication OWNER TO play;

--
-- Name: abstractpublication_id_seq; Type: SEQUENCE; Schema: public; Owner: play
--

CREATE SEQUENCE abstractpublication_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.abstractpublication_id_seq OWNER TO play;

--
-- Name: abstractpublication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: play
--

ALTER SEQUENCE abstractpublication_id_seq OWNED BY abstractpublication.id;


--
-- Name: account; Type: TABLE; Schema: public; Owner: play; Tablespace: 
--

CREATE TABLE account (
    dtype character varying(31) NOT NULL,
    id bigint NOT NULL,
    creationdate timestamp without time zone,
    creationuser character varying(255),
    lastupdate timestamp without time zone,
    lastupdateuser character varying(255),
    version bigint,
    authenticationkey character varying(255),
    email character varying(255) NOT NULL,
    firstname character varying(255),
    gender character varying(255) NOT NULL,
    lang character varying(255) DEFAULT 'en'::character varying NOT NULL,
    lastname character varying(255) NOT NULL,
    role character varying(255),
    sendnotificationbydefault boolean NOT NULL,
    type character varying(255),
    selectedaddress_id bigint
);


ALTER TABLE public.account OWNER TO play;

--
-- Name: account_customerinterest; Type: TABLE; Schema: public; Owner: play; Tablespace: 
--

CREATE TABLE account_customerinterest (
    account_id bigint NOT NULL,
    customerinterests_id bigint NOT NULL
);


ALTER TABLE public.account_customerinterest OWNER TO play;

--
-- Name: account_id_seq; Type: SEQUENCE; Schema: public; Owner: play
--

CREATE SEQUENCE account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_id_seq OWNER TO play;

--
-- Name: account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: play
--

ALTER SEQUENCE account_id_seq OWNED BY account.id;


--
-- Name: address; Type: TABLE; Schema: public; Owner: play; Tablespace: 
--

CREATE TABLE address (
    id bigint NOT NULL,
    creationdate timestamp without time zone,
    creationuser character varying(255),
    lastupdate timestamp without time zone,
    lastupdateuser character varying(255),
    version bigint,
    city character varying(255),
    country character varying(255) NOT NULL,
    name character varying(255),
    posx double precision NOT NULL,
    posy double precision NOT NULL,
    street character varying(255) NOT NULL,
    zip character varying(255) NOT NULL,
    account_id bigint
);


ALTER TABLE public.address OWNER TO play;

--
-- Name: address_id_seq; Type: SEQUENCE; Schema: public; Owner: play
--

CREATE SEQUENCE address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_id_seq OWNER TO play;

--
-- Name: address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: play
--

ALTER SEQUENCE address_id_seq OWNED BY address.id;


--
-- Name: business; Type: TABLE; Schema: public; Owner: play; Tablespace: 
--

CREATE TABLE business (
    id bigint NOT NULL,
    creationdate timestamp without time zone,
    creationuser character varying(255),
    lastupdate timestamp without time zone,
    lastupdateuser character varying(255),
    version bigint,
    askpublicationdate timestamp without time zone,
    businessstatus character varying(255) NOT NULL,
    description text NOT NULL,
    email character varying(255),
    name character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    searchablename character varying(255) NOT NULL,
    deliverylink character varying(255),
    ecommercelink character varying(255),
    facebooklink character varying(255),
    instagramlink character varying(255),
    opinionlink character varying(255),
    reservationlink character varying(255),
    twitterlink character varying(255),
    website character varying(255),
    account_id bigint NOT NULL,
    address_id bigint,
    illustration_id bigint,
    landscape_id bigint
);


ALTER TABLE public.business OWNER TO play;

--
-- Name: business_category; Type: TABLE; Schema: public; Owner: play; Tablespace: 
--

CREATE TABLE business_category (
    business bigint NOT NULL,
    category bigint NOT NULL
);


ALTER TABLE public.business_category OWNER TO play;

--
-- Name: business_id_seq; Type: SEQUENCE; Schema: public; Owner: play
--

CREATE SEQUENCE business_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.business_id_seq OWNER TO play;

--
-- Name: business_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: play
--

ALTER SEQUENCE business_id_seq OWNED BY business.id;


--
-- Name: businesscategory; Type: TABLE; Schema: public; Owner: play; Tablespace: 
--

CREATE TABLE businesscategory (
    id bigint NOT NULL,
    creationdate timestamp without time zone,
    creationuser character varying(255),
    lastupdate timestamp without time zone,
    lastupdateuser character varying(255),
    version bigint,
    name character varying(255) NOT NULL,
    orderindex integer,
    parent_id bigint,
    translationname_id bigint NOT NULL
);


ALTER TABLE public.businesscategory OWNER TO play;

--
-- Name: businesscategory_id_seq; Type: SEQUENCE; Schema: public; Owner: play
--

CREATE SEQUENCE businesscategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.businesscategory_id_seq OWNER TO play;

--
-- Name: businesscategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: play
--

ALTER SEQUENCE businesscategory_id_seq OWNED BY businesscategory.id;


--
-- Name: businessschedule; Type: TABLE; Schema: public; Owner: play; Tablespace: 
--

CREATE TABLE businessschedule (
    id bigint NOT NULL,
    creationdate timestamp without time zone,
    creationuser character varying(255),
    lastupdate timestamp without time zone,
    lastupdateuser character varying(255),
    version bigint,
    dayofweek character varying(255) NOT NULL,
    business_id bigint
);


ALTER TABLE public.businessschedule OWNER TO play;

--
-- Name: businessschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: play
--

CREATE SEQUENCE businessschedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.businessschedule_id_seq OWNER TO play;

--
-- Name: businessschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: play
--

ALTER SEQUENCE businessschedule_id_seq OWNED BY businessschedule.id;


--
-- Name: businessschedulepart; Type: TABLE; Schema: public; Owner: play; Tablespace: 
--

CREATE TABLE businessschedulepart (
    id bigint NOT NULL,
    creationdate timestamp without time zone,
    creationuser character varying(255),
    lastupdate timestamp without time zone,
    lastupdateuser character varying(255),
    version bigint,
    attendance character varying(255) NOT NULL,
    fromminutes integer NOT NULL,
    tominutes integer NOT NULL,
    businessschedule_id bigint NOT NULL
);


ALTER TABLE public.businessschedulepart OWNER TO play;

--
-- Name: businessschedulepart_id_seq; Type: SEQUENCE; Schema: public; Owner: play
--

CREATE SEQUENCE businessschedulepart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.businessschedulepart_id_seq OWNER TO play;

--
-- Name: businessschedulepart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: play
--

ALTER SEQUENCE businessschedulepart_id_seq OWNED BY businessschedulepart.id;


--
-- Name: categoryinterestlink; Type: TABLE; Schema: public; Owner: play; Tablespace: 
--

CREATE TABLE categoryinterestlink (
    id bigint NOT NULL,
    creationdate timestamp without time zone,
    creationuser character varying(255),
    lastupdate timestamp without time zone,
    lastupdateuser character varying(255),
    version bigint,
    priority integer NOT NULL,
    businesscategory_id bigint NOT NULL,
    customerinterest_id bigint NOT NULL
);


ALTER TABLE public.categoryinterestlink OWNER TO play;

--
-- Name: categoryinterestlink_id_seq; Type: SEQUENCE; Schema: public; Owner: play
--

CREATE SEQUENCE categoryinterestlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoryinterestlink_id_seq OWNER TO play;

--
-- Name: categoryinterestlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: play
--

ALTER SEQUENCE categoryinterestlink_id_seq OWNED BY categoryinterestlink.id;


--
-- Name: customerinterest; Type: TABLE; Schema: public; Owner: play; Tablespace: 
--

CREATE TABLE customerinterest (
    id bigint NOT NULL,
    creationdate timestamp without time zone,
    creationuser character varying(255),
    lastupdate timestamp without time zone,
    lastupdateuser character varying(255),
    version bigint,
    iconname character varying(255),
    name character varying(255) NOT NULL,
    orderindex integer,
    translationname_id bigint NOT NULL
);


ALTER TABLE public.customerinterest OWNER TO play;

--
-- Name: customerinterest_id_seq; Type: SEQUENCE; Schema: public; Owner: play
--

CREATE SEQUENCE customerinterest_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customerinterest_id_seq OWNER TO play;

--
-- Name: customerinterest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: play
--

ALTER SEQUENCE customerinterest_id_seq OWNED BY customerinterest.id;


--
-- Name: facebookcredential; Type: TABLE; Schema: public; Owner: play; Tablespace: 
--

CREATE TABLE facebookcredential (
    id bigint NOT NULL,
    creationdate timestamp without time zone,
    creationuser character varying(255),
    lastupdate timestamp without time zone,
    lastupdateuser character varying(255),
    version bigint,
    userid character varying(255) NOT NULL,
    account_id bigint NOT NULL
);


ALTER TABLE public.facebookcredential OWNER TO play;

--
-- Name: facebookcredential_id_seq; Type: SEQUENCE; Schema: public; Owner: play
--

CREATE SEQUENCE facebookcredential_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facebookcredential_id_seq OWNER TO play;

--
-- Name: facebookcredential_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: play
--

ALTER SEQUENCE facebookcredential_id_seq OWNED BY facebookcredential.id;


--
-- Name: followlink; Type: TABLE; Schema: public; Owner: play; Tablespace: 
--

CREATE TABLE followlink (
    id bigint NOT NULL,
    creationdate timestamp without time zone,
    creationuser character varying(255),
    lastupdate timestamp without time zone,
    lastupdateuser character varying(255),
    version bigint,
    followedfrom timestamp without time zone NOT NULL,
    followingnotification boolean DEFAULT true NOT NULL,
    notification boolean,
    account_id bigint NOT NULL,
    business_id bigint NOT NULL
);


ALTER TABLE public.followlink OWNER TO play;

--
-- Name: followlink_id_seq; Type: SEQUENCE; Schema: public; Owner: play
--

CREATE SEQUENCE followlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.followlink_id_seq OWNER TO play;

--
-- Name: followlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: play
--

ALTER SEQUENCE followlink_id_seq OWNED BY followlink.id;


--
-- Name: logincredential; Type: TABLE; Schema: public; Owner: play; Tablespace: 
--

CREATE TABLE logincredential (
    id bigint NOT NULL,
    creationdate timestamp without time zone,
    creationuser character varying(255),
    lastupdate timestamp without time zone,
    lastupdateuser character varying(255),
    version bigint,
    keepsessionopen boolean NOT NULL,
    password character varying(255) NOT NULL,
    account_id bigint NOT NULL
);


ALTER TABLE public.logincredential OWNER TO play;

--
-- Name: logincredential_id_seq; Type: SEQUENCE; Schema: public; Owner: play
--

CREATE SEQUENCE logincredential_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logincredential_id_seq OWNER TO play;

--
-- Name: logincredential_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: play
--

ALTER SEQUENCE logincredential_id_seq OWNED BY logincredential.id;


--
-- Name: session; Type: TABLE; Schema: public; Owner: play; Tablespace: 
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


ALTER TABLE public.session OWNER TO play;

--
-- Name: session_id_seq; Type: SEQUENCE; Schema: public; Owner: play
--

CREATE SEQUENCE session_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.session_id_seq OWNER TO play;

--
-- Name: session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: play
--

ALTER SEQUENCE session_id_seq OWNED BY session.id;


--
-- Name: storedfile; Type: TABLE; Schema: public; Owner: play; Tablespace: 
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
    isimage boolean NOT NULL,
    originalname character varying(255) NOT NULL,
    size integer,
    storedname character varying(255) NOT NULL,
    storednameoriginalsize character varying(255),
    account_id bigint NOT NULL,
    businessgallerypicture_id bigint,
    publication_id bigint
);


ALTER TABLE public.storedfile OWNER TO play;

--
-- Name: storedfile_id_seq; Type: SEQUENCE; Schema: public; Owner: play
--

CREATE SEQUENCE storedfile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.storedfile_id_seq OWNER TO play;

--
-- Name: storedfile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: play
--

ALTER SEQUENCE storedfile_id_seq OWNED BY storedfile.id;


--
-- Name: translation; Type: TABLE; Schema: public; Owner: play; Tablespace: 
--

CREATE TABLE translation (
    id bigint NOT NULL,
    creationdate timestamp without time zone,
    creationuser character varying(255),
    lastupdate timestamp without time zone,
    lastupdateuser character varying(255),
    version bigint
);


ALTER TABLE public.translation OWNER TO play;

--
-- Name: translation_id_seq; Type: SEQUENCE; Schema: public; Owner: play
--

CREATE SEQUENCE translation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.translation_id_seq OWNER TO play;

--
-- Name: translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: play
--

ALTER SEQUENCE translation_id_seq OWNED BY translation.id;


--
-- Name: translationvalue; Type: TABLE; Schema: public; Owner: play; Tablespace: 
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


ALTER TABLE public.translationvalue OWNER TO play;

--
-- Name: translationvalue_id_seq; Type: SEQUENCE; Schema: public; Owner: play
--

CREATE SEQUENCE translationvalue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.translationvalue_id_seq OWNER TO play;

--
-- Name: translationvalue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: play
--

ALTER SEQUENCE translationvalue_id_seq OWNED BY translationvalue.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: play
--

ALTER TABLE ONLY abstractpublication ALTER COLUMN id SET DEFAULT nextval('abstractpublication_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: play
--

ALTER TABLE ONLY account ALTER COLUMN id SET DEFAULT nextval('account_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: play
--

ALTER TABLE ONLY address ALTER COLUMN id SET DEFAULT nextval('address_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: play
--

ALTER TABLE ONLY business ALTER COLUMN id SET DEFAULT nextval('business_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: play
--

ALTER TABLE ONLY businesscategory ALTER COLUMN id SET DEFAULT nextval('businesscategory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: play
--

ALTER TABLE ONLY businessschedule ALTER COLUMN id SET DEFAULT nextval('businessschedule_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: play
--

ALTER TABLE ONLY businessschedulepart ALTER COLUMN id SET DEFAULT nextval('businessschedulepart_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: play
--

ALTER TABLE ONLY categoryinterestlink ALTER COLUMN id SET DEFAULT nextval('categoryinterestlink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: play
--

ALTER TABLE ONLY customerinterest ALTER COLUMN id SET DEFAULT nextval('customerinterest_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: play
--

ALTER TABLE ONLY facebookcredential ALTER COLUMN id SET DEFAULT nextval('facebookcredential_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: play
--

ALTER TABLE ONLY followlink ALTER COLUMN id SET DEFAULT nextval('followlink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: play
--

ALTER TABLE ONLY logincredential ALTER COLUMN id SET DEFAULT nextval('logincredential_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: play
--

ALTER TABLE ONLY session ALTER COLUMN id SET DEFAULT nextval('session_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: play
--

ALTER TABLE ONLY storedfile ALTER COLUMN id SET DEFAULT nextval('storedfile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: play
--

ALTER TABLE ONLY translation ALTER COLUMN id SET DEFAULT nextval('translation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: play
--

ALTER TABLE ONLY translationvalue ALTER COLUMN id SET DEFAULT nextval('translationvalue_id_seq'::regclass);


--
-- Data for Name: abstractpublication; Type: TABLE DATA; Schema: public; Owner: play
--

COPY abstractpublication (dtype, id, creationdate, creationuser, lastupdate, lastupdateuser, version, description, enddate, searchabletitle, startdate, title, type, minimalquantity, offpercent, originalprice, quantity, unit, business_id, interest_id) FROM stdin;
\.


--
-- Name: abstractpublication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: play
--

SELECT pg_catalog.setval('abstractpublication_id_seq', 1, true);


--
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: play
--

COPY account (dtype, id, creationdate, creationuser, lastupdate, lastupdateuser, version, authenticationkey, email, firstname, gender, lang, lastname, role, sendnotificationbydefault, type, selectedaddress_id) FROM stdin;
Account	1	\N	\N	\N	\N	0	\N	florian.jeanmart@gmail.com	Florian	MALE	fr	Jeanmart	SUPERADMIN	t	CUSTOMER	\N
Account	2	\N	\N	\N	\N	0	\N	gil.knops@krings-law.be	Florian	MALE	fr	Jeanmart	SUPERADMIN	t	CUSTOMER	\N
Account	3	\N	\N	\N	\N	0	\N	greg.malcause@gmail.com	Florian	MALE	fr	Jeanmart	SUPERADMIN	t	CUSTOMER	\N
\.


--
-- Data for Name: account_customerinterest; Type: TABLE DATA; Schema: public; Owner: play
--

COPY account_customerinterest (account_id, customerinterests_id) FROM stdin;
\.


--
-- Name: account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: play
--

SELECT pg_catalog.setval('account_id_seq', 12, true);


--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: play
--

COPY address (id, creationdate, creationuser, lastupdate, lastupdateuser, version, city, country, name, posx, posy, street, zip, account_id) FROM stdin;
\.


--
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: play
--

SELECT pg_catalog.setval('address_id_seq', 9, true);


--
-- Data for Name: business; Type: TABLE DATA; Schema: public; Owner: play
--

COPY business (id, creationdate, creationuser, lastupdate, lastupdateuser, version, askpublicationdate, businessstatus, description, email, name, phone, searchablename, deliverylink, ecommercelink, facebooklink, instagramlink, opinionlink, reservationlink, twitterlink, website, account_id, address_id, illustration_id, landscape_id) FROM stdin;
\.


--
-- Data for Name: business_category; Type: TABLE DATA; Schema: public; Owner: play
--

COPY business_category (business, category) FROM stdin;
\.


--
-- Name: business_id_seq; Type: SEQUENCE SET; Schema: public; Owner: play
--

SELECT pg_catalog.setval('business_id_seq', 9, true);


--
-- Data for Name: businesscategory; Type: TABLE DATA; Schema: public; Owner: play
--

COPY businesscategory (id, creationdate, creationuser, lastupdate, lastupdateuser, version, name, orderindex, parent_id, translationname_id) FROM stdin;
1	2015-09-19 16:36:18.85	\N	2015-09-19 16:36:18.85	\N	0	horeca	1	\N	21
2	2015-09-19 16:36:18.857	\N	2015-09-19 16:36:18.857	\N	0	horeca_hotel	2	1	22
3	2015-09-19 16:36:18.864	\N	2015-09-19 16:36:18.864	\N	0	horeca_hotel_auberge	3	2	23
4	2015-09-19 16:36:18.87	\N	2015-09-19 16:36:18.87	\N	0	horeca_hotel_camping	4	2	24
5	2015-09-19 16:36:18.876	\N	2015-09-19 16:36:18.876	\N	0	horeca_hotel_bb	5	2	25
6	2015-09-19 16:36:18.882	\N	2015-09-19 16:36:18.882	\N	0	horeca_hotel_hotel	6	2	26
7	2015-09-19 16:36:18.888	\N	2015-09-19 16:36:18.888	\N	0	horeca_restaurant	7	1	27
8	2015-09-19 16:36:18.895	\N	2015-09-19 16:36:18.895	\N	0	horeca_restaurant_fastfood	8	7	28
9	2015-09-19 16:36:18.9	\N	2015-09-19 16:36:18.9	\N	0	horeca_restaurant_asiatique	9	7	29
10	2015-09-19 16:36:18.906	\N	2015-09-19 16:36:18.906	\N	0	horeca_restaurant_europeen	10	7	30
11	2015-09-19 16:36:18.912	\N	2015-09-19 16:36:18.912	\N	0	horeca_restaurant_africain	11	7	31
12	2015-09-19 16:36:18.918	\N	2015-09-19 16:36:18.918	\N	0	horeca_restaurant_americain	12	7	32
13	2015-09-19 16:36:18.924	\N	2015-09-19 16:36:18.924	\N	0	horeca_restaurant_belge	13	7	33
14	2015-09-19 16:36:18.931	\N	2015-09-19 16:36:18.931	\N	0	horeca_restaurant_brunch	14	7	34
15	2015-09-19 16:36:18.936	\N	2015-09-19 16:36:18.936	\N	0	horeca_restaurant_gastronomique	15	7	35
16	2015-09-19 16:36:18.941	\N	2015-09-19 16:36:18.941	\N	0	horeca_cafe	16	1	36
17	2015-09-19 16:36:18.947	\N	2015-09-19 16:36:18.947	\N	0	horeca_cafe_bieres	17	16	37
18	2015-09-19 16:36:18.953	\N	2015-09-19 16:36:18.953	\N	0	horeca_cafe_vins	18	16	38
19	2015-09-19 16:36:18.958	\N	2015-09-19 16:36:18.958	\N	0	horeca_cafe_champagne	19	16	39
20	2015-09-19 16:36:18.964	\N	2015-09-19 16:36:18.964	\N	0	horeca_cafe_cocktails	20	16	40
21	2015-09-19 16:36:18.969	\N	2015-09-19 16:36:18.969	\N	0	horeca_cafe_jus	21	16	41
22	2015-09-19 16:36:18.975	\N	2015-09-19 16:36:18.975	\N	0	horeca_traiteur	22	1	42
23	2015-09-19 16:36:18.98	\N	2015-09-19 16:36:18.98	\N	0	horeca_traiteur_asiatique	23	22	43
24	2015-09-19 16:36:18.985	\N	2015-09-19 16:36:18.985	\N	0	horeca_traiteur_europeen	24	22	44
25	2015-09-19 16:36:18.99	\N	2015-09-19 16:36:18.99	\N	0	horeca_traiteur_africain	25	22	45
26	2015-09-19 16:36:18.995	\N	2015-09-19 16:36:18.995	\N	0	horeca_traiteur_americain	26	22	46
27	2015-09-19 16:36:18.999	\N	2015-09-19 16:36:18.999	\N	0	horeca_traiteur_belge	27	22	47
28	2015-09-19 16:36:19.005	\N	2015-09-19 16:36:19.005	\N	0	horeca_traiteur_gastronomique	28	22	48
29	2015-09-19 16:36:19.01	\N	2015-09-19 16:36:19.01	\N	0	magasin	29	\N	49
30	2015-09-19 16:36:19.014	\N	2015-09-19 16:36:19.014	\N	0	magasin_alimentation	30	29	50
31	2015-09-19 16:36:19.019	\N	2015-09-19 16:36:19.019	\N	0	magasin_alimentation_supermarche	31	30	51
32	2015-09-19 16:36:19.023	\N	2015-09-19 16:36:19.023	\N	0	magasin_alimentation_boucheriecharcuterie	32	30	52
33	2015-09-19 16:36:19.028	\N	2015-09-19 16:36:19.029	\N	0	magasin_alimentation_poissonerie	33	30	53
34	2015-09-19 16:36:19.033	\N	2015-09-19 16:36:19.033	\N	0	magasin_alimentation_boulangerie	34	30	54
35	2015-09-19 16:36:19.037	\N	2015-09-19 16:36:19.037	\N	0	magasin_alimentation_fromagerie	35	30	55
36	2015-09-19 16:36:19.041	\N	2015-09-19 16:36:19.041	\N	0	magasin_alimentation_bieres	36	30	56
37	2015-09-19 16:36:19.046	\N	2015-09-19 16:36:19.046	\N	0	magasin_alimentation_epices	37	30	57
38	2015-09-19 16:36:19.05	\N	2015-09-19 16:36:19.05	\N	0	magasin_alimentation_confiseries	38	30	58
39	2015-09-19 16:36:19.055	\N	2015-09-19 16:36:19.055	\N	0	magasin_loisirs	39	29	59
40	2015-09-19 16:36:19.059	\N	2015-09-19 16:36:19.059	\N	0	magasin_loisirs_sport_	40	39	60
41	2015-09-19 16:36:19.062	\N	2015-09-19 16:36:19.062	\N	0	magasin_loisirs_maison	41	39	61
42	2015-09-19 16:36:19.067	\N	2015-09-19 16:36:19.067	\N	0	magasin_loisirs_jardin	42	39	62
43	2015-09-19 16:36:19.071	\N	2015-09-19 16:36:19.071	\N	0	magasin_loisirs_jeux	43	39	63
44	2015-09-19 16:36:19.076	\N	2015-09-19 16:36:19.076	\N	0	magasin_loisirs_multimedia	44	39	64
45	2015-09-19 16:36:19.079	\N	2015-09-19 16:36:19.079	\N	0	magasin_loisirs_animaux	45	39	65
46	2015-09-19 16:36:19.085	\N	2015-09-19 16:36:19.085	\N	0	magasin_loisirs_voyages	46	39	66
47	2015-09-19 16:36:19.09	\N	2015-09-19 16:36:19.09	\N	0	magasin_loisirs_livres	47	39	67
48	2015-09-19 16:36:19.094	\N	2015-09-19 16:36:19.094	\N	0	magasin_mode	48	29	68
49	2015-09-19 16:36:19.099	\N	2015-09-19 16:36:19.099	\N	0	magasin_mode_enfants	49	48	69
50	2015-09-19 16:36:19.104	\N	2015-09-19 16:36:19.104	\N	0	magasin_mode_hommes	50	48	70
51	2015-09-19 16:36:19.109	\N	2015-09-19 16:36:19.109	\N	0	magasin_mode_femmes	51	48	71
52	2015-09-19 16:36:19.113	\N	2015-09-19 16:36:19.113	\N	0	magasin_mode_chaussures	52	48	72
53	2015-09-19 16:36:19.118	\N	2015-09-19 16:36:19.118	\N	0	magasin_mode_bijoux	53	48	73
54	2015-09-19 16:36:19.123	\N	2015-09-19 16:36:19.123	\N	0	magasin_mode_parfums	54	48	74
55	2015-09-19 16:36:19.128	\N	2015-09-19 16:36:19.128	\N	0	magasin_mode_lingerie	55	48	75
56	2015-09-19 16:36:19.133	\N	2015-09-19 16:36:19.133	\N	0	magasin_mode_lunettes	56	48	76
57	2015-09-19 16:36:19.137	\N	2015-09-19 16:36:19.137	\N	0	magasin_utile	57	29	77
58	2015-09-19 16:36:19.141	\N	2015-09-19 16:36:19.141	\N	0	magasin_utile_electromenager	58	57	78
59	2015-09-19 16:36:19.149	\N	2015-09-19 16:36:19.149	\N	0	magasin_utile_bricolage	59	57	79
60	2015-09-19 16:36:19.155	\N	2015-09-19 16:36:19.155	\N	0	magasin_utile_papeterie	60	57	80
61	2015-09-19 16:36:19.16	\N	2015-09-19 16:36:19.16	\N	0	magasin_utile_magasin_voiture	61	57	81
62	2015-09-19 16:36:19.164	\N	2015-09-19 16:36:19.164	\N	0	magasin_utile_droguerie	62	57	82
63	2015-09-19 16:36:19.168	\N	2015-09-19 16:36:19.168	\N	0	magasin_utile_velo	63	57	83
64	2015-09-19 16:36:19.172	\N	2015-09-19 16:36:19.172	\N	0	beaute	64	\N	84
65	2015-09-19 16:36:19.177	\N	2015-09-19 16:36:19.177	\N	0	beaute_soins	65	64	85
66	2015-09-19 16:36:19.181	\N	2015-09-19 16:36:19.181	\N	0	beaute_soins_coiffure	66	65	86
67	2015-09-19 16:36:19.185	\N	2015-09-19 16:36:19.186	\N	0	beaute_soins_esthetique	67	65	87
68	2015-09-19 16:36:19.189	\N	2015-09-19 16:36:19.189	\N	0	beaute_soins_manipedi	68	65	88
69	2015-09-19 16:36:19.194	\N	2015-09-19 16:36:19.194	\N	0	beaute_soins_massage	69	65	89
70	2015-09-19 16:36:19.198	\N	2015-09-19 16:36:19.198	\N	0	beaute_soins_tatoupierc	70	65	90
71	2015-09-19 16:36:19.201	\N	2015-09-19 16:36:19.201	\N	0	beaute_soins_toilettage	71	65	91
72	2015-09-19 16:36:19.206	\N	2015-09-19 16:36:19.206	\N	0	beaute_etablissement	72	64	92
73	2015-09-19 16:36:19.21	\N	2015-09-19 16:36:19.21	\N	0	beaute_etablissement_saunahammam	73	72	93
74	2015-09-19 16:36:19.213	\N	2015-09-19 16:36:19.213	\N	0	beaute_etablissement_solarium	74	72	94
75	2015-09-19 16:36:19.217	\N	2015-09-19 16:36:19.217	\N	0	sante	75	\N	95
76	2015-09-19 16:36:19.22	\N	2015-09-19 16:36:19.22	\N	0	sante_medconv	76	75	96
77	2015-09-19 16:36:19.222	\N	2015-09-19 16:36:19.222	\N	0	sante_medconv_generale	77	76	97
78	2015-09-19 16:36:19.226	\N	2015-09-19 16:36:19.226	\N	0	sante_medconv_ophtalmologie	78	76	98
79	2015-09-19 16:36:19.23	\N	2015-09-19 16:36:19.23	\N	0	sante_medconv_orl	79	76	99
80	2015-09-19 16:36:19.237	\N	2015-09-19 16:36:19.237	\N	0	sante_medconv_gyneco	80	76	100
81	2015-09-19 16:36:19.243	\N	2015-09-19 16:36:19.243	\N	0	sante_medconv_dentisterie	81	76	101
82	2015-09-19 16:36:19.281	\N	2015-09-19 16:36:19.281	\N	0	sante_medconv_kine	82	76	102
83	2015-09-19 16:36:19.288	\N	2015-09-19 16:36:19.288	\N	0	sante_medconv_dermato	83	76	103
84	2015-09-19 16:36:19.292	\N	2015-09-19 16:36:19.292	\N	0	sante_medconv_psycho	84	76	104
85	2015-09-19 16:36:19.297	\N	2015-09-19 16:36:19.297	\N	0	sante_mednonconv	85	75	105
86	2015-09-19 16:36:19.302	\N	2015-09-19 16:36:19.302	\N	0	asante_mednonconv_acupuncture	86	85	106
87	2015-09-19 16:36:19.311	\N	2015-09-19 16:36:19.311	\N	0	sante_mednonconv_osteopatie	87	85	107
88	2015-09-19 16:36:19.319	\N	2015-09-19 16:36:19.319	\N	0	sante_mednonconv_homeopathie	88	85	108
89	2015-09-19 16:36:19.327	\N	2015-09-19 16:36:19.327	\N	0	sante_mednonconv_hypnose	89	85	109
90	2015-09-19 16:36:19.334	\N	2015-09-19 16:36:19.334	\N	0	sante_mednonconv_naturopathie	90	85	110
91	2015-09-19 16:36:19.34	\N	2015-09-19 16:36:19.34	\N	0	sante_autres	91	75	111
92	2015-09-19 16:36:19.345	\N	2015-09-19 16:36:19.345	\N	0	sante_autres_pharmacie	92	91	112
93	2015-09-19 16:36:19.356	\N	2015-09-19 16:36:19.356	\N	0	sante_autres_hopitaux	93	91	113
94	2015-09-19 16:36:19.364	\N	2015-09-19 16:36:19.364	\N	0	sante_autres_centres	94	91	114
95	2015-09-19 16:36:19.392	\N	2015-09-19 16:36:19.392	\N	0	sante_autres_veterinaire	95	91	115
96	2015-09-19 16:36:19.397	\N	2015-09-19 16:36:19.397	\N	0	servicesprox	96	\N	116
97	2015-09-19 16:36:19.401	\N	2015-09-19 16:36:19.401	\N	0	servicesprox_crearepa	97	96	117
98	2015-09-19 16:36:19.406	\N	2015-09-19 16:36:19.406	\N	0	servicesprox_crearepa_cordoserru	98	97	118
99	2015-09-19 16:36:19.411	\N	2015-09-19 16:36:19.411	\N	0	servicesprox_crearepa_couture	99	97	119
100	2015-09-19 16:36:19.415	\N	2015-09-19 16:36:19.415	\N	0	servicesprox_crearepa_informatique	100	97	120
101	2015-09-19 16:36:19.419	\N	2015-09-19 16:36:19.419	\N	0	servicesprox_crearepa_smartphones	101	97	121
102	2015-09-19 16:36:19.423	\N	2015-09-19 16:36:19.423	\N	0	servicesprox_crearepa_plombier	102	97	122
103	2015-09-19 16:36:19.429	\N	2015-09-19 16:36:19.429	\N	0	servicesprox_crearepa_electricien	103	97	123
104	2015-09-19 16:36:19.435	\N	2015-09-19 16:36:19.435	\N	0	servicesprox_crearepa_jardinier	104	97	124
105	2015-09-19 16:36:19.443	\N	2015-09-19 16:36:19.443	\N	0	servicesprox_findroit	105	96	125
106	2015-09-19 16:36:19.446	\N	2015-09-19 16:36:19.446	\N	0	servicesprox_findroit_banque	106	105	126
107	2015-09-19 16:36:19.45	\N	2015-09-19 16:36:19.45	\N	0	servicesprox_findroit_mistercash	107	105	127
108	2015-09-19 16:36:19.453	\N	2015-09-19 16:36:19.453	\N	0	servicesprox_findroit_assurances	108	105	128
109	2015-09-19 16:36:19.458	\N	2015-09-19 16:36:19.458	\N	0	servicesprox_findroit_avocat	109	105	129
110	2015-09-19 16:36:19.461	\N	2015-09-19 16:36:19.461	\N	0	servicesprox_findroit_notaire	110	105	130
111	2015-09-19 16:36:19.468	\N	2015-09-19 16:36:19.468	\N	0	servicesprox_findroit_comptable	111	105	131
112	2015-09-19 16:36:19.474	\N	2015-09-19 16:36:19.474	\N	0	servicesprox_voiture	112	96	132
113	2015-09-19 16:36:19.478	\N	2015-09-19 16:36:19.478	\N	0	servicesprox_voiture_garage	113	112	133
114	2015-09-19 16:36:19.481	\N	2015-09-19 16:36:19.481	\N	0	servicesprox_voiture_station	114	112	134
115	2015-09-19 16:36:19.484	\N	2015-09-19 16:36:19.484	\N	0	servicesprox_voiture_carwash	115	112	135
116	2015-09-19 16:36:19.487	\N	2015-09-19 16:36:19.487	\N	0	servicesprox_voiture_parking	116	112	136
117	2015-09-19 16:36:19.491	\N	2015-09-19 16:36:19.491	\N	0	servicesprox_voiture_parebrise	117	112	137
118	2015-09-19 16:36:19.496	\N	2015-09-19 16:36:19.496	\N	0	servicesprox_voiture_pneus	118	112	138
119	2015-09-19 16:36:19.501	\N	2015-09-19 16:36:19.501	\N	0	servicesprox_voiture_controletech	119	112	139
120	2015-09-19 16:36:19.505	\N	2015-09-19 16:36:19.505	\N	0	servicesprox_autres	120	96	140
121	2015-09-19 16:36:19.511	\N	2015-09-19 16:36:19.511	\N	0	servicesprox_autres_imprimerie	121	120	141
122	2015-09-19 16:36:19.515	\N	2015-09-19 16:36:19.515	\N	0	servicesprox_autres_garderie	122	120	142
123	2015-09-19 16:36:19.52	\N	2015-09-19 16:36:19.52	\N	0	servicesprox_autres_immo	123	120	143
124	2015-09-19 16:36:19.524	\N	2015-09-19 16:36:19.524	\N	0	servicesprox_autres_teleinternet	124	120	144
125	2015-09-19 16:36:19.529	\N	2015-09-19 16:36:19.529	\N	0	servicesprox_autres_repassage	125	120	145
126	2015-09-19 16:36:19.533	\N	2015-09-19 16:36:19.533	\N	0	servicesprox_autres_etudesformations	126	120	146
127	2015-09-19 16:36:19.538	\N	2015-09-19 16:36:19.538	\N	0	detente	127	\N	147
128	2015-09-19 16:36:19.544	\N	2015-09-19 16:36:19.544	\N	0	detente_culture	128	127	148
129	2015-09-19 16:36:19.548	\N	2015-09-19 16:36:19.548	\N	0	detente_culture_theatre	129	128	149
130	2015-09-19 16:36:19.551	\N	2015-09-19 16:36:19.551	\N	0	detente_culture_opera	130	128	150
131	2015-09-19 16:36:19.554	\N	2015-09-19 16:36:19.554	\N	0	detente_culture_concert	131	128	151
132	2015-09-19 16:36:19.557	\N	2015-09-19 16:36:19.557	\N	0	detente_culture_cirque	132	128	152
133	2015-09-19 16:36:19.56	\N	2015-09-19 16:36:19.56	\N	0	detente_culture_musee	133	128	153
134	2015-09-19 16:36:19.564	\N	2015-09-19 16:36:19.564	\N	0	detente_culture_cinema	134	128	154
135	2015-09-19 16:36:19.568	\N	2015-09-19 16:36:19.568	\N	0	detente_culture_galerie	135	128	155
136	2015-09-19 16:36:19.572	\N	2015-09-19 16:36:19.572	\N	0	detente_culture_zooaqua	136	128	156
137	2015-09-19 16:36:19.576	\N	2015-09-19 16:36:19.576	\N	0	detente_soiree	137	127	157
138	2015-09-19 16:36:19.58	\N	2015-09-19 16:36:19.58	\N	0	detente_soiree_discotheque	138	137	158
139	2015-09-19 16:36:19.583	\N	2015-09-19 16:36:19.583	\N	0	detente_soiree_karaoke	139	137	159
140	2015-09-19 16:36:19.587	\N	2015-09-19 16:36:19.587	\N	0	detente_soiree_lounge	140	137	160
141	2015-09-19 16:36:19.589	\N	2015-09-19 16:36:19.589	\N	0	detente_soiree_bowling	141	137	161
142	2015-09-19 16:36:19.593	\N	2015-09-19 16:36:19.593	\N	0	detente_soiree_cafetheatre	142	137	162
143	2015-09-19 16:36:19.596	\N	2015-09-19 16:36:19.596	\N	0	detente_soiree_holebi	143	137	163
144	2015-09-19 16:36:19.6	\N	2015-09-19 16:36:19.6	\N	0	detente_sport	144	127	164
145	2015-09-19 16:36:19.606	\N	2015-09-19 16:36:19.606	\N	0	detente_sport_tennis	145	144	165
146	2015-09-19 16:36:19.611	\N	2015-09-19 16:36:19.611	\N	0	detente_sport_badmintonsquash	146	144	166
147	2015-09-19 16:36:19.615	\N	2015-09-19 16:36:19.615	\N	0	detente_sport_escalade	147	144	167
148	2015-09-19 16:36:19.619	\N	2015-09-19 16:36:19.619	\N	0	detente_sport_piscine	148	144	168
149	2015-09-19 16:36:19.622	\N	2015-09-19 16:36:19.622	\N	0	detente_sport_fitness	149	144	169
150	2015-09-19 16:36:19.625	\N	2015-09-19 16:36:19.625	\N	0	detente_sport_karting	150	144	170
151	2015-09-19 16:36:19.629	\N	2015-09-19 16:36:19.629	\N	0	detente_sport_danse	151	144	171
152	2015-09-19 16:36:19.632	\N	2015-09-19 16:36:19.632	\N	0	detente_sport_golf	152	144	172
153	2015-09-19 16:36:19.638	\N	2015-09-19 16:36:19.638	\N	0	detente_autres	153	127	173
154	2015-09-19 16:36:19.644	\N	2015-09-19 16:36:19.644	\N	0	detente_autres_casino	154	153	174
155	2015-09-19 16:36:19.653	\N	2015-09-19 16:36:19.653	\N	0	detente_autres_jeuxsociete	155	153	175
156	2015-09-19 16:36:19.66	\N	2015-09-19 16:36:19.66	\N	0	detente_autres_jeuxvideo	156	153	176
157	2015-09-19 16:36:19.668	\N	2015-09-19 16:36:19.668	\N	0	detente_autres_jeuxenfants	157	153	177
158	2015-09-19 16:36:19.672	\N	2015-09-19 16:36:19.672	\N	0	servicespubliques	158	\N	178
159	2015-09-19 16:36:19.676	\N	2015-09-19 16:36:19.676	\N	0	servicespubliques_pratiques	159	158	179
160	2015-09-19 16:36:19.679	\N	2015-09-19 16:36:19.679	\N	0	servicespubliques_pratiques_poste	160	159	180
161	2015-09-19 16:36:19.683	\N	2015-09-19 16:36:19.683	\N	0	servicespubliques_pratiques_police	161	159	181
162	2015-09-19 16:36:19.687	\N	2015-09-19 16:36:19.687	\N	0	servicespubliques_pratiques_pompiers	162	159	182
163	2015-09-19 16:36:19.692	\N	2015-09-19 16:36:19.692	\N	0	servicespubliques_pratiques_bibliotheque	163	159	183
164	2015-09-19 16:36:19.696	\N	2015-09-19 16:36:19.696	\N	0	servicespubliques_communal	164	158	184
165	2015-09-19 16:36:19.702	\N	2015-09-19 16:36:19.702	\N	0	servicespubliques_communal_population	165	164	185
166	2015-09-19 16:36:19.705	\N	2015-09-19 16:36:19.705	\N	0	servicespubliques_communal_energie	166	164	186
167	2015-09-19 16:36:19.709	\N	2015-09-19 16:36:19.709	\N	0	servicespubliques_communal_emploi	167	164	187
168	2015-09-19 16:36:19.712	\N	2015-09-19 16:36:19.712	\N	0	servicespubliques_communal_urbanisme	168	164	188
169	2015-09-19 16:36:19.716	\N	2015-09-19 16:36:19.716	\N	0	servicespubliques_communal_cpas	169	164	189
170	2015-09-19 16:36:19.72	\N	2015-09-19 16:36:19.72	\N	0	servicespubliques_communal_tourisme	170	164	190
171	2015-09-19 16:36:19.723	\N	2015-09-19 16:36:19.723	\N	0	servicespubliques_fedeintern	171	158	191
172	2015-09-19 16:36:19.727	\N	2015-09-19 16:36:19.727	\N	0	servicespubliques_fedeintern_economie	172	171	192
173	2015-09-19 16:36:19.731	\N	2015-09-19 16:36:19.731	\N	0	servicespubliques_fedeintern_emploi	173	171	193
174	2015-09-19 16:36:19.735	\N	2015-09-19 16:36:19.735	\N	0	servicespubliques_fedeintern_justice	174	171	194
175	2015-09-19 16:36:19.738	\N	2015-09-19 16:36:19.738	\N	0	servicespubliques_fedeintern_mobilite	175	171	195
176	2015-09-19 16:36:19.741	\N	2015-09-19 16:36:19.741	\N	0	servicespubliques_fedeintern_impots	176	171	196
177	2015-09-19 16:36:19.745	\N	2015-09-19 16:36:19.745	\N	0	servicespubliques_fedeintern_logement	177	171	197
178	2015-09-19 16:36:19.749	\N	2015-09-19 16:36:19.749	\N	0	servicespubliques_fedeintern_sante	178	171	198
179	2015-09-19 16:36:19.752	\N	2015-09-19 16:36:19.752	\N	0	servicespubliques_fedeintern_ambassade	179	171	199
\.


--
-- Name: businesscategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: play
--

SELECT pg_catalog.setval('businesscategory_id_seq', 179, true);


--
-- Data for Name: businessschedule; Type: TABLE DATA; Schema: public; Owner: play
--

COPY businessschedule (id, creationdate, creationuser, lastupdate, lastupdateuser, version, dayofweek, business_id) FROM stdin;
\.


--
-- Name: businessschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: play
--

SELECT pg_catalog.setval('businessschedule_id_seq', 1, false);


--
-- Data for Name: businessschedulepart; Type: TABLE DATA; Schema: public; Owner: play
--

COPY businessschedulepart (id, creationdate, creationuser, lastupdate, lastupdateuser, version, attendance, fromminutes, tominutes, businessschedule_id) FROM stdin;
\.


--
-- Name: businessschedulepart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: play
--

SELECT pg_catalog.setval('businessschedulepart_id_seq', 1, false);


--
-- Data for Name: categoryinterestlink; Type: TABLE DATA; Schema: public; Owner: play
--

COPY categoryinterestlink (id, creationdate, creationuser, lastupdate, lastupdateuser, version, priority, businesscategory_id, customerinterest_id) FROM stdin;
1	2015-09-19 16:36:19.756	\N	2015-09-19 16:36:19.756	\N	0	1	3	13
2	2015-09-19 16:36:19.758	\N	2015-09-19 16:36:19.758	\N	0	1	3	14
3	2015-09-19 16:36:19.76	\N	2015-09-19 16:36:19.76	\N	0	1	4	13
4	2015-09-19 16:36:19.761	\N	2015-09-19 16:36:19.761	\N	0	1	4	14
5	2015-09-19 16:36:19.763	\N	2015-09-19 16:36:19.763	\N	0	2	5	1
6	2015-09-19 16:36:19.764	\N	2015-09-19 16:36:19.764	\N	0	1	5	13
7	2015-09-19 16:36:19.765	\N	2015-09-19 16:36:19.765	\N	0	1	5	14
8	2015-09-19 16:36:19.766	\N	2015-09-19 16:36:19.766	\N	0	2	6	1
9	2015-09-19 16:36:19.768	\N	2015-09-19 16:36:19.768	\N	0	2	6	2
10	2015-09-19 16:36:19.769	\N	2015-09-19 16:36:19.769	\N	0	1	6	13
11	2015-09-19 16:36:19.77	\N	2015-09-19 16:36:19.77	\N	0	1	6	14
12	2015-09-19 16:36:19.771	\N	2015-09-19 16:36:19.771	\N	0	1	8	1
13	2015-09-19 16:36:19.772	\N	2015-09-19 16:36:19.772	\N	0	1	8	14
14	2015-09-19 16:36:19.774	\N	2015-09-19 16:36:19.774	\N	0	1	9	1
15	2015-09-19 16:36:19.775	\N	2015-09-19 16:36:19.775	\N	0	2	9	2
16	2015-09-19 16:36:19.776	\N	2015-09-19 16:36:19.776	\N	0	2	9	3
17	2015-09-19 16:36:19.777	\N	2015-09-19 16:36:19.777	\N	0	1	9	14
18	2015-09-19 16:36:19.778	\N	2015-09-19 16:36:19.778	\N	0	1	10	1
19	2015-09-19 16:36:19.779	\N	2015-09-19 16:36:19.779	\N	0	2	10	2
20	2015-09-19 16:36:19.781	\N	2015-09-19 16:36:19.781	\N	0	2	10	3
21	2015-09-19 16:36:19.782	\N	2015-09-19 16:36:19.782	\N	0	1	10	14
22	2015-09-19 16:36:19.784	\N	2015-09-19 16:36:19.784	\N	0	1	11	1
23	2015-09-19 16:36:19.785	\N	2015-09-19 16:36:19.785	\N	0	2	11	2
24	2015-09-19 16:36:19.786	\N	2015-09-19 16:36:19.786	\N	0	2	11	3
25	2015-09-19 16:36:19.787	\N	2015-09-19 16:36:19.787	\N	0	1	11	14
26	2015-09-19 16:36:19.789	\N	2015-09-19 16:36:19.789	\N	0	1	12	1
27	2015-09-19 16:36:19.79	\N	2015-09-19 16:36:19.79	\N	0	2	12	2
28	2015-09-19 16:36:19.791	\N	2015-09-19 16:36:19.791	\N	0	2	12	3
29	2015-09-19 16:36:19.793	\N	2015-09-19 16:36:19.793	\N	0	1	12	14
30	2015-09-19 16:36:19.794	\N	2015-09-19 16:36:19.794	\N	0	1	13	1
31	2015-09-19 16:36:19.796	\N	2015-09-19 16:36:19.796	\N	0	2	13	2
32	2015-09-19 16:36:19.797	\N	2015-09-19 16:36:19.797	\N	0	2	13	3
33	2015-09-19 16:36:19.798	\N	2015-09-19 16:36:19.798	\N	0	1	13	14
34	2015-09-19 16:36:19.799	\N	2015-09-19 16:36:19.799	\N	0	1	14	1
35	2015-09-19 16:36:19.8	\N	2015-09-19 16:36:19.8	\N	0	2	14	2
36	2015-09-19 16:36:19.801	\N	2015-09-19 16:36:19.801	\N	0	2	14	3
37	2015-09-19 16:36:19.802	\N	2015-09-19 16:36:19.802	\N	0	1	14	14
38	2015-09-19 16:36:19.804	\N	2015-09-19 16:36:19.804	\N	0	1	15	1
39	2015-09-19 16:36:19.805	\N	2015-09-19 16:36:19.805	\N	0	2	15	2
40	2015-09-19 16:36:19.806	\N	2015-09-19 16:36:19.806	\N	0	2	15	3
41	2015-09-19 16:36:19.808	\N	2015-09-19 16:36:19.808	\N	0	1	15	14
42	2015-09-19 16:36:19.809	\N	2015-09-19 16:36:19.809	\N	0	2	17	1
43	2015-09-19 16:36:19.81	\N	2015-09-19 16:36:19.81	\N	0	1	17	2
44	2015-09-19 16:36:19.811	\N	2015-09-19 16:36:19.811	\N	0	2	17	3
45	2015-09-19 16:36:19.812	\N	2015-09-19 16:36:19.812	\N	0	2	18	1
46	2015-09-19 16:36:19.813	\N	2015-09-19 16:36:19.813	\N	0	1	18	2
47	2015-09-19 16:36:19.815	\N	2015-09-19 16:36:19.815	\N	0	2	18	3
48	2015-09-19 16:36:19.816	\N	2015-09-19 16:36:19.816	\N	0	2	19	1
49	2015-09-19 16:36:19.817	\N	2015-09-19 16:36:19.817	\N	0	1	19	2
50	2015-09-19 16:36:19.818	\N	2015-09-19 16:36:19.818	\N	0	2	19	3
51	2015-09-19 16:36:19.819	\N	2015-09-19 16:36:19.819	\N	0	2	20	1
52	2015-09-19 16:36:19.82	\N	2015-09-19 16:36:19.82	\N	0	1	20	2
53	2015-09-19 16:36:19.821	\N	2015-09-19 16:36:19.821	\N	0	2	20	3
54	2015-09-19 16:36:19.822	\N	2015-09-19 16:36:19.822	\N	0	2	21	1
55	2015-09-19 16:36:19.823	\N	2015-09-19 16:36:19.823	\N	0	1	21	2
56	2015-09-19 16:36:19.824	\N	2015-09-19 16:36:19.824	\N	0	2	21	3
57	2015-09-19 16:36:19.825	\N	2015-09-19 16:36:19.825	\N	0	1	21	14
58	2015-09-19 16:36:19.827	\N	2015-09-19 16:36:19.827	\N	0	1	23	1
59	2015-09-19 16:36:19.828	\N	2015-09-19 16:36:19.828	\N	0	1	23	14
60	2015-09-19 16:36:19.829	\N	2015-09-19 16:36:19.829	\N	0	1	24	1
61	2015-09-19 16:36:19.83	\N	2015-09-19 16:36:19.83	\N	0	1	24	14
62	2015-09-19 16:36:19.831	\N	2015-09-19 16:36:19.831	\N	0	1	25	1
63	2015-09-19 16:36:19.832	\N	2015-09-19 16:36:19.832	\N	0	1	25	14
64	2015-09-19 16:36:19.833	\N	2015-09-19 16:36:19.833	\N	0	1	26	1
65	2015-09-19 16:36:19.835	\N	2015-09-19 16:36:19.835	\N	0	1	26	14
66	2015-09-19 16:36:19.836	\N	2015-09-19 16:36:19.836	\N	0	1	27	1
67	2015-09-19 16:36:19.837	\N	2015-09-19 16:36:19.837	\N	0	1	27	14
68	2015-09-19 16:36:19.838	\N	2015-09-19 16:36:19.838	\N	0	1	28	1
69	2015-09-19 16:36:19.839	\N	2015-09-19 16:36:19.839	\N	0	1	28	14
70	2015-09-19 16:36:19.84	\N	2015-09-19 16:36:19.84	\N	0	1	31	5
71	2015-09-19 16:36:19.841	\N	2015-09-19 16:36:19.841	\N	0	2	31	6
72	2015-09-19 16:36:19.842	\N	2015-09-19 16:36:19.842	\N	0	2	31	7
73	2015-09-19 16:36:19.843	\N	2015-09-19 16:36:19.843	\N	0	2	31	8
74	2015-09-19 16:36:19.844	\N	2015-09-19 16:36:19.844	\N	0	2	31	11
75	2015-09-19 16:36:19.845	\N	2015-09-19 16:36:19.845	\N	0	1	31	14
76	2015-09-19 16:36:19.846	\N	2015-09-19 16:36:19.846	\N	0	1	32	1
77	2015-09-19 16:36:19.847	\N	2015-09-19 16:36:19.848	\N	0	2	32	11
78	2015-09-19 16:36:19.849	\N	2015-09-19 16:36:19.849	\N	0	1	32	14
79	2015-09-19 16:36:19.85	\N	2015-09-19 16:36:19.85	\N	0	1	33	1
80	2015-09-19 16:36:19.851	\N	2015-09-19 16:36:19.851	\N	0	2	33	11
81	2015-09-19 16:36:19.852	\N	2015-09-19 16:36:19.852	\N	0	1	33	14
82	2015-09-19 16:36:19.853	\N	2015-09-19 16:36:19.853	\N	0	1	34	1
83	2015-09-19 16:36:19.855	\N	2015-09-19 16:36:19.855	\N	0	1	34	14
84	2015-09-19 16:36:19.856	\N	2015-09-19 16:36:19.856	\N	0	1	35	1
85	2015-09-19 16:36:19.857	\N	2015-09-19 16:36:19.857	\N	0	1	35	14
86	2015-09-19 16:36:19.859	\N	2015-09-19 16:36:19.859	\N	0	1	36	1
87	2015-09-19 16:36:19.86	\N	2015-09-19 16:36:19.86	\N	0	2	36	6
88	2015-09-19 16:36:19.862	\N	2015-09-19 16:36:19.862	\N	0	1	37	1
89	2015-09-19 16:36:19.866	\N	2015-09-19 16:36:19.866	\N	0	1	37	14
90	2015-09-19 16:36:19.869	\N	2015-09-19 16:36:19.869	\N	0	1	38	1
91	2015-09-19 16:36:19.87	\N	2015-09-19 16:36:19.87	\N	0	2	38	6
92	2015-09-19 16:36:19.872	\N	2015-09-19 16:36:19.872	\N	0	1	38	14
93	2015-09-19 16:36:19.873	\N	2015-09-19 16:36:19.873	\N	0	2	40	6
94	2015-09-19 16:36:19.875	\N	2015-09-19 16:36:19.875	\N	0	2	40	7
95	2015-09-19 16:36:19.876	\N	2015-09-19 16:36:19.876	\N	0	1	40	10
96	2015-09-19 16:36:19.877	\N	2015-09-19 16:36:19.877	\N	0	2	40	12
97	2015-09-19 16:36:19.879	\N	2015-09-19 16:36:19.879	\N	0	1	40	14
98	2015-09-19 16:36:19.88	\N	2015-09-19 16:36:19.88	\N	0	2	41	6
99	2015-09-19 16:36:19.882	\N	2015-09-19 16:36:19.882	\N	0	1	41	8
100	2015-09-19 16:36:19.883	\N	2015-09-19 16:36:19.883	\N	0	1	41	14
101	2015-09-19 16:36:19.885	\N	2015-09-19 16:36:19.885	\N	0	1	41	17
102	2015-09-19 16:36:19.888	\N	2015-09-19 16:36:19.888	\N	0	1	42	8
103	2015-09-19 16:36:19.889	\N	2015-09-19 16:36:19.889	\N	0	1	42	14
104	2015-09-19 16:36:19.891	\N	2015-09-19 16:36:19.891	\N	0	1	42	17
105	2015-09-19 16:36:19.893	\N	2015-09-19 16:36:19.893	\N	0	2	43	6
106	2015-09-19 16:36:19.895	\N	2015-09-19 16:36:19.895	\N	0	1	43	14
107	2015-09-19 16:36:19.897	\N	2015-09-19 16:36:19.897	\N	0	1	44	6
108	2015-09-19 16:36:19.9	\N	2015-09-19 16:36:19.9	\N	0	1	44	14
109	2015-09-19 16:36:19.903	\N	2015-09-19 16:36:19.903	\N	0	1	44	16
110	2015-09-19 16:36:19.904	\N	2015-09-19 16:36:19.904	\N	0	1	44	18
111	2015-09-19 16:36:19.905	\N	2015-09-19 16:36:19.905	\N	0	1	44	19
112	2015-09-19 16:36:19.906	\N	2015-09-19 16:36:19.906	\N	0	1	44	20
113	2015-09-19 16:36:19.907	\N	2015-09-19 16:36:19.907	\N	0	1	45	11
114	2015-09-19 16:36:19.908	\N	2015-09-19 16:36:19.908	\N	0	1	45	14
115	2015-09-19 16:36:19.909	\N	2015-09-19 16:36:19.909	\N	0	1	46	12
116	2015-09-19 16:36:19.91	\N	2015-09-19 16:36:19.91	\N	0	1	46	14
117	2015-09-19 16:36:19.91	\N	2015-09-19 16:36:19.91	\N	0	1	46	16
118	2015-09-19 16:36:19.911	\N	2015-09-19 16:36:19.911	\N	0	1	47	6
119	2015-09-19 16:36:19.912	\N	2015-09-19 16:36:19.912	\N	0	1	47	14
120	2015-09-19 16:36:19.913	\N	2015-09-19 16:36:19.913	\N	0	1	47	16
121	2015-09-19 16:36:19.915	\N	2015-09-19 16:36:19.915	\N	0	2	49	7
122	2015-09-19 16:36:19.916	\N	2015-09-19 16:36:19.916	\N	0	1	49	14
123	2015-09-19 16:36:19.917	\N	2015-09-19 16:36:19.917	\N	0	1	50	7
124	2015-09-19 16:36:19.918	\N	2015-09-19 16:36:19.918	\N	0	1	50	14
125	2015-09-19 16:36:19.919	\N	2015-09-19 16:36:19.919	\N	0	1	51	7
126	2015-09-19 16:36:19.92	\N	2015-09-19 16:36:19.92	\N	0	1	51	14
127	2015-09-19 16:36:19.921	\N	2015-09-19 16:36:19.921	\N	0	1	52	7
128	2015-09-19 16:36:19.922	\N	2015-09-19 16:36:19.922	\N	0	2	52	10
129	2015-09-19 16:36:19.923	\N	2015-09-19 16:36:19.923	\N	0	2	52	12
130	2015-09-19 16:36:19.925	\N	2015-09-19 16:36:19.925	\N	0	2	52	14
131	2015-09-19 16:36:19.926	\N	2015-09-19 16:36:19.926	\N	0	1	53	6
132	2015-09-19 16:36:19.927	\N	2015-09-19 16:36:19.927	\N	0	2	53	14
133	2015-09-19 16:36:19.928	\N	2015-09-19 16:36:19.928	\N	0	1	53	19
134	2015-09-19 16:36:19.929	\N	2015-09-19 16:36:19.929	\N	0	1	54	6
135	2015-09-19 16:36:19.93	\N	2015-09-19 16:36:19.93	\N	0	2	54	14
136	2015-09-19 16:36:19.932	\N	2015-09-19 16:36:19.932	\N	0	1	55	7
137	2015-09-19 16:36:19.933	\N	2015-09-19 16:36:19.933	\N	0	1	56	6
138	2015-09-19 16:36:19.935	\N	2015-09-19 16:36:19.935	\N	0	2	56	14
139	2015-09-19 16:36:19.936	\N	2015-09-19 16:36:19.936	\N	0	1	58	14
140	2015-09-19 16:36:19.937	\N	2015-09-19 16:36:19.937	\N	0	2	59	8
141	2015-09-19 16:36:19.938	\N	2015-09-19 16:36:19.938	\N	0	1	59	14
142	2015-09-19 16:36:19.939	\N	2015-09-19 16:36:19.939	\N	0	1	59	15
143	2015-09-19 16:36:19.94	\N	2015-09-19 16:36:19.94	\N	0	1	60	14
144	2015-09-19 16:36:19.941	\N	2015-09-19 16:36:19.941	\N	0	1	60	15
145	2015-09-19 16:36:19.942	\N	2015-09-19 16:36:19.942	\N	0	1	60	16
146	2015-09-19 16:36:19.943	\N	2015-09-19 16:36:19.943	\N	0	1	61	6
147	2015-09-19 16:36:19.944	\N	2015-09-19 16:36:19.944	\N	0	1	61	14
148	2015-09-19 16:36:19.945	\N	2015-09-19 16:36:19.945	\N	0	1	62	14
149	2015-09-19 16:36:19.946	\N	2015-09-19 16:36:19.946	\N	0	1	63	14
150	2015-09-19 16:36:19.948	\N	2015-09-19 16:36:19.948	\N	0	1	66	9
151	2015-09-19 16:36:19.949	\N	2015-09-19 16:36:19.949	\N	0	1	66	14
152	2015-09-19 16:36:19.95	\N	2015-09-19 16:36:19.95	\N	0	1	67	9
153	2015-09-19 16:36:19.951	\N	2015-09-19 16:36:19.951	\N	0	1	68	9
154	2015-09-19 16:36:19.953	\N	2015-09-19 16:36:19.953	\N	0	1	69	9
155	2015-09-19 16:36:19.954	\N	2015-09-19 16:36:19.954	\N	0	1	71	11
156	2015-09-19 16:36:19.955	\N	2015-09-19 16:36:19.955	\N	0	1	73	9
157	2015-09-19 16:36:19.956	\N	2015-09-19 16:36:19.956	\N	0	1	74	9
158	2015-09-19 16:36:19.957	\N	2015-09-19 16:36:19.957	\N	0	1	90	9
159	2015-09-19 16:36:19.958	\N	2015-09-19 16:36:19.958	\N	0	1	92	14
160	2015-09-19 16:36:19.96	\N	2015-09-19 16:36:19.96	\N	0	1	95	11
161	2015-09-19 16:36:19.961	\N	2015-09-19 16:36:19.961	\N	0	2	129	1
162	2015-09-19 16:36:19.962	\N	2015-09-19 16:36:19.962	\N	0	2	129	2
163	2015-09-19 16:36:19.964	\N	2015-09-19 16:36:19.964	\N	0	1	129	4
164	2015-09-19 16:36:19.965	\N	2015-09-19 16:36:19.965	\N	0	2	129	14
165	2015-09-19 16:36:19.967	\N	2015-09-19 16:36:19.967	\N	0	2	130	1
166	2015-09-19 16:36:19.968	\N	2015-09-19 16:36:19.968	\N	0	2	130	2
167	2015-09-19 16:36:19.97	\N	2015-09-19 16:36:19.97	\N	0	1	130	4
168	2015-09-19 16:36:19.972	\N	2015-09-19 16:36:19.972	\N	0	2	130	14
169	2015-09-19 16:36:19.974	\N	2015-09-19 16:36:19.974	\N	0	2	131	1
170	2015-09-19 16:36:19.975	\N	2015-09-19 16:36:19.975	\N	0	2	131	2
171	2015-09-19 16:36:19.976	\N	2015-09-19 16:36:19.976	\N	0	1	131	4
172	2015-09-19 16:36:19.977	\N	2015-09-19 16:36:19.977	\N	0	2	131	14
173	2015-09-19 16:36:19.978	\N	2015-09-19 16:36:19.978	\N	0	1	131	18
174	2015-09-19 16:36:19.979	\N	2015-09-19 16:36:19.979	\N	0	1	132	4
175	2015-09-19 16:36:19.98	\N	2015-09-19 16:36:19.98	\N	0	2	132	14
176	2015-09-19 16:36:19.981	\N	2015-09-19 16:36:19.981	\N	0	2	133	1
177	2015-09-19 16:36:19.981	\N	2015-09-19 16:36:19.981	\N	0	2	133	2
178	2015-09-19 16:36:19.982	\N	2015-09-19 16:36:19.982	\N	0	1	133	4
179	2015-09-19 16:36:19.983	\N	2015-09-19 16:36:19.983	\N	0	2	133	14
180	2015-09-19 16:36:19.984	\N	2015-09-19 16:36:19.984	\N	0	1	134	4
181	2015-09-19 16:36:19.984	\N	2015-09-19 16:36:19.984	\N	0	2	134	14
182	2015-09-19 16:36:19.985	\N	2015-09-19 16:36:19.985	\N	0	1	135	4
183	2015-09-19 16:36:19.986	\N	2015-09-19 16:36:19.986	\N	0	1	135	14
184	2015-09-19 16:36:19.987	\N	2015-09-19 16:36:19.987	\N	0	1	136	4
185	2015-09-19 16:36:19.987	\N	2015-09-19 16:36:19.987	\N	0	2	136	14
186	2015-09-19 16:36:19.988	\N	2015-09-19 16:36:19.988	\N	0	2	138	2
187	2015-09-19 16:36:19.989	\N	2015-09-19 16:36:19.989	\N	0	1	138	3
188	2015-09-19 16:36:19.99	\N	2015-09-19 16:36:19.99	\N	0	2	139	1
189	2015-09-19 16:36:19.991	\N	2015-09-19 16:36:19.991	\N	0	2	139	2
190	2015-09-19 16:36:19.993	\N	2015-09-19 16:36:19.993	\N	0	1	139	3
191	2015-09-19 16:36:19.994	\N	2015-09-19 16:36:19.994	\N	0	2	140	1
192	2015-09-19 16:36:19.995	\N	2015-09-19 16:36:19.995	\N	0	2	140	2
193	2015-09-19 16:36:19.996	\N	2015-09-19 16:36:19.996	\N	0	1	140	3
194	2015-09-19 16:36:19.997	\N	2015-09-19 16:36:19.997	\N	0	2	141	1
195	2015-09-19 16:36:19.997	\N	2015-09-19 16:36:19.998	\N	0	2	141	2
196	2015-09-19 16:36:19.998	\N	2015-09-19 16:36:19.998	\N	0	1	141	3
197	2015-09-19 16:36:19.999	\N	2015-09-19 16:36:19.999	\N	0	2	141	14
198	2015-09-19 16:36:20	\N	2015-09-19 16:36:20	\N	0	2	142	1
199	2015-09-19 16:36:20	\N	2015-09-19 16:36:20	\N	0	2	142	2
200	2015-09-19 16:36:20.001	\N	2015-09-19 16:36:20.001	\N	0	1	142	3
201	2015-09-19 16:36:20.002	\N	2015-09-19 16:36:20.002	\N	0	2	142	14
202	2015-09-19 16:36:20.003	\N	2015-09-19 16:36:20.003	\N	0	2	143	1
203	2015-09-19 16:36:20.003	\N	2015-09-19 16:36:20.003	\N	0	2	143	2
204	2015-09-19 16:36:20.005	\N	2015-09-19 16:36:20.005	\N	0	1	143	3
205	2015-09-19 16:36:20.005	\N	2015-09-19 16:36:20.005	\N	0	1	145	10
206	2015-09-19 16:36:20.006	\N	2015-09-19 16:36:20.006	\N	0	1	145	14
207	2015-09-19 16:36:20.007	\N	2015-09-19 16:36:20.007	\N	0	1	146	10
208	2015-09-19 16:36:20.008	\N	2015-09-19 16:36:20.008	\N	0	1	146	14
209	2015-09-19 16:36:20.008	\N	2015-09-19 16:36:20.008	\N	0	1	147	10
210	2015-09-19 16:36:20.009	\N	2015-09-19 16:36:20.009	\N	0	1	147	14
211	2015-09-19 16:36:20.01	\N	2015-09-19 16:36:20.01	\N	0	1	148	10
212	2015-09-19 16:36:20.01	\N	2015-09-19 16:36:20.01	\N	0	1	148	14
213	2015-09-19 16:36:20.011	\N	2015-09-19 16:36:20.011	\N	0	1	149	10
214	2015-09-19 16:36:20.012	\N	2015-09-19 16:36:20.012	\N	0	1	149	14
215	2015-09-19 16:36:20.012	\N	2015-09-19 16:36:20.012	\N	0	1	150	10
216	2015-09-19 16:36:20.013	\N	2015-09-19 16:36:20.013	\N	0	1	150	14
217	2015-09-19 16:36:20.014	\N	2015-09-19 16:36:20.014	\N	0	1	151	10
218	2015-09-19 16:36:20.015	\N	2015-09-19 16:36:20.015	\N	0	1	151	14
219	2015-09-19 16:36:20.015	\N	2015-09-19 16:36:20.015	\N	0	1	152	10
220	2015-09-19 16:36:20.016	\N	2015-09-19 16:36:20.016	\N	0	1	152	14
221	2015-09-19 16:36:20.016	\N	2015-09-19 16:36:20.016	\N	0	2	154	1
222	2015-09-19 16:36:20.017	\N	2015-09-19 16:36:20.017	\N	0	2	154	2
223	2015-09-19 16:36:20.018	\N	2015-09-19 16:36:20.018	\N	0	1	154	3
224	2015-09-19 16:36:20.019	\N	2015-09-19 16:36:20.019	\N	0	2	155	3
225	2015-09-19 16:36:20.019	\N	2015-09-19 16:36:20.019	\N	0	1	155	4
226	2015-09-19 16:36:20.02	\N	2015-09-19 16:36:20.02	\N	0	2	155	14
227	2015-09-19 16:36:20.021	\N	2015-09-19 16:36:20.021	\N	0	1	155	20
228	2015-09-19 16:36:20.022	\N	2015-09-19 16:36:20.022	\N	0	2	156	3
229	2015-09-19 16:36:20.023	\N	2015-09-19 16:36:20.023	\N	0	1	156	4
230	2015-09-19 16:36:20.024	\N	2015-09-19 16:36:20.024	\N	0	2	156	14
231	2015-09-19 16:36:20.024	\N	2015-09-19 16:36:20.024	\N	0	1	156	20
232	2015-09-19 16:36:20.025	\N	2015-09-19 16:36:20.025	\N	0	1	157	14
233	2015-09-19 16:36:20.026	\N	2015-09-19 16:36:20.026	\N	0	1	157	20
\.


--
-- Name: categoryinterestlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: play
--

SELECT pg_catalog.setval('categoryinterestlink_id_seq', 233, true);


--
-- Data for Name: customerinterest; Type: TABLE DATA; Schema: public; Owner: play
--

COPY customerinterest (id, creationdate, creationuser, lastupdate, lastupdateuser, version, iconname, name, orderindex, translationname_id) FROM stdin;
1	2015-09-19 16:36:18.157	\N	2015-09-19 16:36:18.157	\N	0	eat.png	eat	1	1
2	2015-09-19 16:36:18.207	\N	2015-09-19 16:36:18.207	\N	0	drink.png	drink	2	2
3	2015-09-19 16:36:18.222	\N	2015-09-19 16:36:18.222	\N	0	going_out.png	going_out	3	3
4	2015-09-19 16:36:18.232	\N	2015-09-19 16:36:18.232	\N	0	culture.png	culture	4	4
5	2015-09-19 16:36:18.242	\N	2015-09-19 16:36:18.242	\N	0	supermarket.png	supermarket	5	5
6	2015-09-19 16:36:18.251	\N	2015-09-19 16:36:18.251	\N	0	shopping.png	shopping	6	6
7	2015-09-19 16:36:18.261	\N	2015-09-19 16:36:18.261	\N	0	clothe.png	clothe	7	7
8	2015-09-19 16:36:18.27	\N	2015-09-19 16:36:18.27	\N	0	decor.png	decor	8	8
9	2015-09-19 16:36:18.278	\N	2015-09-19 16:36:18.278	\N	0	welness.png	welness	9	9
10	2015-09-19 16:36:18.287	\N	2015-09-19 16:36:18.287	\N	0	sport.png	sport	10	10
11	2015-09-19 16:36:18.296	\N	2015-09-19 16:36:18.296	\N	0	pets.png	pets	11	11
12	2015-09-19 16:36:18.305	\N	2015-09-19 16:36:18.305	\N	0	travel.png	travel	12	12
13	2015-09-19 16:36:18.314	\N	2015-09-19 16:36:18.314	\N	0	sleep.png	sleep	13	13
14	2015-09-19 16:36:18.326	\N	2015-09-19 16:36:18.326	\N	0	baby.png	baby	14	14
15	2015-09-19 16:36:18.335	\N	2015-09-19 16:36:18.335	\N	0	doityourself.png	doityourself	15	15
16	2015-09-19 16:36:18.345	\N	2015-09-19 16:36:18.345	\N	0	read.png	read	16	16
17	2015-09-19 16:36:18.355	\N	2015-09-19 16:36:18.355	\N	0	garden.png	garden	17	17
18	2015-09-19 16:36:18.364	\N	2015-09-19 16:36:18.364	\N	0	music.png	music	18	18
19	2015-09-19 16:36:18.372	\N	2015-09-19 16:36:18.372	\N	0	technology.png	technology	19	19
20	2015-09-19 16:36:18.38	\N	2015-09-19 16:36:18.38	\N	0	play.png	play	20	20
\.


--
-- Name: customerinterest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: play
--

SELECT pg_catalog.setval('customerinterest_id_seq', 20, true);


--
-- Data for Name: facebookcredential; Type: TABLE DATA; Schema: public; Owner: play
--

COPY facebookcredential (id, creationdate, creationuser, lastupdate, lastupdateuser, version, userid, account_id) FROM stdin;
\.


--
-- Name: facebookcredential_id_seq; Type: SEQUENCE SET; Schema: public; Owner: play
--

SELECT pg_catalog.setval('facebookcredential_id_seq', 1, false);


--
-- Data for Name: followlink; Type: TABLE DATA; Schema: public; Owner: play
--

COPY followlink (id, creationdate, creationuser, lastupdate, lastupdateuser, version, followedfrom, followingnotification, notification, account_id, business_id) FROM stdin;
\.


--
-- Name: followlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: play
--

SELECT pg_catalog.setval('followlink_id_seq', 1, false);


--
-- Data for Name: logincredential; Type: TABLE DATA; Schema: public; Owner: play
--

COPY logincredential (id, creationdate, creationuser, lastupdate, lastupdateuser, version, keepsessionopen, password, account_id) FROM stdin;
1	\N	\N	\N	\N	0	f	ZTwjcqnsuvynn57kRu3LMsDX0yIIsa1jiqR2mRnJJ2aJY6TDTLTT2z6mcN5pU+0R	3
2	\N	\N	\N	\N	0	f	ZTwjcqnsuvynn57kRu3LMsDX0yIIsa1jiqR2mRnJJ2aJY6TDTLTT2z6mcN5pU+0R	2
3	\N	\N	\N	\N	0	f	ZTwjcqnsuvynn57kRu3LMsDX0yIIsa1jiqR2mRnJJ2aJY6TDTLTT2z6mcN5pU+0R	1
\.


--
-- Name: logincredential_id_seq; Type: SEQUENCE SET; Schema: public; Owner: play
--

SELECT pg_catalog.setval('logincredential_id_seq', 12, true);


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: play
--

COPY session (id, creationdate, creationuser, lastupdate, lastupdateuser, version, connectiondate, source, account_id) FROM stdin;
\.


--
-- Name: session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: play
--

SELECT pg_catalog.setval('session_id_seq', 1, false);


--
-- Data for Name: storedfile; Type: TABLE DATA; Schema: public; Owner: play
--

COPY storedfile (id, creationdate, creationuser, lastupdate, lastupdateuser, version, comment, fileorder, isimage, originalname, size, storedname, storednameoriginalsize, account_id, businessgallerypicture_id, publication_id) FROM stdin;
\.


--
-- Name: storedfile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: play
--

SELECT pg_catalog.setval('storedfile_id_seq', 18, true);


--
-- Data for Name: translation; Type: TABLE DATA; Schema: public; Owner: play
--

COPY translation (id, creationdate, creationuser, lastupdate, lastupdateuser, version) FROM stdin;
1	2015-09-19 16:36:18.161	\N	2015-09-19 16:36:18.161	\N	0
2	2015-09-19 16:36:18.207	\N	2015-09-19 16:36:18.207	\N	0
3	2015-09-19 16:36:18.222	\N	2015-09-19 16:36:18.222	\N	0
4	2015-09-19 16:36:18.232	\N	2015-09-19 16:36:18.232	\N	0
5	2015-09-19 16:36:18.242	\N	2015-09-19 16:36:18.242	\N	0
6	2015-09-19 16:36:18.251	\N	2015-09-19 16:36:18.251	\N	0
7	2015-09-19 16:36:18.261	\N	2015-09-19 16:36:18.261	\N	0
8	2015-09-19 16:36:18.27	\N	2015-09-19 16:36:18.27	\N	0
9	2015-09-19 16:36:18.279	\N	2015-09-19 16:36:18.279	\N	0
10	2015-09-19 16:36:18.287	\N	2015-09-19 16:36:18.287	\N	0
11	2015-09-19 16:36:18.297	\N	2015-09-19 16:36:18.297	\N	0
12	2015-09-19 16:36:18.306	\N	2015-09-19 16:36:18.306	\N	0
13	2015-09-19 16:36:18.314	\N	2015-09-19 16:36:18.314	\N	0
14	2015-09-19 16:36:18.326	\N	2015-09-19 16:36:18.326	\N	0
15	2015-09-19 16:36:18.336	\N	2015-09-19 16:36:18.336	\N	0
16	2015-09-19 16:36:18.345	\N	2015-09-19 16:36:18.345	\N	0
17	2015-09-19 16:36:18.355	\N	2015-09-19 16:36:18.355	\N	0
18	2015-09-19 16:36:18.364	\N	2015-09-19 16:36:18.364	\N	0
19	2015-09-19 16:36:18.372	\N	2015-09-19 16:36:18.372	\N	0
20	2015-09-19 16:36:18.38	\N	2015-09-19 16:36:18.38	\N	0
21	2015-09-19 16:36:18.85	\N	2015-09-19 16:36:18.85	\N	0
22	2015-09-19 16:36:18.857	\N	2015-09-19 16:36:18.857	\N	0
23	2015-09-19 16:36:18.864	\N	2015-09-19 16:36:18.864	\N	0
24	2015-09-19 16:36:18.87	\N	2015-09-19 16:36:18.87	\N	0
25	2015-09-19 16:36:18.876	\N	2015-09-19 16:36:18.876	\N	0
26	2015-09-19 16:36:18.882	\N	2015-09-19 16:36:18.882	\N	0
27	2015-09-19 16:36:18.888	\N	2015-09-19 16:36:18.888	\N	0
28	2015-09-19 16:36:18.895	\N	2015-09-19 16:36:18.895	\N	0
29	2015-09-19 16:36:18.9	\N	2015-09-19 16:36:18.9	\N	0
30	2015-09-19 16:36:18.906	\N	2015-09-19 16:36:18.906	\N	0
31	2015-09-19 16:36:18.912	\N	2015-09-19 16:36:18.912	\N	0
32	2015-09-19 16:36:18.918	\N	2015-09-19 16:36:18.918	\N	0
33	2015-09-19 16:36:18.925	\N	2015-09-19 16:36:18.925	\N	0
34	2015-09-19 16:36:18.931	\N	2015-09-19 16:36:18.931	\N	0
35	2015-09-19 16:36:18.936	\N	2015-09-19 16:36:18.936	\N	0
36	2015-09-19 16:36:18.942	\N	2015-09-19 16:36:18.942	\N	0
37	2015-09-19 16:36:18.947	\N	2015-09-19 16:36:18.947	\N	0
38	2015-09-19 16:36:18.953	\N	2015-09-19 16:36:18.953	\N	0
39	2015-09-19 16:36:18.958	\N	2015-09-19 16:36:18.958	\N	0
40	2015-09-19 16:36:18.964	\N	2015-09-19 16:36:18.964	\N	0
41	2015-09-19 16:36:18.969	\N	2015-09-19 16:36:18.969	\N	0
42	2015-09-19 16:36:18.975	\N	2015-09-19 16:36:18.975	\N	0
43	2015-09-19 16:36:18.98	\N	2015-09-19 16:36:18.98	\N	0
44	2015-09-19 16:36:18.985	\N	2015-09-19 16:36:18.985	\N	0
45	2015-09-19 16:36:18.99	\N	2015-09-19 16:36:18.99	\N	0
46	2015-09-19 16:36:18.995	\N	2015-09-19 16:36:18.995	\N	0
47	2015-09-19 16:36:19	\N	2015-09-19 16:36:19	\N	0
48	2015-09-19 16:36:19.005	\N	2015-09-19 16:36:19.005	\N	0
49	2015-09-19 16:36:19.01	\N	2015-09-19 16:36:19.01	\N	0
50	2015-09-19 16:36:19.014	\N	2015-09-19 16:36:19.014	\N	0
51	2015-09-19 16:36:19.019	\N	2015-09-19 16:36:19.019	\N	0
52	2015-09-19 16:36:19.023	\N	2015-09-19 16:36:19.023	\N	0
53	2015-09-19 16:36:19.029	\N	2015-09-19 16:36:19.029	\N	0
54	2015-09-19 16:36:19.033	\N	2015-09-19 16:36:19.033	\N	0
55	2015-09-19 16:36:19.037	\N	2015-09-19 16:36:19.037	\N	0
56	2015-09-19 16:36:19.041	\N	2015-09-19 16:36:19.041	\N	0
57	2015-09-19 16:36:19.046	\N	2015-09-19 16:36:19.046	\N	0
58	2015-09-19 16:36:19.05	\N	2015-09-19 16:36:19.05	\N	0
59	2015-09-19 16:36:19.055	\N	2015-09-19 16:36:19.055	\N	0
60	2015-09-19 16:36:19.059	\N	2015-09-19 16:36:19.059	\N	0
61	2015-09-19 16:36:19.062	\N	2015-09-19 16:36:19.062	\N	0
62	2015-09-19 16:36:19.067	\N	2015-09-19 16:36:19.067	\N	0
63	2015-09-19 16:36:19.072	\N	2015-09-19 16:36:19.072	\N	0
64	2015-09-19 16:36:19.076	\N	2015-09-19 16:36:19.076	\N	0
65	2015-09-19 16:36:19.08	\N	2015-09-19 16:36:19.08	\N	0
66	2015-09-19 16:36:19.085	\N	2015-09-19 16:36:19.085	\N	0
67	2015-09-19 16:36:19.09	\N	2015-09-19 16:36:19.09	\N	0
68	2015-09-19 16:36:19.094	\N	2015-09-19 16:36:19.094	\N	0
69	2015-09-19 16:36:19.099	\N	2015-09-19 16:36:19.099	\N	0
70	2015-09-19 16:36:19.104	\N	2015-09-19 16:36:19.104	\N	0
71	2015-09-19 16:36:19.109	\N	2015-09-19 16:36:19.109	\N	0
72	2015-09-19 16:36:19.113	\N	2015-09-19 16:36:19.113	\N	0
73	2015-09-19 16:36:19.119	\N	2015-09-19 16:36:19.119	\N	0
74	2015-09-19 16:36:19.124	\N	2015-09-19 16:36:19.124	\N	0
75	2015-09-19 16:36:19.128	\N	2015-09-19 16:36:19.128	\N	0
76	2015-09-19 16:36:19.133	\N	2015-09-19 16:36:19.133	\N	0
77	2015-09-19 16:36:19.137	\N	2015-09-19 16:36:19.137	\N	0
78	2015-09-19 16:36:19.142	\N	2015-09-19 16:36:19.142	\N	0
79	2015-09-19 16:36:19.149	\N	2015-09-19 16:36:19.149	\N	0
80	2015-09-19 16:36:19.155	\N	2015-09-19 16:36:19.155	\N	0
81	2015-09-19 16:36:19.16	\N	2015-09-19 16:36:19.16	\N	0
82	2015-09-19 16:36:19.164	\N	2015-09-19 16:36:19.164	\N	0
83	2015-09-19 16:36:19.168	\N	2015-09-19 16:36:19.168	\N	0
84	2015-09-19 16:36:19.172	\N	2015-09-19 16:36:19.172	\N	0
85	2015-09-19 16:36:19.177	\N	2015-09-19 16:36:19.177	\N	0
86	2015-09-19 16:36:19.181	\N	2015-09-19 16:36:19.181	\N	0
87	2015-09-19 16:36:19.186	\N	2015-09-19 16:36:19.186	\N	0
88	2015-09-19 16:36:19.189	\N	2015-09-19 16:36:19.189	\N	0
89	2015-09-19 16:36:19.194	\N	2015-09-19 16:36:19.194	\N	0
90	2015-09-19 16:36:19.198	\N	2015-09-19 16:36:19.198	\N	0
91	2015-09-19 16:36:19.201	\N	2015-09-19 16:36:19.201	\N	0
92	2015-09-19 16:36:19.206	\N	2015-09-19 16:36:19.206	\N	0
93	2015-09-19 16:36:19.21	\N	2015-09-19 16:36:19.21	\N	0
94	2015-09-19 16:36:19.213	\N	2015-09-19 16:36:19.213	\N	0
95	2015-09-19 16:36:19.217	\N	2015-09-19 16:36:19.217	\N	0
96	2015-09-19 16:36:19.22	\N	2015-09-19 16:36:19.22	\N	0
97	2015-09-19 16:36:19.222	\N	2015-09-19 16:36:19.222	\N	0
98	2015-09-19 16:36:19.226	\N	2015-09-19 16:36:19.226	\N	0
99	2015-09-19 16:36:19.23	\N	2015-09-19 16:36:19.23	\N	0
100	2015-09-19 16:36:19.237	\N	2015-09-19 16:36:19.237	\N	0
101	2015-09-19 16:36:19.243	\N	2015-09-19 16:36:19.244	\N	0
102	2015-09-19 16:36:19.281	\N	2015-09-19 16:36:19.281	\N	0
103	2015-09-19 16:36:19.288	\N	2015-09-19 16:36:19.288	\N	0
104	2015-09-19 16:36:19.292	\N	2015-09-19 16:36:19.292	\N	0
105	2015-09-19 16:36:19.297	\N	2015-09-19 16:36:19.297	\N	0
106	2015-09-19 16:36:19.302	\N	2015-09-19 16:36:19.302	\N	0
107	2015-09-19 16:36:19.311	\N	2015-09-19 16:36:19.311	\N	0
108	2015-09-19 16:36:19.319	\N	2015-09-19 16:36:19.319	\N	0
109	2015-09-19 16:36:19.328	\N	2015-09-19 16:36:19.328	\N	0
110	2015-09-19 16:36:19.334	\N	2015-09-19 16:36:19.334	\N	0
111	2015-09-19 16:36:19.34	\N	2015-09-19 16:36:19.34	\N	0
112	2015-09-19 16:36:19.345	\N	2015-09-19 16:36:19.345	\N	0
113	2015-09-19 16:36:19.356	\N	2015-09-19 16:36:19.356	\N	0
114	2015-09-19 16:36:19.364	\N	2015-09-19 16:36:19.364	\N	0
115	2015-09-19 16:36:19.393	\N	2015-09-19 16:36:19.393	\N	0
116	2015-09-19 16:36:19.397	\N	2015-09-19 16:36:19.397	\N	0
117	2015-09-19 16:36:19.401	\N	2015-09-19 16:36:19.401	\N	0
118	2015-09-19 16:36:19.407	\N	2015-09-19 16:36:19.407	\N	0
119	2015-09-19 16:36:19.411	\N	2015-09-19 16:36:19.411	\N	0
120	2015-09-19 16:36:19.415	\N	2015-09-19 16:36:19.415	\N	0
121	2015-09-19 16:36:19.419	\N	2015-09-19 16:36:19.419	\N	0
122	2015-09-19 16:36:19.423	\N	2015-09-19 16:36:19.423	\N	0
123	2015-09-19 16:36:19.43	\N	2015-09-19 16:36:19.43	\N	0
124	2015-09-19 16:36:19.435	\N	2015-09-19 16:36:19.435	\N	0
125	2015-09-19 16:36:19.443	\N	2015-09-19 16:36:19.443	\N	0
126	2015-09-19 16:36:19.446	\N	2015-09-19 16:36:19.446	\N	0
127	2015-09-19 16:36:19.45	\N	2015-09-19 16:36:19.45	\N	0
128	2015-09-19 16:36:19.453	\N	2015-09-19 16:36:19.453	\N	0
129	2015-09-19 16:36:19.458	\N	2015-09-19 16:36:19.458	\N	0
130	2015-09-19 16:36:19.461	\N	2015-09-19 16:36:19.461	\N	0
131	2015-09-19 16:36:19.468	\N	2015-09-19 16:36:19.468	\N	0
132	2015-09-19 16:36:19.474	\N	2015-09-19 16:36:19.474	\N	0
133	2015-09-19 16:36:19.478	\N	2015-09-19 16:36:19.478	\N	0
134	2015-09-19 16:36:19.481	\N	2015-09-19 16:36:19.481	\N	0
135	2015-09-19 16:36:19.484	\N	2015-09-19 16:36:19.484	\N	0
136	2015-09-19 16:36:19.487	\N	2015-09-19 16:36:19.487	\N	0
137	2015-09-19 16:36:19.491	\N	2015-09-19 16:36:19.491	\N	0
138	2015-09-19 16:36:19.496	\N	2015-09-19 16:36:19.496	\N	0
139	2015-09-19 16:36:19.501	\N	2015-09-19 16:36:19.501	\N	0
140	2015-09-19 16:36:19.505	\N	2015-09-19 16:36:19.505	\N	0
141	2015-09-19 16:36:19.511	\N	2015-09-19 16:36:19.511	\N	0
142	2015-09-19 16:36:19.516	\N	2015-09-19 16:36:19.516	\N	0
143	2015-09-19 16:36:19.52	\N	2015-09-19 16:36:19.52	\N	0
144	2015-09-19 16:36:19.524	\N	2015-09-19 16:36:19.524	\N	0
145	2015-09-19 16:36:19.529	\N	2015-09-19 16:36:19.529	\N	0
146	2015-09-19 16:36:19.533	\N	2015-09-19 16:36:19.533	\N	0
147	2015-09-19 16:36:19.538	\N	2015-09-19 16:36:19.538	\N	0
148	2015-09-19 16:36:19.544	\N	2015-09-19 16:36:19.544	\N	0
149	2015-09-19 16:36:19.548	\N	2015-09-19 16:36:19.548	\N	0
150	2015-09-19 16:36:19.551	\N	2015-09-19 16:36:19.551	\N	0
151	2015-09-19 16:36:19.554	\N	2015-09-19 16:36:19.554	\N	0
152	2015-09-19 16:36:19.557	\N	2015-09-19 16:36:19.557	\N	0
153	2015-09-19 16:36:19.56	\N	2015-09-19 16:36:19.56	\N	0
154	2015-09-19 16:36:19.564	\N	2015-09-19 16:36:19.564	\N	0
155	2015-09-19 16:36:19.568	\N	2015-09-19 16:36:19.568	\N	0
156	2015-09-19 16:36:19.572	\N	2015-09-19 16:36:19.572	\N	0
157	2015-09-19 16:36:19.576	\N	2015-09-19 16:36:19.576	\N	0
158	2015-09-19 16:36:19.58	\N	2015-09-19 16:36:19.58	\N	0
159	2015-09-19 16:36:19.583	\N	2015-09-19 16:36:19.583	\N	0
160	2015-09-19 16:36:19.587	\N	2015-09-19 16:36:19.587	\N	0
161	2015-09-19 16:36:19.59	\N	2015-09-19 16:36:19.59	\N	0
162	2015-09-19 16:36:19.593	\N	2015-09-19 16:36:19.593	\N	0
163	2015-09-19 16:36:19.596	\N	2015-09-19 16:36:19.596	\N	0
164	2015-09-19 16:36:19.6	\N	2015-09-19 16:36:19.6	\N	0
165	2015-09-19 16:36:19.606	\N	2015-09-19 16:36:19.606	\N	0
166	2015-09-19 16:36:19.612	\N	2015-09-19 16:36:19.612	\N	0
167	2015-09-19 16:36:19.615	\N	2015-09-19 16:36:19.615	\N	0
168	2015-09-19 16:36:19.619	\N	2015-09-19 16:36:19.619	\N	0
169	2015-09-19 16:36:19.622	\N	2015-09-19 16:36:19.622	\N	0
170	2015-09-19 16:36:19.625	\N	2015-09-19 16:36:19.625	\N	0
171	2015-09-19 16:36:19.629	\N	2015-09-19 16:36:19.629	\N	0
172	2015-09-19 16:36:19.632	\N	2015-09-19 16:36:19.632	\N	0
173	2015-09-19 16:36:19.638	\N	2015-09-19 16:36:19.638	\N	0
174	2015-09-19 16:36:19.644	\N	2015-09-19 16:36:19.644	\N	0
175	2015-09-19 16:36:19.653	\N	2015-09-19 16:36:19.653	\N	0
176	2015-09-19 16:36:19.66	\N	2015-09-19 16:36:19.66	\N	0
177	2015-09-19 16:36:19.668	\N	2015-09-19 16:36:19.668	\N	0
178	2015-09-19 16:36:19.672	\N	2015-09-19 16:36:19.672	\N	0
179	2015-09-19 16:36:19.676	\N	2015-09-19 16:36:19.676	\N	0
180	2015-09-19 16:36:19.679	\N	2015-09-19 16:36:19.679	\N	0
181	2015-09-19 16:36:19.683	\N	2015-09-19 16:36:19.683	\N	0
182	2015-09-19 16:36:19.687	\N	2015-09-19 16:36:19.687	\N	0
183	2015-09-19 16:36:19.692	\N	2015-09-19 16:36:19.692	\N	0
184	2015-09-19 16:36:19.696	\N	2015-09-19 16:36:19.696	\N	0
185	2015-09-19 16:36:19.702	\N	2015-09-19 16:36:19.702	\N	0
186	2015-09-19 16:36:19.705	\N	2015-09-19 16:36:19.705	\N	0
187	2015-09-19 16:36:19.709	\N	2015-09-19 16:36:19.709	\N	0
188	2015-09-19 16:36:19.713	\N	2015-09-19 16:36:19.713	\N	0
189	2015-09-19 16:36:19.716	\N	2015-09-19 16:36:19.716	\N	0
190	2015-09-19 16:36:19.72	\N	2015-09-19 16:36:19.72	\N	0
191	2015-09-19 16:36:19.723	\N	2015-09-19 16:36:19.723	\N	0
192	2015-09-19 16:36:19.727	\N	2015-09-19 16:36:19.727	\N	0
193	2015-09-19 16:36:19.731	\N	2015-09-19 16:36:19.731	\N	0
194	2015-09-19 16:36:19.735	\N	2015-09-19 16:36:19.735	\N	0
195	2015-09-19 16:36:19.738	\N	2015-09-19 16:36:19.738	\N	0
196	2015-09-19 16:36:19.742	\N	2015-09-19 16:36:19.742	\N	0
197	2015-09-19 16:36:19.745	\N	2015-09-19 16:36:19.745	\N	0
198	2015-09-19 16:36:19.749	\N	2015-09-19 16:36:19.749	\N	0
199	2015-09-19 16:36:19.752	\N	2015-09-19 16:36:19.752	\N	0
\.


--
-- Name: translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: play
--

SELECT pg_catalog.setval('translation_id_seq', 199, true);


--
-- Data for Name: translationvalue; Type: TABLE DATA; Schema: public; Owner: play
--

COPY translationvalue (id, creationdate, creationuser, lastupdate, lastupdateuser, version, content, lang, searchablecontent, translation_id) FROM stdin;
1	2015-09-19 16:36:18.183	\N	2015-09-19 16:36:18.183	\N	0	J'ai faim!	fr	j'ai faim!	1
2	2015-09-19 16:36:18.186	\N	2015-09-19 16:36:18.187	\N	0	I'm hungry!	en	i'm hungry!	1
3	2015-09-19 16:36:18.209	\N	2015-09-19 16:36:18.21	\N	0	C'est l'heure de l'apéro!	fr	c'est l'heure de l'apero!	2
4	2015-09-19 16:36:18.212	\N	2015-09-19 16:36:18.212	\N	0	Apero time!	en	apero time!	2
5	2015-09-19 16:36:18.224	\N	2015-09-19 16:36:18.224	\N	0	Ce soir… On danse!	fr	ce soir on danse!	3
6	2015-09-19 16:36:18.227	\N	2015-09-19 16:36:18.227	\N	0	I wanna dance tonight!	en	i wanna dance tonight!	3
7	2015-09-19 16:36:18.234	\N	2015-09-19 16:36:18.234	\N	0	Cinéma ou théâtre?	fr	cinema ou theatre?	4
8	2015-09-19 16:36:18.237	\N	2015-09-19 16:36:18.237	\N	0	Cinema or theatre?	en	cinema or theatre?	4
9	2015-09-19 16:36:18.244	\N	2015-09-19 16:36:18.244	\N	0	Mes grosses courses à petits prix.	fr	mes grosses courses a petits prix.	5
10	2015-09-19 16:36:18.247	\N	2015-09-19 16:36:18.247	\N	0	My big purchases at low prices.	en	my big purchases at low prices.	5
11	2015-09-19 16:36:18.253	\N	2015-09-19 16:36:18.253	\N	0	Un cadeau… Juste pour moi!	fr	un cadeau juste pour moi!	6
12	2015-09-19 16:36:18.256	\N	2015-09-19 16:36:18.256	\N	0	A gift… Only for me!	en	a gift only for me!	6
13	2015-09-19 16:36:18.263	\N	2015-09-19 16:36:18.263	\N	0	Je n'ai rien à me mettre!	fr	je n'ai rien a me mettre!	7
14	2015-09-19 16:36:18.265	\N	2015-09-19 16:36:18.265	\N	0	I have nothing to wear!	en	i have nothing to wear!	7
15	2015-09-19 16:36:18.272	\N	2015-09-19 16:36:18.272	\N	0	Qu'on est bien chez soi.	fr	qu'on est bien chez soi.	8
16	2015-09-19 16:36:18.274	\N	2015-09-19 16:36:18.274	\N	0	Home sweet home.	en	home sweet home.	8
17	2015-09-19 16:36:18.281	\N	2015-09-19 16:36:18.281	\N	0	Il est temps de se relaxer!	fr	il est temps de se relaxer!	9
18	2015-09-19 16:36:18.283	\N	2015-09-19 16:36:18.283	\N	0	It's time to relax!	en	it's time to relax!	9
19	2015-09-19 16:36:18.289	\N	2015-09-19 16:36:18.289	\N	0	Aujourd'hui, je transpire!	fr	aujourd'hui, je transpire!	10
20	2015-09-19 16:36:18.291	\N	2015-09-19 16:36:18.291	\N	0	I wanna sweat today!	en	i wanna sweat today!	10
21	2015-09-19 16:36:18.299	\N	2015-09-19 16:36:18.299	\N	0	Poils, plumes ou écailles?	fr	poils, plumes ou ecailles?	11
22	2015-09-19 16:36:18.301	\N	2015-09-19 16:36:18.301	\N	0	I love my pets.	en	i love my pets.	11
23	2015-09-19 16:36:18.308	\N	2015-09-19 16:36:18.308	\N	0	NYC, Bankgok ou Ostende?	fr	nyc, bankgok ou ostende?	12
24	2015-09-19 16:36:18.31	\N	2015-09-19 16:36:18.31	\N	0	NYC, Bankgok or Ostende?	en	nyc, bankgok or ostende?	12
25	2015-09-19 16:36:18.316	\N	2015-09-19 16:36:18.316	\N	0	Bonne nuit!	fr	bonne nuit!	13
26	2015-09-19 16:36:18.319	\N	2015-09-19 16:36:18.319	\N	0	Good night!	en	good night!	13
27	2015-09-19 16:36:18.328	\N	2015-09-19 16:36:18.328	\N	0	Mon enfant mérite le meilleur!	fr	mon enfant merite le meilleur!	14
28	2015-09-19 16:36:18.331	\N	2015-09-19 16:36:18.331	\N	0	My child deserves the best!	en	my child deserves the best!	14
29	2015-09-19 16:36:18.338	\N	2015-09-19 16:36:18.338	\N	0	Je bricole moi-même!	fr	je bricole moi-meme!	15
30	2015-09-19 16:36:18.341	\N	2015-09-19 16:36:18.341	\N	0	Do it myself!	en	do it myself!	15
31	2015-09-19 16:36:18.347	\N	2015-09-19 16:36:18.348	\N	0	Il étais une fois…	fr	il etais une fois	16
32	2015-09-19 16:36:18.35	\N	2015-09-19 16:36:18.35	\N	0	Once upon a time...	en	once upon a time...	16
33	2015-09-19 16:36:18.357	\N	2015-09-19 16:36:18.357	\N	0	Mon jardin est un paradis!	fr	mon jardin est un paradis!	17
34	2015-09-19 16:36:18.36	\N	2015-09-19 16:36:18.36	\N	0	My garden is a paradise.	en	my garden is a paradise.	17
35	2015-09-19 16:36:18.366	\N	2015-09-19 16:36:18.366	\N	0	La musique n'est jamais assez forte!	fr	la musique n'est jamais assez forte!	18
36	2015-09-19 16:36:18.368	\N	2015-09-19 16:36:18.368	\N	0	The music is never loud enough.	en	the music is never loud enough.	18
37	2015-09-19 16:36:18.374	\N	2015-09-19 16:36:18.374	\N	0	Comme un geek!	fr	comme un geek!	19
38	2015-09-19 16:36:18.376	\N	2015-09-19 16:36:18.376	\N	0	Like a geek!	en	like a geek!	19
39	2015-09-19 16:36:18.382	\N	2015-09-19 16:36:18.382	\N	0	Qui veut jouer avec moi?	fr	qui veut jouer avec moi?	20
40	2015-09-19 16:36:18.384	\N	2015-09-19 16:36:18.384	\N	0	Who wanna play with me?	en	who wanna play with me?	20
41	2015-09-19 16:36:18.853	\N	2015-09-19 16:36:18.853	\N	0	Horeca	fr	horeca	21
42	2015-09-19 16:36:18.859	\N	2015-09-19 16:36:18.859	\N	0	Hôtel	fr	hotel	22
43	2015-09-19 16:36:18.866	\N	2015-09-19 16:36:18.866	\N	0	Auberge de jeunesse	fr	auberge de jeunesse	23
44	2015-09-19 16:36:18.872	\N	2015-09-19 16:36:18.872	\N	0	Camping	fr	camping	24
45	2015-09-19 16:36:18.878	\N	2015-09-19 16:36:18.878	\N	0	B&B	fr	b&b	25
46	2015-09-19 16:36:18.884	\N	2015-09-19 16:36:18.884	\N	0	Hôtel	fr	hotel	26
47	2015-09-19 16:36:18.89	\N	2015-09-19 16:36:18.89	\N	0	Restaurant	fr	restaurant	27
48	2015-09-19 16:36:18.896	\N	2015-09-19 16:36:18.896	\N	0	Fast Food	fr	fast food	28
49	2015-09-19 16:36:18.902	\N	2015-09-19 16:36:18.902	\N	0	Asiatique	fr	asiatique	29
50	2015-09-19 16:36:18.908	\N	2015-09-19 16:36:18.908	\N	0	Européen	fr	europeen	30
51	2015-09-19 16:36:18.914	\N	2015-09-19 16:36:18.914	\N	0	Africain	fr	africain	31
52	2015-09-19 16:36:18.92	\N	2015-09-19 16:36:18.92	\N	0	Américain	fr	americain	32
53	2015-09-19 16:36:18.926	\N	2015-09-19 16:36:18.926	\N	0	Belge	fr	belge	33
54	2015-09-19 16:36:18.933	\N	2015-09-19 16:36:18.933	\N	0	Brunch & Sweet	fr	brunch & sweet	34
55	2015-09-19 16:36:18.938	\N	2015-09-19 16:36:18.938	\N	0	Gastronomique & Bistronomie	fr	gastronomique & bistronomie	35
56	2015-09-19 16:36:18.944	\N	2015-09-19 16:36:18.944	\N	0	Café	fr	cafe	36
57	2015-09-19 16:36:18.949	\N	2015-09-19 16:36:18.949	\N	0	Bières	fr	bieres	37
58	2015-09-19 16:36:18.955	\N	2015-09-19 16:36:18.955	\N	0	Vins	fr	vins	38
59	2015-09-19 16:36:18.96	\N	2015-09-19 16:36:18.96	\N	0	Champagne	fr	champagne	39
60	2015-09-19 16:36:18.966	\N	2015-09-19 16:36:18.966	\N	0	Cocktails	fr	cocktails	40
61	2015-09-19 16:36:18.971	\N	2015-09-19 16:36:18.971	\N	0	Jus & Smoothies	fr	jus & smoothies	41
62	2015-09-19 16:36:18.976	\N	2015-09-19 16:36:18.976	\N	0	Traiteur	fr	traiteur	42
63	2015-09-19 16:36:18.981	\N	2015-09-19 16:36:18.981	\N	0	Asiatique	fr	asiatique	43
64	2015-09-19 16:36:18.987	\N	2015-09-19 16:36:18.987	\N	0	Européen	fr	europeen	44
65	2015-09-19 16:36:18.991	\N	2015-09-19 16:36:18.991	\N	0	Africain	fr	africain	45
66	2015-09-19 16:36:18.996	\N	2015-09-19 16:36:18.996	\N	0	Américain	fr	americain	46
67	2015-09-19 16:36:19.001	\N	2015-09-19 16:36:19.001	\N	0	Belge	fr	belge	47
68	2015-09-19 16:36:19.007	\N	2015-09-19 16:36:19.007	\N	0	Gastronomique	fr	gastronomique	48
69	2015-09-19 16:36:19.011	\N	2015-09-19 16:36:19.011	\N	0	Magasin	fr	magasin	49
70	2015-09-19 16:36:19.015	\N	2015-09-19 16:36:19.016	\N	0	Alimentation	fr	alimentation	50
71	2015-09-19 16:36:19.02	\N	2015-09-19 16:36:19.02	\N	0	Supermarché	fr	supermarche	51
72	2015-09-19 16:36:19.025	\N	2015-09-19 16:36:19.025	\N	0	Boucherie & Charcuterie	fr	boucherie & charcuterie	52
73	2015-09-19 16:36:19.03	\N	2015-09-19 16:36:19.03	\N	0	Poissonerie	fr	poissonerie	53
74	2015-09-19 16:36:19.034	\N	2015-09-19 16:36:19.034	\N	0	Boulangerie & Patisserie	fr	boulangerie & patisserie	54
75	2015-09-19 16:36:19.038	\N	2015-09-19 16:36:19.038	\N	0	Fromagerie	fr	fromagerie	55
76	2015-09-19 16:36:19.042	\N	2015-09-19 16:36:19.042	\N	0	Bières & Vins	fr	bieres & vins	56
77	2015-09-19 16:36:19.047	\N	2015-09-19 16:36:19.047	\N	0	Herbes & Epices	fr	herbes & epices	57
78	2015-09-19 16:36:19.052	\N	2015-09-19 16:36:19.052	\N	0	Confiseries & Chocolat	fr	confiseries & chocolat	58
79	2015-09-19 16:36:19.056	\N	2015-09-19 16:36:19.056	\N	0	Loisirs	fr	loisirs	59
80	2015-09-19 16:36:19.06	\N	2015-09-19 16:36:19.06	\N	0	Sport & Aventure	fr	sport & aventure	60
81	2015-09-19 16:36:19.064	\N	2015-09-19 16:36:19.064	\N	0	Maison & Décoration	fr	maison & decoration	61
82	2015-09-19 16:36:19.068	\N	2015-09-19 16:36:19.068	\N	0	Jardin & Fleurs	fr	jardin & fleurs	62
83	2015-09-19 16:36:19.073	\N	2015-09-19 16:36:19.074	\N	0	Jeux & Jouets	fr	jeux & jouets	63
84	2015-09-19 16:36:19.077	\N	2015-09-19 16:36:19.077	\N	0	Multimédia & Informatique	fr	multimedia & informatique	64
85	2015-09-19 16:36:19.081	\N	2015-09-19 16:36:19.081	\N	0	Animaux	fr	animaux	65
86	2015-09-19 16:36:19.087	\N	2015-09-19 16:36:19.087	\N	0	Voyages	fr	voyages	66
87	2015-09-19 16:36:19.091	\N	2015-09-19 16:36:19.091	\N	0	Livres & Journaux	fr	livres & journaux	67
88	2015-09-19 16:36:19.096	\N	2015-09-19 16:36:19.096	\N	0	Mode	fr	mode	68
89	2015-09-19 16:36:19.1	\N	2015-09-19 16:36:19.1	\N	0	Vêtements Enfants	fr	vetements enfants	69
90	2015-09-19 16:36:19.105	\N	2015-09-19 16:36:19.105	\N	0	Vêtements Hommes	fr	vetements hommes	70
91	2015-09-19 16:36:19.11	\N	2015-09-19 16:36:19.11	\N	0	Vêtements Femmes	fr	vetements femmes	71
92	2015-09-19 16:36:19.115	\N	2015-09-19 16:36:19.115	\N	0	Chaussures	fr	chaussures	72
93	2015-09-19 16:36:19.12	\N	2015-09-19 16:36:19.12	\N	0	Bijoux & Montres	fr	bijoux & montres	73
94	2015-09-19 16:36:19.125	\N	2015-09-19 16:36:19.125	\N	0	Parfums & Cosmétique	fr	parfums & cosmetique	74
95	2015-09-19 16:36:19.129	\N	2015-09-19 16:36:19.129	\N	0	Lingerie	fr	lingerie	75
96	2015-09-19 16:36:19.134	\N	2015-09-19 16:36:19.134	\N	0	Lunettes	fr	lunettes	76
97	2015-09-19 16:36:19.138	\N	2015-09-19 16:36:19.138	\N	0	Utile	fr	utile	77
98	2015-09-19 16:36:19.143	\N	2015-09-19 16:36:19.143	\N	0	Electroménager	fr	electromenager	78
99	2015-09-19 16:36:19.151	\N	2015-09-19 16:36:19.151	\N	0	Bricolage	fr	bricolage	79
100	2015-09-19 16:36:19.157	\N	2015-09-19 16:36:19.157	\N	0	Papeterie	fr	papeterie	80
101	2015-09-19 16:36:19.161	\N	2015-09-19 16:36:19.161	\N	0	Voiture	fr	voiture	81
102	2015-09-19 16:36:19.165	\N	2015-09-19 16:36:19.165	\N	0	Droguerie	fr	droguerie	82
103	2015-09-19 16:36:19.169	\N	2015-09-19 16:36:19.169	\N	0	Vélo	fr	velo	83
104	2015-09-19 16:36:19.173	\N	2015-09-19 16:36:19.173	\N	0	Beauté & Bien Être	fr	beaute & bien etre	84
105	2015-09-19 16:36:19.178	\N	2015-09-19 16:36:19.178	\N	0	Soins	fr	soins	85
106	2015-09-19 16:36:19.182	\N	2015-09-19 16:36:19.182	\N	0	Coiffure	fr	coiffure	86
107	2015-09-19 16:36:19.187	\N	2015-09-19 16:36:19.187	\N	0	Esthétique	fr	esthetique	87
108	2015-09-19 16:36:19.19	\N	2015-09-19 16:36:19.19	\N	0	Manicure & Pédicure	fr	manicure & pedicure	88
109	2015-09-19 16:36:19.195	\N	2015-09-19 16:36:19.195	\N	0	Massage	fr	massage	89
110	2015-09-19 16:36:19.199	\N	2015-09-19 16:36:19.199	\N	0	Tatouage & Piercing	fr	tatouage & piercing	90
111	2015-09-19 16:36:19.203	\N	2015-09-19 16:36:19.203	\N	0	Toilettage	fr	toilettage	91
112	2015-09-19 16:36:19.207	\N	2015-09-19 16:36:19.207	\N	0	Etablissement	fr	etablissement	92
113	2015-09-19 16:36:19.211	\N	2015-09-19 16:36:19.211	\N	0	Sauna & Hammam	fr	sauna & hammam	93
114	2015-09-19 16:36:19.214	\N	2015-09-19 16:36:19.214	\N	0	Solarium	fr	solarium	94
115	2015-09-19 16:36:19.218	\N	2015-09-19 16:36:19.218	\N	0	Santé	fr	sante	95
116	2015-09-19 16:36:19.22	\N	2015-09-19 16:36:19.22	\N	0	Médecine Conventionnelle	fr	medecine conventionnelle	96
117	2015-09-19 16:36:19.223	\N	2015-09-19 16:36:19.223	\N	0	Médecine Générale	fr	medecine generale	97
118	2015-09-19 16:36:19.227	\N	2015-09-19 16:36:19.227	\N	0	Ophtalmologie	fr	ophtalmologie	98
119	2015-09-19 16:36:19.231	\N	2015-09-19 16:36:19.231	\N	0	ORL	fr	orl	99
120	2015-09-19 16:36:19.239	\N	2015-09-19 16:36:19.239	\N	0	Gynécologie	fr	gynecologie	100
121	2015-09-19 16:36:19.246	\N	2015-09-19 16:36:19.246	\N	0	Dentisterie	fr	dentisterie	101
122	2015-09-19 16:36:19.283	\N	2015-09-19 16:36:19.283	\N	0	Kinésithérapie	fr	kinesitherapie	102
123	2015-09-19 16:36:19.289	\N	2015-09-19 16:36:19.289	\N	0	Dermatologie	fr	dermatologie	103
124	2015-09-19 16:36:19.293	\N	2015-09-19 16:36:19.293	\N	0	Psychologie	fr	psychologie	104
125	2015-09-19 16:36:19.298	\N	2015-09-19 16:36:19.299	\N	0	Médecine Non-Conventionnelle	fr	medecine non-conventionnelle	105
126	2015-09-19 16:36:19.306	\N	2015-09-19 16:36:19.306	\N	0	Acupuncture	fr	acupuncture	106
127	2015-09-19 16:36:19.313	\N	2015-09-19 16:36:19.313	\N	0	Ostéopatie	fr	osteopatie	107
128	2015-09-19 16:36:19.321	\N	2015-09-19 16:36:19.321	\N	0	Homéopathie	fr	homeopathie	108
129	2015-09-19 16:36:19.329	\N	2015-09-19 16:36:19.329	\N	0	Hypnose	fr	hypnose	109
130	2015-09-19 16:36:19.336	\N	2015-09-19 16:36:19.336	\N	0	Naturopathie	fr	naturopathie	110
131	2015-09-19 16:36:19.341	\N	2015-09-19 16:36:19.341	\N	0	Autres	fr	autres	111
132	2015-09-19 16:36:19.349	\N	2015-09-19 16:36:19.349	\N	0	Pharmacie	fr	pharmacie	112
133	2015-09-19 16:36:19.358	\N	2015-09-19 16:36:19.358	\N	0	Hôpitaux	fr	hopitaux	113
134	2015-09-19 16:36:19.365	\N	2015-09-19 16:36:19.365	\N	0	Centres Médicaux	fr	centres medicaux	114
135	2015-09-19 16:36:19.394	\N	2015-09-19 16:36:19.394	\N	0	Vétérinaire	fr	veterinaire	115
136	2015-09-19 16:36:19.398	\N	2015-09-19 16:36:19.398	\N	0	Services de proximité	fr	services de proximite	116
137	2015-09-19 16:36:19.402	\N	2015-09-19 16:36:19.402	\N	0	Création & Réparation	fr	creation & reparation	117
138	2015-09-19 16:36:19.408	\N	2015-09-19 16:36:19.408	\N	0	Cordonnerie & Serrurrerie	fr	cordonnerie & serrurrerie	118
139	2015-09-19 16:36:19.412	\N	2015-09-19 16:36:19.412	\N	0	Couture & Retouches	fr	couture & retouches	119
140	2015-09-19 16:36:19.416	\N	2015-09-19 16:36:19.416	\N	0	Informatique	fr	informatique	120
141	2015-09-19 16:36:19.42	\N	2015-09-19 16:36:19.42	\N	0	Smartphones & Tablettes	fr	smartphones & tablettes	121
142	2015-09-19 16:36:19.427	\N	2015-09-19 16:36:19.427	\N	0	Plombier	fr	plombier	122
143	2015-09-19 16:36:19.432	\N	2015-09-19 16:36:19.432	\N	0	Electricien	fr	electricien	123
144	2015-09-19 16:36:19.44	\N	2015-09-19 16:36:19.44	\N	0	Jardinier	fr	jardinier	124
145	2015-09-19 16:36:19.444	\N	2015-09-19 16:36:19.444	\N	0	Finances & Droit	fr	finances & droit	125
146	2015-09-19 16:36:19.447	\N	2015-09-19 16:36:19.447	\N	0	Banque	fr	banque	126
147	2015-09-19 16:36:19.451	\N	2015-09-19 16:36:19.451	\N	0	Mistercash	fr	mistercash	127
148	2015-09-19 16:36:19.454	\N	2015-09-19 16:36:19.454	\N	0	Assurances	fr	assurances	128
149	2015-09-19 16:36:19.459	\N	2015-09-19 16:36:19.459	\N	0	Avocat	fr	avocat	129
150	2015-09-19 16:36:19.462	\N	2015-09-19 16:36:19.462	\N	0	Notaire	fr	notaire	130
151	2015-09-19 16:36:19.47	\N	2015-09-19 16:36:19.47	\N	0	Comptable	fr	comptable	131
152	2015-09-19 16:36:19.475	\N	2015-09-19 16:36:19.475	\N	0	Voiture	fr	voiture	132
153	2015-09-19 16:36:19.479	\N	2015-09-19 16:36:19.479	\N	0	Garage	fr	garage	133
154	2015-09-19 16:36:19.482	\N	2015-09-19 16:36:19.482	\N	0	Station Essence	fr	station essence	134
155	2015-09-19 16:36:19.485	\N	2015-09-19 16:36:19.485	\N	0	Carwash	fr	carwash	135
156	2015-09-19 16:36:19.488	\N	2015-09-19 16:36:19.488	\N	0	Parking	fr	parking	136
157	2015-09-19 16:36:19.493	\N	2015-09-19 16:36:19.493	\N	0	Pare-brise	fr	pare-brise	137
158	2015-09-19 16:36:19.498	\N	2015-09-19 16:36:19.498	\N	0	Pneus	fr	pneus	138
159	2015-09-19 16:36:19.502	\N	2015-09-19 16:36:19.502	\N	0	Contrôle Technique	fr	controle technique	139
160	2015-09-19 16:36:19.507	\N	2015-09-19 16:36:19.507	\N	0	Autres	fr	autres	140
161	2015-09-19 16:36:19.512	\N	2015-09-19 16:36:19.512	\N	0	Imprimerie	fr	imprimerie	141
162	2015-09-19 16:36:19.517	\N	2015-09-19 16:36:19.517	\N	0	Garderie & Crèche	fr	garderie & creche	142
163	2015-09-19 16:36:19.521	\N	2015-09-19 16:36:19.521	\N	0	Agence Immobilière	fr	agence immobiliere	143
164	2015-09-19 16:36:19.525	\N	2015-09-19 16:36:19.525	\N	0	Téléphonie & Internet	fr	telephonie & internet	144
165	2015-09-19 16:36:19.53	\N	2015-09-19 16:36:19.53	\N	0	Centre de Repassage	fr	centre de repassage	145
166	2015-09-19 16:36:19.534	\N	2015-09-19 16:36:19.534	\N	0	Etudes & Formations	fr	etudes & formations	146
167	2015-09-19 16:36:19.54	\N	2015-09-19 16:36:19.54	\N	0	Détente	fr	detente	147
168	2015-09-19 16:36:19.545	\N	2015-09-19 16:36:19.545	\N	0	Culture	fr	culture	148
169	2015-09-19 16:36:19.549	\N	2015-09-19 16:36:19.549	\N	0	Théâtre	fr	theatre	149
170	2015-09-19 16:36:19.552	\N	2015-09-19 16:36:19.552	\N	0	Opéra	fr	opera	150
171	2015-09-19 16:36:19.555	\N	2015-09-19 16:36:19.555	\N	0	Concert	fr	concert	151
172	2015-09-19 16:36:19.558	\N	2015-09-19 16:36:19.558	\N	0	Cirque	fr	cirque	152
173	2015-09-19 16:36:19.561	\N	2015-09-19 16:36:19.561	\N	0	Musée	fr	musee	153
174	2015-09-19 16:36:19.565	\N	2015-09-19 16:36:19.565	\N	0	Cinéma	fr	cinema	154
175	2015-09-19 16:36:19.57	\N	2015-09-19 16:36:19.57	\N	0	Galerie	fr	galerie	155
176	2015-09-19 16:36:19.573	\N	2015-09-19 16:36:19.573	\N	0	Zoo & Aquarium	fr	zoo & aquarium	156
177	2015-09-19 16:36:19.576	\N	2015-09-19 16:36:19.576	\N	0	Soirées	fr	soirees	157
178	2015-09-19 16:36:19.581	\N	2015-09-19 16:36:19.581	\N	0	Discothèque	fr	discotheque	158
179	2015-09-19 16:36:19.584	\N	2015-09-19 16:36:19.584	\N	0	Karaoké	fr	karaoke	159
180	2015-09-19 16:36:19.587	\N	2015-09-19 16:36:19.587	\N	0	Bar Lounge	fr	bar lounge	160
181	2015-09-19 16:36:19.59	\N	2015-09-19 16:36:19.59	\N	0	Bowling	fr	bowling	161
182	2015-09-19 16:36:19.594	\N	2015-09-19 16:36:19.594	\N	0	Café-Théâtre	fr	cafe-theatre	162
183	2015-09-19 16:36:19.596	\N	2015-09-19 16:36:19.596	\N	0	Bar Holebi	fr	bar holebi	163
184	2015-09-19 16:36:19.601	\N	2015-09-19 16:36:19.601	\N	0	Sport	fr	sport	164
185	2015-09-19 16:36:19.607	\N	2015-09-19 16:36:19.607	\N	0	Tennis	fr	tennis	165
186	2015-09-19 16:36:19.612	\N	2015-09-19 16:36:19.612	\N	0	Badminton & Squash	fr	badminton & squash	166
187	2015-09-19 16:36:19.616	\N	2015-09-19 16:36:19.616	\N	0	Escalade	fr	escalade	167
188	2015-09-19 16:36:19.62	\N	2015-09-19 16:36:19.62	\N	0	Piscine	fr	piscine	168
189	2015-09-19 16:36:19.623	\N	2015-09-19 16:36:19.623	\N	0	Fitness & Musculation	fr	fitness & musculation	169
190	2015-09-19 16:36:19.627	\N	2015-09-19 16:36:19.627	\N	0	Karting	fr	karting	170
191	2015-09-19 16:36:19.63	\N	2015-09-19 16:36:19.63	\N	0	Danse & Yoga	fr	danse & yoga	171
192	2015-09-19 16:36:19.634	\N	2015-09-19 16:36:19.634	\N	0	Golf	fr	golf	172
193	2015-09-19 16:36:19.639	\N	2015-09-19 16:36:19.639	\N	0	Autres	fr	autres	173
194	2015-09-19 16:36:19.646	\N	2015-09-19 16:36:19.646	\N	0	Casino	fr	casino	174
195	2015-09-19 16:36:19.654	\N	2015-09-19 16:36:19.654	\N	0	Jeux de Société	fr	jeux de societe	175
196	2015-09-19 16:36:19.662	\N	2015-09-19 16:36:19.662	\N	0	Jeux Vidéo	fr	jeux video	176
197	2015-09-19 16:36:19.669	\N	2015-09-19 16:36:19.669	\N	0	Jeux d'Enfants	fr	jeux d'enfants	177
198	2015-09-19 16:36:19.673	\N	2015-09-19 16:36:19.673	\N	0	Administrations Publiques	fr	administrations publiques	178
199	2015-09-19 16:36:19.677	\N	2015-09-19 16:36:19.677	\N	0	Services Pratiques	fr	services pratiques	179
200	2015-09-19 16:36:19.681	\N	2015-09-19 16:36:19.681	\N	0	Poste	fr	poste	180
201	2015-09-19 16:36:19.684	\N	2015-09-19 16:36:19.684	\N	0	Police	fr	police	181
202	2015-09-19 16:36:19.688	\N	2015-09-19 16:36:19.688	\N	0	Pompiers	fr	pompiers	182
203	2015-09-19 16:36:19.693	\N	2015-09-19 16:36:19.693	\N	0	Bibliothèque	fr	bibliotheque	183
204	2015-09-19 16:36:19.699	\N	2015-09-19 16:36:19.699	\N	0	Communal	fr	communal	184
205	2015-09-19 16:36:19.703	\N	2015-09-19 16:36:19.703	\N	0	Etat Civil & Population	fr	etat civil & population	185
206	2015-09-19 16:36:19.706	\N	2015-09-19 16:36:19.706	\N	0	Energie	fr	energie	186
207	2015-09-19 16:36:19.71	\N	2015-09-19 16:36:19.71	\N	0	Emploi	fr	emploi	187
208	2015-09-19 16:36:19.713	\N	2015-09-19 16:36:19.713	\N	0	Urbanisme	fr	urbanisme	188
209	2015-09-19 16:36:19.717	\N	2015-09-19 16:36:19.717	\N	0	CPAS	fr	cpas	189
210	2015-09-19 16:36:19.721	\N	2015-09-19 16:36:19.721	\N	0	Office du Tourisme	fr	office du tourisme	190
211	2015-09-19 16:36:19.724	\N	2015-09-19 16:36:19.724	\N	0	Fédéral & International	fr	federal & international	191
212	2015-09-19 16:36:19.728	\N	2015-09-19 16:36:19.728	\N	0	Economie	fr	economie	192
213	2015-09-19 16:36:19.732	\N	2015-09-19 16:36:19.732	\N	0	Emploi	fr	emploi	193
214	2015-09-19 16:36:19.736	\N	2015-09-19 16:36:19.736	\N	0	Justice	fr	justice	194
215	2015-09-19 16:36:19.739	\N	2015-09-19 16:36:19.739	\N	0	Mobilité	fr	mobilite	195
216	2015-09-19 16:36:19.743	\N	2015-09-19 16:36:19.743	\N	0	Impôts	fr	impots	196
217	2015-09-19 16:36:19.746	\N	2015-09-19 16:36:19.746	\N	0	Logement	fr	logement	197
218	2015-09-19 16:36:19.75	\N	2015-09-19 16:36:19.75	\N	0	Santé	fr	sante	198
219	2015-09-19 16:36:19.753	\N	2015-09-19 16:36:19.753	\N	0	Ambassade	fr	ambassade	199
\.


--
-- Name: translationvalue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: play
--

SELECT pg_catalog.setval('translationvalue_id_seq', 219, true);


--
-- Name: abstractpublication_pkey; Type: CONSTRAINT; Schema: public; Owner: play; Tablespace: 
--

ALTER TABLE ONLY abstractpublication
    ADD CONSTRAINT abstractpublication_pkey PRIMARY KEY (id);


--
-- Name: account_customerinterest_pkey; Type: CONSTRAINT; Schema: public; Owner: play; Tablespace: 
--

ALTER TABLE ONLY account_customerinterest
    ADD CONSTRAINT account_customerinterest_pkey PRIMARY KEY (account_id, customerinterests_id);


--
-- Name: account_pkey; Type: CONSTRAINT; Schema: public; Owner: play; Tablespace: 
--

ALTER TABLE ONLY account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);


--
-- Name: address_pkey; Type: CONSTRAINT; Schema: public; Owner: play; Tablespace: 
--

ALTER TABLE ONLY address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- Name: business_category_pkey; Type: CONSTRAINT; Schema: public; Owner: play; Tablespace: 
--

ALTER TABLE ONLY business_category
    ADD CONSTRAINT business_category_pkey PRIMARY KEY (category, business);


--
-- Name: business_pkey; Type: CONSTRAINT; Schema: public; Owner: play; Tablespace: 
--

ALTER TABLE ONLY business
    ADD CONSTRAINT business_pkey PRIMARY KEY (id);


--
-- Name: businesscategory_pkey; Type: CONSTRAINT; Schema: public; Owner: play; Tablespace: 
--

ALTER TABLE ONLY businesscategory
    ADD CONSTRAINT businesscategory_pkey PRIMARY KEY (id);


--
-- Name: businessschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: play; Tablespace: 
--

ALTER TABLE ONLY businessschedule
    ADD CONSTRAINT businessschedule_pkey PRIMARY KEY (id);


--
-- Name: businessschedulepart_pkey; Type: CONSTRAINT; Schema: public; Owner: play; Tablespace: 
--

ALTER TABLE ONLY businessschedulepart
    ADD CONSTRAINT businessschedulepart_pkey PRIMARY KEY (id);


--
-- Name: categoryinterestlink_pkey; Type: CONSTRAINT; Schema: public; Owner: play; Tablespace: 
--

ALTER TABLE ONLY categoryinterestlink
    ADD CONSTRAINT categoryinterestlink_pkey PRIMARY KEY (id);


--
-- Name: customerinterest_pkey; Type: CONSTRAINT; Schema: public; Owner: play; Tablespace: 
--

ALTER TABLE ONLY customerinterest
    ADD CONSTRAINT customerinterest_pkey PRIMARY KEY (id);


--
-- Name: facebookcredential_pkey; Type: CONSTRAINT; Schema: public; Owner: play; Tablespace: 
--

ALTER TABLE ONLY facebookcredential
    ADD CONSTRAINT facebookcredential_pkey PRIMARY KEY (id);


--
-- Name: followlink_pkey; Type: CONSTRAINT; Schema: public; Owner: play; Tablespace: 
--

ALTER TABLE ONLY followlink
    ADD CONSTRAINT followlink_pkey PRIMARY KEY (id);


--
-- Name: logincredential_pkey; Type: CONSTRAINT; Schema: public; Owner: play; Tablespace: 
--

ALTER TABLE ONLY logincredential
    ADD CONSTRAINT logincredential_pkey PRIMARY KEY (id);


--
-- Name: session_pkey; Type: CONSTRAINT; Schema: public; Owner: play; Tablespace: 
--

ALTER TABLE ONLY session
    ADD CONSTRAINT session_pkey PRIMARY KEY (id);


--
-- Name: storedfile_pkey; Type: CONSTRAINT; Schema: public; Owner: play; Tablespace: 
--

ALTER TABLE ONLY storedfile
    ADD CONSTRAINT storedfile_pkey PRIMARY KEY (id);


--
-- Name: translation_pkey; Type: CONSTRAINT; Schema: public; Owner: play; Tablespace: 
--

ALTER TABLE ONLY translation
    ADD CONSTRAINT translation_pkey PRIMARY KEY (id);


--
-- Name: translationvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: play; Tablespace: 
--

ALTER TABLE ONLY translationvalue
    ADD CONSTRAINT translationvalue_pkey PRIMARY KEY (id);


--
-- Name: uk_3neepbdd5qhvjoo3go8lpjad6; Type: CONSTRAINT; Schema: public; Owner: play; Tablespace: 
--

ALTER TABLE ONLY customerinterest
    ADD CONSTRAINT uk_3neepbdd5qhvjoo3go8lpjad6 UNIQUE (name);


--
-- Name: uk_cs5bnaggwuluahrdh8mbs1rpe; Type: CONSTRAINT; Schema: public; Owner: play; Tablespace: 
--

ALTER TABLE ONLY account
    ADD CONSTRAINT uk_cs5bnaggwuluahrdh8mbs1rpe UNIQUE (email);


--
-- Name: uk_jvavqp5xskd23ovcgxn2rp982; Type: CONSTRAINT; Schema: public; Owner: play; Tablespace: 
--

ALTER TABLE ONLY business
    ADD CONSTRAINT uk_jvavqp5xskd23ovcgxn2rp982 UNIQUE (account_id);


--
-- Name: uk_lb4s0fxvqona00ffc0w0ft9sq; Type: CONSTRAINT; Schema: public; Owner: play; Tablespace: 
--

ALTER TABLE ONLY logincredential
    ADD CONSTRAINT uk_lb4s0fxvqona00ffc0w0ft9sq UNIQUE (account_id);


--
-- Name: uk_mskwv9nr8fd3pb70tlpex5oiu; Type: CONSTRAINT; Schema: public; Owner: play; Tablespace: 
--

ALTER TABLE ONLY facebookcredential
    ADD CONSTRAINT uk_mskwv9nr8fd3pb70tlpex5oiu UNIQUE (userid);


--
-- Name: uk_qkb0sibhqb59gyrpb94gsjt8j; Type: CONSTRAINT; Schema: public; Owner: play; Tablespace: 
--

ALTER TABLE ONLY businesscategory
    ADD CONSTRAINT uk_qkb0sibhqb59gyrpb94gsjt8j UNIQUE (name);


--
-- Name: uk_qwghpx5s01gxmpfoh05umhsxf; Type: CONSTRAINT; Schema: public; Owner: play; Tablespace: 
--

ALTER TABLE ONLY facebookcredential
    ADD CONSTRAINT uk_qwghpx5s01gxmpfoh05umhsxf UNIQUE (account_id);


--
-- Name: fk_10na602yh2ycnfpw4nr1bd0du; Type: FK CONSTRAINT; Schema: public; Owner: play
--

ALTER TABLE ONLY session
    ADD CONSTRAINT fk_10na602yh2ycnfpw4nr1bd0du FOREIGN KEY (account_id) REFERENCES account(id);


--
-- Name: fk_256k0qjaoo8bcmdyxg7je2634; Type: FK CONSTRAINT; Schema: public; Owner: play
--

ALTER TABLE ONLY categoryinterestlink
    ADD CONSTRAINT fk_256k0qjaoo8bcmdyxg7je2634 FOREIGN KEY (customerinterest_id) REFERENCES customerinterest(id);


--
-- Name: fk_38b64ywr72ld53masw4vvl58b; Type: FK CONSTRAINT; Schema: public; Owner: play
--

ALTER TABLE ONLY businessschedule
    ADD CONSTRAINT fk_38b64ywr72ld53masw4vvl58b FOREIGN KEY (business_id) REFERENCES business(id);


--
-- Name: fk_4chinspisy27q2e9unwqdmat1; Type: FK CONSTRAINT; Schema: public; Owner: play
--

ALTER TABLE ONLY followlink
    ADD CONSTRAINT fk_4chinspisy27q2e9unwqdmat1 FOREIGN KEY (business_id) REFERENCES business(id);


--
-- Name: fk_5whd67hrgsopca98cytmb8li1; Type: FK CONSTRAINT; Schema: public; Owner: play
--

ALTER TABLE ONLY storedfile
    ADD CONSTRAINT fk_5whd67hrgsopca98cytmb8li1 FOREIGN KEY (businessgallerypicture_id) REFERENCES business(id);


--
-- Name: fk_7rad1s0ji1q3ed2pnnn4g8oq3; Type: FK CONSTRAINT; Schema: public; Owner: play
--

ALTER TABLE ONLY account_customerinterest
    ADD CONSTRAINT fk_7rad1s0ji1q3ed2pnnn4g8oq3 FOREIGN KEY (customerinterests_id) REFERENCES customerinterest(id);


--
-- Name: fk_8x7x7d45e1jxta3xkpsau0mqx; Type: FK CONSTRAINT; Schema: public; Owner: play
--

ALTER TABLE ONLY business
    ADD CONSTRAINT fk_8x7x7d45e1jxta3xkpsau0mqx FOREIGN KEY (landscape_id) REFERENCES storedfile(id);


--
-- Name: fk_94pwj0kfgpwlkp3iws47p4h0d; Type: FK CONSTRAINT; Schema: public; Owner: play
--

ALTER TABLE ONLY business_category
    ADD CONSTRAINT fk_94pwj0kfgpwlkp3iws47p4h0d FOREIGN KEY (business) REFERENCES business(id);


--
-- Name: fk_b3u7dhuspbk1cxg9m4102mpiw; Type: FK CONSTRAINT; Schema: public; Owner: play
--

ALTER TABLE ONLY account_customerinterest
    ADD CONSTRAINT fk_b3u7dhuspbk1cxg9m4102mpiw FOREIGN KEY (account_id) REFERENCES account(id);


--
-- Name: fk_bis0ix8p4cagdiu4wna6ghfcg; Type: FK CONSTRAINT; Schema: public; Owner: play
--

ALTER TABLE ONLY storedfile
    ADD CONSTRAINT fk_bis0ix8p4cagdiu4wna6ghfcg FOREIGN KEY (publication_id) REFERENCES abstractpublication(id);


--
-- Name: fk_dbvajw108i0m9pdxaxno0jr5e; Type: FK CONSTRAINT; Schema: public; Owner: play
--

ALTER TABLE ONLY businesscategory
    ADD CONSTRAINT fk_dbvajw108i0m9pdxaxno0jr5e FOREIGN KEY (translationname_id) REFERENCES translation(id);


--
-- Name: fk_dg4435wwm356vbnwi3m6gh8m9; Type: FK CONSTRAINT; Schema: public; Owner: play
--

ALTER TABLE ONLY storedfile
    ADD CONSTRAINT fk_dg4435wwm356vbnwi3m6gh8m9 FOREIGN KEY (account_id) REFERENCES account(id);


--
-- Name: fk_fqkdggoknadoc01i9a2ac07r3; Type: FK CONSTRAINT; Schema: public; Owner: play
--

ALTER TABLE ONLY businessschedulepart
    ADD CONSTRAINT fk_fqkdggoknadoc01i9a2ac07r3 FOREIGN KEY (businessschedule_id) REFERENCES businessschedule(id);


--
-- Name: fk_geqnp79hkk4j9v4mq19kpp7w7; Type: FK CONSTRAINT; Schema: public; Owner: play
--

ALTER TABLE ONLY abstractpublication
    ADD CONSTRAINT fk_geqnp79hkk4j9v4mq19kpp7w7 FOREIGN KEY (business_id) REFERENCES business(id);


--
-- Name: fk_hkc0jqlfcippaislqsib4wo2w; Type: FK CONSTRAINT; Schema: public; Owner: play
--

ALTER TABLE ONLY translationvalue
    ADD CONSTRAINT fk_hkc0jqlfcippaislqsib4wo2w FOREIGN KEY (translation_id) REFERENCES translation(id);


--
-- Name: fk_js778xt80celdcwp5qyf0s24l; Type: FK CONSTRAINT; Schema: public; Owner: play
--

ALTER TABLE ONLY business_category
    ADD CONSTRAINT fk_js778xt80celdcwp5qyf0s24l FOREIGN KEY (category) REFERENCES businesscategory(id);


--
-- Name: fk_jvavqp5xskd23ovcgxn2rp982; Type: FK CONSTRAINT; Schema: public; Owner: play
--

ALTER TABLE ONLY business
    ADD CONSTRAINT fk_jvavqp5xskd23ovcgxn2rp982 FOREIGN KEY (account_id) REFERENCES account(id);


--
-- Name: fk_l4fapl05tpfuhchcur8ffw8eq; Type: FK CONSTRAINT; Schema: public; Owner: play
--

ALTER TABLE ONLY business
    ADD CONSTRAINT fk_l4fapl05tpfuhchcur8ffw8eq FOREIGN KEY (illustration_id) REFERENCES storedfile(id);


--
-- Name: fk_lb4s0fxvqona00ffc0w0ft9sq; Type: FK CONSTRAINT; Schema: public; Owner: play
--

ALTER TABLE ONLY logincredential
    ADD CONSTRAINT fk_lb4s0fxvqona00ffc0w0ft9sq FOREIGN KEY (account_id) REFERENCES account(id);


--
-- Name: fk_ml7vua0s0tmeghhrilhekh2ah; Type: FK CONSTRAINT; Schema: public; Owner: play
--

ALTER TABLE ONLY categoryinterestlink
    ADD CONSTRAINT fk_ml7vua0s0tmeghhrilhekh2ah FOREIGN KEY (businesscategory_id) REFERENCES businesscategory(id);


--
-- Name: fk_mpe4dnpn9qglc7svlaaccaxyp; Type: FK CONSTRAINT; Schema: public; Owner: play
--

ALTER TABLE ONLY followlink
    ADD CONSTRAINT fk_mpe4dnpn9qglc7svlaaccaxyp FOREIGN KEY (account_id) REFERENCES account(id);


--
-- Name: fk_o96qg5v5hndsr60e01r0fyd9h; Type: FK CONSTRAINT; Schema: public; Owner: play
--

ALTER TABLE ONLY customerinterest
    ADD CONSTRAINT fk_o96qg5v5hndsr60e01r0fyd9h FOREIGN KEY (translationname_id) REFERENCES translation(id);


--
-- Name: fk_o9wkdpo1g3tpmi89hh7fmin4s; Type: FK CONSTRAINT; Schema: public; Owner: play
--

ALTER TABLE ONLY businesscategory
    ADD CONSTRAINT fk_o9wkdpo1g3tpmi89hh7fmin4s FOREIGN KEY (parent_id) REFERENCES businesscategory(id);


--
-- Name: fk_or5dbsbtme3w24c24kla8y8ci; Type: FK CONSTRAINT; Schema: public; Owner: play
--

ALTER TABLE ONLY account
    ADD CONSTRAINT fk_or5dbsbtme3w24c24kla8y8ci FOREIGN KEY (selectedaddress_id) REFERENCES address(id);


--
-- Name: fk_pk5ah14oqgqhc1jeaoq1llhmd; Type: FK CONSTRAINT; Schema: public; Owner: play
--

ALTER TABLE ONLY abstractpublication
    ADD CONSTRAINT fk_pk5ah14oqgqhc1jeaoq1llhmd FOREIGN KEY (interest_id) REFERENCES customerinterest(id);


--
-- Name: fk_qt0bj0617muanuync9plh35ul; Type: FK CONSTRAINT; Schema: public; Owner: play
--

ALTER TABLE ONLY business
    ADD CONSTRAINT fk_qt0bj0617muanuync9plh35ul FOREIGN KEY (address_id) REFERENCES address(id);


--
-- Name: fk_qwghpx5s01gxmpfoh05umhsxf; Type: FK CONSTRAINT; Schema: public; Owner: play
--

ALTER TABLE ONLY facebookcredential
    ADD CONSTRAINT fk_qwghpx5s01gxmpfoh05umhsxf FOREIGN KEY (account_id) REFERENCES account(id);


--
-- Name: fk_s34qxwjkunlxds94x3m28j0xg; Type: FK CONSTRAINT; Schema: public; Owner: play
--

ALTER TABLE ONLY address
    ADD CONSTRAINT fk_s34qxwjkunlxds94x3m28j0xg FOREIGN KEY (account_id) REFERENCES account(id);


--
-- PostgreSQL database dump complete
--

