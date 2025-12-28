--
-- PostgreSQL database dump
--

\restrict wR4HqgQTPP2qa2CKgRJfqkkLFfDJxHiuvgIJaZ2WguSC35HkQVc2sH6mpz5elEY

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

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
-- Name: detail_pesanan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detail_pesanan (
    id_detail integer NOT NULL,
    id_pesanan integer,
    id_menu integer,
    jumlah integer,
    subtotal numeric(10,2)
);


ALTER TABLE public.detail_pesanan OWNER TO postgres;

--
-- Name: detail_pesanan_id_detail_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.detail_pesanan ALTER COLUMN id_detail ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.detail_pesanan_id_detail_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu (
    id_menu integer NOT NULL,
    nama_menu character varying(100),
    harga integer,
    kategori character varying(50),
    gambar character varying(255)
);


ALTER TABLE public.menu OWNER TO postgres;

--
-- Name: menu_id_menu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_id_menu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_id_menu_seq OWNER TO postgres;

--
-- Name: menu_id_menu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_id_menu_seq OWNED BY public.menu.id_menu;


--
-- Name: pesanan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pesanan (
    id_pesanan integer NOT NULL,
    nama_pelanggan character varying(100),
    total integer,
    tanggal timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    metode_pembayaran character varying(50),
    no_telp character varying(20),
    status character varying(20) DEFAULT 'pending'::character varying
);


ALTER TABLE public.pesanan OWNER TO postgres;

--
-- Name: pesanan_id_pesanan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pesanan_id_pesanan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pesanan_id_pesanan_seq OWNER TO postgres;

--
-- Name: pesanan_id_pesanan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pesanan_id_pesanan_seq OWNED BY public.pesanan.id_pesanan;


--
-- Name: menu id_menu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu ALTER COLUMN id_menu SET DEFAULT nextval('public.menu_id_menu_seq'::regclass);


--
-- Name: pesanan id_pesanan; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pesanan ALTER COLUMN id_pesanan SET DEFAULT nextval('public.pesanan_id_pesanan_seq'::regclass);


--
-- Data for Name: detail_pesanan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detail_pesanan (id_detail, id_pesanan, id_menu, jumlah, subtotal) FROM stdin;
\.


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu (id_menu, nama_menu, harga, kategori, gambar) FROM stdin;
1	Autumn Brew	28000	Iced Coffee	assets/img/Autumn Brew.jpg
2	Deep Hazelnut	32000	Iced Coffee	assets/img/Deep Hazelnut.jpg
3	Dual-Tone Macchiato	35000	Iced Coffee	assets/img/Dual-Tone Macchiato.jpg
4	Pure Beige	25000	Iced Coffee	assets/img/Pure Beige.jpg
5	Taupe Coffee	30000	Iced Coffee	assets/img/Taupe Coffee.jpg
6	Vanilla Latte	33000	Iced Coffee	assets/img/Vanilla Latte.jpg
\.


--
-- Data for Name: pesanan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pesanan (id_pesanan, nama_pelanggan, total, tanggal, metode_pembayaran, no_telp, status) FROM stdin;
\.


--
-- Name: detail_pesanan_id_detail_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detail_pesanan_id_detail_seq', 1, false);


--
-- Name: menu_id_menu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_id_menu_seq', 6, true);


--
-- Name: pesanan_id_pesanan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pesanan_id_pesanan_seq', 1, false);


--
-- Name: detail_pesanan detail_pesanan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_pesanan
    ADD CONSTRAINT detail_pesanan_pkey PRIMARY KEY (id_detail);


--
-- Name: menu menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id_menu);


--
-- Name: pesanan pesanan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pesanan
    ADD CONSTRAINT pesanan_pkey PRIMARY KEY (id_pesanan);


--
-- Name: detail_pesanan detail_pesanan_id_menu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_pesanan
    ADD CONSTRAINT detail_pesanan_id_menu_fkey FOREIGN KEY (id_menu) REFERENCES public.menu(id_menu);


--
-- Name: detail_pesanan detail_pesanan_id_pesanan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_pesanan
    ADD CONSTRAINT detail_pesanan_id_pesanan_fkey FOREIGN KEY (id_pesanan) REFERENCES public.pesanan(id_pesanan);


--
-- PostgreSQL database dump complete
--

\unrestrict wR4HqgQTPP2qa2CKgRJfqkkLFfDJxHiuvgIJaZ2WguSC35HkQVc2sH6mpz5elEY

