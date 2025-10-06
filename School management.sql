--
-- PostgreSQL database dump
--

\restrict sog9tv7P59zBQGpnzXuPVaT5NTaBv7UHCLJDZHQo8f5t88Y0s4aghuzSjpWzpja

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

-- Started on 2025-10-06 18:59:28

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
-- TOC entry 222 (class 1259 OID 16403)
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    course_id integer NOT NULL,
    course_name character varying(150) NOT NULL,
    credits smallint NOT NULL,
    department character varying(100) NOT NULL,
    CONSTRAINT courses_credits_check CHECK ((credits > 0))
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16402)
-- Name: courses_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.courses ALTER COLUMN course_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.courses_course_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 16425)
-- Name: enrollments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enrollments (
    enrollment_id integer NOT NULL,
    student_id integer NOT NULL,
    course_id integer NOT NULL,
    semester character varying(10) NOT NULL,
    year integer NOT NULL,
    grade character varying(2),
    CONSTRAINT enrollments_year_check CHECK (((year > 1900) AND (year < 2100)))
);


ALTER TABLE public.enrollments OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16424)
-- Name: enrollments_enrollment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.enrollments ALTER COLUMN enrollment_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.enrollments_enrollment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 16414)
-- Name: instructors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructors (
    instructor_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    hire_date date NOT NULL,
    department character varying(100) NOT NULL
);


ALTER TABLE public.instructors OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16413)
-- Name: instructors_instructor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.instructors ALTER COLUMN instructor_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.instructors_instructor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 16391)
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    student_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    date_of_birth date NOT NULL,
    enrollment_date date NOT NULL,
    major character varying(100) NOT NULL
);


ALTER TABLE public.students OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16390)
-- Name: students_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.students ALTER COLUMN student_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.students_student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 5035 (class 0 OID 16403)
-- Dependencies: 222
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courses (course_id, course_name, credits, department) FROM stdin;
1	Introduction to Programming	3	Computer Science
2	Data Structures	4	Computer Science
3	Thermodynamics	3	Mechanical Engineering
4	Microeconomics	3	Economics
5	Communication Skills	2	Mass Communication
6	Circuit Analysis	4	Electrical Engineering
7	Organic Chemistry I	4	Chemistry
8	Structural Analysis	3	Civil Engineering
\.


--
-- TOC entry 5039 (class 0 OID 16425)
-- Dependencies: 226
-- Data for Name: enrollments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enrollments (enrollment_id, student_id, course_id, semester, year, grade) FROM stdin;
1	1	1	Fall	2020	A
2	1	2	Spring	2021	A-
3	2	3	Fall	2019	B+
4	2	2	Spring	2020	B
5	3	4	Fall	2021	A
6	3	5	Spring	2022	B-
7	4	4	Fall	2018	A
8	4	6	Spring	2019	B+
9	5	5	Fall	2020	A
10	5	1	Spring	2021	\N
11	6	1	Fall	2019	B
12	6	2	Spring	2020	B+
13	7	6	Fall	2021	A-
14	7	7	Spring	2022	B
15	8	5	Fall	2018	A
16	8	4	Spring	2019	B+
17	9	8	Fall	2020	A
18	9	3	Spring	2021	B-
19	10	7	Fall	2019	C+
20	10	1	Spring	2020	B
\.


--
-- TOC entry 5037 (class 0 OID 16414)
-- Dependencies: 224
-- Data for Name: instructors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instructors (instructor_id, first_name, last_name, hire_date, department) FROM stdin;
1	Samuel	Johnson	2015-08-01	Computer Science
2	Amina	Kano	2017-03-15	Economics
3	Paul	Nwachukwu	2010-11-20	Mechanical Engineering
4	Lilian	Ezeife	2019-06-10	Chemistry
5	Mark	Okafor	2012-01-05	Electrical Engineering
\.


--
-- TOC entry 5033 (class 0 OID 16391)
-- Dependencies: 220
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (student_id, first_name, last_name, date_of_birth, enrollment_date, major) FROM stdin;
1	Ada	Okonkwo	2002-04-15	2020-09-01	Computer Science
2	Tunde	Adebayo	2001-12-02	2019-09-01	Mechanical Engineering
3	Chinwe	Eze	2003-07-20	2021-09-01	Business Administration
4	Musa	Abdullahi	2000-01-10	2018-09-01	Economics
5	Grace	Nwafor	2002-10-05	2020-09-01	Mass Communication
6	Kemi	Balogun	2001-03-30	2019-09-01	Computer Science
7	David	Ibrahim	2003-11-11	2021-09-01	Electrical Engineering
8	Ruth	Chukwu	2000-06-25	2018-09-01	Psychology
9	Emeka	Udo	2002-09-17	2020-09-01	Civil Engineering
10	Aisha	Sule	2001-05-22	2019-09-01	Biochemistry
\.


--
-- TOC entry 5045 (class 0 OID 0)
-- Dependencies: 221
-- Name: courses_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courses_course_id_seq', 8, true);


--
-- TOC entry 5046 (class 0 OID 0)
-- Dependencies: 225
-- Name: enrollments_enrollment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enrollments_enrollment_id_seq', 20, true);


--
-- TOC entry 5047 (class 0 OID 0)
-- Dependencies: 223
-- Name: instructors_instructor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instructors_instructor_id_seq', 5, true);


--
-- TOC entry 5048 (class 0 OID 0)
-- Dependencies: 219
-- Name: students_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_student_id_seq', 10, true);


--
-- TOC entry 4876 (class 2606 OID 16412)
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (course_id);


--
-- TOC entry 4880 (class 2606 OID 16435)
-- Name: enrollments enrollments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_pkey PRIMARY KEY (enrollment_id);


--
-- TOC entry 4878 (class 2606 OID 16423)
-- Name: instructors instructors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructors
    ADD CONSTRAINT instructors_pkey PRIMARY KEY (instructor_id);


--
-- TOC entry 4874 (class 2606 OID 16401)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);


--
-- TOC entry 4882 (class 2606 OID 16437)
-- Name: enrollments unique_enrollment_per_term; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT unique_enrollment_per_term UNIQUE (student_id, course_id, semester, year);


--
-- TOC entry 4883 (class 2606 OID 16443)
-- Name: enrollments fk_course; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT fk_course FOREIGN KEY (course_id) REFERENCES public.courses(course_id) ON DELETE CASCADE;


--
-- TOC entry 4884 (class 2606 OID 16438)
-- Name: enrollments fk_student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT fk_student FOREIGN KEY (student_id) REFERENCES public.students(student_id) ON DELETE CASCADE;


-- Completed on 2025-10-06 18:59:29

--
-- PostgreSQL database dump complete
--

\unrestrict sog9tv7P59zBQGpnzXuPVaT5NTaBv7UHCLJDZHQo8f5t88Y0s4aghuzSjpWzpja

