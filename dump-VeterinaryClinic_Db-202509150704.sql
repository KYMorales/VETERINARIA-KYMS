--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.0

-- Started on 2025-09-15 07:04:17

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
-- TOC entry 3498 (class 1262 OID 65536)
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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 233 (class 1259 OID 73752)
-- Name: Procedures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Procedures" (
    id integer NOT NULL,
    "Name" character varying NOT NULL,
    description character varying NOT NULL
);


ALTER TABLE public."Procedures" OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 73751)
-- Name: Procedures_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Procedures_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Procedures_id_seq" OWNER TO postgres;

--
-- TOC entry 3499 (class 0 OID 0)
-- Dependencies: 232
-- Name: Procedures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Procedures_id_seq" OWNED BY public."Procedures".id;


--
-- TOC entry 237 (class 1259 OID 73763)
-- Name: appointmentprocedures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appointmentprocedures (
    id integer NOT NULL,
    appointmentid integer NOT NULL,
    procedureid integer NOT NULL
);


ALTER TABLE public.appointmentprocedures OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 73761)
-- Name: appointmentprocedures_appointmentid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.appointmentprocedures_appointmentid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.appointmentprocedures_appointmentid_seq OWNER TO postgres;

--
-- TOC entry 3500 (class 0 OID 0)
-- Dependencies: 235
-- Name: appointmentprocedures_appointmentid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.appointmentprocedures_appointmentid_seq OWNED BY public.appointmentprocedures.appointmentid;


--
-- TOC entry 234 (class 1259 OID 73760)
-- Name: appointmentprocedures_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.appointmentprocedures_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.appointmentprocedures_id_seq OWNER TO postgres;

--
-- TOC entry 3501 (class 0 OID 0)
-- Dependencies: 234
-- Name: appointmentprocedures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.appointmentprocedures_id_seq OWNED BY public.appointmentprocedures.id;


--
-- TOC entry 236 (class 1259 OID 73762)
-- Name: appointmentprocedures_procedureid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.appointmentprocedures_procedureid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.appointmentprocedures_procedureid_seq OWNER TO postgres;

--
-- TOC entry 3502 (class 0 OID 0)
-- Dependencies: 236
-- Name: appointmentprocedures_procedureid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.appointmentprocedures_procedureid_seq OWNED BY public.appointmentprocedures.procedureid;


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
-- TOC entry 3503 (class 0 OID 0)
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
-- TOC entry 3504 (class 0 OID 0)
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
-- TOC entry 3505 (class 0 OID 0)
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
-- TOC entry 3506 (class 0 OID 0)
-- Dependencies: 222
-- Name: medicalhistories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medicalhistories_id_seq OWNED BY public.medicalhistories.id;


--
-- TOC entry 242 (class 1259 OID 81932)
-- Name: medicines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicines (
    id integer NOT NULL,
    "Name" character varying NOT NULL,
    manufacturer character varying NOT NULL
);


ALTER TABLE public.medicines OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 81931)
-- Name: medicines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medicines_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.medicines_id_seq OWNER TO postgres;

--
-- TOC entry 3507 (class 0 OID 0)
-- Dependencies: 241
-- Name: medicines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medicines_id_seq OWNED BY public.medicines.id;


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
-- TOC entry 3508 (class 0 OID 0)
-- Dependencies: 217
-- Name: owners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.owners_id_seq OWNED BY public.owners.id;


--
-- TOC entry 246 (class 1259 OID 81948)
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
-- TOC entry 245 (class 1259 OID 81947)
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
-- TOC entry 3509 (class 0 OID 0)
-- Dependencies: 245
-- Name: payments_amount_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_amount_seq OWNED BY public.payments.amount;


--
-- TOC entry 244 (class 1259 OID 81946)
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
-- TOC entry 3510 (class 0 OID 0)
-- Dependencies: 244
-- Name: payments_appointmentid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_appointmentid_seq OWNED BY public.payments.appointmentid;


--
-- TOC entry 243 (class 1259 OID 81945)
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
-- TOC entry 3511 (class 0 OID 0)
-- Dependencies: 243
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
-- TOC entry 3512 (class 0 OID 0)
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
-- TOC entry 3513 (class 0 OID 0)
-- Dependencies: 220
-- Name: pets_ownerid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pets_ownerid_seq OWNED BY public.pets.ownerid;


--
-- TOC entry 240 (class 1259 OID 81922)
-- Name: prescriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prescriptions (
    id integer NOT NULL,
    appointmentid integer NOT NULL,
    notes character varying NOT NULL
);


ALTER TABLE public.prescriptions OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 81921)
-- Name: prescriptions_appointmentid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prescriptions_appointmentid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.prescriptions_appointmentid_seq OWNER TO postgres;

--
-- TOC entry 3514 (class 0 OID 0)
-- Dependencies: 239
-- Name: prescriptions_appointmentid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prescriptions_appointmentid_seq OWNED BY public.prescriptions.appointmentid;


--
-- TOC entry 238 (class 1259 OID 81920)
-- Name: prescriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prescriptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.prescriptions_id_seq OWNER TO postgres;

--
-- TOC entry 3515 (class 0 OID 0)
-- Dependencies: 238
-- Name: prescriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prescriptions_id_seq OWNED BY public.prescriptions.id;


--
-- TOC entry 231 (class 1259 OID 65615)
-- Name: vaccines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vaccines (
    id integer NOT NULL,
    "Name" character varying NOT NULL,
    manufacturer character varying NOT NULL
);


ALTER TABLE public.vaccines OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 65614)
-- Name: vaccines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vaccines_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vaccines_id_seq OWNER TO postgres;

--
-- TOC entry 3516 (class 0 OID 0)
-- Dependencies: 230
-- Name: vaccines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vaccines_id_seq OWNED BY public.vaccines.id;


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
-- TOC entry 3517 (class 0 OID 0)
-- Dependencies: 228
-- Name: veterinarians_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.veterinarians_id_seq OWNED BY public.veterinarians.id;


--
-- TOC entry 3278 (class 2604 OID 73755)
-- Name: Procedures id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Procedures" ALTER COLUMN id SET DEFAULT nextval('public."Procedures_id_seq"'::regclass);


--
-- TOC entry 3279 (class 2604 OID 73766)
-- Name: appointmentprocedures id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointmentprocedures ALTER COLUMN id SET DEFAULT nextval('public.appointmentprocedures_id_seq'::regclass);


--
-- TOC entry 3280 (class 2604 OID 73767)
-- Name: appointmentprocedures appointmentid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointmentprocedures ALTER COLUMN appointmentid SET DEFAULT nextval('public.appointmentprocedures_appointmentid_seq'::regclass);


--
-- TOC entry 3281 (class 2604 OID 73768)
-- Name: appointmentprocedures procedureid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointmentprocedures ALTER COLUMN procedureid SET DEFAULT nextval('public.appointmentprocedures_procedureid_seq'::regclass);


--
-- TOC entry 3273 (class 2604 OID 65588)
-- Name: appointments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments ALTER COLUMN id SET DEFAULT nextval('public.appointments_id_seq'::regclass);


--
-- TOC entry 3274 (class 2604 OID 65589)
-- Name: appointments pet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments ALTER COLUMN pet_id SET DEFAULT nextval('public.appointments_pet_id_seq'::regclass);


--
-- TOC entry 3275 (class 2604 OID 65590)
-- Name: appointments veterinarianid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments ALTER COLUMN veterinarianid SET DEFAULT nextval('public.appointments_veterinarianid_seq'::regclass);


--
-- TOC entry 3271 (class 2604 OID 65566)
-- Name: medicalhistories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicalhistories ALTER COLUMN id SET DEFAULT nextval('public.medicalhistories_id_seq'::regclass);


--
-- TOC entry 3284 (class 2604 OID 81935)
-- Name: medicines id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicines ALTER COLUMN id SET DEFAULT nextval('public.medicines_id_seq'::regclass);


--
-- TOC entry 3268 (class 2604 OID 65541)
-- Name: owners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owners ALTER COLUMN id SET DEFAULT nextval('public.owners_id_seq'::regclass);


--
-- TOC entry 3285 (class 2604 OID 81951)
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- TOC entry 3286 (class 2604 OID 81952)
-- Name: payments appointmentid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN appointmentid SET DEFAULT nextval('public.payments_appointmentid_seq'::regclass);


--
-- TOC entry 3287 (class 2604 OID 81953)
-- Name: payments amount; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN amount SET DEFAULT nextval('public.payments_amount_seq'::regclass);


--
-- TOC entry 3269 (class 2604 OID 65551)
-- Name: pets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pets ALTER COLUMN id SET DEFAULT nextval('public.pets_id_seq'::regclass);


--
-- TOC entry 3270 (class 2604 OID 65552)
-- Name: pets ownerid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pets ALTER COLUMN ownerid SET DEFAULT nextval('public.pets_ownerid_seq'::regclass);


--
-- TOC entry 3282 (class 2604 OID 81925)
-- Name: prescriptions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prescriptions ALTER COLUMN id SET DEFAULT nextval('public.prescriptions_id_seq'::regclass);


--
-- TOC entry 3283 (class 2604 OID 81926)
-- Name: prescriptions appointmentid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prescriptions ALTER COLUMN appointmentid SET DEFAULT nextval('public.prescriptions_appointmentid_seq'::regclass);


--
-- TOC entry 3277 (class 2604 OID 65618)
-- Name: vaccines id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vaccines ALTER COLUMN id SET DEFAULT nextval('public.vaccines_id_seq'::regclass);


--
-- TOC entry 3276 (class 2604 OID 65604)
-- Name: veterinarians id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veterinarians ALTER COLUMN id SET DEFAULT nextval('public.veterinarians_id_seq'::regclass);


--
-- TOC entry 3479 (class 0 OID 73752)
-- Dependencies: 233
-- Data for Name: Procedures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Procedures" (id, "Name", description) FROM stdin;
\.


--
-- TOC entry 3483 (class 0 OID 73763)
-- Dependencies: 237
-- Data for Name: appointmentprocedures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.appointmentprocedures (id, appointmentid, procedureid) FROM stdin;
\.


--
-- TOC entry 3473 (class 0 OID 65585)
-- Dependencies: 227
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.appointments (id, pet_id, veterinarianid, dateappointment, reason) FROM stdin;
\.


--
-- TOC entry 3469 (class 0 OID 65563)
-- Dependencies: 223
-- Data for Name: medicalhistories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicalhistories (id, petid, description, createdat) FROM stdin;
\.


--
-- TOC entry 3488 (class 0 OID 81932)
-- Dependencies: 242
-- Data for Name: medicines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicines (id, "Name", manufacturer) FROM stdin;
\.


--
-- TOC entry 3464 (class 0 OID 65538)
-- Dependencies: 218
-- Data for Name: owners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.owners (id, name, phone, email, addres) FROM stdin;
\.


--
-- TOC entry 3492 (class 0 OID 81948)
-- Dependencies: 246
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (id, appointmentid, amount, paymentdate) FROM stdin;
\.


--
-- TOC entry 3467 (class 0 OID 65548)
-- Dependencies: 221
-- Data for Name: pets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pets (id, "Name", species, breed, birthdate, ownerid) FROM stdin;
\.


--
-- TOC entry 3486 (class 0 OID 81922)
-- Dependencies: 240
-- Data for Name: prescriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prescriptions (id, appointmentid, notes) FROM stdin;
\.


--
-- TOC entry 3477 (class 0 OID 65615)
-- Dependencies: 231
-- Data for Name: vaccines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vaccines (id, "Name", manufacturer) FROM stdin;
\.


--
-- TOC entry 3475 (class 0 OID 65601)
-- Dependencies: 229
-- Data for Name: veterinarians; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.veterinarians (id, "Name", specialization, phone, email) FROM stdin;
\.


--
-- TOC entry 3518 (class 0 OID 0)
-- Dependencies: 232
-- Name: Procedures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Procedures_id_seq"', 1, false);


--
-- TOC entry 3519 (class 0 OID 0)
-- Dependencies: 235
-- Name: appointmentprocedures_appointmentid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointmentprocedures_appointmentid_seq', 1, false);


--
-- TOC entry 3520 (class 0 OID 0)
-- Dependencies: 234
-- Name: appointmentprocedures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointmentprocedures_id_seq', 1, false);


--
-- TOC entry 3521 (class 0 OID 0)
-- Dependencies: 236
-- Name: appointmentprocedures_procedureid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointmentprocedures_procedureid_seq', 1, false);


--
-- TOC entry 3522 (class 0 OID 0)
-- Dependencies: 224
-- Name: appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointments_id_seq', 1, false);


--
-- TOC entry 3523 (class 0 OID 0)
-- Dependencies: 225
-- Name: appointments_pet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointments_pet_id_seq', 1, false);


--
-- TOC entry 3524 (class 0 OID 0)
-- Dependencies: 226
-- Name: appointments_veterinarianid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointments_veterinarianid_seq', 1, false);


--
-- TOC entry 3525 (class 0 OID 0)
-- Dependencies: 222
-- Name: medicalhistories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medicalhistories_id_seq', 1, false);


--
-- TOC entry 3526 (class 0 OID 0)
-- Dependencies: 241
-- Name: medicines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medicines_id_seq', 1, false);


--
-- TOC entry 3527 (class 0 OID 0)
-- Dependencies: 217
-- Name: owners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.owners_id_seq', 1, false);


--
-- TOC entry 3528 (class 0 OID 0)
-- Dependencies: 245
-- Name: payments_amount_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_amount_seq', 1, false);


--
-- TOC entry 3529 (class 0 OID 0)
-- Dependencies: 244
-- Name: payments_appointmentid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_appointmentid_seq', 1, false);


--
-- TOC entry 3530 (class 0 OID 0)
-- Dependencies: 243
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_id_seq', 1, false);


--
-- TOC entry 3531 (class 0 OID 0)
-- Dependencies: 219
-- Name: pets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pets_id_seq', 1, false);


--
-- TOC entry 3532 (class 0 OID 0)
-- Dependencies: 220
-- Name: pets_ownerid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pets_ownerid_seq', 1, false);


--
-- TOC entry 3533 (class 0 OID 0)
-- Dependencies: 239
-- Name: prescriptions_appointmentid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prescriptions_appointmentid_seq', 1, false);


--
-- TOC entry 3534 (class 0 OID 0)
-- Dependencies: 238
-- Name: prescriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prescriptions_id_seq', 1, false);


--
-- TOC entry 3535 (class 0 OID 0)
-- Dependencies: 230
-- Name: vaccines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vaccines_id_seq', 1, false);


--
-- TOC entry 3536 (class 0 OID 0)
-- Dependencies: 228
-- Name: veterinarians_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.veterinarians_id_seq', 1, false);


--
-- TOC entry 3303 (class 2606 OID 73770)
-- Name: appointmentprocedures appointmentprocedures_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointmentprocedures
    ADD CONSTRAINT appointmentprocedures_pk PRIMARY KEY (id);


--
-- TOC entry 3295 (class 2606 OID 65594)
-- Name: appointments appointments_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pk PRIMARY KEY (id);


--
-- TOC entry 3293 (class 2606 OID 65571)
-- Name: medicalhistories medicalhistories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicalhistories
    ADD CONSTRAINT medicalhistories_pkey PRIMARY KEY (id);


--
-- TOC entry 3307 (class 2606 OID 81939)
-- Name: medicines medicines_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicines
    ADD CONSTRAINT medicines_pk PRIMARY KEY (id);


--
-- TOC entry 3289 (class 2606 OID 65545)
-- Name: owners owners_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owners
    ADD CONSTRAINT owners_pk PRIMARY KEY (id);


--
-- TOC entry 3309 (class 2606 OID 81955)
-- Name: payments payments_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pk PRIMARY KEY (id);


--
-- TOC entry 3291 (class 2606 OID 65556)
-- Name: pets pets_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pets
    ADD CONSTRAINT pets_pk PRIMARY KEY (id);


--
-- TOC entry 3305 (class 2606 OID 81930)
-- Name: prescriptions prescriptions_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prescriptions
    ADD CONSTRAINT prescriptions_pk PRIMARY KEY (id);


--
-- TOC entry 3301 (class 2606 OID 73759)
-- Name: Procedures procedures_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Procedures"
    ADD CONSTRAINT procedures_pk PRIMARY KEY (id);


--
-- TOC entry 3299 (class 2606 OID 65622)
-- Name: vaccines vaccines_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vaccines
    ADD CONSTRAINT vaccines_pk PRIMARY KEY (id);


--
-- TOC entry 3297 (class 2606 OID 65608)
-- Name: veterinarians veterinarians_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veterinarians
    ADD CONSTRAINT veterinarians_pk PRIMARY KEY (id);


--
-- TOC entry 3314 (class 2606 OID 73776)
-- Name: appointmentprocedures appointmentprocedures_appointments_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointmentprocedures
    ADD CONSTRAINT appointmentprocedures_appointments_fk FOREIGN KEY (appointmentid) REFERENCES public.appointments(id);


--
-- TOC entry 3315 (class 2606 OID 73771)
-- Name: appointmentprocedures appointmentprocedures_procedures_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointmentprocedures
    ADD CONSTRAINT appointmentprocedures_procedures_fk FOREIGN KEY (procedureid) REFERENCES public."Procedures"(id);


--
-- TOC entry 3312 (class 2606 OID 65595)
-- Name: appointments appointments_pets_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pets_fk FOREIGN KEY (pet_id) REFERENCES public.pets(id);


--
-- TOC entry 3313 (class 2606 OID 65609)
-- Name: appointments appointments_veterinarians_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_veterinarians_fk FOREIGN KEY (veterinarianid) REFERENCES public.veterinarians(id);


--
-- TOC entry 3311 (class 2606 OID 65572)
-- Name: medicalhistories medicalhistories_petid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicalhistories
    ADD CONSTRAINT medicalhistories_petid_fkey FOREIGN KEY (petid) REFERENCES public.pets(id);


--
-- TOC entry 3317 (class 2606 OID 81956)
-- Name: payments payments_appointments_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_appointments_fk FOREIGN KEY (appointmentid) REFERENCES public.appointments(id);


--
-- TOC entry 3310 (class 2606 OID 65557)
-- Name: pets pets_owners_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pets
    ADD CONSTRAINT pets_owners_fk FOREIGN KEY (ownerid) REFERENCES public.owners(id);


--
-- TOC entry 3316 (class 2606 OID 81940)
-- Name: prescriptions prescriptions_appointments_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prescriptions
    ADD CONSTRAINT prescriptions_appointments_fk FOREIGN KEY (appointmentid) REFERENCES public.appointments(id);


-- Completed on 2025-09-15 07:04:18

--
-- PostgreSQL database dump complete
--

