--
-- PostgreSQL database dump
--

-- Dumped from database version 13.7 (Debian 13.7-0+deb11u1)
-- Dumped by pg_dump version 13.7 (Debian 13.7-0+deb11u1)

-- Started on 2022-08-22 15:15:21 CST

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
-- TOC entry 205 (class 1259 OID 16409)
-- Name: Area; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Area" (
    id integer NOT NULL,
    code character(4),
    dimension real,
    "principalProduct" character varying
);


ALTER TABLE public."Area" OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16407)
-- Name: Area_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Area_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Area_id_seq" OWNER TO postgres;

--
-- TOC entry 3068 (class 0 OID 0)
-- Dependencies: 204
-- Name: Area_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Area_id_seq" OWNED BY public."Area".id;


--
-- TOC entry 211 (class 1259 OID 16452)
-- Name: Bill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Bill" (
    id integer NOT NULL,
    day smallint,
    month smallint,
    year smallint,
    client_name character varying,
    shop_name character varying,
    legal_identity character varying,
    phone_number text
);


ALTER TABLE public."Bill" OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16471)
-- Name: BillXProduct; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."BillXProduct" (
    id integer NOT NULL,
    fk_id_bill integer,
    fk_id_product integer,
    fk_id_area integer
);


ALTER TABLE public."BillXProduct" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16469)
-- Name: BillXProduct_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."BillXProduct_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."BillXProduct_id_seq" OWNER TO postgres;

--
-- TOC entry 3069 (class 0 OID 0)
-- Dependencies: 212
-- Name: BillXProduct_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."BillXProduct_id_seq" OWNED BY public."BillXProduct".id;


--
-- TOC entry 210 (class 1259 OID 16450)
-- Name: Bill_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Bill_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Bill_id_seq" OWNER TO postgres;

--
-- TOC entry 3070 (class 0 OID 0)
-- Dependencies: 210
-- Name: Bill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Bill_id_seq" OWNED BY public."Bill".id;


--
-- TOC entry 201 (class 1259 OID 16387)
-- Name: Employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Employee" (
    id integer NOT NULL,
    "idNumber" character varying(10),
    name character varying,
    "position" character varying,
    salary real
);


ALTER TABLE public."Employee" OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16385)
-- Name: Employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Employee_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Employee_id_seq" OWNER TO postgres;

--
-- TOC entry 3071 (class 0 OID 0)
-- Dependencies: 200
-- Name: Employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Employee_id_seq" OWNED BY public."Employee".id;


--
-- TOC entry 207 (class 1259 OID 16420)
-- Name: Payroll; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Payroll" (
    id integer NOT NULL,
    month smallint,
    year smallint
);


ALTER TABLE public."Payroll" OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16434)
-- Name: PayrollXEmployee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PayrollXEmployee" (
    id integer NOT NULL,
    id_employee integer NOT NULL,
    id_payroll integer
);


ALTER TABLE public."PayrollXEmployee" OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16432)
-- Name: PayrollXEmployee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."PayrollXEmployee_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."PayrollXEmployee_id_seq" OWNER TO postgres;

--
-- TOC entry 3072 (class 0 OID 0)
-- Dependencies: 208
-- Name: PayrollXEmployee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."PayrollXEmployee_id_seq" OWNED BY public."PayrollXEmployee".id;


--
-- TOC entry 206 (class 1259 OID 16418)
-- Name: Payroll_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Payroll_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Payroll_id_seq" OWNER TO postgres;

--
-- TOC entry 3073 (class 0 OID 0)
-- Dependencies: 206
-- Name: Payroll_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Payroll_id_seq" OWNED BY public."Payroll".id;


--
-- TOC entry 203 (class 1259 OID 16398)
-- Name: Product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Product" (
    id integer NOT NULL,
    batch character(4),
    name character varying,
    cost real,
    taxe real
);


ALTER TABLE public."Product" OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16396)
-- Name: Product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Product_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Product_id_seq" OWNER TO postgres;

--
-- TOC entry 3074 (class 0 OID 0)
-- Dependencies: 202
-- Name: Product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Product_id_seq" OWNED BY public."Product".id;


--
-- TOC entry 2895 (class 2604 OID 16412)
-- Name: Area id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Area" ALTER COLUMN id SET DEFAULT nextval('public."Area_id_seq"'::regclass);


--
-- TOC entry 2898 (class 2604 OID 16455)
-- Name: Bill id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Bill" ALTER COLUMN id SET DEFAULT nextval('public."Bill_id_seq"'::regclass);


--
-- TOC entry 2899 (class 2604 OID 16474)
-- Name: BillXProduct id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BillXProduct" ALTER COLUMN id SET DEFAULT nextval('public."BillXProduct_id_seq"'::regclass);


--
-- TOC entry 2893 (class 2604 OID 16390)
-- Name: Employee id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Employee" ALTER COLUMN id SET DEFAULT nextval('public."Employee_id_seq"'::regclass);


--
-- TOC entry 2896 (class 2604 OID 16423)
-- Name: Payroll id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Payroll" ALTER COLUMN id SET DEFAULT nextval('public."Payroll_id_seq"'::regclass);


--
-- TOC entry 2897 (class 2604 OID 16437)
-- Name: PayrollXEmployee id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PayrollXEmployee" ALTER COLUMN id SET DEFAULT nextval('public."PayrollXEmployee_id_seq"'::regclass);


--
-- TOC entry 2894 (class 2604 OID 16401)
-- Name: Product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product" ALTER COLUMN id SET DEFAULT nextval('public."Product_id_seq"'::regclass);


--
-- TOC entry 3054 (class 0 OID 16409)
-- Dependencies: 205
-- Data for Name: Area; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Area" (id, code, dimension, "principalProduct") FROM stdin;
\.


--
-- TOC entry 3060 (class 0 OID 16452)
-- Dependencies: 211
-- Data for Name: Bill; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Bill" (id, day, month, year, client_name, shop_name, legal_identity, phone_number) FROM stdin;
\.


--
-- TOC entry 3062 (class 0 OID 16471)
-- Dependencies: 213
-- Data for Name: BillXProduct; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."BillXProduct" (id, fk_id_bill, fk_id_product, fk_id_area) FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 16387)
-- Dependencies: 201
-- Data for Name: Employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Employee" (id, "idNumber", name, "position", salary) FROM stdin;
\.


--
-- TOC entry 3056 (class 0 OID 16420)
-- Dependencies: 207
-- Data for Name: Payroll; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Payroll" (id, month, year) FROM stdin;
\.


--
-- TOC entry 3058 (class 0 OID 16434)
-- Dependencies: 209
-- Data for Name: PayrollXEmployee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PayrollXEmployee" (id, id_employee, id_payroll) FROM stdin;
\.


--
-- TOC entry 3052 (class 0 OID 16398)
-- Dependencies: 203
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Product" (id, batch, name, cost, taxe) FROM stdin;
\.


--
-- TOC entry 3075 (class 0 OID 0)
-- Dependencies: 204
-- Name: Area_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Area_id_seq"', 1, true);


--
-- TOC entry 3076 (class 0 OID 0)
-- Dependencies: 212
-- Name: BillXProduct_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."BillXProduct_id_seq"', 1, false);


--
-- TOC entry 3077 (class 0 OID 0)
-- Dependencies: 210
-- Name: Bill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Bill_id_seq"', 1, false);


--
-- TOC entry 3078 (class 0 OID 0)
-- Dependencies: 200
-- Name: Employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Employee_id_seq"', 1, false);


--
-- TOC entry 3079 (class 0 OID 0)
-- Dependencies: 208
-- Name: PayrollXEmployee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."PayrollXEmployee_id_seq"', 1, false);


--
-- TOC entry 3080 (class 0 OID 0)
-- Dependencies: 206
-- Name: Payroll_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Payroll_id_seq"', 1, false);


--
-- TOC entry 3081 (class 0 OID 0)
-- Dependencies: 202
-- Name: Product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Product_id_seq"', 1, false);


--
-- TOC entry 2905 (class 2606 OID 16417)
-- Name: Area Area_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Area"
    ADD CONSTRAINT "Area_pkey" PRIMARY KEY (id);


--
-- TOC entry 2913 (class 2606 OID 16476)
-- Name: BillXProduct BillXProduct_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BillXProduct"
    ADD CONSTRAINT "BillXProduct_pkey" PRIMARY KEY (id);


--
-- TOC entry 2911 (class 2606 OID 16460)
-- Name: Bill Bill_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Bill"
    ADD CONSTRAINT "Bill_pkey" PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 16395)
-- Name: Employee Employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Employee"
    ADD CONSTRAINT "Employee_pkey" PRIMARY KEY (id);


--
-- TOC entry 2909 (class 2606 OID 16439)
-- Name: PayrollXEmployee PayrollXEmployee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PayrollXEmployee"
    ADD CONSTRAINT "PayrollXEmployee_pkey" PRIMARY KEY (id_employee);


--
-- TOC entry 2907 (class 2606 OID 16425)
-- Name: Payroll Payroll_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Payroll"
    ADD CONSTRAINT "Payroll_pkey" PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 16406)
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (id);


--
-- TOC entry 2918 (class 2606 OID 16487)
-- Name: BillXProduct fk_area; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BillXProduct"
    ADD CONSTRAINT fk_area FOREIGN KEY (fk_id_area) REFERENCES public."Area"(id);


--
-- TOC entry 2916 (class 2606 OID 16477)
-- Name: BillXProduct fk_bill; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BillXProduct"
    ADD CONSTRAINT fk_bill FOREIGN KEY (fk_id_bill) REFERENCES public."Bill"(id);


--
-- TOC entry 2914 (class 2606 OID 16440)
-- Name: PayrollXEmployee fk_id_employee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PayrollXEmployee"
    ADD CONSTRAINT fk_id_employee FOREIGN KEY (id_employee) REFERENCES public."Employee"(id);


--
-- TOC entry 2915 (class 2606 OID 16445)
-- Name: PayrollXEmployee fk_id_payroll; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PayrollXEmployee"
    ADD CONSTRAINT fk_id_payroll FOREIGN KEY (id_payroll) REFERENCES public."Payroll"(id);


--
-- TOC entry 2917 (class 2606 OID 16482)
-- Name: BillXProduct fk_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BillXProduct"
    ADD CONSTRAINT fk_product FOREIGN KEY (fk_id_product) REFERENCES public."Product"(id);


-- Completed on 2022-08-22 15:15:21 CST

--
-- PostgreSQL database dump complete
--

