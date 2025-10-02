--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.2

-- Started on 2025-10-02 08:46:52

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 224 (class 1259 OID 90139)
-- Name: appointments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appointments (
    id integer NOT NULL,
    pet_id integer NOT NULL,
    veterinarian_id integer NOT NULL,
    date timestamp without time zone NOT NULL
);


ALTER TABLE public.appointments OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 90138)
-- Name: appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.appointments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.appointments_id_seq OWNER TO postgres;

--
-- TOC entry 3427 (class 0 OID 0)
-- Dependencies: 223
-- Name: appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.appointments_id_seq OWNED BY public.appointments.id;


--
-- TOC entry 230 (class 1259 OID 98340)
-- Name: medicalhistories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicalhistories (
    id integer NOT NULL,
    petid integer NOT NULL,
    description character varying(500),
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.medicalhistories OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 98339)
-- Name: medicalhistories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medicalhistories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.medicalhistories_id_seq OWNER TO postgres;

--
-- TOC entry 3428 (class 0 OID 0)
-- Dependencies: 229
-- Name: medicalhistories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medicalhistories_id_seq OWNED BY public.medicalhistories.id;


--
-- TOC entry 218 (class 1259 OID 90113)
-- Name: owners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.owners (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    phone character varying(20),
    email character varying(100)
);


ALTER TABLE public.owners OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 90112)
-- Name: owners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.owners_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.owners_id_seq OWNER TO postgres;

--
-- TOC entry 3429 (class 0 OID 0)
-- Dependencies: 217
-- Name: owners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.owners_id_seq OWNED BY public.owners.id;


--
-- TOC entry 228 (class 1259 OID 98326)
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id integer NOT NULL,
    appointmentid integer NOT NULL,
    amount integer NOT NULL,
    paymentdate date NOT NULL
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 98325)
-- Name: payments_amount_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_amount_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payments_amount_seq OWNER TO postgres;

--
-- TOC entry 3430 (class 0 OID 0)
-- Dependencies: 227
-- Name: payments_amount_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_amount_seq OWNED BY public.payments.amount;


--
-- TOC entry 226 (class 1259 OID 98324)
-- Name: payments_appointmentid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_appointmentid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payments_appointmentid_seq OWNER TO postgres;

--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 226
-- Name: payments_appointmentid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_appointmentid_seq OWNED BY public.payments.appointmentid;


--
-- TOC entry 225 (class 1259 OID 98323)
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payments_id_seq OWNER TO postgres;

--
-- TOC entry 3432 (class 0 OID 0)
-- Dependencies: 225
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- TOC entry 220 (class 1259 OID 90120)
-- Name: pets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pets (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    species character varying(50),
    breed character varying(50),
    birth_date date,
    owner_id integer NOT NULL
);


ALTER TABLE public.pets OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 90119)
-- Name: pets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pets_id_seq OWNER TO postgres;

--
-- TOC entry 3433 (class 0 OID 0)
-- Dependencies: 219
-- Name: pets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pets_id_seq OWNED BY public.pets.id;


--
-- TOC entry 222 (class 1259 OID 90132)
-- Name: veterinarians; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veterinarians (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    specialty character varying(50)
);


ALTER TABLE public.veterinarians OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 90131)
-- Name: veterinarians_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.veterinarians_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.veterinarians_id_seq OWNER TO postgres;

--
-- TOC entry 3434 (class 0 OID 0)
-- Dependencies: 221
-- Name: veterinarians_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.veterinarians_id_seq OWNED BY public.veterinarians.id;


--
-- TOC entry 3240 (class 2604 OID 90142)
-- Name: appointments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments ALTER COLUMN id SET DEFAULT nextval('public.appointments_id_seq'::regclass);


--
-- TOC entry 3244 (class 2604 OID 98343)
-- Name: medicalhistories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicalhistories ALTER COLUMN id SET DEFAULT nextval('public.medicalhistories_id_seq'::regclass);


--
-- TOC entry 3237 (class 2604 OID 90116)
-- Name: owners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owners ALTER COLUMN id SET DEFAULT nextval('public.owners_id_seq'::regclass);


--
-- TOC entry 3241 (class 2604 OID 98329)
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- TOC entry 3242 (class 2604 OID 98354)
-- Name: payments appointmentid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN appointmentid SET DEFAULT nextval('public.payments_appointmentid_seq'::regclass);


--
-- TOC entry 3243 (class 2604 OID 98331)
-- Name: payments amount; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN amount SET DEFAULT nextval('public.payments_amount_seq'::regclass);


--
-- TOC entry 3238 (class 2604 OID 90123)
-- Name: pets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pets ALTER COLUMN id SET DEFAULT nextval('public.pets_id_seq'::regclass);


--
-- TOC entry 3239 (class 2604 OID 90135)
-- Name: veterinarians id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veterinarians ALTER COLUMN id SET DEFAULT nextval('public.veterinarians_id_seq'::regclass);


--
-- TOC entry 3415 (class 0 OID 90139)
-- Dependencies: 224
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.appointments (id, pet_id, veterinarian_id, date) FROM stdin;
6	105	3	2025-01-05 10:00:00
7	106	1	2025-01-06 11:00:00
8	107	5	2025-01-06 14:30:00
9	108	2	2025-01-07 09:15:00
10	109	7	2025-01-07 13:45:00
11	110	4	2025-01-08 10:30:00
12	111	6	2025-01-08 15:00:00
13	112	8	2025-01-09 09:00:00
14	113	9	2025-01-09 12:00:00
15	114	10	2025-01-10 11:30:00
16	115	11	2025-01-10 14:00:00
17	116	12	2025-01-11 09:45:00
18	117	13	2025-01-11 16:00:00
19	118	14	2025-01-12 10:15:00
20	119	15	2025-01-12 13:30:00
21	120	16	2025-01-13 11:00:00
22	121	17	2025-01-13 15:30:00
23	122	18	2025-01-14 09:30:00
24	123	19	2025-01-14 12:45:00
25	124	20	2025-01-15 10:30:00
26	125	21	2025-01-15 14:00:00
27	126	22	2025-01-16 09:00:00
28	127	23	2025-01-16 11:30:00
29	128	24	2025-01-17 10:15:00
30	129	25	2025-01-17 13:00:00
31	130	26	2025-01-18 09:45:00
32	131	27	2025-01-18 14:15:00
33	132	28	2025-01-19 11:00:00
34	133	29	2025-01-19 15:00:00
35	134	30	2025-01-20 10:30:00
36	135	31	2025-01-20 13:30:00
37	136	32	2025-01-21 09:15:00
38	137	33	2025-01-21 12:00:00
39	138	34	2025-01-22 11:45:00
40	139	35	2025-01-22 14:30:00
41	140	36	2025-01-23 10:00:00
42	141	37	2025-01-23 13:00:00
43	142	38	2025-01-24 09:30:00
44	143	39	2025-01-24 12:30:00
45	144	40	2025-01-25 10:15:00
46	145	41	2025-01-25 14:00:00
47	146	42	2025-01-26 11:30:00
48	147	43	2025-01-26 15:00:00
49	148	44	2025-01-27 09:45:00
50	149	45	2025-01-27 12:15:00
51	150	46	2025-01-28 10:30:00
52	151	47	2025-01-28 14:30:00
53	152	48	2025-01-29 11:00:00
54	153	49	2025-01-29 13:45:00
55	154	50	2025-01-30 09:00:00
56	155	51	2025-01-30 12:00:00
57	156	52	2025-01-31 10:15:00
58	157	53	2025-01-31 14:00:00
59	158	54	2025-02-01 11:30:00
60	159	55	2025-02-01 15:00:00
61	160	56	2025-02-02 09:45:00
62	161	57	2025-02-02 13:15:00
63	162	58	2025-02-03 10:00:00
64	163	59	2025-02-03 12:45:00
65	164	60	2025-02-04 11:00:00
66	165	61	2025-02-04 14:30:00
67	166	62	2025-02-05 09:15:00
68	167	63	2025-02-05 13:00:00
69	168	64	2025-02-06 10:30:00
70	169	65	2025-02-06 14:15:00
71	170	66	2025-02-07 11:00:00
72	171	67	2025-02-07 13:45:00
73	172	68	2025-02-08 09:30:00
74	173	69	2025-02-08 12:15:00
75	174	70	2025-02-09 10:00:00
76	175	71	2025-02-09 14:00:00
77	176	72	2025-02-10 11:30:00
78	177	73	2025-02-10 15:00:00
79	178	74	2025-02-11 09:45:00
80	179	75	2025-02-11 13:15:00
81	180	76	2025-02-12 10:00:00
82	181	77	2025-02-12 12:45:00
83	182	78	2025-02-13 11:30:00
84	183	79	2025-02-13 14:30:00
85	184	80	2025-02-14 09:15:00
86	185	81	2025-02-14 13:00:00
87	186	82	2025-02-15 10:30:00
88	187	83	2025-02-15 14:15:00
89	188	84	2025-02-16 11:00:00
90	189	85	2025-02-16 13:45:00
91	190	86	2025-02-17 09:30:00
92	191	87	2025-02-17 12:15:00
93	192	88	2025-02-18 10:00:00
94	193	89	2025-02-18 14:00:00
95	194	90	2025-02-19 11:30:00
96	195	91	2025-02-19 15:00:00
97	196	92	2025-02-20 09:45:00
98	197	93	2025-02-20 13:15:00
99	198	94	2025-02-21 10:00:00
100	199	95	2025-02-21 12:45:00
101	200	96	2025-02-22 11:30:00
\.


--
-- TOC entry 3421 (class 0 OID 98340)
-- Dependencies: 230
-- Data for Name: medicalhistories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicalhistories (id, petid, description, createdat) FROM stdin;
1	105	Consulta general de rutina	2023-05-12 10:15:00
2	106	Vacunación anual	2023-05-15 09:30:00
3	107	Chequeo dental	2023-06-01 11:00:00
4	108	Control postoperatorio	2023-06-05 14:45:00
5	109	Consulta por vómitos	2023-06-10 13:20:00
6	110	Chequeo preventivo	2023-06-15 12:10:00
7	111	Vacunación múltiple	2023-07-01 09:00:00
8	112	Examen físico anual	2023-07-05 15:30:00
9	113	Consulta dermatológica	2023-07-12 16:00:00
10	114	Control de peso	2023-07-20 11:45:00
11	115	Tratamiento antiparasitario	2023-08-02 10:20:00
12	116	Chequeo dental	2023-08-10 14:00:00
13	117	Examen oftalmológico	2023-08-15 13:15:00
14	118	Consulta por diarrea	2023-08-22 12:30:00
15	119	Tratamiento respiratorio	2023-09-01 09:45:00
16	120	Chequeo general	2023-09-05 10:10:00
17	121	Vacunación antirrábica	2023-09-12 15:00:00
18	122	Examen físico anual	2023-09-20 14:30:00
19	123	Consulta por tos	2023-09-25 11:15:00
20	124	Control postoperatorio	2023-10-01 12:45:00
21	125	Chequeo preventivo	2023-10-08 09:20:00
22	126	Consulta general de rutina	2023-10-15 10:35:00
23	127	Vacunación múltiple	2023-10-22 11:50:00
24	128	Examen físico anual	2023-10-30 13:10:00
25	129	Tratamiento antiparasitario	2023-11-05 14:25:00
26	130	Chequeo dental	2023-11-12 15:40:00
27	131	Consulta dermatológica	2023-11-18 10:05:00
28	132	Examen físico anual	2023-11-25 09:30:00
29	133	Vacunación anual	2023-12-02 11:45:00
30	134	Control de peso	2023-12-08 12:50:00
31	135	Chequeo preventivo	2023-12-15 13:55:00
32	136	Consulta por vómitos	2023-12-22 10:15:00
33	137	Tratamiento respiratorio	2023-12-28 09:40:00
34	138	Examen físico anual	2024-01-05 14:00:00
35	139	Chequeo general	2024-01-12 15:05:00
36	140	Consulta dermatológica	2024-01-18 16:10:00
37	141	Vacunación múltiple	2024-01-25 11:20:00
38	142	Examen físico anual	2024-02-01 12:25:00
39	143	Chequeo dental	2024-02-08 13:30:00
40	144	Tratamiento antiparasitario	2024-02-15 14:35:00
41	145	Consulta por tos	2024-02-22 10:50:00
42	146	Vacunación antirrábica	2024-03-01 11:55:00
43	147	Examen físico anual	2024-03-08 13:00:00
44	148	Control de peso	2024-03-15 14:05:00
45	149	Chequeo preventivo	2024-03-22 15:10:00
46	150	Consulta general	2024-03-29 09:15:00
47	151	Vacunación múltiple	2024-04-05 10:20:00
48	152	Examen físico anual	2024-04-12 11:25:00
49	153	Consulta dermatológica	2024-04-19 12:30:00
50	154	Chequeo preventivo	2024-04-26 13:35:00
51	155	Tratamiento antiparasitario	2024-05-03 14:40:00
52	156	Chequeo general	2024-05-10 15:45:00
53	157	Consulta por vómitos	2024-05-17 10:50:00
54	158	Vacunación antirrábica	2024-05-24 11:55:00
55	159	Chequeo preventivo	2024-06-01 13:00:00
56	160	Examen físico anual	2024-06-08 14:05:00
57	161	Consulta dermatológica	2024-06-15 15:10:00
58	162	Chequeo dental	2024-06-22 09:15:00
59	163	Tratamiento antiparasitario	2024-06-29 10:20:00
60	164	Consulta por vómitos	2024-07-06 11:25:00
61	165	Control postoperatorio	2024-07-13 12:30:00
62	166	Vacunación anual	2024-07-20 13:35:00
63	167	Chequeo general	2024-07-27 14:40:00
64	168	Consulta dermatológica	2024-08-03 15:45:00
65	169	Examen físico anual	2024-08-10 10:50:00
66	170	Vacunación múltiple	2024-08-17 11:55:00
67	171	Chequeo preventivo	2024-08-24 13:00:00
68	172	Consulta general	2024-08-31 14:05:00
69	173	Tratamiento antiparasitario	2024-09-07 15:10:00
70	174	Chequeo dental	2024-09-14 09:15:00
71	175	Examen físico anual	2024-09-21 10:20:00
72	176	Consulta por vómitos	2024-09-28 11:25:00
73	177	Control postoperatorio	2024-10-05 12:30:00
74	178	Vacunación múltiple	2024-10-12 13:35:00
75	179	Chequeo preventivo	2024-10-19 14:40:00
76	180	Consulta dermatológica	2024-10-26 15:45:00
77	181	Examen físico anual	2024-11-02 10:50:00
78	182	Vacunación antirrábica	2024-11-09 11:55:00
79	183	Chequeo general	2024-11-16 13:00:00
80	184	Consulta por tos	2024-11-23 14:05:00
81	185	Tratamiento antiparasitario	2024-11-30 15:10:00
82	186	Examen físico anual	2024-12-07 09:15:00
83	187	Vacunación múltiple	2024-12-14 10:20:00
84	188	Chequeo preventivo	2024-12-21 11:25:00
85	189	Consulta dermatológica	2024-12-28 12:30:00
86	190	Examen físico anual	2025-01-04 13:35:00
87	191	Chequeo general	2025-01-11 14:40:00
88	192	Vacunación anual	2025-01-18 15:45:00
89	193	Consulta por vómitos	2025-01-25 10:50:00
90	194	Tratamiento antiparasitario	2025-02-01 11:55:00
91	195	Chequeo preventivo	2025-02-08 13:00:00
92	196	Examen físico anual	2025-02-15 14:05:00
93	197	Consulta dermatológica	2025-02-22 15:10:00
94	198	Vacunación múltiple	2025-03-01 09:15:00
95	199	Chequeo preventivo	2025-03-08 10:20:00
96	200	Consulta general	2025-03-15 11:25:00
\.


--
-- TOC entry 3409 (class 0 OID 90113)
-- Dependencies: 218
-- Data for Name: owners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.owners (id, name, phone, email) FROM stdin;
5	Juan Pérez	3001000001	juan.perez@email.com
6	María Gómez	3001000002	maria.gomez@email.com
7	Carlos Díaz	3001000003	carlos.diaz@email.com
8	Laura Torres	3001000004	laura.torres@email.com
9	Andrés Ramírez	3001000005	andres.ramirez@email.com
10	Alejandro Morales	3001000006	alejandro.morales@email.com
11	Isabella Ríos	3001000007	isabella.rios@email.com
12	Mateo Sánchez	3001000008	mateo.sanchez@email.com
13	Daniela Pardo	3001000009	daniela.pardo@email.com
14	Santiago Díaz	3001000010	santiago.diaz@email.com
15	Natalia Ruiz	3001000011	natalia.ruiz@email.com
16	Sebastián Morales	3001000012	sebastian.morales@email.com
17	Juliana Romero	3001000013	juliana.romero@email.com
18	Tomás Guerrero	3001000014	tomas.guerrero@email.com
19	Gabriela Cárdenas	3001000015	gabriela.cardenas@email.com
20	José Gutiérrez	3001000016	jose.gutierrez@email.com
21	Marcela Salazar	3001000017	marcela.salazar@email.com
22	Esteban Correa	3001000018	esteban.correa@email.com
23	Daniel Castro	3001000019	daniel.castro@email.com
24	Catalina Muñoz	3001000020	catalina.munoz@email.com
25	Juan López	3001000021	juan.lopez@email.com
26	Andrea Ortiz	3001000022	andrea.ortiz@email.com
27	Ricardo Méndez	3001000023	ricardo.mendez@email.com
28	Fernanda Duarte	3001000024	fernanda.duarte@email.com
29	Pablo Ramírez	3001000025	pablo.ramirez@email.com
30	Angela Restrepo	3001000026	angela.restrepo@email.com
31	Hernán Jiménez	3001000027	hernan.jimenez@email.com
32	Carolina Torres	3001000028	carolina.torres@email.com
33	Oscar Rivera	3001000029	oscar.rivera@email.com
34	Verónica Molina	3001000030	veronica.molina@email.com
35	David Peña	3001000031	david.pena@email.com
36	Mónica Patiño	3001000032	monica.patino@email.com
37	Alejandro Ruiz	3001000033	alejandro.ruiz@email.com
38	Tatiana Lozano	3001000034	tatiana.lozano@email.com
39	Simón Suárez	3001000035	simon.suarez@email.com
40	Lorena Fernández	3001000036	lorena.fernandez@email.com
41	Cristian Vargas	3001000037	cristian.vargas@email.com
42	Rosa Calderón	3001000038	rosa.calderon@email.com
43	Iván Trujillo	3001000039	ivan.trujillo@email.com
44	Patricia Navarro	3001000040	patricia.navarro@email.com
45	Álvaro Pérez	3001000041	alvaro.perez@email.com
46	Viviana Silva	3001000042	viviana.silva@email.com
47	Francisco Aguilar	3001000043	francisco.aguilar@email.com
48	Diana Mejía	3001000044	diana.mejia@email.com
49	Raúl Herrera	3001000045	raul.herrera@email.com
50	Claudia Peña	3001000046	claudia.pena@email.com
51	Mauricio Ochoa	3001000047	mauricio.ochoa@email.com
52	Elena Cifuentes	3001000048	elena.cifuentes@email.com
53	Fernando Ruiz	3001000049	fernando.ruiz@email.com
54	Liliana Vargas	3001000050	liliana.vargas@email.com
55	Julián Hernández	3001000051	julian.hernandez@email.com
56	Melissa Torres	3001000052	melissa.torres@email.com
57	Rubén Álvarez	3001000053	ruben.alvarez@email.com
58	Sara Contreras	3001000054	sara.contreras@email.com
59	Wilson Ortiz	3001000055	wilson.ortiz@email.com
60	Gloria Romero	3001000056	gloria.romero@email.com
61	Kevin Salas	3001000057	kevin.salas@email.com
62	Camila Arango	3001000058	camila.arango@email.com
63	Miguel Castaño	3001000059	miguel.castano@email.com
64	Laura Velásquez	3001000060	laura.velasquez@email.com
65	Diego Herrera	3001000061	diego.herrera@email.com
66	Rocío Nieto	3001000062	rocio.nieto@email.com
67	Emanuel Rodríguez	3001000063	emanuel.rodriguez@email.com
68	Paola Rincón	3001000064	paola.rincon@email.com
69	Oscar Martínez	3001000065	oscar.martinez@email.com
70	Luisa Méndez	3001000066	luisa.mendez@email.com
71	Hugo Romero	3001000067	hugo.romero@email.com
72	Yesenia Forero	3001000068	yesenia.forero@email.com
73	Pedro Álvarez	3001000069	pedro.alvarez@email.com
74	Catalina Vargas	3001000070	catalina.vargas@email.com
75	Martín Rojas	3001000071	martin.rojas@email.com
76	Natalia Cárdenas	3001000072	natalia.cardenas@email.com
77	Esteban Salgado	3001000073	esteban.salgado@email.com
78	Marcela Duarte	3001000074	marcela.duarte@email.com
79	Javier Sánchez	3001000075	javier.sanchez@email.com
80	Liliana Rincón	3001000076	liliana.rincon@email.com
81	Óscar Rincón	3001000077	oscar.rincon@email.com
82	Jenny Morales	3001000078	jenny.morales@email.com
83	Hernando Gil	3001000079	hernando.gil@email.com
84	Clara Ruiz	3001000080	clara.ruiz@email.com
85	Felipe Vargas	3001000081	felipe.vargas@email.com
86	Daniel Salazar	3001000082	daniel.salazar@email.com
87	Viviana Ramírez	3001000083	viviana.ramirez@email.com
88	Mauricio Torres	3001000084	mauricio.torres@email.com
89	Andrea Ríos	3001000085	andrea.rios@email.com
90	Juan Pérez	3001000086	juan.perez@email.com
91	Lorena Morales	3001000087	lorena.morales@email.com
92	Carlos Herrera	3001000088	carlos.herrera@email.com
93	Marcela Jiménez	3001000089	marcela.jimenez@email.com
94	Alejandro Castro	3001000090	alejandro.castro@email.com
95	Paula Mendoza	3001000091	paula.mendoza@email.com
96	Raúl Cortés	3001000092	raul.cortes@email.com
97	Valentina Vega	3001000093	valentina.vega@email.com
98	Iván Quintero	3001000094	ivan.quintero@email.com
99	Natalia Herrera	3001000095	natalia.herrera@email.com
100	Jorge Molina	3001000096	jorge.molina@email.com
101	Claudia Torres	3001000097	claudia.torres@email.com
102	Diego Rojas	3001000098	diego.rojas@email.com
103	Laura Ramírez	3001000099	laura.ramirez@email.com
104	Fernando Paredes	3001000100	fernando.paredes@email.com
105	Juan Pérez	3001000001	juan.perez@email.com
106	María Gómez	3001000002	maria.gomez@email.com
107	Carlos Díaz	3001000003	carlos.diaz@email.com
108	Laura Torres	3001000004	laura.torres@email.com
109	Andrés Ramírez	3001000005	andres.ramirez@email.com
110	Alejandro Morales	3001000006	alejandro.morales@email.com
111	Isabella Ríos	3001000007	isabella.rios@email.com
112	Mateo Sánchez	3001000008	mateo.sanchez@email.com
113	Daniela Pardo	3001000009	daniela.pardo@email.com
114	Santiago Díaz	3001000010	santiago.diaz@email.com
115	Natalia Ruiz	3001000011	natalia.ruiz@email.com
116	Sebastián Morales	3001000012	sebastian.morales@email.com
117	Juliana Romero	3001000013	juliana.romero@email.com
118	Tomás Guerrero	3001000014	tomas.guerrero@email.com
119	Gabriela Cárdenas	3001000015	gabriela.cardenas@email.com
120	José Gutiérrez	3001000016	jose.gutierrez@email.com
121	Marcela Salazar	3001000017	marcela.salazar@email.com
122	Esteban Correa	3001000018	esteban.correa@email.com
123	Daniel Castro	3001000019	daniel.castro@email.com
124	Catalina Muñoz	3001000020	catalina.munoz@email.com
125	Juan López	3001000021	juan.lopez@email.com
126	Andrea Ortiz	3001000022	andrea.ortiz@email.com
127	Ricardo Méndez	3001000023	ricardo.mendez@email.com
128	Fernanda Duarte	3001000024	fernanda.duarte@email.com
129	Pablo Ramírez	3001000025	pablo.ramirez@email.com
130	Angela Restrepo	3001000026	angela.restrepo@email.com
131	Hernán Jiménez	3001000027	hernan.jimenez@email.com
132	Carolina Torres	3001000028	carolina.torres@email.com
133	Oscar Rivera	3001000029	oscar.rivera@email.com
134	Verónica Molina	3001000030	veronica.molina@email.com
135	David Peña	3001000031	david.pena@email.com
136	Mónica Patiño	3001000032	monica.patino@email.com
137	Alejandro Ruiz	3001000033	alejandro.ruiz@email.com
138	Tatiana Lozano	3001000034	tatiana.lozano@email.com
139	Simón Suárez	3001000035	simon.suarez@email.com
140	Lorena Fernández	3001000036	lorena.fernandez@email.com
141	Cristian Vargas	3001000037	cristian.vargas@email.com
142	Rosa Calderón	3001000038	rosa.calderon@email.com
143	Iván Trujillo	3001000039	ivan.trujillo@email.com
144	Patricia Navarro	3001000040	patricia.navarro@email.com
145	Álvaro Pérez	3001000041	alvaro.perez@email.com
146	Viviana Silva	3001000042	viviana.silva@email.com
147	Francisco Aguilar	3001000043	francisco.aguilar@email.com
148	Diana Mejía	3001000044	diana.mejia@email.com
149	Raúl Herrera	3001000045	raul.herrera@email.com
150	Claudia Peña	3001000046	claudia.pena@email.com
151	Mauricio Ochoa	3001000047	mauricio.ochoa@email.com
152	Elena Cifuentes	3001000048	elena.cifuentes@email.com
153	Fernando Ruiz	3001000049	fernando.ruiz@email.com
154	Liliana Vargas	3001000050	liliana.vargas@email.com
155	Julián Hernández	3001000051	julian.hernandez@email.com
156	Melissa Torres	3001000052	melissa.torres@email.com
157	Rubén Álvarez	3001000053	ruben.alvarez@email.com
158	Sara Contreras	3001000054	sara.contreras@email.com
159	Wilson Ortiz	3001000055	wilson.ortiz@email.com
160	Gloria Romero	3001000056	gloria.romero@email.com
161	Kevin Salas	3001000057	kevin.salas@email.com
162	Camila Arango	3001000058	camila.arango@email.com
163	Miguel Castaño	3001000059	miguel.castano@email.com
164	Laura Velásquez	3001000060	laura.velasquez@email.com
165	Diego Herrera	3001000061	diego.herrera@email.com
166	Rocío Nieto	3001000062	rocio.nieto@email.com
167	Emanuel Rodríguez	3001000063	emanuel.rodriguez@email.com
168	Paola Rincón	3001000064	paola.rincon@email.com
169	Oscar Martínez	3001000065	oscar.martinez@email.com
170	Luisa Méndez	3001000066	luisa.mendez@email.com
171	Hugo Romero	3001000067	hugo.romero@email.com
172	Yesenia Forero	3001000068	yesenia.forero@email.com
173	Pedro Álvarez	3001000069	pedro.alvarez@email.com
174	Catalina Vargas	3001000070	catalina.vargas@email.com
175	Martín Rojas	3001000071	martin.rojas@email.com
176	Natalia Cárdenas	3001000072	natalia.cardenas@email.com
177	Esteban Salgado	3001000073	esteban.salgado@email.com
178	Marcela Duarte	3001000074	marcela.duarte@email.com
179	Javier Sánchez	3001000075	javier.sanchez@email.com
180	Liliana Rincón	3001000076	liliana.rincon@email.com
181	Óscar Rincón	3001000077	oscar.rincon@email.com
182	Jenny Morales	3001000078	jenny.morales@email.com
183	Hernando Gil	3001000079	hernando.gil@email.com
184	Clara Ruiz	3001000080	clara.ruiz@email.com
185	Felipe Vargas	3001000081	felipe.vargas@email.com
186	Daniel Salazar	3001000082	daniel.salazar@email.com
187	Viviana Ramírez	3001000083	viviana.ramirez@email.com
188	Mauricio Torres	3001000084	mauricio.torres@email.com
189	Andrea Ríos	3001000085	andrea.rios@email.com
190	Juan Pérez	3001000086	juan.perez@email.com
191	Lorena Morales	3001000087	lorena.morales@email.com
192	Carlos Herrera	3001000088	carlos.herrera@email.com
193	Marcela Jiménez	3001000089	marcela.jimenez@email.com
194	Alejandro Castro	3001000090	alejandro.castro@email.com
195	Paula Mendoza	3001000091	paula.mendoza@email.com
196	Raúl Cortés	3001000092	raul.cortes@email.com
197	Valentina Vega	3001000093	valentina.vega@email.com
198	Iván Quintero	3001000094	ivan.quintero@email.com
199	Natalia Herrera	3001000095	natalia.herrera@email.com
200	Jorge Molina	3001000096	jorge.molina@email.com
201	Claudia Torres	3001000097	claudia.torres@email.com
202	Diego Rojas	3001000098	diego.rojas@email.com
203	Laura Ramírez	3001000099	laura.ramirez@email.com
204	Fernando Paredes	3001000100	fernando.paredes@email.com
\.


--
-- TOC entry 3419 (class 0 OID 98326)
-- Dependencies: 228
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (id, appointmentid, amount, paymentdate) FROM stdin;
301	6	120	2025-01-05
302	7	150	2025-01-06
303	8	200	2025-01-06
304	9	180	2025-01-07
305	10	160	2025-01-07
306	11	140	2025-01-08
307	12	170	2025-01-08
308	13	190	2025-01-09
309	14	130	2025-01-09
310	15	200	2025-01-10
311	16	150	2025-01-10
312	17	180	2025-01-11
313	18	160	2025-01-11
314	19	140	2025-01-12
315	20	170	2025-01-12
316	21	200	2025-01-13
317	22	150	2025-01-13
318	23	180	2025-01-14
319	24	160	2025-01-14
320	25	140	2025-01-15
321	26	170	2025-01-15
322	27	200	2025-01-16
323	28	150	2025-01-16
324	29	180	2025-01-17
325	30	160	2025-01-17
326	31	140	2025-01-18
327	32	170	2025-01-18
328	33	200	2025-01-19
329	34	150	2025-01-19
330	35	180	2025-01-20
331	36	160	2025-01-20
332	37	140	2025-01-21
333	38	170	2025-01-21
334	39	200	2025-01-22
335	40	150	2025-01-22
336	41	180	2025-01-23
337	42	160	2025-01-23
338	43	140	2025-01-24
339	44	170	2025-01-24
340	45	200	2025-01-25
341	46	150	2025-01-25
342	47	180	2025-01-26
343	48	160	2025-01-26
344	49	140	2025-01-27
345	50	170	2025-01-27
346	51	200	2025-01-28
347	52	150	2025-01-28
348	53	180	2025-01-29
349	54	160	2025-01-29
350	55	140	2025-01-30
351	56	170	2025-01-30
352	57	200	2025-01-31
353	58	150	2025-01-31
354	59	180	2025-02-01
355	60	160	2025-02-01
356	61	140	2025-02-02
357	62	170	2025-02-02
358	63	200	2025-02-03
359	64	150	2025-02-03
360	65	180	2025-02-04
361	66	160	2025-02-04
362	67	140	2025-02-05
363	68	170	2025-02-05
364	69	200	2025-02-06
365	70	150	2025-02-06
366	71	180	2025-02-07
367	72	160	2025-02-07
368	73	140	2025-02-08
369	74	170	2025-02-08
370	75	200	2025-02-09
371	76	150	2025-02-09
372	77	180	2025-02-10
373	78	160	2025-02-10
374	79	140	2025-02-11
375	80	170	2025-02-11
376	81	200	2025-02-12
377	82	150	2025-02-12
378	83	180	2025-02-13
379	84	160	2025-02-13
380	85	140	2025-02-14
381	86	170	2025-02-14
382	87	200	2025-02-15
383	88	150	2025-02-15
384	89	180	2025-02-16
385	90	160	2025-02-16
386	91	140	2025-02-17
387	92	170	2025-02-17
388	93	200	2025-02-18
389	94	150	2025-02-18
390	95	180	2025-02-19
391	96	160	2025-02-19
392	97	140	2025-02-20
393	98	170	2025-02-20
394	99	200	2025-02-21
395	100	150	2025-02-21
\.


--
-- TOC entry 3411 (class 0 OID 90120)
-- Dependencies: 220
-- Data for Name: pets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pets (id, name, species, breed, birth_date, owner_id) FROM stdin;
105	Misu	Gato	Siames	2019-08-22	5
106	Luna	Gato	Persa	2020-11-30	6
107	Bella	Gato	Siames	2021-07-10	7
108	Luna	Gato	Persa	2020-11-03	8
109	Nala	Gato	Maine Coon	2020-01-20	9
110	Coco	Gato	Angora	2021-02-07	10
111	Mia	Gato	Bengalí	2021-09-30	11
112	Chloe	Gato	Ragdoll	2019-03-14	12
113	Kira	Gato	British Shorthair	2020-05-10	13
114	Lola	Gato	Esfinge	2019-08-25	14
115	Milo	Gato	Siames	2020-11-12	15
116	Daisy	Gato	Persa	2021-01-08	16
117	Salem	Gato	Bombay	2020-02-25	17
118	Loki	Gato	Abisinio	2021-03-08	18
119	Nube	Gato	Himalayo	2020-07-04	19
120	Cleo	Gato	Angora	2020-11-18	20
121	Kitty	Gato	Calicó	2021-01-12	21
122	Fiona	Gato	Azul Ruso	2018-10-03	22
123	Sasha	Gato	Maine Coon	2020-08-15	23
124	Nina	Gato	Persa	2021-01-28	24
125	Zoe	Gato	Siames	2020-12-19	25
126	Mimi	Gato	Ragdoll	2019-09-10	26
127	Ginger	Gato	Tabby	2020-03-17	27
128	Dolly	Gato	British Shorthair	2019-04-06	28
129	Nina	Gato	Persa	2020-10-21	29
130	Perla	Gato	Esfinge	2021-02-27	30
131	Lily	Gato	Maine Coon	2020-11-05	31
132	Snow	Gato	Himalayo	2019-03-10	32
133	Maya	Gato	Bengalí	2020-06-19	33
134	Suri	Gato	Angora	2021-01-15	34
135	Candy	Gato	Calicó	2019-07-22	35
136	Luna	Gato	Siames	2020-10-08	36
137	Mocha	Gato	Persa	2020-05-20	37
138	Cami	Gato	Maine Coon	2021-01-05	38
139	Sombra	Gato	Bombay	2020-09-12	39
140	Olivia	Gato	Ragdoll	2020-06-30	40
141	Nieve	Gato	Angora	2020-12-12	41
142	Canelita	Gato	Siames	2021-03-19	42
143	Estrella	Gato	Persa	2019-04-25	43
144	Ruby	Gato	Esfinge	2020-07-12	44
145	Misha	Gato	British Shorthair	2020-06-11	45
146	Lili	Gato	Calicó	2021-01-07	46
147	Nora	Gato	Himalayo	2020-02-03	47
148	Lara	Gato	Persa	2019-09-21	48
149	Dory	Gato	Maine Coon	2020-03-19	49
150	Nina	Gato	Siames	2019-05-12	50
151	Zara	Gato	Angora	2021-01-20	51
152	Kiara	Gato	Bengalí	2020-06-22	52
153	Chispa	Gato	Bombay	2020-03-30	53
154	Firulais	Perro	Labrador	2020-05-10	54
155	Rocky	Perro	Bulldog	2021-01-15	55
156	Max	Perro	Golden Retriever	2018-07-25	56
157	Max	Perro	Labrador	2020-03-15	57
158	Rocky	Perro	Bulldog	2018-05-22	58
159	Toby	Perro	Beagle	2019-08-14	59
160	Simba	Perro	Golden Retriever	2017-06-11	60
161	Bruno	Perro	Pastor Alemán	2019-12-22	61
162	Duke	Perro	Husky	2018-10-05	62
163	Zeus	Perro	Doberman	2017-07-22	63
164	Jack	Perro	Boxer	2018-12-01	64
165	Rex	Perro	Rottweiler	2017-09-17	65
166	Thor	Perro	Pitbull	2018-04-30	66
167	Lucky	Perro	Cocker Spaniel	2017-11-13	67
168	Oreo	Perro	Chihuahua	2019-06-19	68
169	Rocco	Perro	Gran Danés	2016-10-22	69
170	Bobby	Perro	Shih Tzu	2018-05-16	70
171	Spike	Perro	Bulldog Francés	2019-09-21	71
172	Tango	Perro	Setter Irlandés	2017-06-25	72
173	Apollo	Perro	Border Collie	2019-02-18	73
174	Shadow	Perro	Mastín	2016-09-30	74
175	Oscar	Perro	Dálmata	2018-11-05	75
176	Hunter	Perro	Akita	2017-05-22	76
177	Diesel	Perro	Doberman	2018-02-28	77
178	Axel	Perro	Boxer	2017-11-09	78
179	Sam	Perro	Beagle	2018-08-12	79
180	Ranger	Perro	Pastor Belga	2016-12-15	80
181	Bolt	Perro	Labrador	2019-07-19	81
182	Hercules	Perro	Gran Danés	2017-08-22	82
183	Chester	Perro	Bulldog	2018-05-11	83
184	Prince	Perro	Pitbull	2017-09-01	84
185	Rambo	Perro	Rottweiler	2016-11-20	85
186	Flash	Perro	Greyhound	2018-12-05	86
187	Leo	Perro	Shiba Inu	2019-03-14	87
188	Storm	Perro	Husky	2017-10-27	88
189	Tiger	Perro	Pastor Alemán	2018-04-18	89
190	Blue	Perro	Labrador	2019-07-08	90
191	Ricky	Perro	Dálmata	2017-11-25	91
192	Buster	Perro	Beagle	2018-01-14	92
193	Sammy	Perro	Boxer	2017-05-11	93
194	Atlas	Perro	Mastín	2016-08-30	94
195	Tommy	Perro	Chihuahua	2019-03-05	95
196	Ryder	Perro	Husky	2018-11-21	96
197	Spike	Perro	Pitbull	2019-08-19	97
198	Odin	Perro	Doberman	2017-12-12	98
199	Scooby	Perro	Gran Danés	2016-11-25	99
200	King	Perro	Bulldog	2018-04-27	100
\.


--
-- TOC entry 3413 (class 0 OID 90132)
-- Dependencies: 222
-- Data for Name: veterinarians; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.veterinarians (id, name, specialty) FROM stdin;
1	Dr. Juan Torres	Canine Medicine
2	Dra. Laura Sánchez	Feline Medicine
3	Dr. Pedro Alvarez	Surgery
4	Dra. Natalia Gómez	Dermatology
5	Dr. Ana Martínez	Medicina interna
6	Dr. Juan Pérez	Cirugía
7	Dra. María Gómez	Dermatología
8	Dr. Carlos Díaz	Odontología
9	Dra. Laura Torres	Cardiología
10	Dr. Andrés Ramírez	Neurología
11	Dr. Alejandro Morales	Oftalmología
12	Dra. Isabella Ríos	Oncología
13	Dr. Mateo Sánchez	Radiología
14	Dra. Daniela Pardo	Endocrinología
15	Dr. Santiago Díaz	Medicina interna
16	Dra. Natalia Ruiz	Cirugía
17	Dr. Sebastián Morales	Dermatología
18	Dra. Juliana Romero	Odontología
19	Dr. Tomás Guerrero	Cardiología
20	Dra. Gabriela Cárdenas	Neurología
21	Dr. José Gutiérrez	Oftalmología
22	Dra. Marcela Salazar	Oncología
23	Dr. Esteban Correa	Radiología
24	Dra. Daniel Castro	Endocrinología
25	Dra. Catalina Muñoz	Medicina interna
26	Dr. Juan López	Cirugía
27	Dra. Andrea Ortiz	Dermatología
28	Dr. Ricardo Méndez	Odontología
29	Dra. Fernanda Duarte	Cardiología
30	Dr. Pablo Ramírez	Neurología
31	Dra. Angela Restrepo	Oftalmología
32	Dr. Hernán Jiménez	Oncología
33	Dra. Carolina Torres	Radiología
34	Dr. Oscar Rivera	Endocrinología
35	Dra. Verónica Molina	Medicina interna
36	Dr. David Peña	Cirugía
37	Dra. Mónica Patiño	Dermatología
38	Dr. Alejandro Ruiz	Odontología
39	Dra. Tatiana Lozano	Cardiología
40	Dr. Simón Suárez	Neurología
41	Dra. Lorena Fernández	Oftalmología
42	Dr. Cristian Vargas	Oncología
43	Dra. Rosa Calderón	Radiología
44	Dr. Iván Trujillo	Endocrinología
45	Dra. Patricia Navarro	Medicina interna
46	Dr. Álvaro Pérez	Cirugía
47	Dra. Viviana Silva	Dermatología
48	Dr. Francisco Aguilar	Odontología
49	Dra. Diana Mejía	Cardiología
50	Dr. Raúl Herrera	Neurología
51	Dra. Claudia Peña	Oftalmología
52	Dr. Mauricio Ochoa	Oncología
53	Dra. Elena Cifuentes	Radiología
54	Dr. Fernando Ruiz	Endocrinología
55	Dra. Liliana Vargas	Medicina interna
56	Dr. Julián Hernández	Cirugía
57	Dra. Melissa Torres	Dermatología
58	Dr. Rubén Álvarez	Odontología
59	Dra. Sara Contreras	Cardiología
60	Dr. Wilson Ortiz	Neurología
61	Dra. Gloria Romero	Oftalmología
62	Dr. Kevin Salas	Oncología
63	Dra. Camila Arango	Radiología
64	Dr. Miguel Castaño	Endocrinología
65	Dra. Laura Velásquez	Medicina interna
66	Dr. Diego Herrera	Cirugía
67	Dra. Rocío Nieto	Dermatología
68	Dr. Emanuel Rodríguez	Odontología
69	Dra. Paola Rincón	Cardiología
70	Dr. Oscar Martínez	Neurología
71	Dra. Luisa Méndez	Oftalmología
72	Dr. Hugo Romero	Oncología
73	Dra. Yesenia Forero	Radiología
74	Dr. Pedro Álvarez	Endocrinología
75	Dra. Catalina Vargas	Medicina interna
76	Dr. Martín Rojas	Cirugía
77	Dra. Natalia Cárdenas	Dermatología
78	Dr. Esteban Salgado	Odontología
79	Dra. Marcela Duarte	Cardiología
80	Dr. Javier Sánchez	Neurología
81	Dra. Liliana Rincón	Oftalmología
82	Dr. Óscar Rincón	Oncología
83	Dra. Jenny Morales	Radiología
84	Dr. Hernando Gil	Endocrinología
85	Dra. Clara Ruiz	Medicina interna
86	Dr. Felipe Vargas	Cirugía
87	Dr. Daniel Salazar	Dermatología
88	Dra. Viviana Ramírez	Odontología
89	Dr. Mauricio Torres	Cardiología
90	Dra. Andrea Ríos	Neurología
91	Dr. Juan Pérez	Oftalmología
92	Dra. Lorena Morales	Oncología
93	Dr. Carlos Herrera	Radiología
94	Dra. Marcela Jiménez	Endocrinología
95	Dr. Alejandro Castro	Medicina interna
96	Dra. Paula Mendoza	Cirugía
97	Dr. Raúl Cortés	Dermatología
98	Dra. Valentina Vega	Odontología
99	Dr. Iván Quintero	Cardiología
100	Dra. Natalia Herrera	Neurología
101	Dr. Jorge Molina	Oftalmología
102	Dra. Claudia Torres	Oncología
103	Dr. Diego Rojas	Radiología
104	Dra. Laura Ramírez	Endocrinología
\.


--
-- TOC entry 3435 (class 0 OID 0)
-- Dependencies: 223
-- Name: appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointments_id_seq', 101, true);


--
-- TOC entry 3436 (class 0 OID 0)
-- Dependencies: 229
-- Name: medicalhistories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medicalhistories_id_seq', 96, true);


--
-- TOC entry 3437 (class 0 OID 0)
-- Dependencies: 217
-- Name: owners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.owners_id_seq', 204, true);


--
-- TOC entry 3438 (class 0 OID 0)
-- Dependencies: 227
-- Name: payments_amount_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_amount_seq', 1, false);


--
-- TOC entry 3439 (class 0 OID 0)
-- Dependencies: 226
-- Name: payments_appointmentid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_appointmentid_seq', 1, false);


--
-- TOC entry 3440 (class 0 OID 0)
-- Dependencies: 225
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_id_seq', 399, true);


--
-- TOC entry 3441 (class 0 OID 0)
-- Dependencies: 219
-- Name: pets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pets_id_seq', 200, true);


--
-- TOC entry 3442 (class 0 OID 0)
-- Dependencies: 221
-- Name: veterinarians_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.veterinarians_id_seq', 104, true);


--
-- TOC entry 3253 (class 2606 OID 90144)
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id);


--
-- TOC entry 3257 (class 2606 OID 98348)
-- Name: medicalhistories medicalhistories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicalhistories
    ADD CONSTRAINT medicalhistories_pkey PRIMARY KEY (id);


--
-- TOC entry 3247 (class 2606 OID 90118)
-- Name: owners owners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owners
    ADD CONSTRAINT owners_pkey PRIMARY KEY (id);


--
-- TOC entry 3255 (class 2606 OID 98333)
-- Name: payments payments_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pk PRIMARY KEY (id);


--
-- TOC entry 3249 (class 2606 OID 90125)
-- Name: pets pets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pets
    ADD CONSTRAINT pets_pkey PRIMARY KEY (id);


--
-- TOC entry 3251 (class 2606 OID 90137)
-- Name: veterinarians veterinarians_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veterinarians
    ADD CONSTRAINT veterinarians_pkey PRIMARY KEY (id);


--
-- TOC entry 3259 (class 2606 OID 90145)
-- Name: appointments fk_appointments_pet; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT fk_appointments_pet FOREIGN KEY (pet_id) REFERENCES public.pets(id);


--
-- TOC entry 3260 (class 2606 OID 90150)
-- Name: appointments fk_appointments_vet; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT fk_appointments_vet FOREIGN KEY (veterinarian_id) REFERENCES public.veterinarians(id);


--
-- TOC entry 3258 (class 2606 OID 90126)
-- Name: pets fk_pets_owner; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pets
    ADD CONSTRAINT fk_pets_owner FOREIGN KEY (owner_id) REFERENCES public.owners(id);


--
-- TOC entry 3262 (class 2606 OID 98349)
-- Name: medicalhistories medicalhistories_petid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicalhistories
    ADD CONSTRAINT medicalhistories_petid_fkey FOREIGN KEY (petid) REFERENCES public.pets(id);


--
-- TOC entry 3261 (class 2606 OID 98355)
-- Name: payments payments_appointments_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_appointments_fk FOREIGN KEY (appointmentid) REFERENCES public.appointments(id);


-- Completed on 2025-10-02 08:46:52

--
-- PostgreSQL database dump complete
--

