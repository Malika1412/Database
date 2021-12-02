--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

-- Started on 2021-11-19 21:58:16

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
-- TOC entry 209 (class 1259 OID 17264)
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    cname character varying(50) NOT NULL,
    population bigint
);


ALTER TABLE public.country OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 17267)
-- Name: discover; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discover (
    cname character varying(50) NOT NULL,
    disease_code character varying(50) NOT NULL,
    first_enc_date date
);


ALTER TABLE public.discover OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 17270)
-- Name: disease; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disease (
    disease_code character varying(50) NOT NULL,
    pathogen character varying(20),
    description character varying(140),
    id integer
);


ALTER TABLE public.disease OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 17273)
-- Name: diseasetype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diseasetype (
    id integer NOT NULL,
    description character varying(140)
);


ALTER TABLE public.diseasetype OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 17276)
-- Name: doctor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctor (
    email character varying(60) NOT NULL,
    degree character varying(20)
);


ALTER TABLE public.doctor OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17279)
-- Name: publicservant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.publicservant (
    email character varying(60) NOT NULL,
    department character varying(50)
);


ALTER TABLE public.publicservant OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17282)
-- Name: record; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.record (
    email character varying(60) NOT NULL,
    cname character varying(50) NOT NULL,
    disease_code character varying(50) NOT NULL,
    total_deaths integer,
    total_patients integer
);


ALTER TABLE public.record OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17285)
-- Name: specialize; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.specialize (
    id integer NOT NULL,
    email character varying(60) NOT NULL
);


ALTER TABLE public.specialize OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17288)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    email character varying(60) NOT NULL,
    name character varying(30),
    surname character varying(40),
    salary integer,
    phone character varying(20),
    cname character varying(50)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 3363 (class 0 OID 17264)
-- Dependencies: 209
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (cname, population) FROM stdin;
Kazakhstan	18000000
Russia	144000000
Australia	25690000
Germany	83240000
Italy	59550000
Spain	47350000
China	1402000000
Japan	125800000
France	67390000
Scotland	5454000
\.


--
-- TOC entry 3364 (class 0 OID 17267)
-- Dependencies: 210
-- Data for Name: discover; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.discover (cname, disease_code, first_enc_date) FROM stdin;
China	covid-19	2019-12-03
Japan	a3456	1956-08-09
Russia	b12	2000-11-24
France	123c	2004-03-05
Australia	f5	1940-06-08
Italy	g678	1934-07-09
Spain	h56	2008-04-02
Scotland	jk89	1993-10-23
Germany	b234	1957-01-03
Kazakhstan	45f	1999-10-17
\.


--
-- TOC entry 3365 (class 0 OID 17270)
-- Dependencies: 211
-- Data for Name: disease; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disease (disease_code, pathogen, description, id) FROM stdin;
covid-19	virus	respiratory illness	1
b234	\N	Alzheimer's disease - the most common type of dementia. It is a progressive disease beginning with mild memory loss	2
45f	\N	depression	4
g678	\N	skin's cancer	9
b12	fungi	asthma	3
123c	virus	ebola	1
a3456	bacteria	tuberculosis	3
f5	bacteria	meningitis	3
h56	bacteria	cholera	3
jk89	bacteria	typhoid	3
\.


--
-- TOC entry 3366 (class 0 OID 17273)
-- Dependencies: 212
-- Data for Name: diseasetype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.diseasetype (id, description) FROM stdin;
1	virology
2	mental
3	infectious
9	skin
4	heart
5	head
6	addiction disease
7	immunity
8	deficiency
10	genetic
11	hereditary
\.


--
-- TOC entry 3367 (class 0 OID 17276)
-- Dependencies: 213
-- Data for Name: doctor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctor (email, degree) FROM stdin;
55ekt@gmail.com	Doctor of Medicine
6778etk@gmail.com	Master of Surgery
b@gmail.com	Phd
aabek@gmail.com	PhD
bcf@gmail.com	Doctor of Medicine
fr33@yandex.kz	PhD
gtx63amg@mail.ru	MD in Medicine
john123@gmail.com	Master if Surgery
kekek@gmail.com	Phd
opt3@gmail.com	Phd
new@gmail.com	Phd
\.


--
-- TOC entry 3368 (class 0 OID 17279)
-- Dependencies: 214
-- Data for Name: publicservant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.publicservant (email, department) FROM stdin;
htil@gmail.com	Dept 1
alina_1412@gmail.com	Dept 2
amir@gmail.com	Dept 3
kirill@gmail.com	Dept 2
egor_56@mail.ru	Dept 1
erty789@gmail.com	Dept 2
olya123@mail.ru	Dept 4
shawn234@mail.ru	Dept 7
panamera12@gmail.com	Dept 3
tykva123@gmail.com	Dept 3
\.


--
-- TOC entry 3369 (class 0 OID 17282)
-- Dependencies: 215
-- Data for Name: record; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.record (email, cname, disease_code, total_deaths, total_patients) FROM stdin;
alina_1412@gmail.com	Scotland	covid-19	35000	1000000
amir@gmail.com	Kazakhstan	jk89	4000	12
egor_56@mail.ru	Russia	123c	5000	7
erty789@gmail.com	Italy	covid-19	100000	2
htil@gmail.com	China	covid-19	100000	10
kirill@gmail.com	Australia	f5	12000	12
olya123@mail.ru	Spain	b234	13000	120000
panamera12@gmail.com	Australia	covid-19	45000	1
shawn234@mail.ru	Japan	123c	8000	999999
tykva123@gmail.com	Spain	covid-19	150000	100000
erty789@gmail.com	Kazakhstan	covid-19	200000	13
erty789@gmail.com	Germany	covid-19	230000	5
panamera12@gmail.com	Spain	covid-19	150000	4
panamera12@gmail.com	China	covid-19	100000	23
erty789@gmail.com	Russia	covid-19	100000	5
\.


--
-- TOC entry 3370 (class 0 OID 17285)
-- Dependencies: 216
-- Data for Name: specialize; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.specialize (id, email) FROM stdin;
1	55ekt@gmail.com
2	aabek@gmail.com
3	6778etk@gmail.com
4	b@gmail.com
5	aabek@gmail.com
7	fr33@yandex.kz
9	gtx63amg@mail.ru
3	b@gmail.com
3	aabek@gmail.com
1	bcf@gmail.com
1	opt3@gmail.com
\.


--
-- TOC entry 3371 (class 0 OID 17288)
-- Dependencies: 217
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (email, name, surname, salary, phone, cname) FROM stdin;
6778etk@gmail.com	Mary	Ivanova	455000	89054321256	Australia
kekek@gmail.com	Bek	Bekov	200000	81234567890	Germany
gtx63amg@mail.ru	Irina	Tikhonova	175000	89567894567	Japan
55ekt@gmail.com	Timothy	Smith	89000	84235678900	China
john123@gmail.com	Beket	Beketov	155000	81278904567	Italy
fr33@yandex.kz	Ainur	Beketova	350000	85678902312	Spain
aabek@gmail.com	Vlad	Ivanov	400000	87079054321	Scotland
new@gmail.com	Alina	Alinova	555000	89047892312	Germany
b@gmail.com	Bekzhan	Bekzhanov	340000	87770986533	Kazakhstan
bcf@gmail.com	Alibek	Alibekov	230000	84567890213	Russia
opt3@gmail.com	John	Brown	125000	82345679082	China
amir@gmail.com	Amirbek	Amirbekov	123000	87078901112	Kazakhstan
htil@gmail.com	Html	Html	800000	83456890913	China
olya123@mail.ru	Olya	Olyeva	120900	89012345676	Spain
shawn234@mail.ru	Shawn	Mendes	340000	89001233366	Japan
kirill@gmail.com	Kirill	Ivanov	560000	89051230088	Australia
alina_1412@gmail.com	Alina	Amirova	90000	80009994567	Scotland
egor_56@mail.ru	Egor	Egorov	250000	89021235690	Russia
tykva123@gmail.com	Nastya	Kirova	125000	89001178900	Spain
panamera12@gmail.com	Vlad	Tikhonov	350000	85679003331	Australia
erty789@gmail.com	Era	Erov	14720000	85556667788	Italy
\.


--
-- TOC entry 3196 (class 2606 OID 17292)
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (cname);


--
-- TOC entry 3198 (class 2606 OID 17294)
-- Name: discover discover_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discover
    ADD CONSTRAINT discover_pkey PRIMARY KEY (cname, disease_code);


--
-- TOC entry 3200 (class 2606 OID 17296)
-- Name: disease disease_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disease
    ADD CONSTRAINT disease_pkey PRIMARY KEY (disease_code);


--
-- TOC entry 3202 (class 2606 OID 17298)
-- Name: diseasetype diseasetype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diseasetype
    ADD CONSTRAINT diseasetype_pkey PRIMARY KEY (id);


--
-- TOC entry 3204 (class 2606 OID 17300)
-- Name: doctor doctor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_pkey PRIMARY KEY (email);


--
-- TOC entry 3206 (class 2606 OID 17302)
-- Name: publicservant publicservant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publicservant
    ADD CONSTRAINT publicservant_pkey PRIMARY KEY (email);


--
-- TOC entry 3208 (class 2606 OID 17304)
-- Name: record record_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_pkey PRIMARY KEY (email, cname, disease_code);


--
-- TOC entry 3210 (class 2606 OID 17306)
-- Name: specialize specialize_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specialize
    ADD CONSTRAINT specialize_pkey PRIMARY KEY (id, email);


--
-- TOC entry 3212 (class 2606 OID 17308)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (email);


--
-- TOC entry 3213 (class 2606 OID 17309)
-- Name: discover discover_cname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discover
    ADD CONSTRAINT discover_cname_fkey FOREIGN KEY (cname) REFERENCES public.country(cname);


--
-- TOC entry 3214 (class 2606 OID 17314)
-- Name: discover discover_disease_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discover
    ADD CONSTRAINT discover_disease_code_fkey FOREIGN KEY (disease_code) REFERENCES public.disease(disease_code);


--
-- TOC entry 3215 (class 2606 OID 17319)
-- Name: disease disease_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disease
    ADD CONSTRAINT disease_id_fkey FOREIGN KEY (id) REFERENCES public.diseasetype(id);


--
-- TOC entry 3216 (class 2606 OID 17324)
-- Name: doctor doctor_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_email_fkey FOREIGN KEY (email) REFERENCES public.users(email) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3217 (class 2606 OID 17329)
-- Name: publicservant publicservant_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publicservant
    ADD CONSTRAINT publicservant_email_fkey FOREIGN KEY (email) REFERENCES public.users(email) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3218 (class 2606 OID 17334)
-- Name: record record_cname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_cname_fkey FOREIGN KEY (cname) REFERENCES public.country(cname) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3219 (class 2606 OID 17339)
-- Name: record record_disease_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_disease_code_fkey FOREIGN KEY (disease_code) REFERENCES public.disease(disease_code) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3220 (class 2606 OID 17344)
-- Name: record record_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_email_fkey FOREIGN KEY (email) REFERENCES public.publicservant(email) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3221 (class 2606 OID 17349)
-- Name: specialize specialize_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specialize
    ADD CONSTRAINT specialize_email_fkey FOREIGN KEY (email) REFERENCES public.doctor(email) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3222 (class 2606 OID 17354)
-- Name: specialize specialize_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specialize
    ADD CONSTRAINT specialize_id_fkey FOREIGN KEY (id) REFERENCES public.diseasetype(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3223 (class 2606 OID 17359)
-- Name: users users_cname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_cname_fkey FOREIGN KEY (cname) REFERENCES public.country(cname) ON DELETE CASCADE NOT VALID;


-- Completed on 2021-11-19 21:58:22

--
-- PostgreSQL database dump complete
--

