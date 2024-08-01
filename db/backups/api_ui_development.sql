--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Ubuntu 14.12-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.12 (Ubuntu 14.12-0ubuntu0.22.04.1)

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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO root;

--
-- Name: attrs; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.attrs (
    id bigint NOT NULL,
    attr_title character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.attrs OWNER TO root;

--
-- Name: attrs_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.attrs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attrs_id_seq OWNER TO root;

--
-- Name: attrs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.attrs_id_seq OWNED BY public.attrs.id;


--
-- Name: endpoint_associated_attrs; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.endpoint_associated_attrs (
    id bigint NOT NULL,
    endpoint_id bigint NOT NULL,
    endpoint_create boolean,
    endpoint_update boolean,
    endpoint_show boolean,
    endpoint_index boolean,
    endpoint_delete boolean,
    attr_id bigint NOT NULL,
    attr_create_request boolean,
    attr_create_response boolean,
    attr_delete_request boolean,
    attr_delete_response boolean,
    attr_index_request boolean,
    attr_index_response boolean,
    attr_show_request boolean,
    attr_show_response boolean,
    attr_update_request boolean,
    attr_update_response boolean,
    attr_type character varying,
    associated_ui_info character varying,
    associated_product_info character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.endpoint_associated_attrs OWNER TO root;

--
-- Name: endpoint_associated_attrs_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.endpoint_associated_attrs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.endpoint_associated_attrs_id_seq OWNER TO root;

--
-- Name: endpoint_associated_attrs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.endpoint_associated_attrs_id_seq OWNED BY public.endpoint_associated_attrs.id;


--
-- Name: endpoints; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.endpoints (
    id bigint NOT NULL,
    endpoint_title character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.endpoints OWNER TO root;

--
-- Name: endpoints_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.endpoints_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.endpoints_id_seq OWNER TO root;

--
-- Name: endpoints_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.endpoints_id_seq OWNED BY public.endpoints.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO root;

--
-- Name: attrs id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.attrs ALTER COLUMN id SET DEFAULT nextval('public.attrs_id_seq'::regclass);


--
-- Name: endpoint_associated_attrs id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.endpoint_associated_attrs ALTER COLUMN id SET DEFAULT nextval('public.endpoint_associated_attrs_id_seq'::regclass);


--
-- Name: endpoints id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.endpoints ALTER COLUMN id SET DEFAULT nextval('public.endpoints_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2024-08-01 14:44:04.343211	2024-08-01 14:44:04.343213
\.


--
-- Data for Name: attrs; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.attrs (id, attr_title, created_at, updated_at) FROM stdin;
1	agent_uuid	2024-08-01 16:13:05.185827	2024-08-01 16:13:05.185827
2	moxi_works_agent_id	2024-08-01 16:13:05.196383	2024-08-01 16:13:05.196383
3	source_agent_id	2024-08-01 16:13:05.203351	2024-08-01 16:13:05.203351
4	body	2024-08-01 16:13:05.209948	2024-08-01 16:13:05.209948
5	moxi_works_contact_id	2024-08-01 16:13:05.217358	2024-08-01 16:13:05.217358
6	partner_contact_id	2024-08-01 16:13:05.25059	2024-08-01 16:13:05.25059
7	title	2024-08-01 16:13:05.257078	2024-08-01 16:13:05.257078
8	moxi_works_company_id	2024-08-01 16:13:05.263535	2024-08-01 16:13:05.263535
9	parent_company_id	2024-08-01 16:13:05.269663	2024-08-01 16:13:05.269663
10	agent_action	2024-08-01 16:13:05.276028	2024-08-01 16:13:05.276028
11	agent_action_address	2024-08-01 16:13:05.282914	2024-08-01 16:13:05.282914
12	agent_action_address2	2024-08-01 16:13:05.28998	2024-08-01 16:13:05.28998
13	agent_action_city	2024-08-01 16:13:05.297014	2024-08-01 16:13:05.297014
14	agent_action_state	2024-08-01 16:13:05.303444	2024-08-01 16:13:05.303444
15	agent_action_zip	2024-08-01 16:13:05.309677	2024-08-01 16:13:05.309677
16	timestamp	2024-08-01 16:13:05.320305	2024-08-01 16:13:05.320305
17	moxi_works_action_log_id	2024-08-01 16:13:05.33565	2024-08-01 16:13:05.33565
18	status	2024-08-01 16:13:05.346634	2024-08-01 16:13:05.346634
19	deleted	2024-08-01 16:13:05.353156	2024-08-01 16:13:05.353156
20	messages	2024-08-01 16:13:05.359695	2024-08-01 16:13:05.359695
21	date_min	2024-08-01 16:13:05.371897	2024-08-01 16:13:05.371897
22	date_max	2024-08-01 16:13:05.378498	2024-08-01 16:13:05.378498
23	actions	2024-08-01 16:13:05.391208	2024-08-01 16:13:05.391208
24	include_access_level	2024-08-01 17:09:24.073937	2024-08-01 17:09:24.073937
25	include_gci_goals	2024-08-01 17:09:24.083784	2024-08-01 17:09:24.083784
26	include_partners	2024-08-01 17:09:24.090622	2024-08-01 17:09:24.090622
27	include_reviews	2024-08-01 17:09:24.098065	2024-08-01 17:09:24.098065
28	client_agent_id	2024-08-01 17:09:24.106265	2024-08-01 17:09:24.106265
29	mls_agent_id	2024-08-01 17:09:24.113243	2024-08-01 17:09:24.113243
30	license	2024-08-01 17:09:24.120059	2024-08-01 17:09:24.120059
31	mls_name	2024-08-01 17:09:24.126764	2024-08-01 17:09:24.126764
32	mls_abbreviation	2024-08-01 17:09:24.133981	2024-08-01 17:09:24.133981
33	agent_id	2024-08-01 17:09:24.141309	2024-08-01 17:09:24.141309
34	moxi_works_office_id	2024-08-01 17:09:24.149664	2024-08-01 17:09:24.149664
35	office_id	2024-08-01 17:09:24.156761	2024-08-01 17:09:24.156761
36	client_office_id	2024-08-01 17:09:24.16501	2024-08-01 17:09:24.16501
37	company_id	2024-08-01 17:09:24.172266	2024-08-01 17:09:24.172266
38	client_company_id	2024-08-01 17:09:24.179456	2024-08-01 17:09:24.179456
39	office_address_street	2024-08-01 17:09:24.187245	2024-08-01 17:09:24.187245
40	office_address_street2	2024-08-01 17:09:24.194451	2024-08-01 17:09:24.194451
41	office_address_city	2024-08-01 17:09:24.201962	2024-08-01 17:09:24.201962
42	office_address_state	2024-08-01 17:09:24.208784	2024-08-01 17:09:24.208784
43	office_address_zip	2024-08-01 17:09:24.215531	2024-08-01 17:09:24.215531
44	office_mailing_address_street	2024-08-01 17:09:24.222348	2024-08-01 17:09:24.222348
45	office_mailing_address_street2	2024-08-01 17:09:24.22886	2024-08-01 17:09:24.22886
46	office_mailing_address_city	2024-08-01 17:09:24.236017	2024-08-01 17:09:24.236017
47	office_mailing_address_state	2024-08-01 17:09:24.242538	2024-08-01 17:09:24.242538
48	office_mailing_address_zip	2024-08-01 17:09:24.250753	2024-08-01 17:09:24.250753
49	name	2024-08-01 17:09:24.258876	2024-08-01 17:09:24.258876
50	first_name	2024-08-01 17:09:24.266734	2024-08-01 17:09:24.266734
51	last_name	2024-08-01 17:09:24.273933	2024-08-01 17:09:24.273933
52	nickname	2024-08-01 17:09:24.281657	2024-08-01 17:09:24.281657
53	main_phone_number	2024-08-01 17:09:24.288505	2024-08-01 17:09:24.288505
54	mobile_phone_number	2024-08-01 17:09:24.29615	2024-08-01 17:09:24.29615
55	alt_phone_number	2024-08-01 17:09:24.30372	2024-08-01 17:09:24.30372
56	fax_phone_number	2024-08-01 17:09:24.311719	2024-08-01 17:09:24.311719
57	office_phone_number	2024-08-01 17:09:24.319497	2024-08-01 17:09:24.319497
58	primary_email_address	2024-08-01 17:09:24.327579	2024-08-01 17:09:24.327579
59	secondary_email_address	2024-08-01 17:09:24.33508	2024-08-01 17:09:24.33508
60	email_addresses	2024-08-01 17:09:24.343515	2024-08-01 17:09:24.343515
61	lead_routing_email_address	2024-08-01 17:09:24.351885	2024-08-01 17:09:24.351885
62	bio	2024-08-01 17:09:24.361075	2024-08-01 17:09:24.361075
63	designations	2024-08-01 17:09:24.369174	2024-08-01 17:09:24.369174
64	uuid	2024-08-01 17:09:24.376625	2024-08-01 17:09:24.376625
65	has_product_access	2024-08-01 17:09:24.384091	2024-08-01 17:09:24.384091
66	has_engage_access	2024-08-01 17:09:24.39137	2024-08-01 17:09:24.39137
67	access_level	2024-08-01 17:09:24.399272	2024-08-01 17:09:24.399272
68	view_level	2024-08-01 17:09:24.4064	2024-08-01 17:09:24.4064
69	teams	2024-08-01 17:09:24.413592	2024-08-01 17:09:24.413592
70	website_base_url	2024-08-01 17:09:24.420641	2024-08-01 17:09:24.420641
71	twitter	2024-08-01 17:09:24.428509	2024-08-01 17:09:24.428509
72	google_plus	2024-08-01 17:09:24.436853	2024-08-01 17:09:24.436853
73	facebook	2024-08-01 17:09:24.444592	2024-08-01 17:09:24.444592
74	home_page	2024-08-01 17:09:24.451964	2024-08-01 17:09:24.451964
75	profile_image_url	2024-08-01 17:09:24.458484	2024-08-01 17:09:24.458484
76	profile_thumb_url	2024-08-01 17:09:24.465642	2024-08-01 17:09:24.465642
77	region	2024-08-01 17:09:24.472466	2024-08-01 17:09:24.472466
78	gci_goal	2024-08-01 17:09:24.479275	2024-08-01 17:09:24.479275
79	buyer_commission_rate	2024-08-01 17:09:24.486765	2024-08-01 17:09:24.486765
80	seller_commission_rate	2024-08-01 17:09:24.494107	2024-08-01 17:09:24.494107
81	service_area_zip_codes	2024-08-01 17:09:24.501511	2024-08-01 17:09:24.501511
82	agent_website	2024-08-01 17:09:24.509164	2024-08-01 17:09:24.509164
83	alternate_offices	2024-08-01 17:09:24.517234	2024-08-01 17:09:24.517234
84	available_mls	2024-08-01 17:09:24.525416	2024-08-01 17:09:24.525416
85	partners	2024-08-01 17:09:24.533146	2024-08-01 17:09:24.533146
86	company_programs	2024-08-01 17:09:24.540454	2024-08-01 17:09:24.540454
87	source_metadata	2024-08-01 17:09:24.547702	2024-08-01 17:09:24.547702
88	created_timestamp	2024-08-01 17:09:24.555843	2024-08-01 17:09:24.555843
89	deactivated_timestamp	2024-08-01 17:09:24.563329	2024-08-01 17:09:24.563329
90	profile_visible_online	2024-08-01 17:09:24.570632	2024-08-01 17:09:24.570632
91	user_reviews	2024-08-01 17:09:24.58165	2024-08-01 17:09:24.58165
92	updated_since	2024-08-01 17:09:24.59155	2024-08-01 17:09:24.59155
93	page_number	2024-08-01 17:09:24.598603	2024-08-01 17:09:24.598603
94	deactivated	2024-08-01 17:09:24.606696	2024-08-01 17:09:24.606696
95	deactivated_since	2024-08-01 17:09:24.613835	2024-08-01 17:09:24.613835
96	include_company_programs	2024-08-01 17:09:24.622876	2024-08-01 17:09:24.622876
97	include_website	2024-08-01 17:09:24.630839	2024-08-01 17:09:24.630839
98	has_company_programs	2024-08-01 17:09:24.637996	2024-08-01 17:09:24.637996
99	timestamps_only	2024-08-01 17:09:24.645975	2024-08-01 17:09:24.645975
100	include_bio	2024-08-01 17:09:24.653028	2024-08-01 17:09:24.653028
\.


--
-- Data for Name: endpoint_associated_attrs; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.endpoint_associated_attrs (id, endpoint_id, endpoint_create, endpoint_update, endpoint_show, endpoint_index, endpoint_delete, attr_id, attr_create_request, attr_create_response, attr_delete_request, attr_delete_response, attr_index_request, attr_index_response, attr_show_request, attr_show_response, attr_update_request, attr_update_response, attr_type, associated_ui_info, associated_product_info, created_at, updated_at) FROM stdin;
1	1	f	f	f	f	f	1	f	f	f	f	f	f	f	f	f	f	test	test	test	2024-08-01 10:57:13.264727	2024-08-01 10:57:13.264727
\.


--
-- Data for Name: endpoints; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.endpoints (id, endpoint_title, created_at, updated_at) FROM stdin;
1	ActionLog	2024-08-01 14:44:07.444907	2024-08-01 14:44:07.444907
2	Agent	2024-08-01 14:44:07.452647	2024-08-01 14:44:07.452647
3	Brand	2024-08-01 14:44:07.459729	2024-08-01 14:44:07.459729
4	BuyerTransaction	2024-08-01 14:44:07.493681	2024-08-01 14:44:07.493681
5	Company	2024-08-01 14:44:07.500547	2024-08-01 14:44:07.500547
6	Contact	2024-08-01 14:44:07.508215	2024-08-01 14:44:07.508215
7	EmailCampaign	2024-08-01 14:44:07.515202	2024-08-01 14:44:07.515202
8	Event	2024-08-01 14:44:07.522131	2024-08-01 14:44:07.522131
9	Gallery	2024-08-01 14:44:07.528964	2024-08-01 14:44:07.528964
10	Group	2024-08-01 14:44:07.53584	2024-08-01 14:44:07.53584
11	LeadSource	2024-08-01 14:44:07.542489	2024-08-01 14:44:07.542489
12	Listing	2024-08-01 14:44:07.549036	2024-08-01 14:44:07.549036
13	Office	2024-08-01 14:44:07.555277	2024-08-01 14:44:07.555277
14	PresentationLog	2024-08-01 14:44:07.561256	2024-08-01 14:44:07.561256
15	SellerTransaction	2024-08-01 14:44:07.56762	2024-08-01 14:44:07.56762
16	SoldListing	2024-08-01 14:44:07.575054	2024-08-01 14:44:07.575054
17	Task	2024-08-01 14:44:07.58161	2024-08-01 14:44:07.58161
18	Team	2024-08-01 14:44:07.588755	2024-08-01 14:44:07.588755
19	WebUser	2024-08-01 14:44:07.595302	2024-08-01 14:44:07.595302
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.schema_migrations (version) FROM stdin;
20240801144135
20240801144141
20240801172307
\.


--
-- Name: attrs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.attrs_id_seq', 100, true);


--
-- Name: endpoint_associated_attrs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.endpoint_associated_attrs_id_seq', 1, false);


--
-- Name: endpoints_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.endpoints_id_seq', 19, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: attrs attrs_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.attrs
    ADD CONSTRAINT attrs_pkey PRIMARY KEY (id);


--
-- Name: endpoint_associated_attrs endpoint_associated_attrs_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.endpoint_associated_attrs
    ADD CONSTRAINT endpoint_associated_attrs_pkey PRIMARY KEY (id);


--
-- Name: endpoints endpoints_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.endpoints
    ADD CONSTRAINT endpoints_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: index_endpoint_associated_attrs_on_attr_id; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX index_endpoint_associated_attrs_on_attr_id ON public.endpoint_associated_attrs USING btree (attr_id);


--
-- Name: index_endpoint_associated_attrs_on_endpoint_id; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX index_endpoint_associated_attrs_on_endpoint_id ON public.endpoint_associated_attrs USING btree (endpoint_id);


--
-- Name: endpoint_associated_attrs fk_rails_012e59bd15; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.endpoint_associated_attrs
    ADD CONSTRAINT fk_rails_012e59bd15 FOREIGN KEY (endpoint_id) REFERENCES public.endpoints(id);


--
-- Name: endpoint_associated_attrs fk_rails_a2236a24e9; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.endpoint_associated_attrs
    ADD CONSTRAINT fk_rails_a2236a24e9 FOREIGN KEY (attr_id) REFERENCES public.attrs(id);


--
-- PostgreSQL database dump complete
--

