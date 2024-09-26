--
-- PostgreSQL database dump
--

-- Dumped from database version 14.13 (Ubuntu 14.13-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.13 (Ubuntu 14.13-0ubuntu0.22.04.1)

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
-- Name: associated_attrs; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.associated_attrs (
    id bigint NOT NULL,
    request_type jsonb DEFAULT '{}'::jsonb NOT NULL,
    ui_info jsonb DEFAULT '{}'::jsonb NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    associated_endpoints jsonb DEFAULT '{}'::jsonb NOT NULL,
    attr_title character varying
);


ALTER TABLE public.associated_attrs OWNER TO root;

--
-- Name: associated_attrs_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.associated_attrs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.associated_attrs_id_seq OWNER TO root;

--
-- Name: associated_attrs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.associated_attrs_id_seq OWNED BY public.associated_attrs.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO root;

--
-- Name: users; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO root;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO root;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: associated_attrs id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.associated_attrs ALTER COLUMN id SET DEFAULT nextval('public.associated_attrs_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2024-09-25 23:32:20.009115	2024-09-25 23:32:20.009119
\.


--
-- Data for Name: associated_attrs; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.associated_attrs (id, request_type, ui_info, created_at, updated_at, associated_endpoints, attr_title) FROM stdin;
147	{}	{}	2024-09-25 23:32:20.427661	2024-09-25 23:32:20.427661	{}	numeric_id
148	{}	{}	2024-09-25 23:32:20.430294	2024-09-25 23:32:20.430294	{}	public_partner_attrs
149	{}	{}	2024-09-25 23:32:20.434026	2024-09-25 23:32:20.434026	{}	per_page
150	{}	{}	2024-09-25 23:32:20.436655	2024-09-25 23:32:20.436655	{}	show_paging_totals
151	{}	{}	2024-09-25 23:32:20.44189	2024-09-25 23:32:20.44189	{}	contact_name
152	{}	{}	2024-09-25 23:32:20.444884	2024-09-25 23:32:20.444884	{}	primary_phone_number
153	{}	{}	2024-09-25 23:32:20.446666	2024-09-25 23:32:20.446666	{}	secondary_phone_number
154	{}	{}	2024-09-25 23:32:20.449142	2024-09-25 23:32:20.449142	{}	moxi_works_lead_source_id
155	{}	{}	2024-09-25 23:32:20.450987	2024-09-25 23:32:20.450987	{}	original_lead_source
156	{}	{}	2024-09-25 23:32:20.452824	2024-09-25 23:32:20.452824	{}	gender
157	{}	{}	2024-09-25 23:32:20.454646	2024-09-25 23:32:20.454646	{}	label_name
158	{}	{}	2024-09-25 23:32:20.456583	2024-09-25 23:32:20.456583	{}	home_street_address
159	{}	{}	2024-09-25 23:32:20.45839	2024-09-25 23:32:20.45839	{}	home_city
160	{}	{}	2024-09-25 23:32:20.46021	2024-09-25 23:32:20.46021	{}	home_state
161	{}	{}	2024-09-25 23:32:20.462007	2024-09-25 23:32:20.462007	{}	home_zip
162	{}	{}	2024-09-25 23:32:20.463819	2024-09-25 23:32:20.463819	{}	home_country
163	{}	{}	2024-09-25 23:32:20.465955	2024-09-25 23:32:20.465955	{}	is_not_lead
164	{}	{}	2024-09-25 23:32:20.467805	2024-09-25 23:32:20.467805	{}	skip_agent_notification
165	{}	{}	2024-09-25 23:32:20.469712	2024-09-25 23:32:20.469712	{}	job_title
166	{}	{}	2024-09-25 23:32:20.471607	2024-09-25 23:32:20.471607	{}	occupation
167	{}	{}	2024-09-25 23:32:20.473502	2024-09-25 23:32:20.473502	{}	property_url
168	{}	{}	2024-09-25 23:32:20.475363	2024-09-25 23:32:20.475363	{}	property_mls_id
169	{}	{}	2024-09-25 23:32:20.4772	2024-09-25 23:32:20.4772	{}	property_street_address
170	{}	{}	2024-09-25 23:32:20.479052	2024-09-25 23:32:20.479052	{}	property_city
171	{}	{}	2024-09-25 23:32:20.480974	2024-09-25 23:32:20.480974	{}	property_state
172	{}	{}	2024-09-25 23:32:20.48275	2024-09-25 23:32:20.48275	{}	property_zip
173	{}	{}	2024-09-25 23:32:20.484605	2024-09-25 23:32:20.484605	{}	property_beds
174	{}	{}	2024-09-25 23:32:20.486481	2024-09-25 23:32:20.486481	{}	property_baths
175	{}	{}	2024-09-25 23:32:20.488368	2024-09-25 23:32:20.488368	{}	property_list_price
176	{}	{}	2024-09-25 23:32:20.490568	2024-09-25 23:32:20.490568	{}	property_listing_status
177	{}	{}	2024-09-25 23:32:20.492498	2024-09-25 23:32:20.492498	{}	property_photo_url
178	{}	{}	2024-09-25 23:32:20.49442	2024-09-25 23:32:20.49442	{}	search_city
179	{}	{}	2024-09-25 23:32:20.496302	2024-09-25 23:32:20.496302	{}	search_state
180	{}	{}	2024-09-25 23:32:20.497917	2024-09-25 23:32:20.497917	{}	search_zip
181	{}	{}	2024-09-25 23:32:20.499776	2024-09-25 23:32:20.499776	{}	search_min_baths
182	{}	{}	2024-09-25 23:32:20.501582	2024-09-25 23:32:20.501582	{}	search_min_beds
183	{}	{}	2024-09-25 23:32:20.503376	2024-09-25 23:32:20.503376	{}	search_min_price
184	{}	{}	2024-09-25 23:32:20.504964	2024-09-25 23:32:20.504964	{}	search_max_price
185	{}	{}	2024-09-25 23:32:20.506689	2024-09-25 23:32:20.506689	{}	search_min_sq_ft
186	{}	{}	2024-09-25 23:32:20.508513	2024-09-25 23:32:20.508513	{}	search_max_sq_ft
187	{}	{}	2024-09-25 23:32:20.510328	2024-09-25 23:32:20.510328	{}	search_min_lot_size
188	{}	{}	2024-09-25 23:32:20.512124	2024-09-25 23:32:20.512124	{}	search_max_lot_size
189	{}	{}	2024-09-25 23:32:20.514185	2024-09-25 23:32:20.514185	{}	search_min_year_built
190	{}	{}	2024-09-25 23:32:20.516159	2024-09-25 23:32:20.516159	{}	search_max_year_built
191	{}	{}	2024-09-25 23:32:20.518085	2024-09-25 23:32:20.518085	{}	search_property_types
192	{}	{}	2024-09-25 23:32:20.519971	2024-09-25 23:32:20.519971	{}	note
193	{}	{}	2024-09-25 23:32:20.521734	2024-09-25 23:32:20.521734	{}	websites
194	{}	{}	2024-09-25 23:32:20.52348	2024-09-25 23:32:20.52348	{}	birthday
195	{}	{}	2024-09-25 23:32:20.525309	2024-09-25 23:32:20.525309	{}	home_purchase_anniversaries
196	{}	{}	2024-09-25 23:32:20.527128	2024-09-25 23:32:20.527128	{}	company
197	{}	{}	2024-09-25 23:32:20.528912	2024-09-25 23:32:20.528912	{}	spouse_or_partner
198	{}	{}	2024-09-25 23:32:20.530672	2024-09-25 23:32:20.530672	{}	category_names
199	{}	{}	2024-09-25 23:32:20.53414	2024-09-25 23:32:20.53414	{}	is_deleted
200	{}	{}	2024-09-25 23:32:20.537848	2024-09-25 23:32:20.537848	{}	middle_name
201	{}	{}	2024-09-25 23:32:20.540238	2024-09-25 23:32:20.540238	{}	suffix
202	{}	{}	2024-09-25 23:32:20.544856	2024-09-25 23:32:20.544856	{}	phone_numbers
203	{}	{}	2024-09-25 23:32:20.548851	2024-09-25 23:32:20.548851	{}	is_new_contact
204	{}	{}	2024-09-25 23:32:20.551116	2024-09-25 23:32:20.551116	{}	anniversary
205	{}	{}	2024-09-25 23:32:20.552834	2024-09-25 23:32:20.552834	{}	home_purchase_anniversary
206	{}	{}	2024-09-25 23:32:20.55454	2024-09-25 23:32:20.55454	{}	social_media_profiles
207	{}	{}	2024-09-25 23:32:20.570905	2024-09-25 23:32:20.570905	{}	groups
208	{}	{}	2024-09-25 23:32:20.598043	2024-09-25 23:32:20.598043	{}	moxi_works_origin_lead_source_id
209	{}	{}	2024-09-25 23:32:20.649303	2024-09-25 23:32:20.649303	{}	email_address
210	{}	{}	2024-09-25 23:32:20.651288	2024-09-25 23:32:20.651288	{}	phone_number
211	{}	{}	2024-09-25 23:32:20.654195	2024-09-25 23:32:20.654195	{}	only_business_contacts
212	{}	{}	2024-09-25 23:32:20.656906	2024-09-25 23:32:20.656906	{}	total_pages
213	{}	{}	2024-09-25 23:32:20.658759	2024-09-25 23:32:20.658759	{}	contacts
214	{}	{}	2024-09-25 23:32:20.66414	2024-09-25 23:32:20.66414	{}	result
215	{}	{}	2024-09-25 23:32:20.669377	2024-09-25 23:32:20.669377	{}	subscription_type
216	{}	{}	2024-09-25 23:32:20.671976	2024-09-25 23:32:20.671976	{}	subscribed_at
217	{}	{}	2024-09-25 23:32:20.673928	2024-09-25 23:32:20.673928	{}	created_by
218	{}	{}	2024-09-25 23:32:20.675847	2024-09-25 23:32:20.675847	{}	area
219	{}	{}	2024-09-25 23:32:20.677731	2024-09-25 23:32:20.677731	{}	last_sent
220	{}	{}	2024-09-25 23:32:20.679595	2024-09-25 23:32:20.679595	{}	next_scheduled
221	{}	{}	2024-09-25 23:32:20.681426	2024-09-25 23:32:20.681426	{}	created_at
222	{}	{}	2024-09-25 23:32:20.683218	2024-09-25 23:32:20.683218	{}	unsubscribed_at
223	{}	{}	2024-09-25 23:32:20.685078	2024-09-25 23:32:20.685078	{}	unsubscribed_by
224	{}	{}	2024-09-25 23:32:20.686843	2024-09-25 23:32:20.686843	{}	listed
225	{}	{}	2024-09-25 23:32:20.688687	2024-09-25 23:32:20.688687	{}	sold
226	{}	{}	2024-09-25 23:32:20.690516	2024-09-25 23:32:20.690516	{}	zipcode
227	{}	{}	2024-09-25 23:32:20.692387	2024-09-25 23:32:20.692387	{}	nn_subscription_type
228	{}	{}	2024-09-25 23:32:20.694346	2024-09-25 23:32:20.694346	{}	nn_min_price
229	{}	{}	2024-09-25 23:32:20.696508	2024-09-25 23:32:20.696508	{}	nn_max_price
230	{}	{}	2024-09-25 23:32:20.698441	2024-09-25 23:32:20.698441	{}	nn_min_beds
231	{}	{}	2024-09-25 23:32:20.700388	2024-09-25 23:32:20.700388	{}	nn_max_beds
232	{}	{}	2024-09-25 23:32:20.702305	2024-09-25 23:32:20.702305	{}	nn_min_baths
233	{}	{}	2024-09-25 23:32:20.704181	2024-09-25 23:32:20.704181	{}	nn_min_sqft
234	{}	{}	2024-09-25 23:32:20.706006	2024-09-25 23:32:20.706006	{}	nn_max_sqft
235	{}	{}	2024-09-25 23:32:20.707839	2024-09-25 23:32:20.707839	{}	nn_property_type
236	{}	{}	2024-09-25 23:32:20.709904	2024-09-25 23:32:20.709904	{}	partner_event_id
237	{}	{}	2024-09-25 23:32:20.713573	2024-09-25 23:32:20.713573	{}	event_subject
238	{}	{}	2024-09-25 23:32:20.715199	2024-09-25 23:32:20.715199	{}	event_location
239	{}	{}	2024-09-25 23:32:20.717362	2024-09-25 23:32:20.717362	{}	send_reminder
240	{}	{}	2024-09-25 23:32:20.71953	2024-09-25 23:32:20.71953	{}	remind_minutes_before
241	{}	{}	2024-09-25 23:32:20.721485	2024-09-25 23:32:20.721485	{}	event_start
242	{}	{}	2024-09-25 23:32:20.723419	2024-09-25 23:32:20.723419	{}	event_end
243	{}	{}	2024-09-25 23:32:20.725325	2024-09-25 23:32:20.725325	{}	all_day
244	{}	{}	2024-09-25 23:32:20.727179	2024-09-25 23:32:20.727179	{}	attendees
245	{}	{}	2024-09-25 23:32:20.743223	2024-09-25 23:32:20.743223	{}	date_start
246	{}	{}	2024-09-25 23:32:20.745203	2024-09-25 23:32:20.745203	{}	date_end
247	{}	{}	2024-09-25 23:32:20.747859	2024-09-25 23:32:20.747859	{}	date
248	{}	{}	2024-09-25 23:32:20.749717	2024-09-25 23:32:20.749717	{}	events
249	{}	{}	2024-09-25 23:32:20.756638	2024-09-25 23:32:20.756638	{}	ListingID
250	{}	{}	2024-09-25 23:32:20.758454	2024-09-25 23:32:20.758454	{}	ListOfficeAOR
251	{}	{}	2024-09-25 23:32:20.760176	2024-09-25 23:32:20.760176	{}	ListingImages
252	{}	{}	2024-09-25 23:32:20.763456	2024-09-25 23:32:20.763456	{}	partner_group_id
253	{}	{}	2024-09-25 23:32:20.767747	2024-09-25 23:32:20.767747	{}	moxi_works_group_name
254	{}	{}	2024-09-25 23:32:20.769419	2024-09-25 23:32:20.769419	{}	moxi_works_group_id
255	{}	{}	2024-09-25 23:32:20.771704	2024-09-25 23:32:20.771704	{}	transient
256	{}	{}	2024-09-25 23:32:20.773473	2024-09-25 23:32:20.773473	{}	is_contact_removal
257	{}	{}	2024-09-25 23:32:20.77532	2024-09-25 23:32:20.77532	{}	updated_contacts
258	{}	{}	2024-09-25 23:32:20.792888	2024-09-25 23:32:20.792888	{}	is_partner_alias
259	{}	{}	2024-09-25 23:32:20.794735	2024-09-25 23:32:20.794735	{}	is_partner_default
260	{}	{}	2024-09-25 23:32:20.796515	2024-09-25 23:32:20.796515	{}	moxi_works_listing_id
261	{}	{}	2024-09-25 23:32:20.798961	2024-09-25 23:32:20.798961	{}	underscore_response
262	{}	{}	2024-09-25 23:32:20.800665	2024-09-25 23:32:20.800665	{}	LotSizeAcres
263	{}	{}	2024-09-25 23:32:20.802475	2024-09-25 23:32:20.802475	{}	BathroomsFull
264	{}	{}	2024-09-25 23:32:20.804105	2024-09-25 23:32:20.804105	{}	BathroomsHalf
265	{}	{}	2024-09-25 23:32:20.806179	2024-09-25 23:32:20.806179	{}	BathroomsOneQuarter
266	{}	{}	2024-09-25 23:32:20.807974	2024-09-25 23:32:20.807974	{}	BathroomsPartial
267	{}	{}	2024-09-25 23:32:20.809832	2024-09-25 23:32:20.809832	{}	BathroomsThreeQuarter
268	{}	{}	2024-09-25 23:32:20.811684	2024-09-25 23:32:20.811684	{}	BathroomsTotalInteger
269	{}	{}	2024-09-25 23:32:20.813581	2024-09-25 23:32:20.813581	{}	BathroomsTotal
270	{}	{}	2024-09-25 23:32:20.815486	2024-09-25 23:32:20.815486	{}	BedroomsTotal
271	{}	{}	2024-09-25 23:32:20.81735	2024-09-25 23:32:20.81735	{}	PublicTitle
272	{}	{}	2024-09-25 23:32:20.819147	2024-09-25 23:32:20.819147	{}	PublicRemarks
273	{}	{}	2024-09-25 23:32:20.821032	2024-09-25 23:32:20.821032	{}	ModificationTimestamp
274	{}	{}	2024-09-25 23:32:20.822835	2024-09-25 23:32:20.822835	{}	StatusChangeDate
275	{}	{}	2024-09-25 23:32:20.824715	2024-09-25 23:32:20.824715	{}	InternetAddressDisplayYN
276	{}	{}	2024-09-25 23:32:20.826569	2024-09-25 23:32:20.826569	{}	DaysOnMarket
277	{}	{}	2024-09-25 23:32:20.828686	2024-09-25 23:32:20.828686	{}	ListingContractDate
278	{}	{}	2024-09-25 23:32:20.830484	2024-09-25 23:32:20.830484	{}	CreatedDate
279	{}	{}	2024-09-25 23:32:20.83242	2024-09-25 23:32:20.83242	{}	ElementarySchool
280	{}	{}	2024-09-25 23:32:20.834318	2024-09-25 23:32:20.834318	{}	GarageSpaces
281	{}	{}	2024-09-25 23:32:20.836029	2024-09-25 23:32:20.836029	{}	WaterfrontYN
282	{}	{}	2024-09-25 23:32:20.837908	2024-09-25 23:32:20.837908	{}	HighSchool
283	{}	{}	2024-09-25 23:32:20.839747	2024-09-25 23:32:20.839747	{}	AssociationFee
284	{}	{}	2024-09-25 23:32:20.841636	2024-09-25 23:32:20.841636	{}	ListOfficeName
285	{}	{}	2024-09-25 23:32:20.843385	2024-09-25 23:32:20.843385	{}	ListPrice
286	{}	{}	2024-09-25 23:32:20.845762	2024-09-25 23:32:20.845762	{}	ListAgentFullName
287	{}	{}	2024-09-25 23:32:20.84765	2024-09-25 23:32:20.84765	{}	ListAgentUUID
288	{}	{}	2024-09-25 23:32:20.849573	2024-09-25 23:32:20.849573	{}	ListAgentOfficeID
289	{}	{}	2024-09-25 23:32:20.851245	2024-09-25 23:32:20.851245	{}	ListAgentMoxiWorksOfficeID
290	{}	{}	2024-09-25 23:32:20.853412	2024-09-25 23:32:20.853412	{}	SecondaryListAgentFullName
291	{}	{}	2024-09-25 23:32:20.855376	2024-09-25 23:32:20.855376	{}	SecondaryListAgentUUID
292	{}	{}	2024-09-25 23:32:20.857304	2024-09-25 23:32:20.857304	{}	SchoolDistrict
293	{}	{}	2024-09-25 23:32:20.859191	2024-09-25 23:32:20.859191	{}	Address
294	{}	{}	2024-09-25 23:32:20.860931	2024-09-25 23:32:20.860931	{}	Address2
295	{}	{}	2024-09-25 23:32:20.862815	2024-09-25 23:32:20.862815	{}	City
296	{}	{}	2024-09-25 23:32:20.864673	2024-09-25 23:32:20.864673	{}	CountyOrParish
297	{}	{}	2024-09-25 23:32:20.866537	2024-09-25 23:32:20.866537	{}	Latitude
298	{}	{}	2024-09-25 23:32:20.868366	2024-09-25 23:32:20.868366	{}	Longitude
299	{}	{}	2024-09-25 23:32:20.870231	2024-09-25 23:32:20.870231	{}	StateOrProvince
300	{}	{}	2024-09-25 23:32:20.872102	2024-09-25 23:32:20.872102	{}	PostalCode
301	{}	{}	2024-09-25 23:32:20.873994	2024-09-25 23:32:20.873994	{}	Community
302	{}	{}	2024-09-25 23:32:20.875723	2024-09-25 23:32:20.875723	{}	LotSizeSquareFeet
303	{}	{}	2024-09-25 23:32:20.877935	2024-09-25 23:32:20.877935	{}	InternetEntireListingDisplayYN
304	{}	{}	2024-09-25 23:32:20.879932	2024-09-25 23:32:20.879932	{}	MiddleOrJuniorSchool
305	{}	{}	2024-09-25 23:32:20.882357	2024-09-25 23:32:20.882357	{}	ListOfficeAORArea
306	{}	{}	2024-09-25 23:32:20.884063	2024-09-25 23:32:20.884063	{}	PoolYN
307	{}	{}	2024-09-25 23:32:20.885896	2024-09-25 23:32:20.885896	{}	PropertyType
308	{}	{}	2024-09-25 23:32:20.887772	2024-09-25 23:32:20.887772	{}	TaxAnnualAmount
309	{}	{}	2024-09-25 23:32:20.889608	2024-09-25 23:32:20.889608	{}	TaxYear
310	{}	{}	2024-09-25 23:32:20.891463	2024-09-25 23:32:20.891463	{}	SingleStory
311	{}	{}	2024-09-25 23:32:20.893194	2024-09-25 23:32:20.893194	{}	LivingArea
312	{}	{}	2024-09-25 23:32:20.895058	2024-09-25 23:32:20.895058	{}	ViewYN
313	{}	{}	2024-09-25 23:32:20.896919	2024-09-25 23:32:20.896919	{}	YearBuilt
314	{}	{}	2024-09-25 23:32:20.898722	2024-09-25 23:32:20.898722	{}	OnMarket
315	{}	{}	2024-09-25 23:32:20.900759	2024-09-25 23:32:20.900759	{}	Status
316	{}	{}	2024-09-25 23:32:20.902718	2024-09-25 23:32:20.902718	{}	MoxiWorksListingId
317	{}	{}	2024-09-25 23:32:20.904629	2024-09-25 23:32:20.904629	{}	AgentCreatedListing
318	{}	{}	2024-09-25 23:32:20.90651	2024-09-25 23:32:20.90651	{}	VirtualTourURL
319	{}	{}	2024-09-25 23:32:20.908241	2024-09-25 23:32:20.908241	{}	SharedPartnerData
320	{}	{}	2024-09-25 23:32:20.910061	2024-09-25 23:32:20.910061	{}	TaxParcelId
321	{}	{}	2024-09-25 23:32:20.91186	2024-09-25 23:32:20.91186	{}	ListingURL
322	{}	{}	2024-09-25 23:32:20.913787	2024-09-25 23:32:20.913787	{}	PropertyFeatures
323	{}	{}	2024-09-25 23:32:20.915634	2024-09-25 23:32:20.915634	{}	CompanyListingAttributes
324	{}	{}	2024-09-25 23:32:20.91734	2024-09-25 23:32:20.91734	{}	OpenHouse
325	{}	{}	2024-09-25 23:32:20.91922	2024-09-25 23:32:20.91922	{}	ImagesLastModified
326	{}	{}	2024-09-25 23:32:20.921639	2024-09-25 23:32:20.921639	{}	BuyerCommissionType
327	{}	{}	2024-09-25 23:32:20.923426	2024-09-25 23:32:20.923426	{}	BuyerCommissionValue
328	{}	{}	2024-09-25 23:32:20.964426	2024-09-25 23:32:20.964426	{}	last_moxi_works_listing_id
329	{}	{}	2024-09-25 23:32:20.966511	2024-09-25 23:32:20.966511	{}	shared_partner_data_updated_since
330	{}	{}	2024-09-25 23:32:20.968454	2024-09-25 23:32:20.968454	{}	market_status
331	{}	{}	2024-09-25 23:32:20.970292	2024-09-25 23:32:20.970292	{}	property_types
332	{}	{}	2024-09-25 23:32:20.97201	2024-09-25 23:32:20.97201	{}	only_agent_created
333	{}	{}	2024-09-25 23:32:20.973844	2024-09-25 23:32:20.973844	{}	coming_soon
334	{}	{}	2024-09-25 23:32:20.976982	2024-09-25 23:32:20.976982	{}	FinalPage
335	{}	{}	2024-09-25 23:32:20.978912	2024-09-25 23:32:20.978912	{}	Listings
336	{}	{}	2024-09-25 23:32:20.982306	2024-09-25 23:32:20.982306	{}	id
337	{}	{}	2024-09-25 23:32:20.98492	2024-09-25 23:32:20.98492	{}	common_name
338	{}	{}	2024-09-25 23:32:20.986683	2024-09-25 23:32:20.986683	{}	image_url
339	{}	{}	2024-09-25 23:32:20.988748	2024-09-25 23:32:20.988748	{}	address2
340	{}	{}	2024-09-25 23:32:20.991021	2024-09-25 23:32:20.991021	{}	county
341	{}	{}	2024-09-25 23:32:20.993805	2024-09-25 23:32:20.993805	{}	alt_phone
342	{}	{}	2024-09-25 23:32:20.995746	2024-09-25 23:32:20.995746	{}	email
343	{}	{}	2024-09-25 23:32:20.998564	2024-09-25 23:32:20.998564	{}	phone
344	{}	{}	2024-09-25 23:32:21.000829	2024-09-25 23:32:21.000829	{}	timezone
345	{}	{}	2024-09-25 23:32:21.003265	2024-09-25 23:32:21.003265	{}	office_website
346	{}	{}	2024-09-25 23:32:21.005624	2024-09-25 23:32:21.005624	{}	mailing_address
347	{}	{}	2024-09-25 23:32:21.007779	2024-09-25 23:32:21.007779	{}	mailing_address2
348	{}	{}	2024-09-25 23:32:21.009732	2024-09-25 23:32:21.009732	{}	mailing_city
349	{}	{}	2024-09-25 23:32:21.011669	2024-09-25 23:32:21.011669	{}	mailing_zip
350	{}	{}	2024-09-25 23:32:21.013564	2024-09-25 23:32:21.013564	{}	mailing_state
351	{}	{}	2024-09-25 23:32:21.016802	2024-09-25 23:32:21.016802	{}	logo_url
352	{}	{}	2024-09-25 23:32:21.021873	2024-09-25 23:32:21.021873	{}	offices
353	{}	{}	2024-09-25 23:32:21.026287	2024-09-25 23:32:21.026287	{}	created_after
354	{}	{}	2024-09-25 23:32:21.02808	2024-09-25 23:32:21.02808	{}	created_before
355	{}	{}	2024-09-25 23:32:21.029796	2024-09-25 23:32:21.029796	{}	updated_after
356	{}	{}	2024-09-25 23:32:21.031598	2024-09-25 23:32:21.031598	{}	updated_before
357	{}	{}	2024-09-25 23:32:21.033773	2024-09-25 23:32:21.033773	{}	include_times
358	{}	{}	2024-09-25 23:32:21.035629	2024-09-25 23:32:21.035629	{}	type
359	{}	{}	2024-09-25 23:32:21.038206	2024-09-25 23:32:21.038206	{}	presentations
360	{}	{}	2024-09-25 23:32:21.074161	2024-09-25 23:32:21.074161	{}	SoldDate
361	{}	{}	2024-09-25 23:32:21.076426	2024-09-25 23:32:21.076426	{}	SoldPrice
362	{}	{}	2024-09-25 23:32:21.078404	2024-09-25 23:32:21.078404	{}	BuyerAgentFullName
363	{}	{}	2024-09-25 23:32:21.080361	2024-09-25 23:32:21.080361	{}	BuyerAgentUUID
364	{}	{}	2024-09-25 23:32:21.082273	2024-09-25 23:32:21.082273	{}	BuyerAgentOfficeName
365	{}	{}	2024-09-25 23:32:21.08408	2024-09-25 23:32:21.08408	{}	BuyerAgentOfficeID
366	{}	{}	2024-09-25 23:32:21.086001	2024-09-25 23:32:21.086001	{}	BuyerAgentMoxiWorksOfficeID
367	{}	{}	2024-09-25 23:32:21.088782	2024-09-25 23:32:21.088782	{}	sold_since
368	{}	{}	2024-09-25 23:32:21.090819	2024-09-25 23:32:21.090819	{}	sold_before
369	{}	{}	2024-09-25 23:32:21.09494	2024-09-25 23:32:21.09494	{}	include_buyer_listings
370	{}	{}	2024-09-25 23:32:21.099621	2024-09-25 23:32:21.099621	{}	partner_task_id
371	{}	{}	2024-09-25 23:32:21.102608	2024-09-25 23:32:21.102608	{}	due_at
372	{}	{}	2024-09-25 23:32:21.105354	2024-09-25 23:32:21.105354	{}	duration
373	{}	{}	2024-09-25 23:32:21.107175	2024-09-25 23:32:21.107175	{}	description
374	{}	{}	2024-09-25 23:32:21.112982	2024-09-25 23:32:21.112982	{}	completed_at
375	{}	{}	2024-09-25 23:32:21.12995	2024-09-25 23:32:21.12995	{}	due_date_start
376	{}	{}	2024-09-25 23:32:21.131912	2024-09-25 23:32:21.131912	{}	due_date_end
377	{}	{}	2024-09-25 23:32:21.135369	2024-09-25 23:32:21.135369	{}	tasks
378	{}	{}	2024-09-25 23:32:21.137482	2024-09-25 23:32:21.137482	{}	moxi_works_team_id
379	{}	{}	2024-09-25 23:32:21.141311	2024-09-25 23:32:21.141311	{}	address1
380	{}	{}	2024-09-25 23:32:21.145559	2024-09-25 23:32:21.145559	{}	fax
381	{}	{}	2024-09-25 23:32:21.148037	2024-09-25 23:32:21.148037	{}	photo_url
382	{}	{}	2024-09-25 23:32:21.150819	2024-09-25 23:32:21.150819	{}	alt_email
383	{}	{}	2024-09-25 23:32:21.152767	2024-09-25 23:32:21.152767	{}	website_url
384	{}	{}	2024-09-25 23:32:21.154737	2024-09-25 23:32:21.154737	{}	active
385	{}	{}	2024-09-25 23:32:21.167691	2024-09-25 23:32:21.167691	{}	has_agent_association
386	{}	{}	2024-09-25 23:32:21.169521	2024-09-25 23:32:21.169521	{}	has_web_data
387	{}	{}	2024-09-25 23:32:21.171721	2024-09-25 23:32:21.171721	{}	has_favorites
388	{}	{}	2024-09-25 23:32:21.173593	2024-09-25 23:32:21.173593	{}	has_searches
389	{}	{}	2024-09-25 23:32:21.1768	2024-09-25 23:32:21.1768	{}	moxi_works_user_id
390	{}	{}	2024-09-25 23:32:21.18007	2024-09-25 23:32:21.18007	{}	associated_agent_uuid
391	{}	{}	2024-09-25 23:32:21.182003	2024-09-25 23:32:21.182003	{}	favorite_listing_ids
392	{}	{}	2024-09-25 23:32:21.183764	2024-09-25 23:32:21.183764	{}	saved_searches
4	{"ActionLog": ["Create Request", "Create Response"]}	{"APIText": "To include access level information for the agent in the response, pass true", "Products": ["API", "Roster"], "ActionLog": ["API", "Roster"], "RosterText": "The access level of the agent. This can return one of the possible access levels, as seen within the products and permissions page."}	2024-09-25 23:32:20.091429	2024-09-25 16:32:36.225769	{"Endpoints": ["ActionLog"]}	body
10	{"ActionLog": ["Create Request", "Create Response"]}	{"Products": ["ActionLog"], "ActionLog": ["ActionLog"], "ActionLogText": "This is the human readable plain-text string which will be presented to the Agent as the heading of the ActionLog entry. This can be any short, descriptive sentence which would be practical for the agent to see in the history of events associated with a Contact."}	2024-09-25 23:32:20.10424	2024-09-25 16:32:36.225769	{"Endpoints": ["ActionLog"]}	agent_action
11	{"ActionLog": ["Create Request", "Create Response"]}	{"Products": ["ActionLog"], "ActionLog": ["ActionLog"], "ActionLogText": "If creating an agent_action that has a location component (‘inperson’ ‘other’) use this field to denote the street address of the agent_action."}	2024-09-25 23:32:20.106243	2024-09-25 16:32:36.225769	{"Endpoints": ["ActionLog"]}	agent_action_address
12	{"ActionLog": ["Create Request", "Create Response"]}	{"Products": ["ActionLog"], "ActionLog": ["ActionLog"], "ActionLogText": "If creating an agent_action that has a location component (‘inperson’ ‘other’) use this field to denote the additonal street address info of the agent_action."}	2024-09-25 23:32:20.108089	2024-09-25 16:32:36.225769	{"Endpoints": ["ActionLog"]}	agent_action_address2
13	{"ActionLog": ["Create Request", "Create Response"]}	{"Products": ["ActionLog"], "ActionLog": ["ActionLog"], "ActionLogText": "If creating an agent_action that has a location component (‘inperson’ ‘other’) use this field to denote the city or locale of the agent_action."}	2024-09-25 23:32:20.109938	2024-09-25 16:32:36.225769	{"Endpoints": ["ActionLog"]}	agent_action_city
14	{"ActionLog": ["Create Request", "Create Response"]}	{"Products": ["ActionLog"], "ActionLog": ["ActionLog"], "ActionLogText": "If creating an agent_action that has a location component (‘inperson’ ‘other’) use this field to denote the state or province related info of the agent_action."}	2024-09-25 23:32:20.111699	2024-09-25 16:32:36.225769	{"Endpoints": ["ActionLog"]}	agent_action_state
15	{"ActionLog": ["Create Request", "Create Response"]}	{"Products": ["ActionLog"], "ActionLog": ["ActionLog"], "ActionLogText": "If creating an agent_action that has a location component (‘inperson’ ‘other’) use this field to denote the postal code of the agent_action."}	2024-09-25 23:32:20.113374	2024-09-25 16:32:36.225769	{"Endpoints": ["ActionLog"]}	agent_action_zip
16	{"ActionLog": ["Create Response"]}	{"APIText": "This is the Unix timestamp for the creation time of the ActionLog entry.", "Products": ["API"], "ActionLog": ["API"]}	2024-09-25 23:32:20.117031	2024-09-25 16:32:36.225769	{"Endpoints": ["ActionLog"]}	timestamp
17	{"ActionLog": ["Delete Request"]}	{"APIText": "This is the MoxiWorks Platform ID of the ActionLog entry to be deleted. This will be an RFC 4122 compliant UUID.", "Products": ["API"], "ActionLog": ["API"]}	2024-09-25 23:32:20.121399	2024-09-25 16:32:36.225769	{"Endpoints": ["ActionLog"]}	moxi_works_action_log_id
18	{"ActionLog": ["Delete Response"]}	{"APIText": "This will indicate what the status of the request is.", "Products": ["API"], "ActionLog": ["API"]}	2024-09-25 23:32:20.125031	2024-09-25 16:32:36.225769	{"Endpoints": ["ActionLog"]}	status
19	{"ActionLog": ["Delete Response"]}	{"APIText": "This will indicate whether the delete request was successful or not.", "Products": ["API"], "ActionLog": ["API"]}	2024-09-25 23:32:20.127225	2024-09-25 16:32:36.225769	{"Endpoints": ["ActionLog"]}	deleted
20	{"ActionLog": ["Delete Response"]}	{"APIText": "This is an arrray of strings. Any messages associated with the delete request status will be contained in this array.", "Products": ["API"], "ActionLog": ["API"]}	2024-09-25 23:32:20.12894	2024-09-25 16:32:36.225769	{"Endpoints": ["ActionLog"]}	messages
21	{"ActionLog": ["Index Request"]}	{"APIText": "Only ActionLog records created later than this Unix timestamp will be included in the query. The upper bound of the time slice will be the 90 days higher than date_min value or the value of the the date_max; whichever is lower. If no timestamps are provided, ActionLogs from the last 90 days will be retrieved. The maximum timeframe for data is 90 days. date_min and date_max should be set in 90 day increments to retrieve the data from a specific historical point.", "Products": ["API"], "ActionLog": ["API"]}	2024-09-25 23:32:20.133135	2024-09-25 16:32:36.225769	{"Endpoints": ["ActionLog"]}	date_min
22	{"ActionLog": ["Index Request"]}	{"APIText": "Only ActionLog records created earlier than this Unix timestamp will be included in the query. Should be no higher than 90 days past the date_min attribute if it is provided. The maximum timeframe for data is 90 days. date_min and date_max should be set in 90 day increments to retrieve the data from a specific historical point.", "Products": ["API"], "ActionLog": ["API"]}	2024-09-25 23:32:20.134666	2024-09-25 16:32:36.225769	{"Endpoints": ["ActionLog"]}	date_max
87	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "A list of the source-specific user identifiers.", "Products": ["API"]}	2024-09-25 23:32:20.232988	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	source_metadata
23	{"ActionLog": ["Index Response"]}	{"APIText": "This is an Array containing any ActionLog entries found for the Index request - [moxi_works_action_log_id, type, timestamp, log_data].", "Products": ["API"], "ActionLog": ["API"]}	2024-09-25 23:32:20.137577	2024-09-25 16:32:36.225769	{"Endpoints": ["ActionLog"]}	actions
25	{"Agent": ["Create Request"]}	{"Agent": ["API", "Engage"], "APIText": "Whether to include agent’s GCI goals and commissions data in the response data.", "Products": ["API", "Engage"], "EngageText": "This represents the Gross Commission Income goal, as seen throughout the Engage UI."}	2024-09-25 23:32:20.142799	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent", "Agent"]}	include_gci_goals
78	{"Agent": ["Create Response"]}	{"Agent": ["Engage"], "Products": ["Engage"], "EngageText": "This is the agent’s Gross Commission Income goal, as seen throughout the Engage UI."}	2024-09-25 23:32:20.219621	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	gci_goal
79	{"Agent": ["Create Response"]}	{"Agent": ["Roster"], "Products": ["Roster"], "RosterText": "Percentage commission rate for the agent when acting as a buyer’s agent."}	2024-09-25 23:32:20.221358	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	buyer_commission_rate
80	{"Agent": ["Create Response"]}	{"Agent": ["Roster"], "Products": ["Roster"], "RosterText": "Percentage commission rate for the agent when acting as a seller’s agent."}	2024-09-25 23:32:20.222865	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	seller_commission_rate
27	{"Agent": ["Create Request", "Index Request"]}	{"Agent": ["API", "Roster"], "APIText": "To include ratings and reviews associated with the agent in the response, pass true.", "Products": ["API", "Roster"], "RosterText": "Referencing external agent reviews from platforms such as Zillow and Testimonial Tree."}	2024-09-25 23:32:20.145498	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	include_reviews
72	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This will be null. Deprecated.", "Products": ["API"]}	2024-09-25 23:32:20.211252	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	google_plus
24	{"Agent": ["Create Request", "Index Request"]}	{"Agent": ["API", "Roster"], "APIText": "To include access level information for the agent in the response, pass true.", "Products": ["API", "Roster"], "RosterText": "The access level of the agent. This can return one of the possible access levels, as seen within the products and permissions page."}	2024-09-25 23:32:20.141422	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent", "Agent"]}	include_access_level
26	{"Agent": ["Create Request", "Index Request"]}	{"Agent": ["API"], "APIText": "To include affiliate data associated with the agent in the response, pass true.", "Products": ["API"]}	2024-09-25 23:32:20.144115	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	include_partners
92	{"Agent": ["Index Request"]}	{"Agent": ["API"], "APIText": "Any Agent objects updated after this Unix timestamp will be returned in the response. If no updated_since parameter is included in the request, by default only Agent objects updated in the last seven days will be returned.", "Products": ["API"]}	2024-09-25 23:32:20.241577	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	updated_since
94	{"Agent": ["Index Request"]}	{"Agent": ["API"], "APIText": "To find Agent accounts deactivated within the specified timeframe, pass true for this boolean parameter.", "Products": ["API"]}	2024-09-25 23:32:20.244854	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	deactivated
96	{"Agent": ["Index Request"]}	{"Agent": ["API"], "APIText": "To include company specific programs associated with the agent in the response, pass true.", "Products": ["API"]}	2024-09-25 23:32:20.248039	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	include_company_programs
98	{"Agent": ["Index Request"]}	{"Agent": ["API"], "APIText": "To include only Agent objects associated with company specific programs pass true.", "Products": ["API"]}	2024-09-25 23:32:20.250845	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	has_company_programs
100	{"Agent": ["Index Request"]}	{"Agent": ["API", "Roster"], "APIText": "To include bio associated with the agent in the response, pass true.", "Products": ["API", "Roster"], "RosterText": "This references the bio of the agent, as seen on the about me > web info page."}	2024-09-25 23:32:20.253972	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	include_bio
97	{"Agent": ["Index Request"]}	{"Agent": ["API", "Websites"], "APIText": "To include the base url (website_base_url) of the agent’s MoxiWorks website pass true.", "Products": ["API", "Websites"], "WebsitesText": "This references the website url for the agent."}	2024-09-25 23:32:20.249447	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	include_website
95	{"Agent": ["Index Request"]}	{"Agent": ["API"], "APIText": "Any Agent objects deactivated after this Unix timestamp will be returned in the response. If no deactivated_since parameter is included in the request, only Agent objects deactivated in the last seven days will be returned.", "Products": ["API"]}	2024-09-25 23:32:20.246308	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	deactivated_since
51	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "The last name of the agent."}	2024-09-25 23:32:20.180506	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	last_name
52	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "The nickname of the agent."}	2024-09-25 23:32:20.181925	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	nickname
53	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "This is the agent’s main phone number. This number should be considered the number the agent would like to be contacted by."}	2024-09-25 23:32:20.18363	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	main_phone_number
54	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Mobile phone number of the agent. main_phone_number should be considered higher priority, if not the same."}	2024-09-25 23:32:20.185118	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	mobile_phone_number
28	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the ID of the Agent, as utilized by their brokerage or company.", "Products": ["API"]}	2024-09-25 23:32:20.147634	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	client_agent_id
50	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "The first name of the agent."}	2024-09-25 23:32:20.17912	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	first_name
29	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is the ID of the Agent utilized by their primary MLS. This ID allows listings to associate with the User Account.", "Products": ["API", "Roster"], "RosterText": "This ID can be found on the Manage MLS Associations page of the Agent or other User Account."}	2024-09-25 23:32:20.149189	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	mls_agent_id
30	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the number of the license granted to the agent. Please see mls_agent_id for the Agent MLS ID value.", "Products": ["API"]}	2024-09-25 23:32:20.150694	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	license
31	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is the name of the primary MLS for the agent.", "Products": ["API", "Roster"], "RosterText": "This name can be found on the Manage MLS Associations page of the Agent or other User Account."}	2024-09-25 23:32:20.152173	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	mls_name
32	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the standard abbreviation of the primary MLS utilized by the agent.", "Products": ["API"]}	2024-09-25 23:32:20.153623	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	mls_abbreviation
33	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the ID of this Agent. This will be an integer.", "Products": ["API"]}	2024-09-25 23:32:20.155038	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	agent_id
36	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the ID of the office for this Agent. This will be an integer.", "Products": ["API"]}	2024-09-25 23:32:20.159145	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	client_office_id
37	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the ID of the company for this Agent. This will be an integer.", "Products": ["API"]}	2024-09-25 23:32:20.16054	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	company_id
38	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the ID of the Company utilized by their brokerage or company.", "Products": ["API"]}	2024-09-25 23:32:20.161953	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	client_company_id
39	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is the main associated physical street address where the office is located. It can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Displays under the associated office page."}	2024-09-25 23:32:20.163408	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	office_address_street
40	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is the main associated secondary physical street address field, often populated with a suite or office number. This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Displays under the associated office page."}	2024-09-25 23:32:20.164702	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	office_address_street2
41	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "The city where the office is located, as associated with the physical address. This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Displays under the associated office page."}	2024-09-25 23:32:20.166432	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	office_address_city
42	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "The state where the office is located, as associated with the physical address. This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Displays under the associated office page."}	2024-09-25 23:32:20.167935	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	office_address_state
43	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "The postal code associated with the office physical address. This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Displays under the associated office page."}	2024-09-25 23:32:20.169416	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	office_address_zip
44	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the associated mailing address where the office is located. It can be null if there is no data for this attribute.", "Products": ["API"]}	2024-09-25 23:32:20.170869	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	office_mailing_address_street
45	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the associated secondary mailing street address field, often populated with a suite or office number. This can be null if there is no data for this attribute.", "Products": ["API"]}	2024-09-25 23:32:20.1723	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	office_mailing_address_street2
46	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "The city where the office receives mail, as associated with the mailing address. This can be null if there is no data for this attribute.", "Products": ["API"]}	2024-09-25 23:32:20.173674	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	office_mailing_address_city
47	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "The state where the office receives mail, as associated with the mailing address. This can be null if there is no data for this attribute.", "Products": ["API"]}	2024-09-25 23:32:20.175077	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	office_mailing_address_state
48	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "The postal code associated with the office mailing address. This can be null if there is no data for this attribute.", "Products": ["API"]}	2024-09-25 23:32:20.176364	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	office_mailing_address_zip
55	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Alternate phone number for the agent. This should be considered second in priority to main_phone_number."}	2024-09-25 23:32:20.186594	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	alt_phone_number
56	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "This is the agent’s fax phone number."}	2024-09-25 23:32:20.1879	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	fax_phone_number
57	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "This is the agent’s office phone number."}	2024-09-25 23:32:20.189347	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	office_phone_number
58	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "This is the agent’s main email address. This email address should be considered the email address the agent would prefer to be contacted by."}	2024-09-25 23:32:20.190761	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	primary_email_address
59	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "This is the agent’s alternate email address. This email address should be considered the email address the agent would want to be contacted by only if the address in primary_email_address is not functional."}	2024-09-25 23:32:20.192118	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	secondary_email_address
61	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Engage"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Engage"], "EngageText": "This is the agent’s lead routing email address. This can be null if there is no data for this attribute."}	2024-09-25 23:32:20.194922	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	lead_routing_email_address
7	{"Agent": ["Create Response", "Index Response"], "ActionLog": ["Create Request", "Create Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "ActionLog", "Roster"], "ActionLog": ["ActionLog"], "RosterText": "This is the business title of the agent.", "ActionLogText": "This is the human readable plain-text string which will be presented to the Agent as the heading of the ActionLog entry. This can be any short, descriptive sentence which would be practical for the agent to see in the history of events associated with a Contact."}	2024-09-25 23:32:20.097192	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	title
62	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "Array of key/value pairs. Each has a body and header, both strings, which can be null or blank.", "Products": ["API", "Roster"], "RosterText": "This is the bio of the agent, as seen on the about me > web info page."}	2024-09-25 23:32:20.196643	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	bio
63	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is a string that contains the agent’s designation(s), if any. This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": ""}	2024-09-25 23:32:20.198042	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	designations
64	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is an RFC 4122 compliant UUID. This UUID can be used as a unique identifier in determining associations between Agent objects and Listing objects.", "Products": ["API", "Roster"], "RosterText": "Displays within the about me section."}	2024-09-25 23:32:20.199501	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	uuid
65	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "Indicates whether the agent has access to MoxiWorks Products.", "Products": ["API", "Roster"], "RosterText": "Referring to each individual Moxi product offered, such as Engage, Present, Impress etc."}	2024-09-25 23:32:20.200823	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	has_product_access
66	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Engage"], "APIText": "Indicates whether the agent has access to MoxiWorks Engage Product.", "Products": ["API", "Engage"], "EngageText": "Referencing the agent’s ability to access Engage as a product."}	2024-09-25 23:32:20.202608	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	has_engage_access
67	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "If include_access_level was passed as true, this can return one of the possible access levels.", "Products": ["API", "Roster"], "RosterText": "Related to the products and permissions page, specific to user account permissions section."}	2024-09-25 23:32:20.204124	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	access_level
68	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This will return one of the possible view levels.", "Products": ["API", "Roster"], "RosterText": "The view level of the agent."}	2024-09-25 23:32:20.205614	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	view_level
69	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "The teams array contains Dictionary objects representing Team entries. These include [name, uuid, member_category].", "Products": ["API", "Roster"], "RosterText": "Related to Agent Teams, within My Account section."}	2024-09-25 23:32:20.207089	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	teams
70	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["Roster", "Websites"], "Products": ["Roster", "Websites"], "RosterText": "Seen within About Me > Web Info.", "WebsitesText": "The base url of the agent’s MoxiWorks agent website."}	2024-09-25 23:32:20.208524	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	website_base_url
71	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data available for this attribute.", "Products": ["API", "Roster"], "RosterText": "Agent’s Twitter URL. Seen within About Me > Web Info."}	2024-09-25 23:32:20.209844	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	twitter
73	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data available for this attribute.", "Products": ["API", "Roster"], "RosterText": "Agent’s Facebook page url. Seen within About Me > Web Info."}	2024-09-25 23:32:20.212657	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	facebook
74	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Websites"], "APIText": "You’ll need to prefix the domain with protocol if using this attribute for an href. This can be null if there is no data available for this attribute.", "Products": ["API", "Websites"], "WebsitesText": "Agent’s website domain. This will be returned without the HTTP(S) prefix."}	2024-09-25 23:32:20.214043	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	home_page
75	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is a valid URL for a larger size image for the agent. If no agent image has been uploaded for this agent a default image url will be provided.", "Products": ["API", "Roster"], "RosterText": "Agent’s associated profile image within About Me section."}	2024-09-25 23:32:20.215428	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	profile_image_url
76	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is a valid URL for a thumbnail size image for the agent. If no agent image has been uploaded for this agent a default image url will be provided.", "Products": ["API", "Roster"], "RosterText": "Agent’s associated profile image within About Me section, thumbnail."}	2024-09-25 23:32:20.21681	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	profile_thumb_url
77	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "The region the agent’s office is in."}	2024-09-25 23:32:20.218284	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	region
81	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["Engage"], "Products": ["Engage"], "EngageText": "A list of the lead service area zip codes covered by the agent."}	2024-09-25 23:32:20.224374	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	service_area_zip_codes
82	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["Websites"], "Products": ["Websites"], "WebsitesText": "This includes the base_url and bio_page_slug of the agent MoxiWorks website."}	2024-09-25 23:32:20.225839	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	agent_website
83	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "The alternate_offices array contains Dictionary objects representing AlternateOffice entries. These include [moxi_works_office_id, office_id, office_address_street, office_address_street2, office_address_city, office_address_state, office_address_zip, office_phone_number].", "Products": ["API", "Roster"], "RosterText": "Agent’s alternate offices, as seen within the additional offices page."}	2024-09-25 23:32:20.227469	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	alternate_offices
84	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "The available_mls Array contains Dictionary objects representing MLS entries. These include [name, display_name, mls_abbreviation, agent_id].", "Products": ["API", "Roster"], "RosterText": "Agent’s alternate offices, as seen within the additional offices page."}	2024-09-25 23:32:20.228875	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	available_mls
85	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "Existence of objects in the partners data structure is dependent upon external relationships existing between the agent represented by this Agent and the affiliate. Documented entities in the `partners` data structure may or may not be returned based on agent relationship. Your logic should be engineered to handle cases where the entity you are interested in is returned and where an empty data structure is returned.", "Products": ["API"]}	2024-09-25 23:32:20.230276	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	partners
86	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "A list of the company specific program names in which the agent participates or is a member.", "Products": ["API"]}	2024-09-25 23:32:20.231597	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	company_programs
88	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the Unix timestamp representing the date that this Agent was created in the MoxiWorks system.", "Products": ["API"]}	2024-09-25 23:32:20.234398	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	created_timestamp
90	{"Agent": ["Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "True corresponds to Yes (visible online); false corresponds to No (not visible online).", "Products": ["API", "Roster"], "RosterText": "Indicates the “Profile Visible Online” value for this Agent."}	2024-09-25 23:32:20.237436	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	profile_visible_online
91	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "Existence of objects in the user_reviews data structure is dependent upon external sources, i.e. Zillow, Testimonial Tree. Documented entities in the `user_reviews` data structure may or may not be returned when `include_reviews=true` is passed. Your logic should be engineered to handle cases where the entity you are interested in is returned and where an empty data structure is returned. Included in this - [source_name, agg_rating, reviews_count]", "Products": ["API", "Roster"], "RosterText": "External agent reviews from platforms such as Zillow and Testimonial Tree."}	2024-09-25 23:32:20.239145	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	user_reviews
60	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "The email_addresses Hash is a Dictionary object holding the email addresses associated with the Agent record. These include [primary, display, alternate, moxi_sync, lead_routing, zillow].", "Products": ["API", "Roster"], "RosterText": "Some of these will display on the About Me section, including primary, display, moxi sync."}	2024-09-25 23:32:20.193529	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	email_addresses
89	{"Agent": ["Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is the Unix timestamp representing the date that this Agent was deactivated in the MoxiWorks system. This will be returned null if the agent is still active.This is the Unix timestamp representing the date that this Agent was deactivated in the MoxiWorks system. This will be returned null if the agent is still active.", "Products": ["API", "Roster"], "RosterText": "Will display within Account Info section if user account is deactivated."}	2024-09-25 23:32:20.235994	2024-09-25 16:32:43.185022	{"Endpoints": ["Agent"]}	deactivated_timestamp
101	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Present"], "Products": ["Present"], "PresentText": "This is the logo associated with the Brokerage or Company."}	2024-09-25 23:32:20.277975	2024-09-25 16:32:51.912998	{"Endpoints": ["Brand"]}	image_logo
105	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Present"], "Products": ["Present"], "PresentText": "Within a Presentation, this is the background color of associated buttons."}	2024-09-25 23:32:20.28371	2024-09-25 16:32:51.912998	{"Endpoints": ["Brand"]}	button_background_color
35	{"Agent": ["Create Response", "Index Response"], "Brand": ["Index Request"]}	{"Agent": ["API"], "Brand": ["API", "Roster"], "APIText": "This is the ID of the office for this Agent. This will be an integer.", "Products": ["API"]}	2024-09-25 23:32:20.157765	2024-09-25 16:32:51.912998	{"Endpoints": ["Agent", "Brand"]}	office_id
34	{"Agent": ["Create Response", "Index Request", "Index Response"], "Brand": ["Index Request"]}	{"Agent": ["API", "Roster"], "Brand": ["API", "Roster"], "APIText": "This will be an RFC 4122 compliant UUID.", "Products": ["API", "Roster"], "RosterText": "This is the MoxiWorks Platform ID of the office for this Agent."}	2024-09-25 23:32:20.156445	2024-09-25 16:32:51.912998	{"Endpoints": ["Agent", "Brand"]}	moxi_works_office_id
102	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "Accent color.", "Products": ["API", "Present"], "PresentText": "Within a Presentation, this will be the accent color."}	2024-09-25 23:32:20.279396	2024-09-25 16:32:51.912998	{"Endpoints": ["Brand"]}	cma_authoring_color
103	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Present"], "Products": ["Present"], "PresentText": "Within a Presentation, this will be the background color of a page."}	2024-09-25 23:32:20.280871	2024-09-25 16:32:51.912998	{"Endpoints": ["Brand"]}	background_color
104	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Present"], "Products": ["Present"], "PresentText": "Within a Presentation, this is the font color intended to overlay the background_color attribute."}	2024-09-25 23:32:20.282307	2024-09-25 16:32:51.912998	{"Endpoints": ["Brand"]}	background_font_color_primary
106	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Present"], "Products": ["Present"], "PresentText": "Within a Presentation, this is the font color intended to overlay the button_background_color attribute."}	2024-09-25 23:32:20.285094	2024-09-25 16:32:51.912998	{"Endpoints": ["Brand"]}	button_font_color
107	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "This attribute may contain embedded HTML.", "Products": ["API", "Present"], "PresentText": "Within a Presentation, this will be the copyright notice information."}	2024-09-25 23:32:20.286491	2024-09-25 16:32:51.912998	{"Endpoints": ["Brand"]}	copyright
108	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "Relates to the Brokerage or Company name.", "Products": ["API", "Present"], "PresentText": "Within a Presentation, this is the name of the Brokerage or Company as displayed to the consumer."}	2024-09-25 23:32:20.287822	2024-09-25 16:32:51.912998	{"Endpoints": ["Brand"]}	display_name
109	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Engage"], "APIText": "This is specific to the background color that displays when sending an email from Present.", "Products": ["API", "Engage"], "EngageText": "Background color of sent email elements outside of the email body."}	2024-09-25 23:32:20.28917	2024-09-25 16:32:51.912998	{"Endpoints": ["Brand"]}	email_element_background_color
110	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Engage"], "APIText": "Font color intended to overlay email_element_background_color?", "Products": ["API", "Engage"], "EngageText": "The font color for font that overlays email_element_background_color?"}	2024-09-25 23:32:20.290565	2024-09-25 16:32:51.912998	{"Endpoints": ["Brand"]}	email_background_font_color
111	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "Brokerage or Company logo shown in Print (PDF) Presentations.", "Products": ["API", "Present"], "PresentText": "Within a Presentation - specifically Print (PDF) format, this will be the Brokerage or Company logo that displays."}	2024-09-25 23:32:20.291996	2024-09-25 16:32:51.912998	{"Endpoints": ["Brand"]}	image_cma_pdf_logo_header
112	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Engage"], "Products": ["Engage"], "EngageText": "Related to sent emails, this will be the Brokerage or Company logo as shown in email header."}	2024-09-25 23:32:20.293441	2024-09-25 16:32:51.912998	{"Endpoints": ["Brand"]}	image_email_logo_alt
113	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Present", "Websites"], "Products": ["Present", "Websites"], "PresentText": "Within a presentation, this will be the favicon that displays related to the Brokerage or Company.", "WebsitesText": "Favicon of Brokerage or Company."}	2024-09-25 23:32:20.295204	2024-09-25 16:32:51.912998	{"Endpoints": ["Brand"]}	image_favicon
114	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "Brokerage or Company logo for web view presentations.", "Products": ["API", "Present"], "PresentText": "Within a Presentation - specifically web view, this will be the Brokerage or Company logo."}	2024-09-25 23:32:20.297064	2024-09-25 16:32:51.912998	{"Endpoints": ["Brand"]}	image_pres_cover_logo
115	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "Block element background color for web view presentations.", "Products": ["API", "Present"], "PresentText": "Within a Presentation - specifically web view, this is the background color that displays."}	2024-09-25 23:32:20.29873	2024-09-25 16:32:51.912998	{"Endpoints": ["Brand"]}	pres_block_background_color
116	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "Font color intended to overlay pres_block_background_color attribute.", "Products": ["API", "Present"], "PresentText": "Within a Presentation - specifically web view, this is the font color for related text."}	2024-09-25 23:32:20.300414	2024-09-25 16:32:51.912998	{"Endpoints": ["Brand"]}	pres_block_text_color
49	{"Agent": ["Create Response", "Index Response"], "Brand": ["Index Response"]}	{"Agent": ["API", "Roster"], "Brand": ["API", "Present"], "APIText": "This can be null if there is no data for this attribute.Human readable string identifying the brand.", "Products": ["API", "Present", "Roster"], "RosterText": "The full name of the agent.", "PresentText": "This will be the name that displays related to the associated Brand."}	2024-09-25 23:32:20.177732	2024-09-25 16:32:51.912998	{"Endpoints": ["Brand"]}	name
146	{"BuyerTransaction": ["Update Request"]}	{"APIText": "If this is set to true then The MoxiWorks Platform will promote this transaction to the next stage.", "Products": ["API"], "BuyerTransaction": ["API"]}	2024-09-25 23:32:20.388134	2024-09-26 12:37:50.632951	{"Endpoints": ["BuyerTransaction"]}	promote_transaction
93	{"Agent": ["Index Request"], "BuyerTransaction": ["Index Request"]}	{"Agent": ["API"], "APIText": "For queries with multi-page responses, use the page_number parameter to return data for specific pages. Data for page 1 is returned if this parameter is not included. Use this parameter if total_pages indicates that there is more than one page of data available.", "Products": ["API"]}	2024-09-25 23:32:20.243079	2024-09-26 12:37:50.632951	{"Endpoints": ["Agent"]}	page_number
99	{"Agent": ["Index Request"], "BuyerTransaction": ["Index Request"]}	{"Agent": ["API"], "APIText": "If supplied then the results will exclude all data except primary identifiers and a unix timestamp (last_updated) & iso8601 timestamp (modification_timestamp) of the last time this record was updated.", "Products": ["API"]}	2024-09-25 23:32:20.252573	2024-09-26 12:37:50.632951	{"Endpoints": ["Agent"]}	timestamps_only
3	{"Agent": ["Create Request"], "Brand": ["Index Request"], "ActionLog": ["Create Request", "Delete Request", "Index Request"], "BuyerTransaction": ["Create Request", "Update Request", "Show Request", "Index Request"]}	{"Agent": ["API"], "Brand": ["API"], "APIText": "If you have access to agent data from the same company source that MoxiWorks uses as an upstream data source then you should use the source_agent_id request attribute. This identifier will be unique only within the scope of a given company or parent_company, and must be used in conjunction with the moxi_works_company_id or parent_company_id request attributes. Please email partners@moxiworks.com for clarification about this request attribute.", "Products": ["API"], "ActionLog": ["API"]}	2024-09-25 23:32:20.089515	2024-09-26 12:37:50.632951	{"Endpoints": ["ActionLog", "Agent", "Brand", "BuyerTransaction"]}	source_agent_id
8	{"Agent": ["Create Request", "Index Request"], "Brand": ["Show Request", "Index Request"], "ActionLog": ["Create Request", "Delete Request", "Index Request"], "BuyerTransaction": ["Create Request", "Update Request", "Show Request", "Index Request"]}	{"Agent": ["API", "Roster"], "Brand": ["API", "Roster"], "APIText": "MoxiWorks Plaform Company entities are your entry-point for determining the established relationships for your organization to companies on the MoxiWorks Platform and for accessing data about those companies. Many requests require a moxi_works_company_id, which can be derived from the Company Index endpoint.", "Products": ["API", "Roster"], "ActionLog": ["API", "Roster"], "RosterText": "", "BuyerTransaction": ["API", "Roster"]}	2024-09-25 23:32:20.099024	2024-09-26 12:37:50.632951	{"Endpoints": ["ActionLog", "Agent", "Brand", "Brand", "BuyerTransaction"]}	moxi_works_company_id
9	{"Agent": ["Create Request", "Index Request"], "Brand": ["Show Request", "Index Request"], "ActionLog": ["Create Request", "Delete Request", "Index Request"], "BuyerTransaction": ["Create Request", "Update Request", "Show Request", "Index Request"]}	{"Agent": ["API", "Roster"], "Brand": ["API", "Roster"], "APIText": "This provides for a broad scope by which partners may be afforded permissions to perform MoxiWorks Platform actions, in scenarios where a partner does business with a parent company in the MoxiWorks System. It also provides broad scope under which agents may be looked up using the source_agent_id request attribute in many scenarios across different MoxiWorks Platform endpoints and actions.", "Products": ["API", "Roster"], "ActionLog": ["API", "Roster"], "RosterText": "This is the numeric_id or moxi_works_company_id of a company that is considered to be a parent company in the MoxiWorks Platform.", "BuyerTransaction": ["API", "Roster"]}	2024-09-25 23:32:20.100796	2024-09-26 12:37:50.632951	{"Endpoints": ["ActionLog", "Agent", "Brand", "Brand", "BuyerTransaction"]}	parent_company_id
137	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "The desired purchase price for a property if using target rather than range.", "BuyerTransaction": ["Engage"]}	2024-09-25 23:32:20.346384	2024-09-26 12:37:50.632951	{"Endpoints": ["BuyerTransaction"]}	target_price
136	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Show Response", "Index Response"]}	{"APIText": "If payment for the transaction is based on a flat fee derived from sales volume, use this attribute.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, the total commission for the transaction based on percentage of purchase price.", "BuyerTransaction": ["API", "Engage"]}	2024-09-25 23:32:20.344802	2024-09-26 12:37:50.632951	{"Endpoints": ["BuyerTransaction"]}	sales_volume_flat_fee
135	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Show Response", "Index Response"]}	{"APIText": "If the payment for the transaction is based on percentage of sales volume, use this attribute.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, the total commission for the transaction based on sales volume percentage.", "BuyerTransaction": ["API", "Engage"]}	2024-09-25 23:32:20.343184	2024-09-26 12:37:50.632951	{"Endpoints": ["BuyerTransaction"]}	sales_volume_percentage
120	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This should be populated if this BuyerTransaction is_mls_transaction is false.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this will be the city or township of the property being purchased.", "BuyerTransaction": ["API", "Engage"]}	2024-09-25 23:32:20.318747	2024-09-26 12:37:50.632951	{"Endpoints": ["BuyerTransaction"]}	city
140	{"BuyerTransaction": ["Create Request", "Create Response", "Update Response", "Show Response", "Index Response"]}	{"APIText": "The stage that the BuyerTransaction should be placed into.", "Products": ["API"], "BuyerTransaction": ["API"]}	2024-09-25 23:32:20.351448	2024-09-26 12:37:50.632951	{"Endpoints": ["BuyerTransaction"]}	stage
142	{"BuyerTransaction": ["Create Response", "Update Response", "Show Response", "Index Response"]}	{"APIText": "When created through the MoxiWorks Platform, BuyerTransaction objects will automatically be configured as active transactions. For more information about BuyerTransaction stages, see the MoxiCloud documentation, specific to BuyerTransaction Stages.", "Products": ["API", "Engage"], "EngageText": "For Buyer Transactions, this attribute displays the name or title that is associated with the current stage of the transaction.", "BuyerTransaction": ["API", "Engage"]}	2024-09-25 23:32:20.357692	2024-09-26 12:37:50.632951	{"Endpoints": ["BuyerTransaction"]}	stage_name
145	{"BuyerTransaction": ["Create Response", "Update Response", "Show Response", "Index Response"]}	{"APIText": "The stage that the BuyerTransaction should be placed into.", "Products": ["API"], "BuyerTransaction": ["API"]}	2024-09-25 23:32:20.372234	2024-09-26 12:37:50.632951	{"Endpoints": ["BuyerTransaction"]}	state_changed_at
121	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This should be populated if this BuyerTransaction is_mls_transaction is false.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this will be the state or province of the property being purchased.", "BuyerTransaction": ["API", "Engage"]}	2024-09-25 23:32:20.320399	2024-09-26 12:37:50.632951	{"Endpoints": ["BuyerTransaction"]}	state
130	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This should be false for paperwork-only, for sale by owner, off-market, or pocket listing type transactions or any transactions that will not be tracked through an MLS.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this attribute indictates whether the property being purchased is listed on an MLS.", "BuyerTransaction": ["API", "Engage"]}	2024-09-25 23:32:20.334705	2024-09-26 12:37:50.632951	{"Endpoints": ["BuyerTransaction"]}	is_mls_transaction
143	{"BuyerTransaction": ["Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This should be null if the BuyerTransaction is not yet in complete state.", "Products": ["API", "Engage"], "EngageText": "This is the closing price for the transaction.", "BuyerTransaction": ["API", "Engage"]}	2024-09-25 23:32:20.368898	2024-09-26 12:37:50.632951	{"Endpoints": ["BuyerTransaction"]}	closing_price
118	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "Brief, human readable content that will be shown to the agent as notes about the BuyerTransaction that you are creating.", "Products": ["API", "Engage"], "EngageText": "For Buyer Transactions, these will be the related notes.", "BuyerTransaction": ["API", "Engage"]}	2024-09-25 23:32:20.315063	2024-09-26 12:37:50.632951	{"Endpoints": ["BuyerTransaction"]}	notes
117	{"BuyerTransaction": ["Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "A brief, human readable title that will be shown to the agent as the subject of the BuyerTransaction that you are creating.", "Products": ["API", "Engage"], "EngageText": "For Buyer Transactions, this will be the name or title of the transaction in question.", "BuyerTransaction": ["API", "Engage"]}	2024-09-25 23:32:20.312859	2024-09-26 12:37:50.632951	{"Endpoints": ["BuyerTransaction"]}	transaction_name
119	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This should be populated if this BuyerTransaction is_mls_transaction is false.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this is the street address of the property being purchased.", "BuyerTransaction": ["API", "Engage"]}	2024-09-25 23:32:20.317077	2024-09-26 12:37:50.632951	{"Endpoints": ["BuyerTransaction"]}	address
122	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This should be populated if this BuyerTransaction is_mls_transaction is false.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this will be the postal code of the property being purchased.", "BuyerTransaction": ["API", "Engage"]}	2024-09-25 23:32:20.322008	2024-09-26 12:37:50.632951	{"Endpoints": ["BuyerTransaction"]}	zip_code
123	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the minimum desired living area for prospective properties.", "BuyerTransaction": ["Engage"]}	2024-09-25 23:32:20.323594	2024-09-26 12:37:50.632951	{"Endpoints": ["BuyerTransaction"]}	min_sqft
124	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the maximum desired living area for prospective properties.", "BuyerTransaction": ["Engage"]}	2024-09-25 23:32:20.325188	2024-09-26 12:37:50.632951	{"Endpoints": ["BuyerTransaction"]}	max_sqft
125	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the minimum number of bedrooms for prospective properties.", "BuyerTransaction": ["Engage"]}	2024-09-25 23:32:20.326721	2024-09-26 12:37:50.632951	{"Endpoints": ["BuyerTransaction"]}	min_beds
126	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the maximum number of bedrooms for prospective properties.", "BuyerTransaction": ["Engage"]}	2024-09-25 23:32:20.32831	2024-09-26 12:37:50.632951	{"Endpoints": ["BuyerTransaction"]}	max_beds
127	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the minimum number of bathrooms for prospective properties.", "BuyerTransaction": ["Engage"]}	2024-09-25 23:32:20.329901	2024-09-26 12:37:50.632951	{"Endpoints": ["BuyerTransaction"]}	min_baths
128	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the maximum number of bathrooms for prospective properties.", "BuyerTransaction": ["Engage"]}	2024-09-25 23:32:20.331498	2024-09-26 12:37:50.632951	{"Endpoints": ["BuyerTransaction"]}	max_baths
129	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the name of a locality representing an area of interest for prospective properties.", "BuyerTransaction": ["Engage"]}	2024-09-25 23:32:20.333096	2024-09-26 12:37:50.632951	{"Endpoints": ["BuyerTransaction"]}	area_of_interest
131	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "mls_number should be populated only if is_mls_transaction is true. If no commission (either commission_percentage or commission_flat_fee) is supplied during creation, commission_percentage is set to the default commission_percentage for the associated Agent.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, the MLS number of the the property being purchased.", "BuyerTransaction": ["API", "Engage"]}	2024-09-25 23:32:20.336214	2024-09-26 12:37:50.632951	{"Endpoints": ["BuyerTransaction"]}	mls_number
132	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This is the Unix timestamp representing the date that the agent initiated transaction discussions with the client.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this would be considered the date and time when the Agent first initiated transaction discussions with the client.", "BuyerTransaction": ["API", "Engage"]}	2024-09-25 23:32:20.338175	2024-09-26 12:37:50.632951	{"Endpoints": ["BuyerTransaction"]}	start_timestamp
134	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "If the commission for the transaction is based on a flat dollar amount, use this attribute.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this is the dollar amount of the total commission for the transaction.", "BuyerTransaction": ["API", "Engage"]}	2024-09-25 23:32:20.34152	2024-09-26 12:37:50.632951	{"Endpoints": ["BuyerTransaction"]}	commission_flat_fee
133	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "If the commission for the transaction is based on a percentage of the purchase amount, use this attribute. If no commission (either commission_percentage or commission_flat_fee) is supplied during creation, commission_percentage is set to the default commission_percentage for the associated Agent.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, the total commission for the transaction based on this percentage of the purchase price.", "BuyerTransaction": ["API", "Engage"]}	2024-09-25 23:32:20.339855	2024-09-26 12:37:50.632951	{"Endpoints": ["BuyerTransaction"]}	commission_percentage
138	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "The minimum price range for a property if using a price range rather than target price.", "BuyerTransaction": ["Engage"]}	2024-09-25 23:32:20.348073	2024-09-26 12:37:50.632951	{"Endpoints": ["BuyerTransaction"]}	min_price
139	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "The maximum price range for a property if using a price range rather than target price.", "BuyerTransaction": ["Engage"]}	2024-09-25 23:32:20.349765	2024-09-26 12:37:50.632951	{"Endpoints": ["BuyerTransaction"]}	max_price
144	{"BuyerTransaction": ["Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "A Unix timestamp. This should be null if the BuyerTransaction is not yet in complete state.", "Products": ["API", "Engage"], "EngageText": "For a Buyer Transaction, this represents the point in time when the transaction was completed.", "BuyerTransaction": ["API", "Engage"]}	2024-09-25 23:32:20.370612	2024-09-26 12:37:50.632951	{"Endpoints": ["BuyerTransaction"]}	closing_timestamp
141	{"BuyerTransaction": ["Create Response", "Update Request", "Update Response", "Show Request", "Show Response", "Index Response"]}	{"APIText": "This is the MoxiWorks Platform ID of the BuyerTransaction which you have created. This will be an RFC 4122 compliant UUID. This ID should be recorded on response as it is the key ID for updating the BuyerTransaction.", "Products": ["API"], "BuyerTransaction": ["API"]}	2024-09-25 23:32:20.353882	2024-09-26 12:37:50.632951	{"Endpoints": ["BuyerTransaction"]}	moxi_works_transaction_id
5	{"ActionLog": ["Create Request", "Create Response", "Index Request", "Index Response"], "BuyerTransaction": ["Create Request", "Create Response", "Update Response", "Show Response", "Index Request", "Index Response"]}	{"APIText": "This will be an RFC 4122 compliant UUID, and is the same as the moxi_works_contact_id attribute of the Contact response.", "Products": ["API", "ActionLog"], "ActionLog": ["API", "ActionLog"], "ActionLogText": "This is the MoxiWorks Platform ID of a Contact an ActionLog object is to be associated with. This data is required and must reference a valid MoxiWorks Contact ID for your ActionLog Create request to be accepted."}	2024-09-25 23:32:20.093372	2024-09-26 12:37:50.632951	{"Endpoints": ["ActionLog", "BuyerTransaction"]}	moxi_works_contact_id
6	{"ActionLog": ["Create Request", "Create Response", "Index Request", "Index Response"], "BuyerTransaction": ["Create Request", "Create Response", "Update Response", "Show Response", "Index Request", "Index Response"]}	{"APIText": "This is the unique identifer used in the system that will be connecting to the MoxiWorks platform.", "Products": ["API", "ActionLog"], "ActionLog": ["API", "ActionLog"], "ActionLogText": "This UUID will have already been associated with the Contact the ActionLog entry is created about. The Contact record on the MoxiWorks Platform can be created as necessary using Contact Create before attempting to use this contact ID to create an ActionLog entry. Failure to do so will result in the request being rejected."}	2024-09-25 23:32:20.095392	2024-09-26 12:37:50.632951	{"Endpoints": ["ActionLog", "BuyerTransaction"]}	partner_contact_id
1	{"Agent": ["Create Request"], "Brand": ["Index Request"], "ActionLog": ["Create Request", "Create Response", "Delete Request", "Index Request", "Index Response"], "BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Request", "Show Response", "Index Request", "Index Response"]}	{"Agent": ["API", "Roster"], "Brand": ["API", "Roster"], "APIText": "This will be an RFC 4122 compliant UUID. If data is being pulled from The MoxiWorks Platform and integrating with your own system in a managed or automated fashion, then using agent_uuid request attribute is preferable. It is guaranteed to be unique and to never change for the lifetime of the account.", "Products": ["API", "Roster"], "ActionLog": ["API", "Roster"], "RosterText": "Agent UUID, found on profile page within Roster/Client Manager and is the user account level UUID.", "BuyerTransaction": ["API", "Roster"]}	2024-09-25 23:32:20.085531	2024-09-26 12:37:50.632951	{"Endpoints": ["ActionLog", "Agent", "Brand", "BuyerTransaction"]}	agent_uuid
2	{"Agent": ["Create Request", "Create Response", "Index Response"], "Brand": ["Index Request"], "ActionLog": ["Create Request", "Create Response", "Delete Request", "Index Request", "Index Response"], "BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Request", "Show Response", "Index Request", "Index Response"]}	{"Agent": ["API", "Roster"], "Brand": ["API", "Roster"], "APIText": "If you have already existing agent data, agent accounts and your own user interface that agents can use to integrate your account with their MoxiWorks Platform account then you should use the moxi_works_agent_id request attribute. It is intended for use cases where integration is managed by end-user interaction.", "Products": ["API", "Roster"], "ActionLog": ["API", "Roster"], "RosterText": "This identifier is guaranteed to be unique, but may be either an alphanumeric string or an email address.", "BuyerTransaction": ["API", "Roster"]}	2024-09-25 23:32:20.087543	2024-09-26 12:37:50.632951	{"Endpoints": ["ActionLog", "Agent", "Brand", "BuyerTransaction"]}	moxi_works_agent_id
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.schema_migrations (version) FROM stdin;
20240811182658
20240811182703
20240811182710
20240811182730
20240811204211
20240922222835
20240922222858
20240922223024
20240923042938
20240923045436
20240924184330
20240924201823
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at) FROM stdin;
\.


--
-- Name: associated_attrs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.associated_attrs_id_seq', 392, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: associated_attrs associated_attrs_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.associated_attrs
    ADD CONSTRAINT associated_attrs_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- PostgreSQL database dump complete
--

