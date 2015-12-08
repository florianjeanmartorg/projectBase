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
Promotion	2	2015-09-19 16:53:33.936	\N	2015-09-19 16:53:33.936	\N	0	Des fraises de la région.	2015-09-19 18:53:33.936	tartes aux fraises	2015-09-18 16:53:33.936	Tartes aux fraises	PROMOTION	1	0.66666666666666663	12	8		10	1
BusinessNotification	3	2015-09-19 16:53:40.681	\N	2015-09-19 16:53:40.681	\N	0	N'hésitez pas à nous contacter pour recevoir les différentes possibilités de gâteaux et tartes.	2015-09-19 22:53:40.68	voici notre derniere creation pour l'anniversaire d'enzo!	2015-09-18 16:53:40.681	Voici notre dernière création pour l'anniversaire d'Enzo!	NOTIFICATION	\N	\N	\N	\N	\N	10	14
BusinessNotification	4	2015-09-19 16:53:42.671	\N	2015-09-19 16:53:42.671	\N	0		2015-09-20 16:53:42.671	n'oubliez pas de feter papa ce dimanche nous, on est prets!	2015-09-18 16:53:42.671	N'oubliez pas de fêter Papa ce dimanche… Nous, on est prêts!	NOTIFICATION	\N	\N	\N	\N	\N	10	\N
BusinessNotification	5	2015-09-19 16:53:44.664	\N	2015-09-19 16:53:44.664	\N	0		2015-09-21 16:53:44.664	bienvenue a l'expo "miel dans tous ses etats" au centre culturel!	2015-09-18 16:53:44.664	Bienvenue à l'expo "Miel dans tous ses états" au Centre Culturel!	NOTIFICATION	\N	\N	\N	\N	\N	10	4
BusinessNotification	6	2015-09-19 16:53:47.194	\N	2015-09-19 16:53:47.194	\N	0		2015-09-20 15:53:47.194	saviez-vous que tout les fruits que nous utilisons sont bio et locaux?	2015-09-18 16:53:47.194	Saviez-vous que tout les fruits que nous utilisons sont bio et locaux?	NOTIFICATION	\N	\N	\N	\N	\N	10	\N
BusinessNotification	7	2015-09-19 16:53:50.124	\N	2015-09-19 16:53:50.124	\N	0	Il est temps de prendre des vacances! Mais, ne vous inquiétez pas… Nous penserons à vous!  ;)	2015-09-21 11:53:50.124	nous serons exceptionellement fermes ce weekend!	2015-09-18 16:53:50.124	Nous serons exceptionellement fermés ce weekend!	NOTIFICATION	\N	\N	\N	\N	\N	10	\N
Promotion	8	2015-09-19 16:53:51.025	\N	2015-09-19 16:53:51.025	\N	0	Miel produits par Frouchka qui habite à Boitsfort.	2015-09-20 15:53:51.025	pots de miel 300ml	2015-09-18 16:53:51.025	Pots de miel 300ml	PROMOTION	\N	0.100000000000000006	\N	\N		10	1
Promotion	9	2015-09-19 16:53:51.032	\N	2015-09-19 16:53:51.032	\N	0		2015-09-19 22:53:51.032	2 + 1 couque gratuite	2015-09-18 16:53:51.032	2 + 1 couque gratuite	PROMOTION	\N	\N	\N	\N		10	1
BusinessNotification	10	2015-09-19 16:53:51.045	\N	2015-09-19 16:53:51.045	\N	0		2015-09-19 21:53:51.044	bientot la saison des barbecues preparez-vous!  :)	2015-09-18 16:53:51.044	Bientôt la saison des barbecues… Préparez-vous!  :)	NOTIFICATION	\N	\N	\N	\N	\N	11	1
BusinessNotification	11	2015-09-19 16:54:01.512	\N	2015-09-19 16:54:01.512	\N	0		2015-09-20 15:54:01.512	je vous presente mr marc, mon fournisseur de buf de qualite du brabant wallon!	2015-09-18 16:54:01.512	Je vous présente Mr Marc, mon fournisseur de bœuf de qualité du Brabant Wallon!	NOTIFICATION	\N	\N	\N	\N	\N	11	\N
BusinessNotification	12	2015-09-19 16:54:25.563	\N	2015-09-19 16:54:25.563	\N	0		2015-09-22 09:54:25.563	faites mariner vos viandes des la veille au soir pour un meilleur gout!	2015-09-18 16:54:25.563	Faites mariner vos viandes dès la veille au soir pour un meilleur goût!	NOTIFICATION	\N	\N	\N	\N	\N	11	\N
BusinessNotification	13	2015-09-19 16:54:30.072	\N	2015-09-19 16:54:30.072	\N	0		2015-09-23 07:54:30.072	nouveau boudin blanc maison a decouvrir!	2015-09-18 16:54:30.072	Nouveau boudin blanc maison à découvrir!	NOTIFICATION	\N	\N	\N	\N	\N	11	1
BusinessNotification	14	2015-09-19 16:54:31.439	\N	2015-09-19 16:54:31.439	\N	0		2015-09-19 19:54:31.439	l'equipe au complet en plein travail!	2015-09-18 16:54:31.439	L'équipe au complet en plein travail!	NOTIFICATION	\N	\N	\N	\N	\N	11	\N
Promotion	15	2015-09-19 16:54:33.275	\N	2015-09-19 16:54:33.275	\N	0	Viande de qualité sélectionnée auprès de nos agriculteurs wallons. N'hésitez pas à nous demander leurs coordonnées pour aller leur rendre visite!	2015-09-19 20:54:33.275	brochettes de poulet	2015-09-18 16:54:33.275	Brochettes de poulet	PROMOTION	\N	0.149999999999999994	\N	\N		11	1
Promotion	16	2015-09-19 16:54:36.657	\N	2015-09-19 16:54:36.657	\N	0		2015-09-20 15:54:36.657	sauce banzai	2015-09-18 16:54:36.657	Sauce Banzaï	PROMOTION	\N	0.200000000000000011	\N	\N		11	1
Promotion	17	2015-09-19 16:54:39.518	\N	2015-09-19 16:54:39.518	\N	0		2015-09-22 20:54:39.518	roti de porc	2015-09-18 16:54:39.518	Roti de porc	PROMOTION	0.25	0.100000000000000006	15	6	kg	11	1
Promotion	18	2015-09-19 16:54:41.699	\N	2015-09-19 16:54:41.699	\N	0		2015-09-19 19:54:41.699	pate au poivre vert	2015-09-18 16:54:41.699	Pâté au poivre vert	PROMOTION	\N	0.149999999999999994	25	2	kg	11	1
BusinessNotification	19	2015-09-19 16:54:44.532	\N	2015-09-19 16:54:44.532	\N	0		2015-09-19 21:54:44.532	venez nous retrouvez tous les mardis des 18h00 pour l'aquagym!	2015-09-18 16:54:44.532	Venez nous retrouvez tous les mardis dès 18h00 pour l'aquagym!	NOTIFICATION	\N	\N	\N	\N	\N	12	10
BusinessNotification	20	2015-09-19 16:54:47.839	\N	2015-09-19 16:54:47.839	\N	0		2015-09-20 01:54:47.839	les 6iemes primaire de saint michel sont venus nous dire bonjour!	2015-09-18 16:54:47.839	Les 6ièmes primaire de Saint Michel sont venus nous dire bonjour!	NOTIFICATION	\N	\N	\N	\N	\N	12	\N
BusinessNotification	21	2015-09-19 16:56:31.197	\N	2015-09-19 16:56:31.197	\N	0		2015-09-21 11:56:31.197	fiers de notre athlete national!	2015-09-18 16:56:31.197	Fiers de notre athlète national!	NOTIFICATION	\N	\N	\N	\N	\N	12	\N
BusinessNotification	22	2015-09-19 16:56:33.056	\N	2015-09-19 16:56:33.056	\N	0	Nous nous engageons à vous accueillir chaque jour dans les meilleurs conditions.	2015-09-22 20:56:33.055	il fait chaud dehors, il fait juste bon dedans 28c sous l'eau!	2015-09-18 16:56:33.055	Il fait chaud dehors, il fait juste bon dedans… 28°C sous l'eau!	NOTIFICATION	\N	\N	\N	\N	\N	12	10
BusinessNotification	23	2015-09-19 16:56:39.109	\N	2015-09-19 16:56:39.109	\N	0		2015-09-19 19:56:39.109	toutes les 2 heures, les sols de nos cabines sont nettoyes a fond!	2015-09-18 16:56:39.109	Toutes les 2 heures, les sols de nos cabines sont nettoyés à fond!	NOTIFICATION	\N	\N	\N	\N	\N	12	\N
Promotion	24	2015-09-19 16:56:40.612	\N	2015-09-19 16:56:40.612	\N	0		2015-09-20 01:56:40.612	entree adulte "soiree"	2015-09-18 16:56:40.612	Entrée adulte "Soirée"	PROMOTION	\N	0.300000000000000044	\N	\N		12	10
Promotion	25	2015-09-19 16:56:40.62	\N	2015-09-19 16:56:40.62	\N	0	Couleurs disponibles : bleu, blanc, vert, jaune.\nTailles disponibles : M, L, XL.	2015-09-22 09:56:40.62	bonnets 'speedo'	2015-09-18 16:56:40.62	Bonnets 'Speedo'	PROMOTION	\N	0.5	\N	\N		12	10
BusinessNotification	26	2015-09-19 16:56:51.365	\N	2015-09-19 16:56:51.365	\N	0		2015-09-20 01:56:51.365	nous proposons aujourd'hui en lunch du jour une salade de gesiers aux pommes.	2015-09-18 16:56:51.365	Nous proposons aujourd'hui en lunch du jour une salade de gésiers aux pommes.	NOTIFICATION	\N	\N	\N	\N	\N	13	1
BusinessNotification	27	2015-09-19 16:57:22.311	\N	2015-09-19 16:57:22.311	\N	0		2015-09-21 11:57:22.311	bienvenue a michel notre nouveau cuisinier!	2015-09-18 16:57:22.311	Bienvenue à Michel notre nouveau cuisinier!	NOTIFICATION	\N	\N	\N	\N	\N	13	\N
BusinessNotification	28	2015-09-19 16:57:25.964	\N	2015-09-19 16:57:25.964	\N	0		2015-09-19 23:57:25.964	7h00, deja l'heure pour nous d'aller vous chercher de bons produits!	2015-09-18 16:57:25.964	7h00, déjà l'heure pour nous d'aller vous chercher de bons produits!	NOTIFICATION	\N	\N	\N	\N	\N	13	\N
BusinessNotification	29	2015-09-19 16:57:35.95	\N	2015-09-19 16:57:35.95	\N	0	Réservations : 02/123.25.89	2015-09-23 18:57:35.95	n'oubliez pas de reserver votre table si vous venez en groupe!	2015-09-18 16:57:35.95	N'oubliez pas de réserver votre table si vous venez en groupe!	NOTIFICATION	\N	\N	\N	\N	\N	13	\N
BusinessNotification	30	2015-09-19 16:58:13.774	\N	2015-09-19 16:58:13.774	\N	0		2015-09-19 21:58:13.774	happy hour ce jeudi soir sur les cocktails de 18 a 19h!	2015-09-18 16:58:13.774	Happy Hour ce jeudi soir sur les cocktails de 18 à 19h!	NOTIFICATION	\N	\N	\N	\N	\N	13	2
Promotion	31	2015-09-19 16:58:25.253	\N	2015-09-19 16:58:25.253	\N	0		2015-09-22 09:58:25.253	2 couverts	2015-09-18 16:58:25.253	2 couverts	PROMOTION	1	0.100000000000000006	\N	10		13	1
Promotion	32	2015-09-19 16:58:25.258	\N	2015-09-19 16:58:25.258	\N	0		2015-09-22 20:58:25.258	steaks de saumon	2015-09-18 16:58:25.258	Steaks de saumon	PROMOTION	1	0.72222222222222221	18	8		13	1
BusinessNotification	33	2015-09-19 16:58:25.263	\N	2015-09-19 16:58:25.263	\N	0		2015-09-19 19:58:25.263	vous revez d'un combishort pour l'ete? ils vous attendent!	2015-09-18 16:58:25.263	Vous rêvez d'un combishort pour l'été? Ils vous attendent!	NOTIFICATION	\N	\N	\N	\N	\N	14	7
BusinessNotification	34	2015-09-19 16:58:28.288	\N	2015-09-19 16:58:28.288	\N	0		2015-09-19 21:58:28.288	le jeans est partout... depechez vous de regarnir votre garde-robe!	2015-09-18 16:58:28.288	Le jeans est partout... Dépêchez vous de regarnir votre garde-robe!	NOTIFICATION	\N	\N	\N	\N	\N	14	\N
BusinessNotification	35	2015-09-19 16:58:33.968	\N	2015-09-19 16:58:33.968	\N	0	Viviane vous attend pour prendre vos mesures. Comptez maximum 48h et venez récuper votre robe!	2015-09-20 01:58:33.968	retouches gratuites sur vos robes de soiree jusqu'aux soldes!	2015-09-18 16:58:33.968	Retouches gratuites sur vos robes de soirée jusqu'aux soldes!	NOTIFICATION	\N	\N	\N	\N	\N	14	\N
BusinessNotification	36	2015-09-19 16:58:36.255	\N	2015-09-19 16:58:36.255	\N	0		2015-09-21 11:58:36.255	seance relooking chez ms mode ce vendredi soir. inscriptions ouvertes!	2015-09-18 16:58:36.255	Séance relooking chez MS Mode ce vendredi soir. Inscriptions ouvertes!	NOTIFICATION	\N	\N	\N	\N	\N	14	\N
BusinessNotification	37	2015-09-19 16:58:36.767	\N	2015-09-19 16:58:36.767	\N	0		2015-09-22 20:58:36.767	que pensez-vous du nouvel arrivage?..	2015-09-18 16:58:36.767	Que pensez-vous du nouvel arrivage?..	NOTIFICATION	\N	\N	\N	\N	\N	14	7
Promotion	38	2015-09-19 16:58:39.894	\N	2015-09-19 16:58:39.894	\N	0		2015-09-19 19:58:39.894	chapeaux de mariage	2015-09-18 16:58:39.894	Chapeaux de mariage	PROMOTION	\N	0.149999999999999994	\N	\N		14	7
Promotion	39	2015-09-19 16:58:44.067	\N	2015-09-19 16:58:44.067	\N	0		2015-09-20 01:58:44.067	bottes daim bouvy	2015-09-18 16:58:44.067	Bottes daim BOUVY	PROMOTION	\N	0.200000000000000011	\N	\N		14	7
Promotion	40	2015-09-19 16:58:45.828	\N	2015-09-19 16:58:45.828	\N	0		2015-09-19 19:58:45.828	vestes cuir chanel	2015-09-18 16:58:45.828	Vestes cuir CHANEL	PROMOTION	1	0.300000000000000044	399	5		14	7
BusinessNotification	41	2015-09-19 16:58:48.623	\N	2015-09-19 16:58:48.623	\N	0	Demandez-nous quels produits correspondent le mieux à votre peau!	2015-09-23 07:58:48.623	tous nos produits sont sans ammoniac pour limiter l'agression de votre peau!	2015-09-18 16:58:48.623	Tous nos produits sont sans ammoniac pour limiter l'agression de votre peau!	NOTIFICATION	\N	\N	\N	\N	\N	15	\N
BusinessNotification	42	2015-09-19 17:00:09.503	\N	2015-09-19 17:00:09.503	\N	0		2015-09-20 02:00:09.503	avez-vous deja essayer le nouveau soin loreal?	2015-09-18 17:00:09.503	Avez-vous déjà essayer le nouveau soin LOREAL?	NOTIFICATION	\N	\N	\N	\N	\N	15	9
BusinessNotification	43	2015-09-19 17:00:20.574	\N	2015-09-19 17:00:20.574	\N	0		2015-09-21 12:00:20.574	votre coiffeuse elise sera en conge du 10 au 22 juillet.	2015-09-18 17:00:20.574	Votre coiffeuse Elise sera en congé du 10 au 22 juillet.	NOTIFICATION	\N	\N	\N	\N	\N	15	\N
BusinessNotification	44	2015-09-19 17:00:21.817	\N	2015-09-19 17:00:21.817	\N	0		2015-09-20 00:00:21.817	n'oubliez pas de proteger egalement vos cheveux du soleil!	2015-09-18 17:00:21.817	N'oubliez pas de protéger également vos cheveux du soleil!	NOTIFICATION	\N	\N	\N	\N	\N	15	\N
BusinessNotification	45	2015-09-19 17:00:28.673	\N	2015-09-19 17:00:28.673	\N	0	Hé oui, la mode passe par le cuivre.\nCouleur chaude avec du soleil et agréable en soirée, laissez-vous tenter par cette exclusivité à Bruxelles!	2015-09-23 19:00:28.672	et si vous tentiez un peu plus de cuivre dans vos cheveux?!	2015-09-18 17:00:28.672	Et si vous tentiez un peu plus de cuivre dans vos cheveux?!	NOTIFICATION	\N	\N	\N	\N	\N	15	\N
Promotion	46	2015-09-19 17:00:52.057	\N	2015-09-19 17:00:52.057	\N	0		2015-09-19 22:00:52.057	brushing (tous les lundis)	2015-09-18 17:00:52.057	Brushing (tous les lundis)	PROMOTION	\N	0.149999999999999994	\N	\N		15	9
Promotion	47	2015-09-19 17:00:54.23	\N	2015-09-19 17:00:54.23	\N	0		2015-09-20 16:00:54.23	lumino contrast (l'oreal)	2015-09-18 17:00:54.23	Lumino Contrast (L'Oréal)	PROMOTION	1	0.200000000000000011	19	35		15	9
BusinessNotification	48	2015-09-19 17:00:58.348	\N	2015-09-19 17:00:58.348	\N	0		2015-09-22 10:00:58.348	nouvel arrivage juste pour votre terrasse!	2015-09-18 17:00:58.348	Nouvel arrivage juste pour votre terrasse!	NOTIFICATION	\N	\N	\N	\N	\N	16	8
BusinessNotification	49	2015-09-19 17:01:02.976	\N	2015-09-19 17:01:02.976	\N	0		2015-09-23 08:01:02.976	et si ajoutiez un peu de home-made dans votre deco?	2015-09-18 17:01:02.976	Et si ajoutiez un peu de Home-Made dans votre déco?	NOTIFICATION	\N	\N	\N	\N	\N	16	8
BusinessNotification	50	2015-09-19 17:01:23.255	\N	2015-09-19 17:01:23.255	\N	0		2015-09-20 02:01:23.255	des bougies aux milles senteurs!	2015-09-18 17:01:23.255	Des bougies aux milles senteurs!	NOTIFICATION	\N	\N	\N	\N	\N	16	8
BusinessNotification	51	2015-09-19 17:01:44.315	\N	2015-09-19 17:01:44.315	\N	0		2015-09-21 12:01:44.315	nous vous proposons des stages de bricolage pour vos enfants!	2015-09-18 17:01:44.315	Nous vous proposons des stages de bricolage pour vos enfants!	NOTIFICATION	\N	\N	\N	\N	\N	16	14
BusinessNotification	52	2015-09-19 17:02:12.768	\N	2015-09-19 17:02:12.768	\N	0		2015-09-20 00:02:12.768	des idees depuis nos vacances!	2015-09-18 17:02:12.768	Des idées depuis nos vacances!	NOTIFICATION	\N	\N	\N	\N	\N	16	8
Promotion	53	2015-09-19 17:02:22.938	\N	2015-09-19 17:02:22.938	\N	0		2015-09-23 19:02:22.938	serviettes funny	2015-09-18 17:02:22.938	Serviettes FUNNY	PROMOTION	\N	0.149999999999999994	\N	\N		16	8
Promotion	54	2015-09-19 17:02:26.138	\N	2015-09-19 17:02:26.138	\N	0		2015-09-19 22:02:26.138	fauteuils chill	2015-09-18 17:02:26.138	Fauteuils CHILL	PROMOTION	\N	0.100000000000000006	\N	\N		16	8
Promotion	55	2015-09-19 17:02:35.473	\N	2015-09-19 17:02:35.473	\N	0		2015-09-22 01:02:35.473	tables 4 personnes gardenor	2015-09-18 17:02:35.473	Tables 4 personnes GARDENOR	PROMOTION	\N	0.922779922779922823	259	\N		16	8
BusinessNotification	56	2015-09-19 17:02:47.572	\N	2015-09-19 17:02:47.572	\N	0		2015-09-22 10:02:47.572	et voici notre cocktail de l'ete a gouter de toute urgence!	2015-09-18 17:02:47.572	Et voici notre cocktail de l'été… A goûter de toute urgence!	NOTIFICATION	\N	\N	\N	\N	\N	17	2
BusinessNotification	57	2015-09-19 17:04:28.388	\N	2015-09-19 17:04:28.388	\N	0	Entrée 10€\nPrévente 8€\nLes organisateurs se réservent le droit d'entrée.	2015-09-22 21:04:28.388	soiree speciale latino ce vendredi!	2015-09-18 17:04:28.388	Soirée spéciale Latino ce vendredi!	NOTIFICATION	\N	\N	\N	\N	\N	17	3
BusinessNotification	58	2015-09-19 17:04:30.742	\N	2015-09-19 17:04:30.742	\N	0		2015-09-19 20:04:30.742	la terrasse est ouverte pour le weekend!	2015-09-18 17:04:30.742	La terrasse est ouverte pour le weekend!	NOTIFICATION	\N	\N	\N	\N	\N	17	\N
BusinessNotification	59	2015-09-19 17:04:40.722	\N	2015-09-19 17:04:40.722	\N	0		2015-09-19 22:04:40.722	la delta nouvelle biere au clover!	2015-09-18 17:04:40.722	La Delta… Nouvelle bière au Clover!	NOTIFICATION	\N	\N	\N	\N	\N	17	2
BusinessNotification	60	2015-09-19 17:04:53.066	\N	2015-09-19 17:04:53.066	\N	0		2015-09-20 02:04:53.066	projection du match ce soir des 20h00!	2015-09-18 17:04:53.066	Projection du match ce soir dès 20h00!	NOTIFICATION	\N	\N	\N	\N	\N	17	3
BusinessNotification	61	2015-09-19 17:05:01.056	\N	2015-09-19 17:05:01.056	\N	0		2015-09-21 12:05:01.056	10 + 1 biere gratuite durant toute la coupe du monde!	2015-09-18 17:05:01.056	10 + 1 bière gratuite durant toute la coupe du monde!	NOTIFICATION	\N	\N	\N	\N	\N	17	2
Promotion	62	2015-09-19 17:05:01.06	\N	2015-09-19 17:05:01.06	\N	0		2015-09-22 21:05:01.06	mojito fraises	2015-09-18 17:05:01.06	Mojito Fraises	PROMOTION	\N	0.200000000000000011	\N	\N		17	2
BusinessNotification	63	2015-09-19 17:05:01.079	\N	2015-09-19 17:05:01.079	\N	0	En salade, smoothie ou glace… Il y a 1001 façons d'utiliser ce succulent fruit!	2015-09-19 20:05:01.079	c'est la saison des mangues. rendez-vous au rayon fruits et legumes!	2015-09-18 17:05:01.079	C'est la saison des mangues. Rendez-vous au rayon fruits et légumes!	NOTIFICATION	\N	\N	\N	\N	\N	18	1
BusinessNotification	64	2015-09-19 17:05:26.307	\N	2015-09-19 17:05:26.307	\N	0		2015-09-22 10:05:26.307	alex, notre responsable 'bien-etre', vous conseille parmi nos cremes solaires.	2015-09-18 17:05:26.307	Alex, notre responsable 'Bien-Être', vous conseille parmi nos crêmes solaires.	NOTIFICATION	\N	\N	\N	\N	\N	18	9
BusinessNotification	65	2015-09-19 17:05:28.374	\N	2015-09-19 17:05:28.374	\N	0		2015-09-23 08:05:28.374	pensez au self-scan pour gagner du temps!	2015-09-18 17:05:28.374	Pensez au self-scan pour gagner du temps!	NOTIFICATION	\N	\N	\N	\N	\N	18	\N
BusinessNotification	66	2015-09-19 17:05:32.491	\N	2015-09-19 17:05:32.491	\N	0	Nos amis scouts préparent déjà leur prochain voyage et vous accueillent tous les soirs de 18 à 20h à notre caisse. Une petite pièce, un gros billet, tout est bon!  :o)	2015-09-20 02:05:32.491	les scouts de saint dominique financent leur voyage a nos caisses!	2015-09-18 17:05:32.491	Les scouts de Saint Dominique financent leur voyage à nos caisses!	NOTIFICATION	\N	\N	\N	\N	\N	18	\N
BusinessNotification	67	2015-09-19 17:07:03.085	\N	2015-09-19 17:07:03.085	\N	0		2015-09-21 12:07:03.085	la delta est egalement disponible chez nous!	2015-09-18 17:07:03.085	La Delta est également disponible chez nous!	NOTIFICATION	\N	\N	\N	\N	\N	18	5
Promotion	68	2015-09-19 17:07:14.808	\N	2015-09-19 17:07:14.808	\N	0		2015-09-20 00:07:14.808	decoration 'paques'	2015-09-18 17:07:14.808	Décoration 'Pâques'	PROMOTION	\N	0.149999999999999994	\N	\N		18	8
Promotion	69	2015-09-19 17:07:52.403	\N	2015-09-19 17:07:52.403	\N	0		2015-09-23 19:07:52.403	poulets rotis	2015-09-18 17:07:52.403	Poulets rôtis	PROMOTION	\N	0.200000000000000011	\N	\N		18	1
Promotion	70	2015-09-19 17:08:00.358	\N	2015-09-19 17:08:00.358	\N	0		2015-09-19 22:08:00.358	sauce devos lemmens	2015-09-18 17:08:00.358	Sauce DEVOS LEMMENS	PROMOTION	\N	0.100000000000000006	\N	\N		18	5
Promotion	71	2015-09-19 17:08:32.604	\N	2015-09-19 17:08:32.604	\N	0		2015-09-20 00:08:32.604	tables ping-pong jeanmi	2015-09-18 17:08:32.604	Tables Ping-Pong JEANMI	PROMOTION	1	0.100000000000000006	179	3		18	5
Promotion	72	2015-09-19 17:09:11.664	\N	2015-09-19 17:09:11.664	\N	0		2015-09-22 01:09:11.664	velo enfants eddi	2015-09-18 17:09:11.664	Vélo Enfants EDDI	PROMOTION	1	0.149999999999999994	85	5		18	14
\.


--
-- Name: abstractpublication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: play
--

SELECT pg_catalog.setval('abstractpublication_id_seq', 72, true);


--
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: play
--

COPY account (dtype, id, creationdate, creationuser, lastupdate, lastupdateuser, version, authenticationkey, email, firstname, gender, lang, lastname, role, sendnotificationbydefault, type, selectedaddress_id) FROM stdin;
Account	1	\N	\N	\N	\N	0	\N	florian.jeanmart@gmail.com	Florian	MALE	fr	Jeanmart	SUPERADMIN	t	CUSTOMER	\N
Account	2	\N	\N	\N	\N	0	\N	gil.knops@krings-law.be	Florian	MALE	fr	Jeanmart	SUPERADMIN	t	CUSTOMER	\N
Account	3	\N	\N	\N	\N	0	\N	greg.malcause@gmail.com	Florian	MALE	fr	Jeanmart	SUPERADMIN	t	CUSTOMER	\N
BusinessAccount	13	2015-09-19 16:50:07.142	\N	2015-09-19 16:50:07.142	\N	0	JzsqnfhvXmbTimVMp4owSrhbAZb5fwm1+F9Mb/C+aqu3SWNRzt3wy9LnWC/iQ0Mc	pain@business.com	L'amie du pain	MALE	fr	L'amie du pain	BUSINESS	t	BUSINESS	\N
BusinessAccount	14	2015-09-19 16:51:00.665	\N	2015-09-19 16:51:00.665	\N	0	mjKPggYzSXCZl8ItqDFKxjbg1a2hutHn0opTAC9s/m59m2evZMo/S6TfNn0ytdsg	boucherie@business.com	La Bouche Rit	MALE	fr	La Bouche Rit	BUSINESS	t	BUSINESS	\N
BusinessAccount	15	2015-09-19 16:51:29.558	\N	2015-09-19 16:51:29.558	\N	0	9gSmtSbVkjy/cwUUdaJ2/a0dD23aZNNHX0SBE2Ff/o3pTTzyW7DnwkDT4Vub8SxA	piscine@business.com	Piscine 'Ibiza'	MALE	fr	Piscine 'Ibiza'	BUSINESS	t	BUSINESS	\N
BusinessAccount	16	2015-09-19 16:51:49.319	\N	2015-09-19 16:51:49.319	\N	0	c1g6qfWSZHy9ph4NxS8jklh4+GooajTxYuQfwRXJnz7tCAN/YM7ZP1yOTQKVONfD	villa@business.com	Villa Lorraine	MALE	fr	Villa Lorraine	BUSINESS	t	BUSINESS	\N
BusinessAccount	17	2015-09-19 16:51:58.989	\N	2015-09-19 16:51:58.989	\N	0	ghUc0ZYavGfQ3UKajo8bQU/ZmGhX3Ggrx1upZ9mWhgFo0AAzq7kNjhFcyMHGOKH2	mode@business.com	MS Mode	MALE	fr	MS Mode	BUSINESS	t	BUSINESS	\N
BusinessAccount	18	2015-09-19 16:52:19.209	\N	2015-09-19 16:52:19.209	\N	0	L1d13aQxerYj+2VuZkZz1jvryio2UfJAaDOjHIgC8zRRPHnbbS3gJQUqyjYFFhMk	coiffeur@business.com	Tif & Tondu	MALE	fr	Tif & Tondu	BUSINESS	t	BUSINESS	\N
BusinessAccount	19	2015-09-19 16:52:35.064	\N	2015-09-19 16:52:35.064	\N	0	JFU1D1d2JoHqVWYdDNKQyUGRftdx0LknFzfxPdFn+M92WjL+MNLk3UTIie2cQZ5r	traiteur@business.com	Jany Deco	MALE	fr	Jany Deco	BUSINESS	t	BUSINESS	\N
BusinessAccount	20	2015-09-19 16:52:59.41	\N	2015-09-19 16:52:59.41	\N	0	kvV/7bffYI6wbp4cTwcv2h/hmYrrtOd8YdpzMbwHfUdd5P/qqa20Gb+laHoyL/kJ	bar@business.com	Clover Bar	MALE	fr	Clover Bar	BUSINESS	t	BUSINESS	\N
BusinessAccount	21	2015-09-19 16:53:24.526	\N	2015-09-19 16:53:24.526	\N	0	5IxAKxti4u3vksO7x4qEURYOLPKjv7XZX6He0eosTE1ClSlFL7Go/um9dfG7OeK+	jacketannie@business.com	Supermarket "Jack & Annie"	MALE	fr	Supermarket "Jack & Annie"	BUSINESS	t	BUSINESS	\N
\.


--
-- Data for Name: account_customerinterest; Type: TABLE DATA; Schema: public; Owner: play
--

COPY account_customerinterest (account_id, customerinterests_id) FROM stdin;
\.


--
-- Name: account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: play
--

SELECT pg_catalog.setval('account_id_seq', 21, true);


--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: play
--

COPY address (id, creationdate, creationuser, lastupdate, lastupdateuser, version, city, country, name, posx, posy, street, zip, account_id) FROM stdin;
10	2015-09-19 16:50:07.249	\N	2015-09-19 16:50:07.249	\N	0	Auderghem	Belgique	\N	50.8137793000000002	4.42598799999999937	Boulevard du Souverain 230	1160	\N
11	2015-09-19 16:51:00.781	\N	2015-09-19 16:51:00.781	\N	0	Auderghem	Belgique	\N	50.8126350000000002	4.42786819999999981	Boulevard du Souverain 63	1160	\N
12	2015-09-19 16:51:29.671	\N	2015-09-19 16:51:29.671	\N	0	Auderghem	Belgique	\N	50.7946416999999997	4.47961410000000004	Chaussée de Wavre 6	1160	\N
13	2015-09-19 16:51:49.432	\N	2015-09-19 16:51:49.432	\N	0	Auderghem	Belgique	\N	50.8203256999999979	4.42841769999999979	Boulevard du Souverain 6	1160	\N
14	2015-09-19 16:51:59.099	\N	2015-09-19 16:51:59.099	\N	0	Auderghem	Belgique	\N	50.8185288999999969	4.42785290000000042	Boulevard du Souverain 630	1160	\N
15	2015-09-19 16:52:19.333	\N	2015-09-19 16:52:19.333	\N	0	Auderghem	Belgique	\N	50.8036032999999989	4.44229839999999943	Avenue Schaller 105	1160	\N
16	2015-09-19 16:52:35.172	\N	2015-09-19 16:52:35.172	\N	0	Auderghem	Belgique	\N	50.8092894999999984	4.43650309999999859	Avenue Schaller 1	1160	\N
17	2015-09-19 16:52:59.515	\N	2015-09-19 16:52:59.515	\N	0	Auderghem	Belgique	\N	50.8089167999999987	4.43687960000000015	Avenue Schaller 15	1160	\N
18	2015-09-19 16:53:24.634	\N	2015-09-19 16:53:24.634	\N	0	Auderghem	Belgique	\N	50.8197121999999979	4.42898019999999981	Boulevard du Souverain 68	1160	\N
\.


--
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: play
--

SELECT pg_catalog.setval('address_id_seq', 18, true);


--
-- Data for Name: business; Type: TABLE DATA; Schema: public; Owner: play
--

COPY business (id, creationdate, creationuser, lastupdate, lastupdateuser, version, askpublicationdate, businessstatus, description, email, name, phone, searchablename, deliverylink, ecommercelink, facebooklink, instagramlink, opinionlink, reservationlink, twitterlink, website, account_id, address_id, illustration_id, landscape_id) FROM stdin;
10	2015-09-19 16:50:07.142	\N	2015-09-19 16:51:00.789	\N	1	\N	PUBLISHED	L'Amie du Pain, boulangerie artisanale depuis 1972, vous  propose une large gamme de pains bio et cuits sur pierre.\nVenez également découvrir notre rayon de produits sans gluten, mais pas sans goût!	pain@business.com	L'amie du pain	+32 123 45 66	l'amie du pain	\N	\N	\N	\N	\N	\N	\N	\N	13	10	20	19
11	2015-09-19 16:51:00.665	\N	2015-09-19 16:51:29.679	\N	1	\N	PUBLISHED	Une boucherie où vous trouverez des viandes découpées sur place dans des viandes de qualité.\nTous les jours, les bouchers vous préparent de savoureuses viandes marinées que vous pouvez réserver également via le site internet.	boucherie@business.com	La Bouche Rit	+32 123 45 67	la bouche rit	\N	\N	\N	\N	\N	\N	\N	\N	14	11	22	21
12	2015-09-19 16:51:29.558	\N	2015-09-19 16:51:49.438	\N	1	\N	PUBLISHED	Notre piscine vous accueille tous les jours de la semaine dans ses installations toutes neuves et son eau toujours à 28°C!	piscine@business.com	Piscine 'Ibiza'	+32 123 45 68	piscine 'ibiza'	\N	\N	\N	\N	\N	\N	\N	\N	15	12	24	23
13	2015-09-19 16:51:49.319	\N	2015-09-19 16:51:59.106	\N	1	\N	PUBLISHED	Perdue au milieu du Parc de la Woluwe, la Villa Lorraine dispose d'une grande terrasse ensoleillée où il fait bon se retrouver entre amis après le boulot.\nRéservez également votre table pour un dîner aux chandelles ou entre collègues et laisser vous suprendre par notre chef étoilé!	villa@business.com	Villa Lorraine	+32 123 45 69	villa lorraine	\N	\N	\N	\N	\N	\N	\N	\N	16	13	26	25
14	2015-09-19 16:51:58.989	\N	2015-09-19 16:52:19.34	\N	1	\N	PUBLISHED	Venez passer la porte du paradis des robes et des chapeaux.\nUn choix vaste et des conseils personnalisés pour toutes les envies et tous les genres!	mode@business.com	MS Mode	+32 123 45 70	ms mode	\N	\N	\N	\N	\N	\N	\N	\N	17	14	28	27
15	2015-09-19 16:52:19.209	\N	2015-09-19 16:52:35.179	\N	1	\N	PUBLISHED	Chez Tif & Tondu, nous voulons créer les conditions pour que vous expérimentiez un traitement personnalisé, de qualité et où le temps n’est pas compté. Nous mettons tout en œuvre pour que votre passage chez nous soit un vrai moment de détente et de plaisir.	coiffeur@business.com	Tif & Tondu	+32 123 45 71	tif & tondu	\N	\N	\N	\N	\N	\N	\N	\N	18	15	30	29
16	2015-09-19 16:52:35.064	\N	2015-09-19 16:52:59.524	\N	1	\N	PUBLISHED	Jany Deco est un magasin qui mêle passion et maison. Venez dénicher l'objet qui finira d'habiller votre salon, terasse ou même salle-de-bain!	traiteur@business.com	Jany Deco	+32 123 45 73	jany deco	\N	\N	\N	\N	\N	\N	\N	\N	19	16	32	31
17	2015-09-19 16:52:59.41	\N	2015-09-19 16:53:24.643	\N	1	\N	PUBLISHED	Situé dans l'artère commerciale de l'avenue Roland à Woluwé-Saint-Lambert, le Clover Bar  vous accueille pour déguster une de ses 50 bières spéciales à la carte. Si le houblon ne vous tente pas, vous succomberez aux charmes de nos cocktails maison!	bar@business.com	Clover Bar	+32 123 45 74	clover bar	\N	\N	\N	\N	\N	\N	\N	\N	20	17	34	33
18	2015-09-19 16:53:24.526	\N	2015-09-19 16:53:33.924	\N	1	\N	PUBLISHED	Jack & Annie vous accueillent depuis 1988 dans leur épicerie de quartier basée sur 2 étage. Parking facile et photomaton à disposition!	jacketannie@business.com	Supermarket "Jack & Annie"	+32 123 45 75	supermarket "jack & annie"	\N	\N	\N	\N	\N	\N	\N	\N	21	18	36	35
\.


--
-- Data for Name: business_category; Type: TABLE DATA; Schema: public; Owner: play
--

COPY business_category (business, category) FROM stdin;
10	34
11	32
12	148
13	28
14	51
15	66
16	41
17	20
18	31
\.


--
-- Name: business_id_seq; Type: SEQUENCE SET; Schema: public; Owner: play
--

SELECT pg_catalog.setval('business_id_seq', 18, true);


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
13	2015-09-19 16:50:07.197	\N	2015-09-19 16:50:07.197	\N	0	f	doL2MqdN9qdgkdPJWS9bzGO3eGffLy02vJ626+GUCNMOxHtEsBwHgp/0JQDDTAjT	13
14	2015-09-19 16:51:00.727	\N	2015-09-19 16:51:00.727	\N	0	f	0cnV0bORPA5q4MuKG2xYdKQz+oYP1kI9u5M5JK2PtOJFX4lIrzt0cKhwAZRYE1bH	14
15	2015-09-19 16:51:29.617	\N	2015-09-19 16:51:29.617	\N	0	f	KG5zArQ1RTDaA3LxYoJPEuV7iyS6I+PcgBOyybUrAOqDHQv6CAVTzu+vfI9LaK7k	15
16	2015-09-19 16:51:49.378	\N	2015-09-19 16:51:49.378	\N	0	f	/dloqE6EJhNzHrC154rYhYWG5s5kduw6UmZ2vzaqYn80H7LEZeJ4Pys2brDcBWBi	16
17	2015-09-19 16:51:59.047	\N	2015-09-19 16:51:59.047	\N	0	f	wBUyzgAQR8y4VbwDvMJR5QCSdZRURs3dCRG5wEqFUw42pYdjwfdL2t2O78qtmUDl	17
18	2015-09-19 16:52:19.282	\N	2015-09-19 16:52:19.282	\N	0	f	8I/bWSKn93QwWbDv6csNLnmP/ZH/e+L0wJmJC5cX50i56Tt8d/lWIZTVuN7btwxd	18
19	2015-09-19 16:52:35.119	\N	2015-09-19 16:52:35.119	\N	0	f	pLMNW171HYmkOf53x+HgHestdjIzFUjSZQ1gCzcVHRqFENyVQx3/TKCXubIqoYWa	19
20	2015-09-19 16:52:59.463	\N	2015-09-19 16:52:59.463	\N	0	f	4odzaqoVTxeON/hhGIOBwzOzSEbw1RS5WPVjVCahz2VD4BQeilbwMZHGqVFNDAtF	20
21	2015-09-19 16:53:24.58	\N	2015-09-19 16:53:24.58	\N	0	f	gnarLiokr1KFdztcZSZjXrECe6BSBTjvgwkeYM9fZqWqw3IIeOxuelTN1Z+fCxcs	21
\.


--
-- Name: logincredential_id_seq; Type: SEQUENCE SET; Schema: public; Owner: play
--

SELECT pg_catalog.setval('logincredential_id_seq', 21, true);


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
19	2015-09-19 16:50:16.204	\N	2015-09-19 16:50:16.204	\N	0	\N	0	f	temp-file-name8999500804388441302.tmp	0	MXPaEZi0uErrU5Zpj88HhFgmUAKnkLIWRGiZD5ksePCG8JYhjJri6fGnMeKSjNO5MOKzcfMY9HelViZCOiROzSUPMziYQvIysxUi	QI4doAUvw5HO6vQIRc3UrHWI5Hwy9DpkK9sh3RtoqOKj57IU4PWJd7jdLa4G4ZnuQDvpESKkULxvfoo3yPlFpgK0f3qhy0PLds7M	13	\N	\N
20	2015-09-19 16:50:43.893	\N	2015-09-19 16:50:43.893	\N	0	\N	0	f	temp-file-name8108321814517818475.tmp	0	PPaUVX0ahwqN9RYOoRnGvrOz66b1tFH0vqhuHMGIqPHkjG3PUCPVzyNMxUN2xetXKueeybR8oh5XY0BqQTgCZDGKoVtWLq0APCqr	sMIhpDxZmLpAuTdCulPRSyPDlDCPP8ytpg3bYnS62VqV4QYpqSqLAY0Pie49Traiprlm85pkPZyIWvx3UM0nFIKJUVIeBduqVkuA	13	\N	\N
21	2015-09-19 16:51:14.697	\N	2015-09-19 16:51:14.697	\N	0	\N	0	f	temp-file-name8673084557420779344.tmp	0	u3t6RaJr3MFNQ748uG8xUihtzvY5najZLwfjtZDLgVQS9r6OZEQkEi5JzrYLbKVHqk6j3EowG9yL2vVe98g2PG6FsaZeRTh210Lp	msZp19BG3dn5ozlvqOF6VpzNH2EN1sJlMSbh5IZMxQtpDSoHJuF5jvRMXNt3NGDArIOiOSvCrBXdaZmdmJSJZnEuDcYHmlHdbHPz	14	\N	\N
22	2015-09-19 16:51:28.955	\N	2015-09-19 16:51:28.955	\N	0	\N	0	f	temp-file-name4764576778970711772.tmp	0	CpOpsL8Stx6jfxICsYU3rsPOGteVktBsq1yR6iHM2kanuwgZBOhDh2HPXaLAxOZa1hC7rJBoPJRF9auTXUF9JVAZt4r2JfIg7aAv	MAOU7tZxtTiJxsNy4lm4LffyNEzHqGSMg8Js70KH3sWV2TtKYICWu8nnB6nVfNIt6Dfk552WHq7g6iEt4GyDg260ISdlUyHIAARy	14	\N	\N
23	2015-09-19 16:51:36.635	\N	2015-09-19 16:51:36.635	\N	0	\N	0	f	temp-file-name1817385065532737141.tmp	0	2PW0CnDCmflabUOV3xZovmLCzvh7nqLpsRjibfqtXLC2asfVG31diPRF4GZpSZ2R5x9pbKGvD6b6Ah3AY75we633DfdS0LSe1UbZ	hkPqZXThuB5tHS8FisLuM4KRGW7n9uY0LpDFREql5dWLDZmKSrKiBhEID24rwVeCREqs4Zf8MpTtRHvkrs8JcK1ssZ52BegZujjR	15	\N	\N
24	2015-09-19 16:51:48.125	\N	2015-09-19 16:51:48.125	\N	0	\N	0	f	temp-file-name6854481984464886401.tmp	0	z7TetEcL41G24fAo8FO75SwupY95YZrc7vmL9KK84LRx8Dxb0qES1dlquEdb8gRCj8cQ5lSg8jGdlzuRG1T5NMTkMWGtrMyNaUEj	R7ojxl5XoYSB779YRjowrHK0NiSZHfZDjrJuqNsrRpSrTE791IgeQeUbr7EAMmPls7W1IQWvsiYqT0uzWzStWDIsJvVceCHZkBqe	15	\N	\N
25	2015-09-19 16:51:53.316	\N	2015-09-19 16:51:53.316	\N	0	\N	0	f	temp-file-name3835951636641368004.tmp	0	ABDtPUkB2KZIkgs1kodqW0bOcHQUG9LefNxX9ZuR2bNUgPZFLUcSzOy8mYX049pKL2qUu1vet7e7ytUmkdSjYesN4tjnMXGEzact	TaOPDBOr3zwZxh0clTokNwJm65fGkqzk9PUe8hqCMJqmopz01a6WLULe15OwPhI15oEOpim6K7DCC3IG5r56feiYVYVtNosHXdxK	16	\N	\N
26	2015-09-19 16:51:57.988	\N	2015-09-19 16:51:57.988	\N	0	\N	0	f	temp-file-name5242846837147320433.tmp	0	w9c34eV9w48GUYVUVIsNeY5XFjHKik1StKlYRAhc8cVacnDqg4VolACPAPjS0visqfsqAQLfPxvfbWy8dGVcaqVzVx4pryrACV8K	en8GX10nEBRKJ6IvB4ngn9H8DPgv8bWfqGZAKaGu4GMwaDrgq64isBfPll8l8qscPbAvecEUiohI92SyyEirfUZax7v4CllCzfiR	16	\N	\N
27	2015-09-19 16:52:06.644	\N	2015-09-19 16:52:06.644	\N	0	\N	0	f	temp-file-name9217798460622896596.tmp	0	Mij17G6uheEZiIgP8n7zRflu3QtNWI1C5U39TvALRW1DwYfC3mOCxduFaAcFEOvqt6o8rqz9uFzNO07Jzr9LNwe8aq18Tlo9jj5J	3h2E9y1FRL2dRh2OLBdyXIfDkljlvqdgSBxcme5031fri8pf6tdiH9LwXCaGU4HxTkhyVryzZcOGyO9RfhvaX5EkbddmyhC186z2	17	\N	\N
28	2015-09-19 16:52:16.598	\N	2015-09-19 16:52:16.598	\N	0	\N	0	f	temp-file-name7321911110194341263.tmp	0	vW13p9jjajManSpqNccH0ji7ftVTLdBs5tHpAyoFbnLgnLdyOqnOXJOpHaQOsBjfGx1FwF0XPh1SxDEZQorwwrXhaR4PE9InP13j	8xTWuvMOSC0y2ZNlLtVAcy2EwKppKOrkxg24IH7AQWEJJuIAwMy3blPQMjVvw6AEuG2ghKoSYh0QsHFze3P63XsscYhebYJMA6CT	17	\N	\N
29	2015-09-19 16:52:26.866	\N	2015-09-19 16:52:26.866	\N	0	\N	0	f	temp-file-name4202965401550173974.tmp	0	vXKxJj794hnnbhGIqglfHDFqZ75q0JvERPv6jlTS0lqWmpBibLF7SSlCzbpIVDgyb2S6ot6XhyaiTGg7UZiosGKarf5nc07yKJfC	2pZZScjYOQYvb8m4uEMro6z0lvjDvP9pYPYZ6hkeM94E0W22zfQbXaM7Mzt5drUhaxuEWY8kozbyaipqWvegWhQ0uyodPnb3Tc8Z	18	\N	\N
30	2015-09-19 16:52:34.571	\N	2015-09-19 16:52:34.571	\N	0	\N	0	f	temp-file-name2769520709786873579.tmp	0	NoNTZAUeYDv6j3zEAOhHlN27h31SOWIxhMsdG0Ef86wYcK7N5guD1EeafrUd3Wno8vdhvNYQd8lz4ADLWH6CKvhyZYxjFx5CeBUu	TcDGIMhALnnAxfGfNOthqBjNdWJKymugXBugug6cmfien2OuNU2XOfRvJsriMwOE3TQaNV2xj6CjbPU4qElVVTpm6xdtFiXev3cf	18	\N	\N
31	2015-09-19 16:52:46.667	\N	2015-09-19 16:52:46.667	\N	0	\N	0	f	temp-file-name8215662659213435897.tmp	0	WvcJHh4x8c8yVVRal9b79BDzcVcHn70Pq8PQ80HNKddaRVf8WcPBX6hd5a5TQPuAxLLR4vl0OFZEKn0pax4hvTZ7XKlWcM5YClPE	EkWfWziuZ6rlHGYcrpDcqAqt8nNORnmnPm5lOYRw6RNn1AR55GMj7S7R2cST8x0u9768SuMN7Vm6Imxe4pG8SgLC43KwZrA8Dmob	19	\N	\N
32	2015-09-19 16:52:58.763	\N	2015-09-19 16:52:58.763	\N	0	\N	0	f	temp-file-name1394423021039989383.tmp	0	uWaAnF6DvkRxMEIXbEB5gFuG4Fp6lUle3ayQLWH6y3hktLtM5T9Y923R3BITgEiYf9E069rBzxbkIjMhhJtv8EN8xpAmHA29Sd2b	RfaDTQS9fjlRVk1WnljU62nXtVtDmSpKZrdSPlUrcUemtHOjyNK7irrSrgJfz9smiM5zozSwhm3Z5mjegqxYNm5yUm1uRVIGx8cT	19	\N	\N
33	2015-09-19 16:53:11.589	\N	2015-09-19 16:53:11.589	\N	0	\N	0	f	temp-file-name6384750306222345964.tmp	0	pjjVC2nYXK8EUpaJv2B5mnwdKkwkEnoWP1b299lcrX377BbqhcAhz870ueE0N3fJHmDFR94R3jQgz9R7m9jqqHH42n0hRFoQAlkA	dhYUzUCvXvJXa1tB68UW2kWpJcYs2UKzPuxuKri6IfAXfqG0g56K2bcspqu2A5NAZnnvU7LeajsU90ef7FgHI30iaZtk2O0kroPf	20	\N	\N
34	2015-09-19 16:53:23.524	\N	2015-09-19 16:53:23.524	\N	0	\N	0	f	temp-file-name5915651931847914801.tmp	0	M8ksP3NkksHq9unUsuc9qzRnEiRIBBPaqDlHUpB8F5KyWqg21MDN4e2K0uCY76kEB8mk217SWDExJjbxSMHcSBkUwh2XEEw4c5eY	R16dzQ1hD9Smg9FTUENqnMNfoOftvsKjb5VtbdLFxIeZVsgmNPW5X6dOVbvhhls3ptjGkV81lvui5puEbT68JLU2BPHus1rWjWy2	20	\N	\N
35	2015-09-19 16:53:28.685	\N	2015-09-19 16:53:28.685	\N	0	\N	0	f	temp-file-name4223683947885453737.tmp	0	xFJdiDWXCOTmBPlYgr3BrRv8fqsPPXhmLjEsjuA2jBFNsZx0YcJDr0KoXXIiy07B2GiXb8RpaRVhLAUJiV5w3KO5XB7iKsSF7yFx	xoqnhURtdwHEeFGdkTSIyP2JSKdlzslV6MkwnlZeDgsQciHQVMSU6Gs4ef2eIvBPOXZzMJEYzcC1uqHwOA6DNYL8gw0Uatf31JH3	21	\N	\N
36	2015-09-19 16:53:33.095	\N	2015-09-19 16:53:33.095	\N	0	\N	0	f	temp-file-name8505207670130665255.tmp	0	IAyvdFJi6gRTWGYe45SpZvZgGEq0HyojDdEMX6n0Ov9SxenmEHwKBSZxB4Vl7DX7k2sNLsbGvjMLzN9sGqmpM6woYr4BnSCZLnY7	p5mZRLCqpv6SFYqFy8SYKF2WpNW8Ndvu4bZBb7r1LyEIExbcj9Gpgmjj818cXq2NfoT2iwweYHtZ9ZG47dfaedC7ZLKoS8dKVghK	21	\N	\N
37	2015-09-19 16:53:37.299	\N	2015-09-19 16:53:40.685	\N	1	\N	0	f	temp-file-name2841625849909240013.tmp	0	lwiLjfDnfQWMTgmSWV9b1lMXTslmp3WqJTZcsfGCcxRhcH27ggvyoXNov0BTs220XlpozweenvfNEmLCVJL3LdNvYzYDx5Y4ibK2	pxLgP1V1dLPOqsLvB9fcrjuXmPUz3x95OHeSh8aV9WjIeuy2OvYD96QhOUlA1sDc32vY1E6hiNKtvlzceihNtvTGYAeN5SFKAJON	13	\N	2
38	2015-09-19 16:53:41.735	\N	2015-09-19 16:53:42.676	\N	1	\N	0	f	temp-file-name1395502541223014685.tmp	0	ftqzrGcIBvhpUEqgGZ0t4IxSGghR9TgseGAmcRUifAJDOJ4ZQLgMLQFHUbQdEHPcGYVpiWqwUQer2kI5dPZqWu3LIaspNJqNWiTa	StdmwfTcocoV6t0dD1BWHN7QnrYkAW7TFAijyvnLBZO2KwQHSuKL6ig8ayxIdocnLMsEa58hlhH4FW5SQzCW87AiWvA6s75PCEPq	13	\N	3
39	2015-09-19 16:53:43.78	\N	2015-09-19 16:53:44.668	\N	1	\N	0	f	temp-file-name4989891372614481133.tmp	0	V8BPvxBANvSlmbSHI3FELHmLnSdJ3yK4PvlqRa1K4ccV9GaqtW8PlJcOoOou7pvSdXOpOoCzuLYovDOjkkd2gdiS0AFKD93vbKGY	tCSbEEtcmlcjstt9MWee1cAN6FqWAFOhnEz9gCpfp8kee1lenrtLbFhp9S80NyCKmr2EZEx9RoeJCmdfMavuJS7Zm4FG6DvAvl0Q	13	\N	4
40	2015-09-19 16:53:46.015	\N	2015-09-19 16:53:47.198	\N	1	\N	0	f	temp-file-name7713484703490151172.tmp	0	68tg81WhDbcu5jajYeMDAIQkyQRBokBxaMkXZ7ixZNMS6NXB4BVK7hRtGCKLqloyUlh7truQGPV6VOlIDUAmtdEs5U3iyPx1DJIp	sPLpB4oS3CihzmJUviXac2CWHylnjPzkA9lghxNWYSbN1SnKdVTGp9gZAtdCk3ETXTkCDrSQBAexNO7k39oCycQh7MWKSFn5v4zw	13	\N	5
41	2015-09-19 16:53:48.787	\N	2015-09-19 16:53:50.127	\N	1	\N	0	f	temp-file-name8777024944253388177.tmp	0	q8dRs31ipH65t0ksqnYOGOMoxrYvbcoP8QHCIyH2Vgws55KfEvbRI8IyDiGtG0u42uwGOr2xb9AulxRlDc4fpeWmb78AtHBh4XuJ	RBci1JBzkMw6hhK6v5MvPORMiOUdr1OADWWodVkM42JQpPOyDyrB9l3t7mCF48tDvO0MMSLTcmsO5eUg4XNdITTO3zQpRlc7Q40t	13	\N	6
42	2015-09-19 16:53:56.004	\N	2015-09-19 16:54:01.523	\N	1	\N	0	f	temp-file-name3634121634897950836.tmp	0	Q2cYawj1wTUqLM6aap5S1eRqsfTUx51LFMkRIm62Ti3Su082eXrfIjuDAfJOgcI6hX1IwaBVAE4ixQsqZnl1cwUGxpT0HV9vzq5E	5dpkYqGMYfpY9g6IxY017xBRMrmGU2vR9P3deVwe888jGlJIIvDOqWaH8vh2aHVlbtia5EGwqqmiDL9irLp0Xu9lWkZN8scmugtW	14	\N	10
43	2015-09-19 16:54:13.923	\N	2015-09-19 16:54:25.569	\N	1	\N	0	f	temp-file-name4925223881362552041.tmp	0	wPPbba9neni9IU4dCl6P8endRGk5F9Jzz8aPKd86e7IFB0hGI4Qdh1au9lbn5nQ7xLzW9dm4znyunwdPF2Ryte6GdEMEcTZdJQdY	1PO9fvVS3AM5ebXVZ4cpa8yzLJHPdWogG2rm1TgueFlUEvxRpNWyaBRlx3VhzJ7JaS6ocLFOGmkX8lm6GPFlfsxyGvUFwY5BmYmb	14	\N	11
44	2015-09-19 16:54:28.059	\N	2015-09-19 16:54:30.084	\N	1	\N	0	f	temp-file-name8454229794921712956.tmp	0	9MC0iwRJzwrg4sk2bqfNyD07MnWiaYOoxLGt4Dh8dQ93QL4Lcp1lqzNpkcxXzciMZoWtcDzsCPGTuFLCm2Yly5pYUzNFY9DpN7kW	JVVaUWWIeuh1CkAHOyQBdYRelM0owEBWBdhRFRcVQs7CX0FhB3r6kBW7L7PWzzFmpDxbAsYB3Jzxr4cvZBb7HYZHX9lbAzuYyJyd	14	\N	12
45	2015-09-19 16:54:30.788	\N	2015-09-19 16:54:31.444	\N	1	\N	0	f	temp-file-name7633615859609289524.tmp	0	EBhQTZz9Wa9zMo3g1FwCz8rAT3EQrbT7ZtsXickIJE6QhIPHuP9WN4160FPdQq1RWwI4ONadZ8Ywi13qPdsqALWvWWcu72JEnjZ9	uE0swLmNrAjjE9XaHyaVPzuWJORy88G1o5jOMrCgCSYcZddoiAEBoDBR9j4zh27Ig2gZUe8d4Ua4B8C8FyU09jmdfXpEjWguxK9m	14	\N	13
46	2015-09-19 16:54:32.394	\N	2015-09-19 16:54:33.279	\N	1	\N	0	f	temp-file-name1152533244525397909.tmp	0	XESxwLy39k4Lf0pzqSTNLaKQFrJJJy0oVS7zp7GBM6gaFwdpj00FIGx0wJcHEGR0mMkVRPqpZyOQQoTUAcjs0grJ2SjXtxvT9bhB	TTPrsyeNlIpAacZNhSzJpd4gKV4o8NQ6fc367hMQAb4yYO8oCXLDnY1NXMdjQH4CApWQsRLiLuyX9wqlZCVTOjWOyD7zJIHyfC2w	14	\N	14
47	2015-09-19 16:54:34.957	\N	2015-09-19 16:54:36.677	\N	1	\N	0	f	temp-file-name745925686784307445.tmp	0	4LUy9pNnevOPRRpzSZyJ3VfkDa4x5YjP1YIzbvJJV6vMr0NWE0dWbE0iLTf8amwkpu3hAn81jQH9Kkho3ESfXM3xmLFDYvFBZayn	T2GluQD3ladwDp5lsFTtNW6n6KpQQI7eoWWmnd9xZqQpzbqJXf1xsHRRq62W5jKYyUXUvd0zSKFsiSMp3wvoroehBdfEZ7ACjBp1	14	\N	15
48	2015-09-19 16:54:38.123	\N	2015-09-19 16:54:39.522	\N	1	\N	0	f	temp-file-name6039109141995118166.tmp	0	ZiHZSBlDKYGpqSAU5woGeBiKQjJ3XkVut0AJ5IVxWXUQH2SxRH4Seu14TdAk0TmzfTHM864t5ca4oYwQgnNNiK6bwt0PdBDQ9FlI	gndk8XLHJgStYceAu6f8nvNyFFpz2qSOLjjJMCYnri3ELtGvdwAQ5KgpFygj9uQvZdRA6kz99Mh4MytksRZ9He94hF6LEXpd6Vz6	14	\N	16
49	2015-09-19 16:54:40.615	\N	2015-09-19 16:54:41.703	\N	1	\N	0	f	temp-file-name1301022991175106976.tmp	0	uiw0HrT7wcLLSJ8pitC7zaVwdtHXNOGqgEuEoG1VgzsB4RW2iugbsUXAwMNtTvHIsJ7QCQmha1LLtir27Kg17Ao3vy4dSFCzCuMV	MsPRyazzUFtMwFQOMHIdfVbhiRPONISt9k0cF6EoY1qwuQb4xoGhb5ezdgb5Z2x7XJVEn6VlbD0qWNLCMa5mAqJ3LxtQelalziWa	14	\N	17
50	2015-09-19 16:54:43.138	\N	2015-09-19 16:54:44.535	\N	1	\N	0	f	temp-file-name7517424840852990292.tmp	0	EDqtDb8Mde7RLQkbz8Ga03hLWJwSziJRBBHBExLXbHfotx7j98vx9Mxx8B5NEJfHgd55bUBIM24t6O3ZC7yiQiZ4Lyu9HsPmTvve	nXQTqkkJ2072EPLvuqy0jtAxQgQ9Apk60BN4VPQCrhC20oAI0tnuMMGXYoP2wDIbYg0sMH5z2hwCHUQ6wlM7leLlUvh1zDHtu5MA	14	\N	18
51	2015-09-19 16:54:46.249	\N	2015-09-19 16:54:47.873	\N	1	\N	0	f	temp-file-name356930172739965318.tmp	0	1QyKlyjT3VSs7sKwVscd7tbtR3syuN2gmv3FjnWglNb3D6lGfpq5QKES5T5GcdO5BlrsQsuGYwCYSXDsYj2Y77GcseAfwo5TPVV5	5sAIvtyeUHikwvI2aUX4cFsBCppsyqvBJrvWisgdaA1mn0yQTdZxtkRanwV6wuFTBl9FUQIdxdzWf1PdyqB7JHAZPMfrC8ttGMcb	15	\N	19
52	2015-09-19 16:55:40.046	\N	2015-09-19 16:56:31.201	\N	1	\N	0	f	temp-file-name2829499826571446501.tmp	0	QK7hWmDfh4oJFKk3PvbTcLUI9WRkWyIPvyXvrP0Su0wTKMtRBihFDRzINuo0KMRuu1r2CbMgTHl9WDi5LkpE3p58tELpFGkusX5g	De5lh2ZEtbmy5TPwjXNhFAfdN1Aqkph09GNEomPuvmHKxZ0US6pTQs863BOJjJWOLS8gl67aN5ao0TS5ZMFKsD9vkA3r5RlKPYeD	15	\N	20
53	2015-09-19 16:56:32.15	\N	2015-09-19 16:56:33.065	\N	1	\N	0	f	temp-file-name1552378793914471381.tmp	0	0W4hjh2mBjFtn4BXHJORBCmpVNAZW8526ex7SryugcSqBpNviB0dB5UpVYNbx2eH6S7cE2ey5hMTkkASgOGHaEQxWl0eYLlXH1PQ	xItN1EEffSlfUt6DHQlwKy7e6xHUYQS5rUFQJLK5umvyTYTWpIQYlRxcxLFJMWeCPKlylNVHCFvd5Prdz3rIFhnKFPQaovNGnekh	15	\N	21
54	2015-09-19 16:56:36.233	\N	2015-09-19 16:56:39.115	\N	1	\N	0	f	temp-file-name4722519164927941329.tmp	0	Xi6WfUnXVbcW3Pn4htr4tBBmGABHKAGKxcoZqaYJGnIIQ7y7LewzBese1IckDH7WJlQipXJb3P3HJsAzgXrwVxAbEFAXUgxCLWkV	NOsNS0aCUridj3Pbtdg4guQKcltkOmLz6NgaKP9Vxobl8AWdjmA5KzqnDyBZXnEAeuJ9w4J8kncHIIRi45OLT23LSxFSlMUXlbg1	15	\N	22
55	2015-09-19 16:56:39.873	\N	2015-09-19 16:56:40.626	\N	1	\N	0	f	temp-file-name4538039268046439966.tmp	0	muKsYTXZfMXDTK30J07fVTeGU6bhzxZkCW1cTLuBbVZkEAjKsQltcxfOU1UAi3At6uR1b4h3sFMAwuzbPsrRIZjvJBGHjrPHEe9s	HA8a7AsQIUDqw8N3ScTlsiXdaJKcxyJuJ8BhtTIG0cCCVmuoRTwECHWP8uVumnucgbDFmzkHyXNzyXPAP6g0mtZEXmVS12aB19ZL	15	\N	23
56	2015-09-19 16:56:41.688	\N	2015-09-19 16:56:42.643	\N	1	\N	0	f	temp-file-name111838523599009706.tmp	0	eeWwMMpUgIdXwlBOji7NHrlh6MNlK5XbDMYCqANxQwxFBAKoHn0eoGH7NVhcJCrIdxgk5CaNf8eAGZX4KEGfcg0hielMFlZJ1qVT	K1r03tpbepgPRMXNEn0ZijFNeLOFnjt3bDKIKiwitCQqOlKtYM7XmOIdHzGmwTbjzqNUI4Mk9k1p7kPCM8BieUTPIK66ZvjTSAhi	15	\N	25
57	2015-09-19 16:56:43.589	\N	2015-09-19 16:56:44.936	\N	1	\N	0	f	temp-file-name1736294884020758407.tmp	0	R3RlVtBQ1dLYcXnnopEGPyzkgg1dwF3s8kosQVdxwT4M5cSvzKv5T6TXrIVEUwEakhJ5rx4IlIAiC918kHiYyYyM6qOimtx8NT8X	rTPhlo76GL8vPFA9sIoLr5jZFhbvyrApfbjr0aWT3A9yt9MwnZiViLOKOdngaXXK3JByQ30rKN1vazCOhdDb18fa8P1EKT5rD4hQ	15	\N	25
58	2015-09-19 16:56:45.778	\N	2015-09-19 16:56:46.699	\N	1	\N	0	f	temp-file-name8649934264239660856.tmp	0	i0EZLkXT4aHaAaB3Xr4wmkQtFX7BBPmP00XAiwDhd0pQIyqvM1GnVhOAigZPFZQ6mAqjm8Ze1mJv7WmbB8VIUtBpJWc3nsc3VoS2	A6eroe5Whb6ZwiXRl7fbbtyfyJtKLwvNON4AHjzu2NlUERC6CtrsYoQnsUV9GyVARuVXVOLNQzjKrofZzfgzY1fzsuuSNw2Qm5li	15	\N	25
59	2015-09-19 16:56:49.251	\N	2015-09-19 16:56:51.374	\N	1	\N	0	f	temp-file-name5435687473409685681.tmp	0	IHrMQX6LxDtxuCh3wJUBkIPCLcYbthVaS4LxNyxVDxi4MfMZLWLG6wgERPYnVScevVSz1BW2EsTQpIS8jlAe2Xhonp3EPSKiFieI	ZLiSrtIsP0NH9C6bYkBwbFS2KhE2M1zNlPncMStGeRMo0XNQBN9fUQgXn9zaadEodzd3xfpbAdvzPLulze6RTkVxDGwewFLBePTt	15	\N	25
60	2015-09-19 16:57:06.556	\N	2015-09-19 16:57:22.319	\N	1	\N	0	f	temp-file-name4771811311815186795.tmp	0	IivhkYe7uZfXZq6mj472vlny1MFQtoVhCsb5eeURICbeS6evS10MkecRYolNQvSMVHQsdIgbxZikucD8JW4FXy2oBAfFcmUahPZW	aZBHLt9tgRlnCa6PMyzh43inLAQ54QV51DHKIbZ8RGBS6NquyxWkqPPqh6gsXS1Oi7UMCQgaaAztcVIQTHhPnF8qw2cIKGfj7tPw	16	\N	26
61	2015-09-19 16:57:24.177	\N	2015-09-19 16:57:25.971	\N	1	\N	0	f	temp-file-name3085513351969136234.tmp	0	lGt2NYSE4KAMqRc6MRwaoeDeKL2VxOXM9E1VcCeBWCRzukPlnJ5yD42nSJGfxAYGgJVKNratdZqn4jFOvkJCITFTzsKdOaapPHeX	5921lSYTmmZ8zqhN1NsAT68Pus8gYTc6hhiWi0WRMCTy4AlXvZMqL99uet9cNrQkiKB8Yv0s2unBCjkdry3pr7F7NGf2uH3REstc	16	\N	27
62	2015-09-19 16:57:31.039	\N	2015-09-19 16:57:35.965	\N	1	\N	0	f	temp-file-name592799037129733470.tmp	0	sW9WokkInfrVRGITS8ZGG96PUtolubqwnScJGhbvT1gEQJyJg2n1A2T0cQrHXBMtxaiI3LQfIgsUjDfYnlPucH7J7d8PcYjlIaTW	fhbfdFWCpXPXLVbsbEn9EDibZnNUyasxQr7U4G3iq2DhTBQDM7ST2L5Dil12COrBznzy5vq4yeUctjbu1AmJSwKw12NU7moYK67E	16	\N	28
63	2015-09-19 16:57:54.284	\N	2015-09-19 16:58:13.782	\N	1	\N	0	f	temp-file-name4535846990269650947.tmp	0	vhPAIUllcdxFgw6mJAH1JYsLZvIAjtnveOMnia2n8I2CZb60YPcC9Fyeo9xYtoZAdpKKWQfp1BWLJ2EnHTIAkeBnrJxMPIILhJ45	E08RMkLjTrIz1IKYYbjgTZlAaQb0r0nfMBMYQXGBnUsSTh1XI5v9xkOd0qNkjgXBTJuhfXtHVqrlOn6fuqXBunR5HAu6mR1Cl6rx	16	\N	29
64	2015-09-19 16:58:19.602	\N	2015-09-19 16:58:25.267	\N	1	\N	0	f	temp-file-name1188900692180249533.tmp	0	BYsgF0xLkEIM3YRiuD6wFaTyaIsp6XaLxeEsXtmZLECz5LBbf68UV0Piu7EtJW6VUKyARMk6mVlx8SijYeA2mBVEGMHqXxuVgAzp	10dWxNTAAirf6jNUvm4uyniyOh6oHaiybz2X3ZoVWJpUhcopreEcysf8FV3LWBmQUUcZ8ZH0Zmu1DepfaD0XOCc6vvVdDfYejW3V	16	\N	30
65	2015-09-19 16:58:26.941	\N	2015-09-19 16:58:28.297	\N	1	\N	0	f	temp-file-name4746501135693369689.tmp	0	6fy0VjP7y1ctCV7CpTbqtuBuXtxEj0eOGhWHgD21pT6D9DVl6OSgEvV0KMDRs8i7h4QWaGP3HbY6rP55zwWypohMmsJTFvV2LU5r	jpA1s2BS9U8JbFqmDA8mLYEAS2ZWWmx9Cklx2GqN418AILX8sgWbdzCuhWaFc43woK6f4QvvNGBTzcEinBzGYubGUYA3QrW0Xhej	17	\N	33
66	2015-09-19 16:58:31.115	\N	2015-09-19 16:58:33.975	\N	1	\N	0	f	temp-file-name3601930420341645165.tmp	0	L8lCZBu05tPD0qlS3E5tJHxdVIhfI5edGwrj3yWhSlT3NB5A5hm1QkUSiq5ZXODKIgR9WJ4wZWtpO7PCMBqelnitUsA962YFYMcS	q1olnkQPnx0jkR99WdZAi3pFs5DhAAunTPrROGK0NsrHgKbuMVzSGtfdxoYbvIrLJUw06r2jXKiy9YsJxzpru9pZZFSpLTZBGIyt	17	\N	34
67	2015-09-19 16:58:35.145	\N	2015-09-19 16:58:36.259	\N	1	\N	0	f	temp-file-name6843382813567973963.tmp	0	lO60Kc9d34abfi2OsY1pdyiZYBHXu4EefUnqMAwK2K3xZfRS2ers2gnBrefmGPC87QwNkRhO41x26aqEaCPAkWvkELNR3HmQXopU	QKXtqZ4Rj865V4SZ8DA345TOeAGrXsK05KBumGKCkoayB8C6YM7oIZDLMTRKjO1M7ABQTlX6GeaV4cKgGabGUuQU8v0HPL8LoRfk	17	\N	35
68	2015-09-19 16:58:38.344	\N	2015-09-19 16:58:39.899	\N	1	\N	0	f	temp-file-name5293926905891477255.tmp	0	yhYcaWmos1sVArTakpAcIFYFHuq2BLvQyhBhWkc74voPTZApt4AHcqIm5Vfw0lqGsqZCzhRbtG46EFtsBhui7StD4Ghguxft8RJp	gL4KWOHuGBc9pjqi7L14tsD6AeXOErvAprEurE7Nwci6iNbPvO4ExOsLWVWgQmGb8uxKxngGg4eIPqksBcZgVzfFffeIjREZCAGY	17	\N	37
69	2015-09-19 16:58:42.076	\N	2015-09-19 16:58:44.071	\N	1	\N	0	f	temp-file-name6448590024836438011.tmp	0	zG7nC4nIrjHOpLBHeurkeotwIaUA9O9egjAKfyX87ALSh4CJfG1Z75uM6Sd3EDwZehpB5lw76wdyHfso54KKpuhloF3zhJ3NtjwK	zErnWOf5dv68bkozfdI0uyBlUIhTR48RyZrK0MeB1n8AiwEF5bzsDdsQuCuaR5GhjaOsEmUfzF5xaTqNdeXewophTcIPoVDWx1gk	17	\N	38
70	2015-09-19 16:58:45.024	\N	2015-09-19 16:58:45.832	\N	1	\N	0	f	temp-file-name2723046823639704966.tmp	0	FYfvQid88fDoLFg6RQqw9j1QvVwS1ikydpYmYSYJAUvbXQSxvKRL6XiW6I5Y1opHqMdtnu0J8PeX45KwIlY6CuXtGZjtR72tO3jY	VjMNf6cVFx8oJjEqpj4nykr2u5epASPWVVnGUvcvGZcfCG9A5qh7YS8z48A3xhRjnAvSAdO4yb2Zq0HJHI0SRzew3MKB8pjnmHdP	17	\N	39
71	2015-09-19 16:58:47.206	\N	2015-09-19 16:58:48.645	\N	1	\N	0	f	temp-file-name7920567112831873320.tmp	0	jHl5l3dfhe8XuQbVOXxc8oGLNxUUuFVw7t4zMP3elw5wQtw4Qm9bi1m4HRIbGE3CISq1pmDFcTv3IgefyaY6nGDq9xWqsAcvxsDg	pm68xkFfcRLQ7mmpJyKuTkHWgh6NKSyLWU2lbO0PBlR73VJD0yUwbPyBeAfXWUkZ6xlJGL0hSfWZaD3TCpfn8HRF9n9aoJwgxg3w	17	\N	40
72	2015-09-19 16:59:28.478	\N	2015-09-19 17:00:09.509	\N	1	\N	0	f	temp-file-name2436082331596245367.tmp	0	xzRWjUxCCkC8r13s214J3Cw01kgg3Ab0CMqBwLX0ZJdJqoYx8ZnbeykMLEQQ5ilCJivYWV4C5JFaB6m74zdLFHEjaw1QaTMmNPJ9	n2FwpOCMNBZPT4MNAowNOPK6QQiKTGAThRYNm2smB5LiZ74X0EPaeV9dUZQdO2Ggd4x35XFZJXCo2BQLsAGo4hDym8ecESepWyFM	18	\N	41
73	2015-09-19 17:00:15.129	\N	2015-09-19 17:00:20.58	\N	1	\N	0	f	temp-file-name3789966626877528602.tmp	0	SdId1JMbnwvsE2Dw9gL9cQTJa5ak5uNwhdI8CFud4xYIeuEk4kH0lYyIVGIIXlS3dbiXk7jPLfK6EWuiUl3jlz9ntjr9QSbohmmJ	IY7HdLJTYBf8QLiM3lPj8tEnaq8O0kgy8Eo4kp2YRxtda7GYtoD8tCNrXJWN3xsLjrSZ9WseK6xhq0meTB8TMZckXhyi4jSlly7F	18	\N	42
74	2015-09-19 17:00:21.219	\N	2015-09-19 17:00:21.827	\N	1	\N	0	f	temp-file-name2764124845264160562.tmp	0	FNpZYmfffsEj7zeQYl1hJK5CzwHlBaI2PennqhzCFOKhkRVRjRHogBefHFHYIZts5NYyUlAoDy4N6blP5cKAO4AnQmG44wavAiG4	byPOCJMKp0p1TMkuPkmlfmfiLyOf4y8IjUxkJ2JMRiv5cCHX2bGDVoCWJrfALncp3qImQnmNmsOV4dPinz40ApmG5eEn5FIYc9MZ	18	\N	43
75	2015-09-19 17:00:25.354	\N	2015-09-19 17:00:28.678	\N	1	\N	0	f	temp-file-name6958201048746373290.tmp	0	mspYJfnp9adBAwcreCOpuO9olF4dbuo857OeGDey0xlgykK1I3tJI2feOiQcM7enb4XMOVkXDDJXwM2q017jyiHNctzHJdm16jYt	Uc6kT1ya9v8X1SGT7la05yBD3elxzwHy453BY1a8K2SRDQnGmcpgU4A1qVlPvUa5zP6NRxMHaMM05970tepMXs7xP9DmYwdcEF6A	18	\N	44
76	2015-09-19 17:00:29.754	\N	2015-09-19 17:00:30.761	\N	1	\N	0	f	temp-file-name3636581042172043262.tmp	0	1RnwdIsb8Mdxrw8juerEbOvhASXnWwVnyT7u7qwc6qsUx8al5BDDSeFdH0MaUewhM7i4Yw48qIni4g25hNrCZ0fYrGck757AfS8Z	BKZYncie9SyOLsORkw8seuy5pGM3UYZpHodDbAsX7PDqbWmLgrEv7I0UKxEadhuSaXSx43WjlisuaK6jHOqXawoFCzIKErogNZI9	18	\N	45
77	2015-09-19 17:00:36.074	\N	2015-09-19 17:00:40.657	\N	1	\N	0	f	temp-file-name121697936680006550.tmp	0	mhh991dx29K4bvXpDkIDtOj4OZQIc4eV5vFrOVOAMPofpzru6mGzvWdCaBA5pflEjPTVygOp5nqZOoVs8NkolvsXWhhKAkvaFnKg	8rQO4keqMdbBrnbhTwCjvlGBU6DkSQkq6Ah53MMau3MpcrKWFRTKOFEogoV9i5KHKUWpAxanqU3KESHcxubTBB8LRWPr6ddW0XFY	18	\N	45
78	2015-09-19 17:00:44.785	\N	2015-09-19 17:00:54.233	\N	1	\N	0	f	temp-file-name2379374568668611824.tmp	0	mvxsyADInGDw4MniUVEXhNXZWGBO34ocBJagBqCHhGvZkXx5udkDqQTGE8gTLrqK2ymhFRA1IJS3iskOiCL8Ft1MVgOZ6S9o6klJ	nLGtevolTECBK7SX5WBBUChBGuiev5PBU9XOTJnh77pRcIYjqRNPEtBF4OqDH5MX9mzTGeMYcagSLB1FeAk6AiRt6vThpHL2590H	18	\N	45
79	2015-09-19 17:00:55.652	\N	2015-09-19 17:00:58.354	\N	1	\N	0	f	temp-file-name1529471214324321156.tmp	0	GdetxjJqLDV0lWOwuOLVsbTHaoq4l2rENkWcaznmCkKgFQONkx1wwgJBoeFeyAyhZgOAu9vJZwcwhq9jYIMJXaMBYchuDsRumm4J	Q6uYAiCJ57anBATWKe52DkesCEhQsjLsLJmrFltm4SRj1UpVcCaAdSmlb9s6K9yxaMr8h5tGd97m45vSLVl2blTxYh2lnyD60yIH	18	\N	47
80	2015-09-19 17:01:00.306	\N	2015-09-19 17:01:02.979	\N	1	\N	0	f	temp-file-name1158132549601519861.tmp	0	RKyZtJZRoWdrpM8TRAQVTPj6YBdy9fbY6OCDD51miFgsSxz0bSPJNRQMs5hZNMAQjGaE7c3H5ppceAekwLgwBWY89OSwasdQ5Aqb	KbsG1hcktbsBVrL2OuyWPl0Ps8VKB2VE3WWYWipddyU87S8hF2VBpZSCgrdwEZMd1Pks2vBcC0dxYooWrdcLhVDpM2DIhCxMC2Ug	19	\N	48
81	2015-09-19 17:01:04.138	\N	2015-09-19 17:01:23.261	\N	1	\N	0	f	temp-file-name1725348374373143148.tmp	0	w9uQ5uJT588Y3AMhKtjtrIZOqf56djgHe9ap57tMERPLpQPb3SRG5PNmH0NXR3FfL0PfGye6JnTE0boQra1GgfiKJUToShJnVFJA	9pCaizDDlZtaBxyvOXf6fdqOxEpcwIHJ5x0Boq4lGbZg4b0egDJhPEOXZUgtzNwbOR2Ri78ieRp5nZ3FcK4h2txz3eVgOXZbx2EN	19	\N	49
82	2015-09-19 17:01:28.771	\N	2015-09-19 17:01:44.323	\N	1	\N	0	f	temp-file-name8849224432202753029.tmp	0	Wg2ZCCqfrCNnjEgxUdW812BM8hqdsYhWHeM4w2MaQTDsz7zHqP8ZShQ1CWJhoZfN5a3FSde0RXMzbmGxyoy4plugREXi7k3SWL9c	vfD2uLUcdsTmtNI6H2PTCZ93cK8DVQ4Ufz78cNf0VUhhwRwURkjx9Qbq6WRsKUCFSwXYGCO4kJC3gCpONXE8Q8tIdHXOjxrKBpJt	19	\N	50
83	2015-09-19 17:01:56.703	\N	2015-09-19 17:02:12.776	\N	1	\N	0	f	temp-file-name1720766279852912615.tmp	0	gmyrsCgPeXkAZuWUZ23w1k7YAySnqG067WzQZmYJ0kChqmyboh8ItKfAFxjxsipvP0l8Pb8O0fPxQGMnmGHBx8V5fvLiGvpC4BsA	6SiUNLkPgW7nkFNPiFd0Jb0DPe54gdYUTXFHXXkcSxWSRQkzcCRT8nsgKf1vBZyPczjlze3CY7FpU1UZYoTUptaP9NsU8J64iwHG	19	\N	51
84	2015-09-19 17:02:16.702	\N	2015-09-19 17:02:22.946	\N	1	\N	0	f	temp-file-name7210300382062014214.tmp	0	bOyM91MmnoNpAXs9mkbgSrpG5PKVIPBVf5FrQ3qlClLi13X5LXZJDRDkv1msVpj28PPyc9FWOuwFddJhvRAA11JDnl36HLfsafyA	GxPqsqKjvNXCxZtfehEJezfhZ8DaABeNWUL6gwW4PTOft6HFe8hoVmt6R2UCZoGN2Yrwvg6w3ogGM2f7O0HSm3hsBfpq80Zg31f8	19	\N	52
85	2015-09-19 17:02:24.628	\N	2015-09-19 17:02:26.144	\N	1	\N	0	f	temp-file-name8565668607821213211.tmp	0	QanUtrzed2V5UWM9UJ1kurqHjphdzLl5F93JPxbvGX69jwAsIHKCNaNoSsyqlQCLXuxzM8xrRkgM2jcv2wfvVJkCwpufp5ftDzI0	surx6Z87Wfeg9BbhCpqtBZtss4ht6aWKddK6yuJml5W80rwnVMEnNFam0TIXX3vdPj3cTp10Qc1OhEh8mY3QfdbRgCBt4Ez12aVW	19	\N	53
86	2015-09-19 17:02:28.29	\N	2015-09-19 17:02:35.485	\N	1	\N	0	f	temp-file-name8762693856008930901.tmp	0	J04gHgfShrdaUSFnChibfqOIjHUUrnoJPGZMMZRbl3J9MX6nB8HxnH4SBIzksATHNYv1kt6UhtldTKC2NNsWbCmBivf19iE03iE3	3H1BYrsBXVtNLhCJkYW2Q7J1Kexv6NKUyNuSD3IY8DdXQJ5KYb9pBSVl75HV3GkIzDcyiAmdEGyo9uBiHjpMMNoN2zcmkQOwyfU3	19	\N	54
87	2015-09-19 17:02:40.067	\N	2015-09-19 17:02:47.598	\N	1	\N	0	f	temp-file-name4994180153476679950.tmp	0	sMTi5upclB0u1sjS9DuDF1G7KVG04IbMXbbnPggxNcpTTYWoVhnkWFHYtrmTA2uP9NvU2LuXLAMjPogYwYYMUnv1zbuZEJ0OjueI	ZLjVjsYt2zYtu42TPh60ZA4D2KZFfydj4jGS2IF3E9bP8uTlVKXkB8LGQSY8rl0lB864nijBEcenErWSXQxDwaC31L6JM9U8c0t1	19	\N	55
88	2015-09-19 17:03:38.618	\N	2015-09-19 17:04:28.397	\N	1	\N	0	f	temp-file-name4270385191572704242.tmp	0	z1KO3c6PbfO0VlcLTe4ybi2OmvkIYVncNDWbdawf9lyLRHdA5NBwRaUipYt2ABaT5rlkjgOrTYBp41dXqc6Nv1MOWswqyUl7WXMr	LckL1ppH1s39VDyrV9uynGA3NdiJwa0ZAIjEIybKzEnMwy0k3OEwzqsnhXM7IRv39VVYhKsHeTZJFHT2C9zzKEfz40NHTXNSRsEv	20	\N	56
89	2015-09-19 17:04:29.684	\N	2015-09-19 17:04:30.756	\N	1	\N	0	f	temp-file-name2643064083610766855.tmp	0	augJ0Eq7mg5IjMJ7kbLEnsmQT9aXH9dY9s9DbGFqlmhs7RE20qkLcepQrkltnnwrNdD8UPHr9ZTmX2MpA0WGHJYpR1OoBXWXhdbc	93gsSyyEW0jrsE9pJf1BJNHfsJSQpqahwbedTnDCtb5wGBAXMPR40GoByOSmOPZeud3ptvPwRFPIlVhjb7S2ZDzvhxxT3pJC5xYQ	20	\N	57
90	2015-09-19 17:04:35.814	\N	2015-09-19 17:04:40.726	\N	1	\N	0	f	temp-file-name3439451269232989492.tmp	0	kpookIIK2NCayYGjgKrkCDXuKvedwosUdZN7rH4K0kQkK0VREFaw79dExUxGzWje933wrCObrcpm0WuYy2OD4mNp8GA6WB04nXr1	0N3ztQqH2Zyw8zWc8z5jaIpLrLGllxXl0IFndcxEEXBZ8nubocJnJBu0bTFNI8WkC4Tu1hj0RtqdOboHDjLwPlBiVrPDLJZFKZ71	20	\N	58
91	2015-09-19 17:04:42.288	\N	2015-09-19 17:04:53.073	\N	1	\N	0	f	temp-file-name8920218769959008648.tmp	0	jcsWh84sH0crQHjqKdWqAHfkM1IcMu3aNq1DdDJCdTDWdEOISIwa9faOGLxh6Gw96mYRfHabSryKlLqbkl5y9JKPHt3WsFRICzhY	uQi9iyrmCCYVrX7xpCMAclGMxD70pX9UB0Cztc80FwlpsUqJ2BDTTvCM4s6kMR1uRIMygVZNBqh6zO8JwACn0xYgAcoOxY46PRNx	20	\N	59
92	2015-09-19 17:04:54.48	\N	2015-09-19 17:05:01.093	\N	1	\N	0	f	temp-file-name4756215772260888877.tmp	0	sh30hWFoqrUeGnuR6egujBwyFwqY237pBzX6JNHX8RyaD0TbCkHC6eVP81CetVfJZycvWrgKJlFLU9qI2j23KeNMb8ztkE8BYDJa	SNzaoGwRLOxMGUli611Za4e50xbddwRoSRdaC8lsxmYkNEDN39FPucdEiTzF455NF1Gr8y1tS9YBmdfMgPyj1YcZRuKwfQ0GZM9j	20	\N	60
93	2015-09-19 17:05:14.134	\N	2015-09-19 17:05:26.318	\N	1	\N	0	f	temp-file-name3255503288291714832.tmp	0	4JijWIJPjA1G4CoNabpdsI9ktpsoVZmyR1uLJ2HnlSgwNQLDE8hZtUFKqKzwBQddcANZwOwXpGmptiuYhB8cynDkDAL11HXqNT7f	01Qizonpu1XBCvEm6dvcHkKCxoAxcNAhhCTVngkr8Mj2vel6FY2y3SbfxWR6GNWmPbbrWHyE4sTUsicKpzcs6cA9xJXuOARlIkDo	21	\N	63
94	2015-09-19 17:05:27.405	\N	2015-09-19 17:05:28.38	\N	1	\N	0	f	temp-file-name2494793291006645600.tmp	0	zJyAmp1nyEzuPhvutcCwlWCwqfYU7MUGaQmVHnhgpRK2xZkrC88hTUwZ4Bt27tDDoCpjbKB5rhTgDZhUO7NwEdWIqxfFJgRaN1aD	5AUPKVPeyxisF3zGuZwhbPkbnKQtltbddXLzP851pVlNOV14YDnDJ9Fs08PhvuThODmAmor1yKHuRJpnj7eSjW975N5J8jrUw9lM	21	\N	64
95	2015-09-19 17:05:30.409	\N	2015-09-19 17:05:32.52	\N	1	\N	0	f	temp-file-name8598354157985222433.tmp	0	a8mq7mKZhZqJqBcgz6Lq5poVqkvkv2B5vb55xZ6JgwlE4pnC6pSxaW8QeLIjPcvY73n7gZxgv6LbmRYa2HdomXXusDWLoGO9zJFU	t3syxrvpeQxAbCjJO4IzR8iekk9tPO47lfbRl4luly2LrkAsJSm5EXnE6mdeeoVtrPOyFAcK0IDa0aUCOOq02t9IkGI9m63jR8qR	21	\N	65
96	2015-09-19 17:06:04.071	\N	2015-09-19 17:06:35.484	\N	1	\N	0	f	temp-file-name8292126580049479065.tmp	0	iAGFNjOXCeDMp3dmC3rUYHbZuHOM04jI8Dpv3AbxpvtGRbIQsZsGtdjOa9SIRdFNJpbmxyGC5ne5fcdkasMUUHrdR5O9GVeJCjyP	uF4NnMJqE7vJvJJu6qj5GVEB8JQztTxclQ8t1p5CunBo2o3vD6yqS21G2nhpPTVkLlcdDYXp4cqhmxpJnMt8GD3gHrjr1m9usy3a	21	\N	66
97	2015-09-19 17:06:49.382	\N	2015-09-19 17:07:03.093	\N	1	\N	0	f	temp-file-name3998212497068317266.tmp	0	52Ywhnvt29mvZWBmsuqEaTHYlBrUiUbCWCPIFzIYAhslMAlBFjzoIsLh1QntAVcYtgQEBeWTQdsw6rVswUMATuf3IYifXYFkeS6t	LepAVjguRICOytIi2L1t63WeXMRGbuFyVUu42rIPlIWFw4Cv9rMfPd8amjNNOiAH1s3P3zH67iikexkNIo3jDQcVFKsRMdCThqL4	21	\N	66
98	2015-09-19 17:07:08.556	\N	2015-09-19 17:07:14.819	\N	1	\N	0	f	temp-file-name2931697126357916575.tmp	0	5QSEkfWiMNP7rTesouyeEmTxHspivuesOgIlCpm8DWUCB5UqV07hmN9RIkD5sxo24dCb2VzV7HQdOr2o4zXxvIqwsamdD4SHfiz0	REYHFBGTwIkxFqqUedA0N7KVUDb8CFRGVLQrGakLUVNUdmVs7kEc2DYpZoYMuzGmLcM94uBnJ5KkqYbcSZ2ru3Xbd7dAlIEUSR3F	21	\N	67
99	2015-09-19 17:07:33.802	\N	2015-09-19 17:07:52.411	\N	1	\N	0	f	temp-file-name8076685608358531229.tmp	0	UiCpiu4wlFogu1w5jmVXpYbsKnur6YjtesBPxBGnHLCaAAYr0nvMzPMes3NMoXbWLMCesCoP3uWZw1LQtnWaYdNk8ekN3XhuCiVW	t2Sv5GIJ7C4adXPT9Ve2czruYyXJIWjOdKGbvTjUheHZttzXgwVDRqniIpiPGZgPXMVd5NEaeKVohB71XrDFMjJGO7f6zo8HQA18	21	\N	68
100	2015-09-19 17:07:56.368	\N	2015-09-19 17:08:00.371	\N	1	\N	0	f	temp-file-name1094348507734268091.tmp	0	mHRiHO4nfFDi6fpurdcuI8cPE8QCAGuobSnIkNwqD4kSxwjcOb7PFDwkkQwnl7W6tBmh8eK2pxbtIv6U9p0rEGYdl7KMKZQ6UlZX	TXphAvWGk2Bt4gcC9Ab5sexLBjgBLvWRds41pA9gUrtYt98wxXqmdKcKk2y2uJZUxQc0vNJHKft0Ajfvito3xzC9xYGibtI13RCO	21	\N	69
101	2015-09-19 17:08:13.894	\N	2015-09-19 17:08:32.617	\N	1	\N	0	f	temp-file-name3763847992422288951.tmp	0	C0v1XfI88wQjgMtsBZWOGIlkpgyYIjfKARBa9JoewJuYvy1Qo3qoks7qlCHgFtOaRy0UpN8psS3xicOz1GoErzXprzpaNhGXBQLl	fTzjdkBRzLfIN0j8p119nr6NLFmrKSfpCoAfTnheAo9ktkKkpZxgkGVsGAsU6DE9iD4UXJyeHrOCQSCkPXehIFL5n8mhzLql6Ilj	21	\N	70
102	2015-09-19 17:08:51.404	\N	2015-09-19 17:09:11.67	\N	1	\N	0	f	temp-file-name2836224210177908245.tmp	0	cL9mJHUB9qxCHdTRGHZofExF0zrx5BA4WMTLrVR0lOVGDTIc9pbxpSMpqUIVGT2S0S3EbhTEW5g62KIZR4cFI0hC7Ekrw14S9cpa	Ao2LHzD3xayQYX5WgphEKEWO7vsO6JAGhUBFOIO2BZB1LtK8OXyOIu1xevcsOdBJyePdjflgZVYM7VjZWudcusFANdCLu8mhE0sF	21	\N	71
103	2015-09-19 17:09:14.017	\N	2015-09-19 17:09:15.639	\N	1	\N	0	f	temp-file-name7255133411871433524.tmp	0	FBXmVe5sCZndiZOrdMH1ftdtw00cJEehozlQI87F9Dqo7wjeUfK5g1TYz3KYU6SpDcV18jARdtKh00CP0pPVMcQrcT2BGiS8ryvI	vssXCuxjWhgHeZVWKmPnGnvvbtCUvKP3RlJQGiiaPgLv482mYT3FoCD1ighEDGpEZ6HO0gfOYOeHvMbrzggf4Q8WRHRMl1mFC49r	21	\N	72
\.


--
-- Name: storedfile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: play
--

SELECT pg_catalog.setval('storedfile_id_seq', 103, true);


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

