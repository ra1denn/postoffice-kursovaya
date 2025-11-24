--
-- PostgreSQL database dump
--

\restrict 6QymSMCLuOsyHkKNgVDXcQMPPzIYw8Eam9xRX3YKvWr1BKtvaSOuqi4qiFh5kbr

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2025-11-24 18:00:44

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
-- TOC entry 5 (class 2615 OID 16982)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 231 (class 1259 OID 17095)
-- Name: заявка; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."заявка" (
    id integer NOT NULL,
    "клиент_id" integer,
    "отправление_id" character varying,
    "время_создания" timestamp without time zone NOT NULL,
    "тип" character varying,
    "описание" character varying,
    "результат" character varying
);


ALTER TABLE public."заявка" OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17094)
-- Name: заявка_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."заявка_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."заявка_id_seq" OWNER TO postgres;

--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 230
-- Name: заявка_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."заявка_id_seq" OWNED BY public."заявка".id;


--
-- TOC entry 225 (class 1259 OID 17033)
-- Name: история_статусов; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."история_статусов" (
    id integer NOT NULL,
    "отправление_id" character varying NOT NULL,
    "время" timestamp without time zone NOT NULL,
    "статус" character varying NOT NULL,
    "отделение_id" integer,
    "комментарий" character varying
);


ALTER TABLE public."история_статусов" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17032)
-- Name: история_статусов_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."история_статусов_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."история_статусов_id_seq" OWNER TO postgres;

--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 224
-- Name: история_статусов_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."история_статусов_id_seq" OWNED BY public."история_статусов".id;


--
-- TOC entry 218 (class 1259 OID 16984)
-- Name: клиент; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."клиент" (
    id integer NOT NULL,
    "имя" character varying NOT NULL,
    "фамилия" character varying NOT NULL,
    "телефон" character varying,
    "электронная_почта" character varying,
    "адрес" character varying
);


ALTER TABLE public."клиент" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16983)
-- Name: клиент_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."клиент_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."клиент_id_seq" OWNER TO postgres;

--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 217
-- Name: клиент_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."клиент_id_seq" OWNED BY public."клиент".id;


--
-- TOC entry 227 (class 1259 OID 17052)
-- Name: маршрут; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."маршрут" (
    id integer NOT NULL,
    "отправление_id" character varying NOT NULL,
    "отделение_откуда_id" integer,
    "отделение_куда_id" integer,
    "время_отправления" timestamp without time zone,
    "время_прибытия" timestamp without time zone
);


ALTER TABLE public."маршрут" OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17051)
-- Name: маршрут_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."маршрут_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."маршрут_id_seq" OWNER TO postgres;

--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 226
-- Name: маршрут_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."маршрут_id_seq" OWNED BY public."маршрут".id;


--
-- TOC entry 229 (class 1259 OID 17076)
-- Name: оплата; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."оплата" (
    id integer NOT NULL,
    "отправление_id" character varying,
    "клиент_id" integer,
    "сумма" double precision,
    "способ" character varying,
    "время" timestamp without time zone NOT NULL
);


ALTER TABLE public."оплата" OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17075)
-- Name: оплата_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."оплата_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."оплата_id_seq" OWNER TO postgres;

--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 228
-- Name: оплата_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."оплата_id_seq" OWNED BY public."оплата".id;


--
-- TOC entry 220 (class 1259 OID 16993)
-- Name: отделение; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."отделение" (
    id integer NOT NULL,
    "код" character varying NOT NULL,
    "адрес" character varying,
    "телефон" character varying
);


ALTER TABLE public."отделение" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16992)
-- Name: отделение_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."отделение_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."отделение_id_seq" OWNER TO postgres;

--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 219
-- Name: отделение_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."отделение_id_seq" OWNED BY public."отделение".id;


--
-- TOC entry 223 (class 1259 OID 17015)
-- Name: отправление; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."отправление" (
    id character varying NOT NULL,
    "тип" character varying,
    "вес" double precision,
    "отправитель_id" integer,
    "получатель_id" integer,
    "адрес_отправителя" character varying,
    "адрес_получателя" character varying,
    "текущий_статус" character varying
);


ALTER TABLE public."отправление" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17002)
-- Name: сотрудник; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."сотрудник" (
    id integer NOT NULL,
    "имя" character varying NOT NULL,
    "фамилия" character varying NOT NULL,
    "телефон" character varying,
    "электронная_почта" character varying,
    "роль" character varying NOT NULL,
    "отделение_id" integer
);


ALTER TABLE public."сотрудник" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17001)
-- Name: сотрудник_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."сотрудник_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."сотрудник_id_seq" OWNER TO postgres;

--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 221
-- Name: сотрудник_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."сотрудник_id_seq" OWNED BY public."сотрудник".id;


--
-- TOC entry 4782 (class 2604 OID 17098)
-- Name: заявка id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."заявка" ALTER COLUMN id SET DEFAULT nextval('public."заявка_id_seq"'::regclass);


--
-- TOC entry 4779 (class 2604 OID 17036)
-- Name: история_статусов id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."история_статусов" ALTER COLUMN id SET DEFAULT nextval('public."история_статусов_id_seq"'::regclass);


--
-- TOC entry 4776 (class 2604 OID 16987)
-- Name: клиент id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."клиент" ALTER COLUMN id SET DEFAULT nextval('public."клиент_id_seq"'::regclass);


--
-- TOC entry 4780 (class 2604 OID 17055)
-- Name: маршрут id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."маршрут" ALTER COLUMN id SET DEFAULT nextval('public."маршрут_id_seq"'::regclass);


--
-- TOC entry 4781 (class 2604 OID 17079)
-- Name: оплата id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."оплата" ALTER COLUMN id SET DEFAULT nextval('public."оплата_id_seq"'::regclass);


--
-- TOC entry 4777 (class 2604 OID 16996)
-- Name: отделение id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."отделение" ALTER COLUMN id SET DEFAULT nextval('public."отделение_id_seq"'::regclass);


--
-- TOC entry 4778 (class 2604 OID 17005)
-- Name: сотрудник id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."сотрудник" ALTER COLUMN id SET DEFAULT nextval('public."сотрудник_id_seq"'::regclass);


--
-- TOC entry 4970 (class 0 OID 17095)
-- Dependencies: 231
-- Data for Name: заявка; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."заявка" (id, "клиент_id", "отправление_id", "время_создания", "тип", "описание", "результат") FROM stdin;
1	1	TRK0001	2025-10-15 20:41:51.352555	вопрос	Уточнение доставки	\N
0	1	TRK0001	2025-11-24 12:00:00	question	Тест через API	\N
\.


--
-- TOC entry 4964 (class 0 OID 17033)
-- Dependencies: 225
-- Data for Name: история_статусов; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."история_статусов" (id, "отправление_id", "время", "статус", "отделение_id", "комментарий") FROM stdin;
1	TRK0001	2025-10-15 20:41:51.342806	Зарегистрировано	\N	\N
\.


--
-- TOC entry 4957 (class 0 OID 16984)
-- Dependencies: 218
-- Data for Name: клиент; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."клиент" (id, "имя", "фамилия", "телефон", "электронная_почта", "адрес") FROM stdin;
1	Алиса	Иванова	+79100000001	alice@example.com	ул. Пушкина, 1
2	Боб	Петров	+79100000002	bob@example.com	ул. Ленина, 2
10	Иван	Иванов	89123456789	ivan@example.com	ул. Дыбенко, 52
\.


--
-- TOC entry 4966 (class 0 OID 17052)
-- Dependencies: 227
-- Data for Name: маршрут; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."маршрут" (id, "отправление_id", "отделение_откуда_id", "отделение_куда_id", "время_отправления", "время_прибытия") FROM stdin;
1	TRK0001	1	2	2025-10-15 20:41:51.347369	\N
\.


--
-- TOC entry 4968 (class 0 OID 17076)
-- Dependencies: 229
-- Data for Name: оплата; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."оплата" (id, "отправление_id", "клиент_id", "сумма", "способ", "время") FROM stdin;
1	TRK0001	1	250	карта	2025-10-15 20:41:51.337858
\.


--
-- TOC entry 4959 (class 0 OID 16993)
-- Dependencies: 220
-- Data for Name: отделение; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."отделение" (id, "код", "адрес", "телефон") FROM stdin;
1	BR-001	г. Москва, ул. Ц., 5	+74951230001
2	BR-002	г. СПб, ул. Н., 12	+78123004567
\.


--
-- TOC entry 4962 (class 0 OID 17015)
-- Dependencies: 223
-- Data for Name: отправление; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."отправление" (id, "тип", "вес", "отправитель_id", "получатель_id", "адрес_отправителя", "адрес_получателя", "текущий_статус") FROM stdin;
TRK0001	посылка	2.5	1	2	ул. Пушкина, 1	ул. Ленина, 2	Зарегистрировано
\.


--
-- TOC entry 4961 (class 0 OID 17002)
-- Dependencies: 222
-- Data for Name: сотрудник; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."сотрудник" (id, "имя", "фамилия", "телефон", "электронная_почта", "роль", "отделение_id") FROM stdin;
1	Ольга	Смирнова	\N	\N	оператор	1
\.


--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 230
-- Name: заявка_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."заявка_id_seq"', 1, true);


--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 224
-- Name: история_статусов_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."история_статусов_id_seq"', 1, true);


--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 217
-- Name: клиент_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."клиент_id_seq"', 2, true);


--
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 226
-- Name: маршрут_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."маршрут_id_seq"', 1, true);


--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 228
-- Name: оплата_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."оплата_id_seq"', 1, true);


--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 219
-- Name: отделение_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."отделение_id_seq"', 2, true);


--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 221
-- Name: сотрудник_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."сотрудник_id_seq"', 2, true);


--
-- TOC entry 4798 (class 2606 OID 17102)
-- Name: заявка заявка_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."заявка"
    ADD CONSTRAINT "заявка_pkey" PRIMARY KEY (id);


--
-- TOC entry 4792 (class 2606 OID 17040)
-- Name: история_статусов история_статусов_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."история_статусов"
    ADD CONSTRAINT "история_статусов_pkey" PRIMARY KEY (id);


--
-- TOC entry 4784 (class 2606 OID 16991)
-- Name: клиент клиент_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."клиент"
    ADD CONSTRAINT "клиент_pkey" PRIMARY KEY (id);


--
-- TOC entry 4794 (class 2606 OID 17059)
-- Name: маршрут маршрут_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."маршрут"
    ADD CONSTRAINT "маршрут_pkey" PRIMARY KEY (id);


--
-- TOC entry 4796 (class 2606 OID 17083)
-- Name: оплата оплата_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."оплата"
    ADD CONSTRAINT "оплата_pkey" PRIMARY KEY (id);


--
-- TOC entry 4786 (class 2606 OID 17000)
-- Name: отделение отделение_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."отделение"
    ADD CONSTRAINT "отделение_pkey" PRIMARY KEY (id);


--
-- TOC entry 4790 (class 2606 OID 17021)
-- Name: отправление отправление_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."отправление"
    ADD CONSTRAINT "отправление_pkey" PRIMARY KEY (id);


--
-- TOC entry 4788 (class 2606 OID 17009)
-- Name: сотрудник сотрудник_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."сотрудник"
    ADD CONSTRAINT "сотрудник_pkey" PRIMARY KEY (id);


--
-- TOC entry 4809 (class 2606 OID 17103)
-- Name: заявка заявка_клиент_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."заявка"
    ADD CONSTRAINT "заявка_клиент_id_fkey" FOREIGN KEY ("клиент_id") REFERENCES public."клиент"(id);


--
-- TOC entry 4810 (class 2606 OID 17108)
-- Name: заявка заявка_отправление_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."заявка"
    ADD CONSTRAINT "заявка_отправление_id_fkey" FOREIGN KEY ("отправление_id") REFERENCES public."отправление"(id);


--
-- TOC entry 4802 (class 2606 OID 17046)
-- Name: история_статусов история_статусов_отделение_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."история_статусов"
    ADD CONSTRAINT "история_статусов_отделение_id_fkey" FOREIGN KEY ("отделение_id") REFERENCES public."отделение"(id);


--
-- TOC entry 4803 (class 2606 OID 17041)
-- Name: история_статусов история_статусов_отправление_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."история_статусов"
    ADD CONSTRAINT "история_статусов_отправление_id_fkey" FOREIGN KEY ("отправление_id") REFERENCES public."отправление"(id);


--
-- TOC entry 4804 (class 2606 OID 17070)
-- Name: маршрут маршрут_отделение_куда_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."маршрут"
    ADD CONSTRAINT "маршрут_отделение_куда_id_fkey" FOREIGN KEY ("отделение_куда_id") REFERENCES public."отделение"(id);


--
-- TOC entry 4805 (class 2606 OID 17065)
-- Name: маршрут маршрут_отделение_откуда_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."маршрут"
    ADD CONSTRAINT "маршрут_отделение_откуда_id_fkey" FOREIGN KEY ("отделение_откуда_id") REFERENCES public."отделение"(id);


--
-- TOC entry 4806 (class 2606 OID 17060)
-- Name: маршрут маршрут_отправление_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."маршрут"
    ADD CONSTRAINT "маршрут_отправление_id_fkey" FOREIGN KEY ("отправление_id") REFERENCES public."отправление"(id);


--
-- TOC entry 4807 (class 2606 OID 17089)
-- Name: оплата оплата_клиент_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."оплата"
    ADD CONSTRAINT "оплата_клиент_id_fkey" FOREIGN KEY ("клиент_id") REFERENCES public."клиент"(id);


--
-- TOC entry 4808 (class 2606 OID 17084)
-- Name: оплата оплата_отправление_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."оплата"
    ADD CONSTRAINT "оплата_отправление_id_fkey" FOREIGN KEY ("отправление_id") REFERENCES public."отправление"(id);


--
-- TOC entry 4800 (class 2606 OID 17022)
-- Name: отправление отправление_отправитель_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."отправление"
    ADD CONSTRAINT "отправление_отправитель_id_fkey" FOREIGN KEY ("отправитель_id") REFERENCES public."клиент"(id);


--
-- TOC entry 4801 (class 2606 OID 17027)
-- Name: отправление отправление_получатель_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."отправление"
    ADD CONSTRAINT "отправление_получатель_id_fkey" FOREIGN KEY ("получатель_id") REFERENCES public."клиент"(id);


--
-- TOC entry 4799 (class 2606 OID 17010)
-- Name: сотрудник сотрудник_отделение_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."сотрудник"
    ADD CONSTRAINT "сотрудник_отделение_id_fkey" FOREIGN KEY ("отделение_id") REFERENCES public."отделение"(id);


--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


-- Completed on 2025-11-24 18:00:44

--
-- PostgreSQL database dump complete
--

\unrestrict 6QymSMCLuOsyHkKNgVDXcQMPPzIYw8Eam9xRX3YKvWr1BKtvaSOuqi4qiFh5kbr

