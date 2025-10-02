--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.0

-- Started on 2025-10-02 08:44:24

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
-- TOC entry 3437 (class 1262 OID 65536)
-- Name: VeterinaryClinic_Db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "VeterinaryClinic_Db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE "VeterinaryClinic_Db" OWNER TO postgres;

\connect "VeterinaryClinic_Db"

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
-- TOC entry 234 (class 1255 OID 90189)
-- Name: sp_owner_pets(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.sp_owner_pets() RETURNS TABLE(owner_name character varying, pet_name character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT o.name AS owner_name,
           p.name AS pet_name
    FROM owners o
    JOIN pets p ON o.id = p.ownerid;
END;
$$;


ALTER FUNCTION public.sp_owner_pets() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 227 (class 1259 OID 65585)
-- Name: appointments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appointments (
    id integer NOT NULL,
    pet_id integer NOT NULL,
    veterinarianid integer NOT NULL,
    dateappointment date NOT NULL,
    reason character varying NOT NULL
);


ALTER TABLE public.appointments OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 65582)
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
-- TOC entry 3438 (class 0 OID 0)
-- Dependencies: 224
-- Name: appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.appointments_id_seq OWNED BY public.appointments.id;


--
-- TOC entry 225 (class 1259 OID 65583)
-- Name: appointments_pet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.appointments_pet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.appointments_pet_id_seq OWNER TO postgres;

--
-- TOC entry 3439 (class 0 OID 0)
-- Dependencies: 225
-- Name: appointments_pet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.appointments_pet_id_seq OWNED BY public.appointments.pet_id;


--
-- TOC entry 226 (class 1259 OID 65584)
-- Name: appointments_veterinarianid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.appointments_veterinarianid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.appointments_veterinarianid_seq OWNER TO postgres;

--
-- TOC entry 3440 (class 0 OID 0)
-- Dependencies: 226
-- Name: appointments_veterinarianid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.appointments_veterinarianid_seq OWNED BY public.appointments.veterinarianid;


--
-- TOC entry 223 (class 1259 OID 65563)
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
-- TOC entry 222 (class 1259 OID 65562)
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
-- TOC entry 3441 (class 0 OID 0)
-- Dependencies: 222
-- Name: medicalhistories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medicalhistories_id_seq OWNED BY public.medicalhistories.id;


--
-- TOC entry 218 (class 1259 OID 65538)
-- Name: owners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.owners (
    id integer NOT NULL,
    name character varying NOT NULL,
    phone character varying NOT NULL,
    email character varying NOT NULL,
    addres character varying NOT NULL
);


ALTER TABLE public.owners OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 65537)
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
-- TOC entry 3442 (class 0 OID 0)
-- Dependencies: 217
-- Name: owners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.owners_id_seq OWNED BY public.owners.id;


--
-- TOC entry 233 (class 1259 OID 81948)
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
-- TOC entry 232 (class 1259 OID 81947)
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
-- TOC entry 3443 (class 0 OID 0)
-- Dependencies: 232
-- Name: payments_amount_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_amount_seq OWNED BY public.payments.amount;


--
-- TOC entry 231 (class 1259 OID 81946)
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
-- TOC entry 3444 (class 0 OID 0)
-- Dependencies: 231
-- Name: payments_appointmentid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_appointmentid_seq OWNED BY public.payments.appointmentid;


--
-- TOC entry 230 (class 1259 OID 81945)
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
-- TOC entry 3445 (class 0 OID 0)
-- Dependencies: 230
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- TOC entry 221 (class 1259 OID 65548)
-- Name: pets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pets (
    id integer NOT NULL,
    "Name" character varying(100) NOT NULL,
    species character varying NOT NULL,
    breed character varying NOT NULL,
    birthdate date NOT NULL,
    ownerid integer NOT NULL
);


ALTER TABLE public.pets OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 65546)
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
-- TOC entry 3446 (class 0 OID 0)
-- Dependencies: 219
-- Name: pets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pets_id_seq OWNED BY public.pets.id;


--
-- TOC entry 220 (class 1259 OID 65547)
-- Name: pets_ownerid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pets_ownerid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pets_ownerid_seq OWNER TO postgres;

--
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 220
-- Name: pets_ownerid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pets_ownerid_seq OWNED BY public.pets.ownerid;


--
-- TOC entry 229 (class 1259 OID 65601)
-- Name: veterinarians; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veterinarians (
    id integer NOT NULL,
    "Name" character varying NOT NULL,
    specialization character varying NOT NULL,
    phone character varying NOT NULL,
    email character varying NOT NULL
);


ALTER TABLE public.veterinarians OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 65600)
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
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 228
-- Name: veterinarians_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.veterinarians_id_seq OWNED BY public.veterinarians.id;


--
-- TOC entry 3246 (class 2604 OID 65588)
-- Name: appointments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments ALTER COLUMN id SET DEFAULT nextval('public.appointments_id_seq'::regclass);


--
-- TOC entry 3247 (class 2604 OID 65589)
-- Name: appointments pet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments ALTER COLUMN pet_id SET DEFAULT nextval('public.appointments_pet_id_seq'::regclass);


--
-- TOC entry 3248 (class 2604 OID 65590)
-- Name: appointments veterinarianid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments ALTER COLUMN veterinarianid SET DEFAULT nextval('public.appointments_veterinarianid_seq'::regclass);


--
-- TOC entry 3244 (class 2604 OID 65566)
-- Name: medicalhistories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicalhistories ALTER COLUMN id SET DEFAULT nextval('public.medicalhistories_id_seq'::regclass);


--
-- TOC entry 3241 (class 2604 OID 65541)
-- Name: owners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owners ALTER COLUMN id SET DEFAULT nextval('public.owners_id_seq'::regclass);


--
-- TOC entry 3250 (class 2604 OID 81951)
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- TOC entry 3251 (class 2604 OID 81952)
-- Name: payments appointmentid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN appointmentid SET DEFAULT nextval('public.payments_appointmentid_seq'::regclass);


--
-- TOC entry 3252 (class 2604 OID 81953)
-- Name: payments amount; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN amount SET DEFAULT nextval('public.payments_amount_seq'::regclass);


--
-- TOC entry 3242 (class 2604 OID 65551)
-- Name: pets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pets ALTER COLUMN id SET DEFAULT nextval('public.pets_id_seq'::regclass);


--
-- TOC entry 3243 (class 2604 OID 65552)
-- Name: pets ownerid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pets ALTER COLUMN ownerid SET DEFAULT nextval('public.pets_ownerid_seq'::regclass);


--
-- TOC entry 3249 (class 2604 OID 65604)
-- Name: veterinarians id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veterinarians ALTER COLUMN id SET DEFAULT nextval('public.veterinarians_id_seq'::regclass);


--
-- TOC entry 3425 (class 0 OID 65585)
-- Dependencies: 227
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.appointments (id, pet_id, veterinarianid, dateappointment, reason) FROM stdin;
105	1	6	2025-01-05	Consulta general de rutina
106	2	7	2025-01-06	Vacunación anual
107	3	8	2025-01-07	Chequeo dental
108	4	9	2025-01-08	Control postoperatorio
109	5	10	2025-01-09	Consulta por vómitos
110	111	11	2025-01-10	Consulta general de rutina
111	112	12	2025-01-11	Vacunación anual
112	113	13	2025-01-12	Chequeo dental
113	114	14	2025-01-13	Control postoperatorio
114	115	15	2025-01-14	Consulta por vómitos
115	116	16	2025-01-15	Consulta dermatológica
116	117	17	2025-01-16	Examen físico anual
117	118	18	2025-01-17	Chequeo preventivo
118	119	19	2025-01-18	Vacunación antirrábica
119	120	20	2025-01-19	Control de peso
120	121	21	2025-01-20	Chequeo dental
121	122	22	2025-01-21	Examen oftalmológico
122	123	23	2025-01-22	Consulta por diarrea
123	124	24	2025-01-23	Tratamiento respiratorio
124	125	25	2025-01-24	Chequeo general
125	126	26	2025-01-25	Vacunación múltiple
126	127	27	2025-01-26	Control postoperatorio
127	128	28	2025-01-27	Consulta por alergia
128	129	29	2025-01-28	Examen físico anual
129	130	30	2025-01-29	Vacunación antirrábica
130	131	31	2025-01-30	Chequeo preventivo
131	132	32	2025-01-31	Consulta general de rutina
132	133	33	2025-02-01	Vacunación múltiple
133	134	34	2025-02-02	Tratamiento antiparasitario
134	135	35	2025-02-03	Chequeo dental
135	136	36	2025-02-04	Examen físico anual
136	137	37	2025-02-05	Consulta por vómitos
137	138	38	2025-02-06	Control postoperatorio
138	139	39	2025-02-07	Vacunación anual
139	140	40	2025-02-08	Chequeo general
140	141	41	2025-02-09	Consulta dermatológica
141	142	42	2025-02-10	Vacunación múltiple
142	143	43	2025-02-11	Examen físico anual
143	144	44	2025-02-12	Tratamiento antiparasitario
144	145	45	2025-02-13	Chequeo preventivo
145	146	46	2025-02-14	Consulta por tos
146	147	47	2025-02-15	Vacunación antirrábica
147	148	48	2025-02-16	Examen físico anual
148	149	49	2025-02-17	Control de peso
149	150	50	2025-02-18	Consulta general
150	151	51	2025-02-19	Tratamiento respiratorio
151	152	52	2025-02-20	Chequeo preventivo
152	153	53	2025-02-21	Vacunación múltiple
153	154	54	2025-02-22	Consulta dermatológica
154	155	55	2025-02-23	Examen físico anual
155	156	56	2025-02-24	Chequeo dental
156	157	57	2025-02-25	Tratamiento antiparasitario
157	158	58	2025-02-26	Consulta por vómitos
158	159	59	2025-02-27	Control postoperatorio
159	160	60	2025-02-28	Vacunación antirrábica
160	161	61	2025-03-01	Chequeo general
161	162	62	2025-03-02	Examen físico anual
162	163	63	2025-03-03	Consulta dermatológica
163	164	64	2025-03-04	Vacunación múltiple
164	165	65	2025-03-05	Chequeo preventivo
165	166	66	2025-03-06	Tratamiento antiparasitario
166	167	67	2025-03-07	Consulta por tos
167	168	68	2025-03-08	Examen físico anual
168	169	69	2025-03-09	Vacunación anual
169	170	70	2025-03-10	Chequeo dental
170	171	71	2025-03-11	Consulta general de rutina
171	172	72	2025-03-12	Vacunación múltiple
172	173	73	2025-03-13	Control de peso
173	174	74	2025-03-14	Consulta dermatológica
174	175	75	2025-03-15	Examen físico anual
175	176	76	2025-03-16	Chequeo preventivo
176	177	77	2025-03-17	Vacunación antirrábica
177	178	78	2025-03-18	Consulta general
178	179	79	2025-03-19	Tratamiento antiparasitario
179	180	80	2025-03-20	Chequeo dental
180	181	81	2025-03-21	Examen físico anual
181	182	82	2025-03-22	Consulta por vómitos
182	183	83	2025-03-23	Control postoperatorio
183	184	84	2025-03-24	Vacunación múltiple
184	185	85	2025-03-25	Chequeo preventivo
185	186	86	2025-03-26	Consulta dermatológica
186	187	87	2025-03-27	Examen físico anual
187	188	88	2025-03-28	Vacunación antirrábica
188	189	89	2025-03-29	Chequeo general
189	190	90	2025-03-30	Consulta por tos
190	191	91	2025-03-31	Tratamiento antiparasitario
191	192	92	2025-04-01	Examen físico anual
192	193	93	2025-04-02	Vacunación múltiple
193	194	94	2025-04-03	Chequeo preventivo
194	195	95	2025-04-04	Consulta dermatológica
195	196	96	2025-04-05	Examen físico anual
196	197	97	2025-04-06	Chequeo general
197	198	98	2025-04-07	Vacunación anual
198	199	99	2025-04-08	Consulta por vómitos
199	200	100	2025-04-09	Tratamiento antiparasitario
200	201	6	2025-04-10	Chequeo preventivo
201	202	7	2025-04-11	Examen físico anual
202	203	8	2025-04-12	Consulta dermatológica
203	204	9	2025-04-13	Vacunación múltiple
\.


--
-- TOC entry 3421 (class 0 OID 65563)
-- Dependencies: 223
-- Data for Name: medicalhistories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicalhistories (id, petid, description, createdat) FROM stdin;
1	1	Vacunación contra la rabia aplicada	2025-09-24 18:21:48.170026
2	2	Tratamiento por infección urinaria	2025-09-24 18:21:48.170026
3	3	Chequeo dental y limpieza	2025-09-24 18:21:48.170026
4	4	Desparasitación interna y externa	2025-09-24 18:21:48.170026
5	5	Revisión post-operatoria, evolución favorable	2025-09-24 18:21:48.170026
6	1	Chequeo general, vacunación y revisión dental	2025-01-05 10:00:00
7	2	Vacunación anual y control de peso	2025-01-06 11:00:00
8	3	Chequeo dental y limpieza oral	2025-01-07 09:30:00
9	4	Control postoperatorio de cirugía menor	2025-01-08 14:00:00
10	5	Consulta por vómitos frecuentes	2025-01-09 13:00:00
11	111	Chequeo general y vacunación múltiple	2025-01-10 12:00:00
12	113	Chequeo preventivo y suplementación	2025-01-11 10:30:00
13	115	Examen físico anual y revisión de piel	2025-01-12 09:45:00
14	117	Control de peso y vacunación antirrábica	2025-01-13 11:15:00
15	119	Limpieza dental y control de encías	2025-01-14 15:00:00
16	121	Consulta dermatológica, tratamiento tópico	2025-01-15 10:20:00
17	123	Chequeo general y vacunación anual	2025-01-16 13:30:00
18	125	Consulta por vómitos, dieta especial	2025-01-17 14:15:00
19	127	Control postoperatorio de extracción dental	2025-01-18 09:00:00
20	129	Examen físico y revisión de articulaciones	2025-01-19 11:45:00
21	131	Chequeo preventivo y suplementación vitamínica	2025-01-20 10:10:00
22	133	Vacunación múltiple y revisión general	2025-01-21 12:50:00
23	135	Chequeo dental, limpieza y fluoración	2025-01-22 09:25:00
24	137	Control postoperatorio de cirugía menor	2025-01-23 14:40:00
25	139	Consulta general, revisión completa	2025-01-24 10:00:00
26	141	Vacunación anual y control de peso	2025-01-25 11:20:00
27	143	Chequeo preventivo y suplementos	2025-01-26 09:30:00
28	145	Examen físico y revisión de piel	2025-01-27 15:10:00
29	147	Limpieza dental y control de encías	2025-01-28 10:45:00
30	149	Consulta por vómitos frecuentes	2025-01-29 13:00:00
31	151	Chequeo general y vacunación múltiple	2025-01-30 09:50:00
32	153	Vacunación anual y control de peso	2025-01-31 11:15:00
33	155	Chequeo preventivo y revisión de piel	2025-02-01 10:30:00
34	157	Control postoperatorio y antibióticos	2025-02-02 14:00:00
35	159	Limpieza dental y fluoración	2025-02-03 09:20:00
36	161	Consulta general y control de peso	2025-02-04 12:10:00
37	163	Vacunación antirrábica y chequeo físico	2025-02-05 11:40:00
38	165	Chequeo preventivo y suplementación	2025-02-06 10:50:00
39	167	Examen físico anual	2025-02-07 09:30:00
40	169	Limpieza dental y revisión de encías	2025-02-08 14:20:00
41	171	Consulta dermatológica, tratamiento tópico	2025-02-09 10:15:00
42	173	Chequeo general y vacunación múltiple	2025-02-10 11:30:00
43	175	Chequeo preventivo y control de peso	2025-02-11 09:40:00
44	177	Vacunación antirrábica y examen físico	2025-02-12 13:50:00
45	179	Consulta por vómitos y dieta especial	2025-02-13 10:20:00
46	181	Limpieza dental y revisión oral	2025-02-14 12:10:00
47	183	Control postoperatorio de cirugía menor	2025-02-15 14:00:00
48	185	Chequeo preventivo y suplementación	2025-02-16 09:30:00
49	187	Consulta dermatológica y tratamiento tópico	2025-02-17 11:45:00
50	189	Examen físico y revisión general	2025-02-18 10:15:00
51	191	Control postoperatorio y antibióticos	2025-02-19 14:20:00
52	193	Chequeo preventivo y vacunación anual	2025-02-20 09:50:00
53	195	Examen físico anual y revisión dental	2025-02-21 11:30:00
54	197	Consulta general, control de peso	2025-02-22 10:40:00
55	199	Vacunación anual y suplementación	2025-02-23 13:00:00
56	201	Chequeo preventivo y dieta especial	2025-02-24 09:15:00
57	203	Examen físico y control postoperatorio	2025-02-25 11:20:00
58	2	Vacunación anual y chequeo general	2025-02-26 10:30:00
59	4	Chequeo preventivo y revisión de piel	2025-02-27 14:10:00
60	112	Examen físico anual y control dental	2025-02-28 09:50:00
61	114	Control postoperatorio y antibióticos	2025-03-01 11:45:00
62	116	Chequeo dental y limpieza oral	2025-03-02 10:10:00
63	118	Consulta por vómitos y dieta especial	2025-03-03 12:30:00
64	120	Consulta general y vacunación múltiple	2025-03-04 09:40:00
65	122	Vacunación anual y examen físico	2025-03-05 11:00:00
66	124	Chequeo preventivo y suplementación	2025-03-06 10:20:00
67	126	Examen físico y control postoperatorio	2025-03-07 14:15:00
68	128	Control postoperatorio y antibióticos	2025-03-08 09:30:00
69	130	Chequeo dental y limpieza oral	2025-03-09 11:40:00
70	132	Consulta por vómitos y dieta especial	2025-03-10 10:10:00
71	134	Consulta general y revisión completa	2025-03-11 12:50:00
72	136	Vacunación múltiple y chequeo preventivo	2025-03-12 09:45:00
73	138	Chequeo preventivo y suplementación	2025-03-13 11:20:00
74	140	Examen físico y revisión general	2025-03-14 10:15:00
75	142	Control postoperatorio y antibióticos	2025-03-15 13:30:00
76	144	Chequeo dental y limpieza oral	2025-03-16 09:50:00
77	146	Consulta por vómitos y dieta especial	2025-03-17 11:10:00
78	148	Consulta general y vacunación anual	2025-03-18 10:30:00
79	150	Vacunación anual y examen físico	2025-03-19 12:15:00
80	152	Chequeo preventivo y suplementación	2025-03-20 09:40:00
81	154	Examen físico y control postoperatorio	2025-03-21 11:30:00
82	156	Control postoperatorio y antibióticos	2025-03-22 10:10:00
83	158	Chequeo dental y limpieza oral	2025-03-23 13:20:00
84	160	Consulta por vómitos y dieta especial	2025-03-24 09:50:00
85	162	Consulta general y vacunación múltiple	2025-03-25 11:40:00
86	164	Vacunación anual y examen físico	2025-03-26 10:15:00
87	166	Chequeo preventivo y suplementación	2025-03-27 12:50:00
88	168	Examen físico y revisión general	2025-03-28 09:30:00
89	170	Control postoperatorio y antibióticos	2025-03-29 11:10:00
90	172	Chequeo dental y limpieza oral	2025-03-30 10:45:00
91	174	Consulta por vómitos y dieta especial	2025-03-31 12:20:00
92	176	Consulta general y vacunación múltiple	2025-04-01 09:50:00
93	178	Vacunación anual y examen físico	2025-04-02 11:15:00
94	180	Chequeo preventivo y suplementación	2025-04-03 10:10:00
95	182	Examen físico y control postoperatorio	2025-04-04 12:40:00
96	184	Control postoperatorio y antibióticos	2025-04-05 09:50:00
97	186	Chequeo dental y limpieza oral	2025-04-06 11:30:00
98	188	Consulta por vómitos y dieta especial	2025-04-07 10:15:00
99	190	Consulta general y revisión completa	2025-04-08 12:50:00
100	192	Vacunación múltiple y control preventivo	2025-04-09 09:30:00
101	194	Chequeo preventivo y suplementos	2025-04-10 11:10:00
102	196	Examen físico y revisión general	2025-04-11 10:45:00
103	198	Control postoperatorio y antibióticos	2025-04-12 12:20:00
104	200	Chequeo dental y limpieza oral	2025-04-13 09:50:00
105	202	Consulta por vómitos y dieta especial	2025-04-14 11:30:00
106	204	Consulta general y vacunación múltiple	2025-04-15 10:10:00
\.


--
-- TOC entry 3416 (class 0 OID 65538)
-- Dependencies: 218
-- Data for Name: owners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.owners (id, name, phone, email, addres) FROM stdin;
2	Carlos Gómez	3001234567	carlos.gomez@mail.com	Calle 10 #5-20
3	Ana Martínez	3109876543	ana.martinez@mail.com	Carrera 15 #8-12
4	Luis Pérez	3204567890	luis.perez@mail.com	Av. Siempre Viva 123
5	María Rodríguez	3015551122	maria.rodriguez@mail.com	Calle 23 #45-67
6	Sofía Hernández	3114447788	sofia.hernandez@mail.com	Carrera 9 #20-15
7	Carlos Gómez	3001234567	carlos.gomez@mail.com	Calle 10 #5-20
8	Ana Martínez	3109876543	ana.martinez@mail.com	Carrera 15 #8-12
9	Luis Pérez	3204567890	luis.perez@mail.com	Av. Siempre Viva 123
10	María Rodríguez	3015551122	maria.rodriguez@mail.com	Calle 23 #45-67
11	Sofía Hernández	3114447788	sofia.hernandez@mail.com	Carrera 9 #20-15
12	Carlos Pérez	3001110001	carlos.perez@email.com	Calle 10 #20-30
13	María Gómez	3001110002	maria.gomez@email.com	Carrera 15 #45-12
14	Luis Rodríguez	3001110003	luis.rodriguez@email.com	Av. 30 #12-50
15	Ana Torres	3001110004	ana.torres@email.com	Calle 8 #9-25
16	Jorge Ramírez	3001110005	jorge.ramirez@email.com	Carrera 7 #15-60
17	Paula Martínez	3001110006	paula.martinez@email.com	Av. 68 #45-22
18	Andrés Herrera	3001110007	andres.herrera@email.com	Calle 100 #25-12
19	Laura Jiménez	3001110008	laura.jimenez@email.com	Carrera 40 #12-10
20	Felipe Castro	3001110009	felipe.castro@email.com	Calle 12 #8-34
21	Valentina Ríos	3001110010	valentina.rios@email.com	Carrera 50 #22-14
22	Camilo Vargas	3001110011	camilo.vargas@email.com	Av. 80 #30-45
23	Isabella López	3001110012	isabella.lopez@email.com	Calle 24 #18-20
24	Mateo Sánchez	3001110013	mateo.sanchez@email.com	Carrera 9 #14-30
25	Daniela Pardo	3001110014	daniela.pardo@email.com	Av. 13 #45-33
26	Santiago Díaz	3001110015	santiago.diaz@email.com	Calle 60 #23-11
27	Natalia Ruiz	3001110016	natalia.ruiz@email.com	Carrera 12 #10-05
28	Sebastián Morales	3001110017	sebastian.morales@email.com	Av. 15 #60-10
29	Juliana Romero	3001110018	juliana.romero@email.com	Calle 45 #22-07
30	Tomás Guerrero	3001110019	tomas.guerrero@email.com	Carrera 18 #33-22
31	Gabriela Cárdenas	3001110020	gabriela.cardenas@email.com	Av. 19 #55-11
32	José Gutiérrez	3001110021	jose.gutierrez@email.com	Calle 21 #8-22
33	Marcela Salazar	3001110022	marcela.salazar@email.com	Carrera 28 #40-16
34	Esteban Correa	3001110023	esteban.correa@email.com	Av. 26 #12-09
35	Daniel Castro	3001110024	daniel.castro@email.com	Calle 5 #17-30
36	Catalina Muñoz	3001110025	catalina.munoz@email.com	Carrera 80 #14-60
37	Juan López	3001110026	juan.lopez@email.com	Av. 7 #33-21
38	Andrea Ortiz	3001110027	andrea.ortiz@email.com	Calle 12 #20-10
39	Ricardo Méndez	3001110028	ricardo.mendez@email.com	Carrera 60 #45-22
40	Fernanda Duarte	3001110029	fernanda.duarte@email.com	Av. 20 #10-13
41	Pablo Ramírez	3001110030	pablo.ramirez@email.com	Calle 40 #18-14
42	Angela Restrepo	3001110031	angela.restrepo@email.com	Carrera 15 #8-33
43	Hernán Jiménez	3001110032	hernan.jimenez@email.com	Av. 100 #40-12
44	Carolina Torres	3001110033	carolina.torres@email.com	Calle 18 #12-23
45	Oscar Rivera	3001110034	oscar.rivera@email.com	Carrera 22 #30-17
46	Verónica Molina	3001110035	veronica.molina@email.com	Av. 5 #22-08
47	David Peña	3001110036	david.pena@email.com	Calle 70 #50-20
48	Mónica Patiño	3001110037	monica.patino@email.com	Carrera 13 #16-18
49	Alejandro Ruiz	3001110038	alejandro.ruiz@email.com	Av. 30 #14-10
50	Tatiana Lozano	3001110039	tatiana.lozano@email.com	Calle 28 #22-15
51	Simón Suárez	3001110040	simon.suarez@email.com	Carrera 19 #20-06
52	Lorena Fernández	3001110041	lorena.fernandez@email.com	Av. 45 #11-10
53	Cristian Vargas	3001110042	cristian.vargas@email.com	Calle 90 #8-14
54	Rosa Calderón	3001110043	rosa.calderon@email.com	Carrera 5 #22-20
55	Iván Trujillo	3001110044	ivan.trujillo@email.com	Av. 15 #30-11
56	Patricia Navarro	3001110045	patricia.navarro@email.com	Calle 50 #15-33
57	Álvaro Pérez	3001110046	alvaro.perez@email.com	Carrera 28 #12-29
58	Viviana Silva	3001110047	viviana.silva@email.com	Av. 17 #9-14
59	Francisco Aguilar	3001110048	francisco.aguilar@email.com	Calle 34 #40-22
60	Diana Mejía	3001110049	diana.mejia@email.com	Carrera 6 #20-30
61	Raúl Herrera	3001110050	raul.herrera@email.com	Av. 40 #33-14
62	Claudia Peña	3001110051	claudia.pena@email.com	Calle 32 #15-25
63	Mauricio Ochoa	3001110052	mauricio.ochoa@email.com	Carrera 50 #18-12
64	Elena Cifuentes	3001110053	elena.cifuentes@email.com	Av. 80 #12-40
65	Fernando Ruiz	3001110054	fernando.ruiz@email.com	Calle 15 #10-22
66	Liliana Vargas	3001110055	liliana.vargas@email.com	Carrera 60 #20-09
67	Julián Hernández	3001110056	julian.hernandez@email.com	Av. 22 #45-12
68	Melissa Torres	3001110057	melissa.torres@email.com	Calle 10 #5-17
69	Rubén Álvarez	3001110058	ruben.alvarez@email.com	Carrera 33 #22-19
70	Sara Contreras	3001110059	sara.contreras@email.com	Av. 35 #40-10
71	Wilson Ortiz	3001110060	wilson.ortiz@email.com	Calle 28 #14-21
72	Gloria Romero	3001110061	gloria.romero@email.com	Carrera 45 #20-12
73	Kevin Salas	3001110062	kevin.salas@email.com	Av. 27 #11-10
74	Camila Arango	3001110063	camila.arango@email.com	Calle 60 #22-14
75	Miguel Castaño	3001110064	miguel.castano@email.com	Carrera 19 #8-20
76	Laura Velásquez	3001110065	laura.velasquez@email.com	Av. 13 #40-09
77	Diego Herrera	3001110066	diego.herrera@email.com	Calle 15 #22-23
78	Rocío Nieto	3001110067	rocio.nieto@email.com	Carrera 30 #18-10
79	Emanuel Rodríguez	3001110068	emanuel.rodriguez@email.com	Av. 12 #50-15
80	Paola Rincón	3001110069	paola.rincon@email.com	Calle 22 #30-16
81	Oscar Martínez	3001110070	oscar.martinez@email.com	Carrera 33 #12-24
82	Luisa Méndez	3001110071	luisa.mendez@email.com	Av. 14 #9-10
83	Hugo Romero	3001110072	hugo.romero@email.com	Calle 17 #22-11
84	Yesenia Forero	3001110073	yesenia.forero@email.com	Carrera 11 #30-15
85	Pedro Álvarez	3001110074	pedro.alvarez@email.com	Av. 20 #45-14
86	Catalina Vargas	3001110075	catalina.vargas@email.com	Calle 35 #12-20
87	Martín Rojas	3001110076	martin.rojas@email.com	Carrera 18 #40-17
88	Natalia Cárdenas	3001110077	natalia.cardenas@email.com	Av. 23 #11-12
89	Esteban Salgado	3001110078	esteban.salgado@email.com	Calle 28 #22-33
90	Marcela Duarte	3001110079	marcela.duarte@email.com	Carrera 15 #10-19
91	Javier Sánchez	3001110080	javier.sanchez@email.com	Av. 45 #20-10
92	Liliana Rincón	3001110081	liliana.rincon@email.com	Calle 19 #8-40
93	Óscar Rincón	3001110082	oscar.rincon@email.com	Carrera 50 #15-29
94	Jenny Morales	3001110083	jenny.morales@email.com	Av. 33 #14-13
95	Hernando Gil	3001110084	hernando.gil@email.com	Calle 14 #18-20
96	Clara Ruiz	3001110085	clara.ruiz@email.com	Carrera 60 #25-19
97	Felipe Vargas	3001110086	felipe.vargas@email.com	Av. 9 #40-18
98	Daniel Salazar	3001110087	daniel.salazar@email.com	Calle 27 #33-14
99	Viviana Ramírez	3001110088	viviana.ramirez@email.com	Carrera 20 #50-16
100	Mauricio Torres	3001110089	mauricio.torres@email.com	Av. 11 #20-20
101	Andrea Ríos	3001110090	andrea.rios@email.com	Calle 38 #22-14
102	Germán Suárez	3001110091	german.suarez@email.com	Carrera 25 #12-18
103	Alejandra Jaramillo	3001110092	alejandra.jaramillo@email.com	Av. 31 #15-11
104	Rodrigo Castro	3001110093	rodrigo.castro@email.com	Calle 26 #18-21
105	Carla Villamil	3001110094	carla.villamil@email.com	Carrera 15 #30-30
106	Mauricio Benítez	3001110095	mauricio.benitez@email.com	Av. 18 #14-12
107	Verónica Castaño	3001110096	veronica.castano@email.com	Calle 10 #22-16
108	Camilo Gómez	3001110097	camilo.gomez@email.com	Carrera 45 #40-13
109	Julieta Torres	3001110098	julieta.torres@email.com	Av. 25 #18-10
110	Nicolás Morales	3001110099	nicolas.morales@email.com	Calle 11 #9-15
111	Lorena Pérez	3001110100	lorena.perez@email.com	Carrera 19 #10-22
\.


--
-- TOC entry 3431 (class 0 OID 81948)
-- Dependencies: 233
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (id, appointmentid, amount, paymentdate) FROM stdin;
211	105	150000	2025-01-06
212	106	200000	2025-01-07
213	107	120000	2025-01-08
214	108	180000	2025-01-09
215	109	130000	2025-01-10
216	110	160000	2025-01-11
217	111	190000	2025-01-12
218	112	140000	2025-01-13
219	113	210000	2025-01-14
220	114	170000	2025-01-15
221	115	220000	2025-01-16
222	116	125000	2025-01-17
223	117	135000	2025-01-18
224	118	150000	2025-01-19
225	119	160000	2025-01-20
226	120	175000	2025-01-21
227	121	200000	2025-01-22
228	122	180000	2025-01-23
229	123	155000	2025-01-24
230	124	165000	2025-01-25
231	125	210000	2025-01-26
232	126	190000	2025-01-27
233	127	175000	2025-01-28
234	128	200000	2025-01-29
235	129	220000	2025-01-30
236	130	180000	2025-01-31
237	131	160000	2025-02-01
238	132	150000	2025-02-02
239	133	170000	2025-02-03
240	134	140000	2025-02-04
241	135	155000	2025-02-05
242	136	165000	2025-02-06
243	137	180000	2025-02-07
244	138	190000	2025-02-08
245	139	200000	2025-02-09
246	140	210000	2025-02-10
247	141	220000	2025-02-11
248	142	180000	2025-02-12
249	143	160000	2025-02-13
250	144	150000	2025-02-14
251	145	175000	2025-02-15
252	146	190000	2025-02-16
253	147	200000	2025-02-17
254	148	210000	2025-02-18
255	149	220000	2025-02-19
256	150	230000	2025-02-20
257	151	180000	2025-02-21
258	152	160000	2025-02-22
259	153	170000	2025-02-23
260	154	190000	2025-02-24
261	155	200000	2025-02-25
262	156	210000	2025-02-26
263	157	220000	2025-02-27
264	158	230000	2025-02-28
265	159	150000	2025-03-01
266	160	160000	2025-03-02
267	161	175000	2025-03-03
268	162	180000	2025-03-04
269	163	190000	2025-03-05
270	164	200000	2025-03-06
271	165	210000	2025-03-07
272	166	220000	2025-03-08
273	167	230000	2025-03-09
274	168	240000	2025-03-10
275	169	250000	2025-03-11
276	170	260000	2025-03-12
277	171	270000	2025-03-13
278	172	280000	2025-03-14
279	173	290000	2025-03-15
280	174	300000	2025-03-16
281	175	310000	2025-03-17
282	176	320000	2025-03-18
283	177	330000	2025-03-19
284	178	340000	2025-03-20
285	179	350000	2025-03-21
286	180	360000	2025-03-22
287	181	370000	2025-03-23
288	182	380000	2025-03-24
289	183	390000	2025-03-25
290	184	400000	2025-03-26
291	185	410000	2025-03-27
292	186	420000	2025-03-28
293	187	430000	2025-03-29
294	188	440000	2025-03-30
295	189	450000	2025-03-31
296	190	460000	2025-04-01
297	191	470000	2025-04-02
298	192	480000	2025-04-03
299	193	490000	2025-04-04
300	194	500000	2025-04-05
301	195	150000	2025-04-06
302	196	160000	2025-04-07
303	197	170000	2025-04-08
304	198	180000	2025-04-09
305	199	190000	2025-04-10
306	200	200000	2025-04-11
307	201	210000	2025-04-12
308	202	220000	2025-04-13
309	203	230000	2025-04-14
\.


--
-- TOC entry 3419 (class 0 OID 65548)
-- Dependencies: 221
-- Data for Name: pets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pets (id, "Name", species, breed, birthdate, ownerid) FROM stdin;
111	Max	Perro	Labrador	2020-03-15	7
112	Bella	Gato	Siames	2021-07-10	8
113	Rocky	Perro	Bulldog	2018-05-22	9
114	Luna	Gato	Persa	2020-11-03	10
115	Toby	Perro	Beagle	2019-08-14	11
116	Nala	Gato	Maine Coon	2020-01-20	12
117	Simba	Perro	Golden Retriever	2017-06-11	13
118	Coco	Gato	Angora	2021-02-07	14
119	Bruno	Perro	Pastor Alemán	2019-12-22	15
120	Mia	Gato	Bengalí	2021-09-30	16
121	Duke	Perro	Husky	2018-10-05	17
1	Firulais	Perro	Labrador	2020-05-10	2
2	Misu	Gato	Siames	2019-08-22	3
3	Rocky	Perro	Bulldog	2021-01-15	4
4	Luna	Gato	Persa	2020-11-30	5
122	Chloe	Gato	Ragdoll	2019-03-14	18
5	Max	Perro	Golden Retriever	2018-07-25	6
123	Zeus	Perro	Doberman	2017-07-22	19
124	Kira	Gato	British Shorthair	2020-05-10	20
125	Jack	Perro	Boxer	2018-12-01	21
126	Lola	Gato	Esfinge	2019-08-25	22
127	Rex	Perro	Rottweiler	2017-09-17	23
128	Milo	Gato	Siames	2020-11-12	24
129	Thor	Perro	Pitbull	2018-04-30	25
130	Daisy	Gato	Persa	2021-01-08	26
131	Lucky	Perro	Cocker Spaniel	2017-11-13	27
132	Salem	Gato	Bombay	2020-02-25	28
133	Oreo	Perro	Chihuahua	2019-06-19	29
134	Loki	Gato	Abisinio	2021-03-08	30
135	Rocco	Perro	Gran Danés	2016-10-22	31
136	Nube	Gato	Himalayo	2020-07-04	32
137	Bobby	Perro	Shih Tzu	2018-05-16	33
138	Cleo	Gato	Angora	2020-11-18	34
139	Spike	Perro	Bulldog Francés	2019-09-21	35
140	Kitty	Gato	Calicó	2021-01-12	36
141	Tango	Perro	Setter Irlandés	2017-06-25	37
142	Fiona	Gato	Azul Ruso	2018-10-03	38
143	Apollo	Perro	Border Collie	2019-02-18	39
144	Sasha	Gato	Maine Coon	2020-08-15	40
145	Shadow	Perro	Mastín	2016-09-30	41
146	Nina	Gato	Persa	2021-01-28	42
147	Oscar	Perro	Dálmata	2018-11-05	43
148	Zoe	Gato	Siames	2020-12-19	44
149	Hunter	Perro	Akita	2017-05-22	45
150	Mimi	Gato	Ragdoll	2019-09-10	46
151	Diesel	Perro	Doberman	2018-02-28	47
152	Ginger	Gato	Tabby	2020-03-17	48
153	Axel	Perro	Boxer	2017-11-09	49
154	Dolly	Gato	British Shorthair	2019-04-06	50
155	Sam	Perro	Beagle	2018-08-12	51
156	Nina	Gato	Persa	2020-10-21	52
157	Ranger	Perro	Pastor Belga	2016-12-15	53
158	Perla	Gato	Esfinge	2021-02-27	54
159	Bolt	Perro	Labrador	2019-07-19	55
160	Lily	Gato	Maine Coon	2020-11-05	56
161	Hercules	Perro	Gran Danés	2017-08-22	57
162	Snow	Gato	Himalayo	2019-03-10	58
163	Chester	Perro	Bulldog	2018-05-11	59
164	Maya	Gato	Bengalí	2020-06-19	60
165	Prince	Perro	Pitbull	2017-09-01	61
166	Suri	Gato	Angora	2021-01-15	62
167	Rambo	Perro	Rottweiler	2016-11-20	63
168	Candy	Gato	Calicó	2019-07-22	64
169	Flash	Perro	Greyhound	2018-12-05	65
170	Luna	Gato	Siames	2020-10-08	66
171	Leo	Perro	Shiba Inu	2019-03-14	67
172	Mocha	Gato	Persa	2020-05-20	68
173	Storm	Perro	Husky	2017-10-27	69
174	Cami	Gato	Maine Coon	2021-01-05	70
175	Tiger	Perro	Pastor Alemán	2018-04-18	71
176	Sombra	Gato	Bombay	2020-09-12	72
177	Blue	Perro	Labrador	2019-07-08	73
178	Olivia	Gato	Ragdoll	2020-06-30	74
179	Ricky	Perro	Dálmata	2017-11-25	75
180	Nieve	Gato	Angora	2020-12-12	76
181	Buster	Perro	Beagle	2018-01-14	77
182	Canelita	Gato	Siames	2021-03-19	78
183	Sammy	Perro	Boxer	2017-05-11	79
184	Estrella	Gato	Persa	2019-04-25	80
185	Atlas	Perro	Mastín	2016-08-30	81
186	Ruby	Gato	Esfinge	2020-07-12	82
187	Tommy	Perro	Chihuahua	2019-03-05	83
188	Misha	Gato	British Shorthair	2020-06-11	84
189	Ryder	Perro	Husky	2018-11-21	85
190	Lili	Gato	Calicó	2021-01-07	86
191	Spike	Perro	Pitbull	2019-08-19	87
192	Nora	Gato	Himalayo	2020-02-03	88
193	Odin	Perro	Doberman	2017-12-12	89
194	Lara	Gato	Persa	2019-09-21	90
195	Scooby	Perro	Gran Danés	2016-11-25	91
196	Dory	Gato	Maine Coon	2020-03-19	92
197	King	Perro	Bulldog	2018-04-27	93
198	Nina	Gato	Siames	2019-05-12	94
199	Thor	Perro	Rottweiler	2017-09-17	95
200	Zara	Gato	Angora	2021-01-20	96
201	Rusty	Perro	Beagle	2019-02-05	97
202	Kiara	Gato	Bengalí	2020-06-22	98
203	Diesel	Perro	Mastín	2017-08-11	99
204	Chispa	Gato	Bombay	2020-03-30	100
\.


--
-- TOC entry 3427 (class 0 OID 65601)
-- Dependencies: 229
-- Data for Name: veterinarians; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.veterinarians (id, "Name", specialization, phone, email) FROM stdin;
1	Dr. Juan Pérez	Cirugía	3001234567	juan.perez@vetclinic.com
2	Dra. María Gómez	Animales pequeños	3012345678	maria.gomez@vetclinic.com
3	Dr. Carlos Díaz	Animales exóticos	3023456789	carlos.diaz@vetclinic.com
4	Dra. Laura Torres	Dermatología	3034567890	laura.torres@vetclinic.com
5	Dr. Andrés Ramírez	Odontología	3045678901	andres.ramirez@vetclinic.com
6	Dr. Alejandro Pérez	Cardiología	3001000006	alejandro.perez6@email.com
7	Dra. Mariana Gómez	Dermatología	3001000007	mariana.gomez7@email.com
8	Dr. Luis Rodríguez	Neurología	3001000008	luis.rodriguez8@email.com
9	Dra. Ana Torres	Oncología	3001000009	ana.torres9@email.com
10	Dr. Jorge Ramírez	Pediatría	3001000010	jorge.ramirez10@email.com
11	Dra. Paula Martínez	Oftalmología	3001000011	paula.martinez11@email.com
12	Dr. Andrés Herrera	Traumatología	3001000012	andres.herrera12@email.com
13	Dra. Laura Jiménez	Endocrinología	3001000013	laura.jimenez13@email.com
14	Dr. Felipe Castro	Gastroenterología	3001000014	felipe.castro14@email.com
15	Dra. Valentina Ríos	Reumatología	3001000015	valentina.rios15@email.com
16	Dr. Camilo Vargas	Cardiología	3001000016	camilo.vargas16@email.com
17	Dra. Isabella López	Dermatología	3001000017	isabella.lopez17@email.com
18	Dr. Mateo Sánchez	Neurología	3001000018	mateo.sanchez18@email.com
19	Dra. Daniela Pardo	Oncología	3001000019	daniela.pardo19@email.com
20	Dr. Santiago Díaz	Pediatría	3001000020	santiago.diaz20@email.com
21	Dra. Natalia Ruiz	Oftalmología	3001000021	natalia.ruiz21@email.com
22	Dr. Sebastián Morales	Traumatología	3001000022	sebastian.morales22@email.com
23	Dra. Juliana Romero	Endocrinología	3001000023	juliana.romero23@email.com
24	Dr. Tomás Guerrero	Gastroenterología	3001000024	tomas.guerrero24@email.com
25	Dra. Gabriela Cárdenas	Reumatología	3001000025	gabriela.cardenas25@email.com
26	Dr. José Gutiérrez	Cardiología	3001000026	jose.gutierrez26@email.com
27	Dra. Marcela Salazar	Dermatología	3001000027	marcela.salazar27@email.com
28	Dr. Esteban Correa	Neurología	3001000028	esteban.correa28@email.com
29	Dra. Daniel Castro	Oncología	3001000029	daniel.castro29@email.com
30	Dr. Catalina Muñoz	Pediatría	3001000030	catalina.munoz30@email.com
31	Dra. Juan López	Oftalmología	3001000031	juan.lopez31@email.com
32	Dr. Andrea Ortiz	Traumatología	3001000032	andrea.ortiz32@email.com
33	Dra. Ricardo Méndez	Endocrinología	3001000033	ricardo.mendez33@email.com
34	Dr. Fernanda Duarte	Gastroenterología	3001000034	fernanda.duarte34@email.com
35	Dra. Pablo Ramírez	Reumatología	3001000035	pablo.ramirez35@email.com
36	Dr. Angela Restrepo	Cardiología	3001000036	angela.restrepo36@email.com
37	Dra. Hernán Jiménez	Dermatología	3001000037	hernan.jimenez37@email.com
38	Dr. Carolina Torres	Neurología	3001000038	carolina.torres38@email.com
39	Dra. Oscar Rivera	Oncología	3001000039	oscar.rivera39@email.com
40	Dr. Verónica Molina	Pediatría	3001000040	veronica.molina40@email.com
41	Dra. David Peña	Oftalmología	3001000041	david.pena41@email.com
42	Dr. Mónica Patiño	Traumatología	3001000042	monica.patino42@email.com
43	Dra. Alejandro Ruiz	Endocrinología	3001000043	alejandro.ruiz43@email.com
44	Dr. Tatiana Lozano	Gastroenterología	3001000044	tatiana.lozano44@email.com
45	Dra. Simón Suárez	Reumatología	3001000045	simon.suarez45@email.com
46	Dr. Lorena Fernández	Cardiología	3001000046	lorena.fernandez46@email.com
47	Dra. Cristian Vargas	Dermatología	3001000047	cristian.vargas47@email.com
48	Dr. Rosa Calderón	Neurología	3001000048	rosa.calderon48@email.com
49	Dra. Iván Trujillo	Oncología	3001000049	ivan.trujillo49@email.com
50	Dr. Patricia Navarro	Pediatría	3001000050	patricia.navarro50@email.com
51	Dra. Álvaro Pérez	Oftalmología	3001000051	alvaro.perez51@email.com
52	Dr. Viviana Silva	Traumatología	3001000052	viviana.silva52@email.com
53	Dra. Francisco Aguilar	Endocrinología	3001000053	francisco.aguilar53@email.com
54	Dr. Diana Mejía	Gastroenterología	3001000054	diana.mejia54@email.com
55	Dra. Raúl Herrera	Reumatología	3001000055	raul.herrera55@email.com
56	Dr. Claudia Peña	Cardiología	3001000056	claudia.pena56@email.com
57	Dra. Mauricio Ochoa	Dermatología	3001000057	mauricio.ochoa57@email.com
58	Dr. Elena Cifuentes	Neurología	3001000058	elena.cifuentes58@email.com
59	Dra. Fernando Ruiz	Oncología	3001000059	fernando.ruiz59@email.com
60	Dr. Liliana Vargas	Pediatría	3001000060	liliana.vargas60@email.com
61	Dra. Julián Hernández	Oftalmología	3001000061	julian.hernandez61@email.com
62	Dr. Melissa Torres	Traumatología	3001000062	melissa.torres62@email.com
63	Dra. Rubén Álvarez	Endocrinología	3001000063	ruben.alvarez63@email.com
64	Dr. Sara Contreras	Gastroenterología	3001000064	sara.contreras64@email.com
65	Dra. Wilson Ortiz	Reumatología	3001000065	wilson.ortiz65@email.com
66	Dr. Gloria Romero	Cardiología	3001000066	gloria.romero66@email.com
67	Dra. Kevin Salas	Dermatología	3001000067	kevin.salas67@email.com
68	Dr. Camila Arango	Neurología	3001000068	camila.arango68@email.com
69	Dra. Miguel Castaño	Oncología	3001000069	miguel.castano69@email.com
70	Dr. Laura Velásquez	Pediatría	3001000070	laura.velasquez70@email.com
71	Dra. Diego Herrera	Oftalmología	3001000071	diego.herrera71@email.com
72	Dr. Rocío Nieto	Traumatología	3001000072	rocio.nieto72@email.com
73	Dra. Emanuel Rodríguez	Endocrinología	3001000073	emanuel.rodriguez73@email.com
74	Dr. Paola Rincón	Gastroenterología	3001000074	paola.rincon74@email.com
75	Dra. Oscar Martínez	Reumatología	3001000075	oscar.martinez75@email.com
76	Dr. Luisa Méndez	Cardiología	3001000076	luisa.mendez76@email.com
77	Dra. Hugo Romero	Dermatología	3001000077	hugo.romero77@email.com
78	Dr. Yesenia Forero	Neurología	3001000078	yesenia.forero78@email.com
79	Dra. Pedro Álvarez	Oncología	3001000079	pedro.alvarez79@email.com
80	Dr. Catalina Vargas	Pediatría	3001000080	catalina.vargas80@email.com
81	Dra. Martín Rojas	Oftalmología	3001000081	martin.rojas81@email.com
82	Dr. Natalia Cárdenas	Traumatología	3001000082	natalia.cardenas82@email.com
83	Dra. Esteban Salgado	Endocrinología	3001000083	esteban.salgado83@email.com
84	Dr. Marcela Duarte	Gastroenterología	3001000084	marcela.duarte84@email.com
85	Dra. Javier Sánchez	Reumatología	3001000085	javier.sanchez85@email.com
86	Dr. Liliana Rincón	Cardiología	3001000086	liliana.rincon86@email.com
87	Dra. Óscar Rincón	Dermatología	3001000087	oscar.rincon87@email.com
88	Dr. Jenny Morales	Neurología	3001000088	jenny.morales88@email.com
89	Dra. Hernando Gil	Oncología	3001000089	hernando.gil89@email.com
90	Dr. Clara Ruiz	Pediatría	3001000090	clara.ruiz90@email.com
91	Dra. Felipe Vargas	Oftalmología	3001000091	felipe.vargas91@email.com
92	Dr. Daniel Salazar	Traumatología	3001000092	daniel.salazar92@email.com
93	Dra. Viviana Ramírez	Endocrinología	3001000093	viviana.ramirez93@email.com
94	Dr. Mauricio Torres	Gastroenterología	3001000094	mauricio.torres94@email.com
95	Dra. Andrea Ríos	Reumatología	3001000095	andrea.rios95@email.com
96	Dr. Juan Pérez	Cardiología	3001000096	juan.perez96@email.com
97	Dra. Lorena Morales	Dermatología	3001000097	lorena.morales97@email.com
98	Dr. Carlos Herrera	Neurología	3001000098	carlos.herrera98@email.com
99	Dra. Marcela Jiménez	Oncología	3001000099	marcela.jimenez99@email.com
100	Dr. Alejandro Castro	Pediatría	3001000100	alejandro.castro100@email.com
\.


--
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 224
-- Name: appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointments_id_seq', 203, true);


--
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 225
-- Name: appointments_pet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointments_pet_id_seq', 1, false);


--
-- TOC entry 3451 (class 0 OID 0)
-- Dependencies: 226
-- Name: appointments_veterinarianid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointments_veterinarianid_seq', 1, false);


--
-- TOC entry 3452 (class 0 OID 0)
-- Dependencies: 222
-- Name: medicalhistories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medicalhistories_id_seq', 106, true);


--
-- TOC entry 3453 (class 0 OID 0)
-- Dependencies: 217
-- Name: owners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.owners_id_seq', 111, true);


--
-- TOC entry 3454 (class 0 OID 0)
-- Dependencies: 232
-- Name: payments_amount_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_amount_seq', 1, false);


--
-- TOC entry 3455 (class 0 OID 0)
-- Dependencies: 231
-- Name: payments_appointmentid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_appointmentid_seq', 1, false);


--
-- TOC entry 3456 (class 0 OID 0)
-- Dependencies: 230
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_id_seq', 309, true);


--
-- TOC entry 3457 (class 0 OID 0)
-- Dependencies: 219
-- Name: pets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pets_id_seq', 204, true);


--
-- TOC entry 3458 (class 0 OID 0)
-- Dependencies: 220
-- Name: pets_ownerid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pets_ownerid_seq', 1, true);


--
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 228
-- Name: veterinarians_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.veterinarians_id_seq', 100, true);


--
-- TOC entry 3260 (class 2606 OID 65594)
-- Name: appointments appointments_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pk PRIMARY KEY (id);


--
-- TOC entry 3258 (class 2606 OID 65571)
-- Name: medicalhistories medicalhistories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicalhistories
    ADD CONSTRAINT medicalhistories_pkey PRIMARY KEY (id);


--
-- TOC entry 3254 (class 2606 OID 65545)
-- Name: owners owners_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owners
    ADD CONSTRAINT owners_pk PRIMARY KEY (id);


--
-- TOC entry 3264 (class 2606 OID 81955)
-- Name: payments payments_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pk PRIMARY KEY (id);


--
-- TOC entry 3256 (class 2606 OID 65556)
-- Name: pets pets_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pets
    ADD CONSTRAINT pets_pk PRIMARY KEY (id);


--
-- TOC entry 3262 (class 2606 OID 65608)
-- Name: veterinarians veterinarians_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veterinarians
    ADD CONSTRAINT veterinarians_pk PRIMARY KEY (id);


--
-- TOC entry 3267 (class 2606 OID 65595)
-- Name: appointments appointments_pets_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pets_fk FOREIGN KEY (pet_id) REFERENCES public.pets(id);


--
-- TOC entry 3268 (class 2606 OID 65609)
-- Name: appointments appointments_veterinarians_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_veterinarians_fk FOREIGN KEY (veterinarianid) REFERENCES public.veterinarians(id);


--
-- TOC entry 3266 (class 2606 OID 65572)
-- Name: medicalhistories medicalhistories_petid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicalhistories
    ADD CONSTRAINT medicalhistories_petid_fkey FOREIGN KEY (petid) REFERENCES public.pets(id);


--
-- TOC entry 3269 (class 2606 OID 81956)
-- Name: payments payments_appointments_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_appointments_fk FOREIGN KEY (appointmentid) REFERENCES public.appointments(id);


--
-- TOC entry 3265 (class 2606 OID 65557)
-- Name: pets pets_owners_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pets
    ADD CONSTRAINT pets_owners_fk FOREIGN KEY (ownerid) REFERENCES public.owners(id);


-- Completed on 2025-10-02 08:44:24

--
-- PostgreSQL database dump complete
--

