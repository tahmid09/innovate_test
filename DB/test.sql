--
-- PostgreSQL database cluster dump
--

-- Started on 2022-10-31 01:49:46

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:tQjp+IcuoTaO+lz35fRuVA==$KDItbfOuQc6P1jHv1xe5P+Wa5GNUQeRJiWjguTgtrsI=:Bejp2PXWPbnsMKcDVYMyvbCZ2p6QfoPi2Bre1zHA6sE=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0
-- Dumped by pg_dump version 15.0

-- Started on 2022-10-31 01:49:46

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

-- Completed on 2022-10-31 01:49:46

--
-- PostgreSQL database dump complete
--

--
-- Database "hotel" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0
-- Dumped by pg_dump version 15.0

-- Started on 2022-10-31 01:49:46

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
-- TOC entry 3315 (class 1262 OID 16398)
-- Name: hotel; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE hotel WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE hotel OWNER TO postgres;

\connect hotel

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

-- Completed on 2022-10-31 01:49:47

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0
-- Dumped by pg_dump version 15.0

-- Started on 2022-10-31 01:49:47

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
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 3316 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


-- Completed on 2022-10-31 01:49:47

--
-- PostgreSQL database dump complete
--

--
-- Database "s3innovate_test" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0
-- Dumped by pg_dump version 15.0

-- Started on 2022-10-31 01:49:47

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
-- TOC entry 3379 (class 1262 OID 16399)
-- Name: s3innovate_test; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE s3innovate_test WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE s3innovate_test OWNER TO postgres;

\connect s3innovate_test

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 16532)
-- Name: Device; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Device" (
    id integer NOT NULL,
    deviceid character varying,
    devicetype character varying,
    devicename character varying,
    groupid character varying,
    datatype character varying,
    status boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."Device" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16531)
-- Name: Device_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Device_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Device_id_seq" OWNER TO postgres;

--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 220
-- Name: Device_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Device_id_seq" OWNED BY public."Device".id;


--
-- TOC entry 223 (class 1259 OID 16543)
-- Name: Temperature; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Temperature" (
    id integer NOT NULL,
    temperature integer NOT NULL,
    humidity integer NOT NULL,
    occupancy boolean DEFAULT false NOT NULL,
    status boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    "deviceidId" integer
);


ALTER TABLE public."Temperature" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16542)
-- Name: Temperature_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Temperature_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Temperature_id_seq" OWNER TO postgres;

--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 222
-- Name: Temperature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Temperature_id_seq" OWNED BY public."Temperature".id;


--
-- TOC entry 217 (class 1259 OID 16424)
-- Name: device; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.device (
    id integer NOT NULL,
    status boolean DEFAULT true NOT NULL,
    deviceid character varying,
    devicetype character varying,
    devicename character varying,
    groupid character varying,
    datatype character varying,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.device OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16423)
-- Name: device_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.device_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.device_id_seq OWNER TO postgres;

--
-- TOC entry 3382 (class 0 OID 0)
-- Dependencies: 216
-- Name: device_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.device_id_seq OWNED BY public.device.id;


--
-- TOC entry 215 (class 1259 OID 16414)
-- Name: store; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    parent_id integer DEFAULT 0 NOT NULL,
    status boolean DEFAULT true NOT NULL,
    created_at time with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.store OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16413)
-- Name: store_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.store_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_id_seq OWNER TO postgres;

--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 214
-- Name: store_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.store_id_seq OWNED BY public.store.id;


--
-- TOC entry 219 (class 1259 OID 16445)
-- Name: temperature; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temperature (
    id integer NOT NULL,
    occupancy boolean DEFAULT false NOT NULL,
    status boolean DEFAULT true NOT NULL,
    deviceid integer NOT NULL,
    temperature integer NOT NULL,
    humidity integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.temperature OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16444)
-- Name: temperature_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temperature_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temperature_id_seq OWNER TO postgres;

--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 218
-- Name: temperature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temperature_id_seq OWNED BY public.temperature.id;


--
-- TOC entry 3204 (class 2604 OID 16535)
-- Name: Device id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Device" ALTER COLUMN id SET DEFAULT nextval('public."Device_id_seq"'::regclass);


--
-- TOC entry 3207 (class 2604 OID 16546)
-- Name: Temperature id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Temperature" ALTER COLUMN id SET DEFAULT nextval('public."Temperature_id_seq"'::regclass);


--
-- TOC entry 3197 (class 2604 OID 16427)
-- Name: device id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device ALTER COLUMN id SET DEFAULT nextval('public.device_id_seq'::regclass);


--
-- TOC entry 3193 (class 2604 OID 16417)
-- Name: store id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store ALTER COLUMN id SET DEFAULT nextval('public.store_id_seq'::regclass);


--
-- TOC entry 3200 (class 2604 OID 16448)
-- Name: temperature id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temperature ALTER COLUMN id SET DEFAULT nextval('public.temperature_id_seq'::regclass);


--
-- TOC entry 3371 (class 0 OID 16532)
-- Dependencies: 221
-- Data for Name: Device; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Device" (id, deviceid, devicetype, devicename, groupid, datatype, status, created_at) FROM stdin;
\.


--
-- TOC entry 3373 (class 0 OID 16543)
-- Dependencies: 223
-- Data for Name: Temperature; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Temperature" (id, temperature, humidity, occupancy, status, created_at, "deviceidId") FROM stdin;
\.


--
-- TOC entry 3367 (class 0 OID 16424)
-- Dependencies: 217
-- Data for Name: device; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.device (id, status, deviceid, devicetype, devicename, groupid, datatype, created_at) FROM stdin;
1	t	ibm-878A66	computer1.0.0	VN1-1-3	847b3b2f1b05dc4	DATA	2022-10-30 22:53:39.637555
2	t	ibm-878A661	computer1.0.0	VN1-1-3	847b3b2f1b05dc4	DATA	2022-10-30 23:00:24.91249
\.


--
-- TOC entry 3365 (class 0 OID 16414)
-- Dependencies: 215
-- Data for Name: store; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store (id, name, parent_id, status, created_at) FROM stdin;
1	Building A	0	t	00:13:56.34222+06
2	Building B	0	t	00:14:24.766528+06
3	Carpark	1	t	00:15:51.139667+06
4	Level 2	1	t	00:15:51.139667+06
5	Level 1	2	t	00:16:47.091451+06
6	Room 101	5	t	00:18:33.470348+06
8	Pantry	5	t	00:19:30.867522+06
9	Lobby C	6	t	00:20:10.627813+06
10	Kios A	9	t	00:20:54.699737+06
11	XXX	10	t	00:21:43.994635+06
\.


--
-- TOC entry 3369 (class 0 OID 16445)
-- Dependencies: 219
-- Data for Name: temperature; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temperature (id, occupancy, status, deviceid, temperature, humidity, created_at) FROM stdin;
2	f	t	2	21	53	2022-10-30 23:00:24.924726
3	f	t	2	21	53	2022-10-30 23:00:59.634534
4	f	t	2	21	53	2022-10-30 23:05:39.407899
5	f	t	2	0	0	2022-10-31 00:04:13.43669
12	f	t	2	21	53	2022-10-31 00:49:38.523537
15	f	t	2	0	0	2022-10-31 00:51:39.484924
16	f	t	2	0	0	2022-10-31 00:52:07.788185
17	f	t	2	21	53	2022-10-31 00:52:13.178955
18	f	t	2	21	53	2022-10-31 00:52:51.655195
19	f	t	2	21	53	2022-10-31 00:55:22.71167
20	f	t	2	21	53	2022-10-31 00:55:45.467072
21	f	t	2	21	53	2022-10-31 01:05:20.441589
22	t	t	2	21	53	2022-10-31 01:20:22.917955
23	t	t	2	21	53	2022-10-31 01:21:07.323977
24	t	t	2	21	53	2022-10-31 01:22:22.981987
25	t	t	2	21	53	2022-10-31 01:23:01.084231
\.


--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 220
-- Name: Device_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Device_id_seq"', 1, false);


--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 222
-- Name: Temperature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Temperature_id_seq"', 1, false);


--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 216
-- Name: device_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.device_id_seq', 2, true);


--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 214
-- Name: store_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_id_seq', 11, true);


--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 218
-- Name: temperature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temperature_id_seq', 25, true);


--
-- TOC entry 3220 (class 2606 OID 16551)
-- Name: Temperature PK_44d4689d132f9a03ef8d0e16779; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Temperature"
    ADD CONSTRAINT "PK_44d4689d132f9a03ef8d0e16779" PRIMARY KEY (id);


--
-- TOC entry 3218 (class 2606 OID 16541)
-- Name: Device PK_f0a3247774bd4eaad2177055336; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Device"
    ADD CONSTRAINT "PK_f0a3247774bd4eaad2177055336" PRIMARY KEY (id);


--
-- TOC entry 3214 (class 2606 OID 16431)
-- Name: device device_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device
    ADD CONSTRAINT device_pkey PRIMARY KEY (id);


--
-- TOC entry 3212 (class 2606 OID 16422)
-- Name: store store_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store
    ADD CONSTRAINT store_pkey PRIMARY KEY (id);


--
-- TOC entry 3216 (class 2606 OID 16455)
-- Name: temperature temperature_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temperature
    ADD CONSTRAINT temperature_pkey PRIMARY KEY (id);


--
-- TOC entry 3221 (class 2606 OID 16560)
-- Name: Temperature FK_d884e70782d6541d3ac619f7fff; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Temperature"
    ADD CONSTRAINT "FK_d884e70782d6541d3ac619f7fff" FOREIGN KEY ("deviceidId") REFERENCES public.device(id);


-- Completed on 2022-10-31 01:49:47

--
-- PostgreSQL database dump complete
--

--
-- Database "test_db" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0
-- Dumped by pg_dump version 15.0

-- Started on 2022-10-31 01:49:47

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
-- TOC entry 3350 (class 1262 OID 16462)
-- Name: test_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE test_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE test_db OWNER TO postgres;

\connect test_db

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16477)
-- Name: Device; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Device" (
    id integer NOT NULL,
    status boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    deviceid character varying,
    devicetype character varying,
    devicename character varying,
    groupid character varying,
    datatype character varying
);


ALTER TABLE public."Device" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16476)
-- Name: Device_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Device_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Device_id_seq" OWNER TO postgres;

--
-- TOC entry 3351 (class 0 OID 0)
-- Dependencies: 215
-- Name: Device_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Device_id_seq" OWNED BY public."Device".id;


--
-- TOC entry 218 (class 1259 OID 16488)
-- Name: Temperature; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Temperature" (
    id integer NOT NULL,
    temperature integer NOT NULL,
    humidity integer NOT NULL,
    occupancy boolean DEFAULT false NOT NULL,
    status boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    "deviceidId" integer
);


ALTER TABLE public."Temperature" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16487)
-- Name: Temperature_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Temperature_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Temperature_id_seq" OWNER TO postgres;

--
-- TOC entry 3352 (class 0 OID 0)
-- Dependencies: 217
-- Name: Temperature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Temperature_id_seq" OWNED BY public."Temperature".id;


--
-- TOC entry 214 (class 1259 OID 16465)
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- TOC entry 3184 (class 2604 OID 16480)
-- Name: Device id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Device" ALTER COLUMN id SET DEFAULT nextval('public."Device_id_seq"'::regclass);


--
-- TOC entry 3187 (class 2604 OID 16491)
-- Name: Temperature id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Temperature" ALTER COLUMN id SET DEFAULT nextval('public."Temperature_id_seq"'::regclass);


--
-- TOC entry 3342 (class 0 OID 16477)
-- Dependencies: 216
-- Data for Name: Device; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Device" (id, status, created_at, deviceid, devicetype, devicename, groupid, datatype) FROM stdin;
1	t	2022-10-30 12:28:48.216	\N	\N	\N	\N	\N
2	t	2022-10-30 22:27:37.149207	ibm-878A66	computer1.0.0	computer1.0.0	computer1.0.0	computer1.0.0
3	t	2022-10-30 22:28:46.14626	ibm-878A66	computer1.0.0	computer1.0.0	computer1.0.0	computer1.0.0
4	t	2022-10-30 22:30:27.402171	ibm-878A66	computer1.0.0	VN1-1-3	847b3b2f1b05dc4	DATA
\.


--
-- TOC entry 3344 (class 0 OID 16488)
-- Dependencies: 218
-- Data for Name: Temperature; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Temperature" (id, temperature, humidity, occupancy, status, created_at, "deviceidId") FROM stdin;
\.


--
-- TOC entry 3340 (class 0 OID 16465)
-- Dependencies: 214
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
0ade3994-e599-40b5-abc3-b816e327f18b	cc22516d537791fae1809385cf86dea3edb2a6876ff2a24ea7383d1f5ca1ddbf	2022-10-30 17:52:15.659419+06	20221030115215_mig1	\N	\N	2022-10-30 17:52:15.629166+06	1
\.


--
-- TOC entry 3353 (class 0 OID 0)
-- Dependencies: 215
-- Name: Device_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Device_id_seq"', 4, true);


--
-- TOC entry 3354 (class 0 OID 0)
-- Dependencies: 217
-- Name: Temperature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Temperature_id_seq"', 1, false);


--
-- TOC entry 3194 (class 2606 OID 16486)
-- Name: Device Device_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Device"
    ADD CONSTRAINT "Device_pkey" PRIMARY KEY (id);


--
-- TOC entry 3196 (class 2606 OID 16496)
-- Name: Temperature Temperature_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Temperature"
    ADD CONSTRAINT "Temperature_pkey" PRIMARY KEY (id);


--
-- TOC entry 3192 (class 2606 OID 16473)
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3197 (class 2606 OID 16526)
-- Name: Temperature FK_d884e70782d6541d3ac619f7fff; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Temperature"
    ADD CONSTRAINT "FK_d884e70782d6541d3ac619f7fff" FOREIGN KEY ("deviceidId") REFERENCES public."Device"(id);


-- Completed on 2022-10-31 01:49:48

--
-- PostgreSQL database dump complete
--

-- Completed on 2022-10-31 01:49:48

--
-- PostgreSQL database cluster dump complete
--

