--
-- PostgreSQL database dump
--

-- Dumped from database version 15.7 (Homebrew)
-- Dumped by pg_dump version 15.7 (Homebrew)

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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: aaron
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO aaron;

--
-- Name: associated_attrs; Type: TABLE; Schema: public; Owner: aaron
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


ALTER TABLE public.associated_attrs OWNER TO aaron;

--
-- Name: associated_attrs_id_seq; Type: SEQUENCE; Schema: public; Owner: aaron
--

CREATE SEQUENCE public.associated_attrs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.associated_attrs_id_seq OWNER TO aaron;

--
-- Name: associated_attrs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aaron
--

ALTER SEQUENCE public.associated_attrs_id_seq OWNED BY public.associated_attrs.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: aaron
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO aaron;

--
-- Name: users; Type: TABLE; Schema: public; Owner: aaron
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


ALTER TABLE public.users OWNER TO aaron;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: aaron
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO aaron;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aaron
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: associated_attrs id; Type: DEFAULT; Schema: public; Owner: aaron
--

ALTER TABLE ONLY public.associated_attrs ALTER COLUMN id SET DEFAULT nextval('public.associated_attrs_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: aaron
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: aaron
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2024-09-27 02:03:04.085807	2024-09-27 02:03:04.085809
\.


--
-- Data for Name: associated_attrs; Type: TABLE DATA; Schema: public; Owner: aaron
--

COPY public.associated_attrs (id, request_type, ui_info, created_at, updated_at, associated_endpoints, attr_title) FROM stdin;
147	{}	{}	2024-09-27 02:03:07.176487	2024-09-27 02:03:07.176487	{}	numeric_id
148	{}	{}	2024-09-27 02:03:07.179229	2024-09-27 02:03:07.179229	{}	public_partner_attrs
149	{}	{}	2024-09-27 02:03:07.183245	2024-09-27 02:03:07.183245	{}	per_page
150	{}	{}	2024-09-27 02:03:07.185936	2024-09-27 02:03:07.185936	{}	show_paging_totals
151	{}	{}	2024-09-27 02:03:07.191143	2024-09-27 02:03:07.191143	{}	contact_name
152	{}	{}	2024-09-27 02:03:07.193651	2024-09-27 02:03:07.193651	{}	primary_phone_number
153	{}	{}	2024-09-27 02:03:07.195313	2024-09-27 02:03:07.195313	{}	secondary_phone_number
154	{}	{}	2024-09-27 02:03:07.197744	2024-09-27 02:03:07.197744	{}	moxi_works_lead_source_id
155	{}	{}	2024-09-27 02:03:07.199788	2024-09-27 02:03:07.199788	{}	original_lead_source
156	{}	{}	2024-09-27 02:03:07.201648	2024-09-27 02:03:07.201648	{}	gender
157	{}	{}	2024-09-27 02:03:07.20349	2024-09-27 02:03:07.20349	{}	label_name
158	{}	{}	2024-09-27 02:03:07.205566	2024-09-27 02:03:07.205566	{}	home_street_address
159	{}	{}	2024-09-27 02:03:07.207382	2024-09-27 02:03:07.207382	{}	home_city
160	{}	{}	2024-09-27 02:03:07.209091	2024-09-27 02:03:07.209091	{}	home_state
161	{}	{}	2024-09-27 02:03:07.210872	2024-09-27 02:03:07.210872	{}	home_zip
162	{}	{}	2024-09-27 02:03:07.212629	2024-09-27 02:03:07.212629	{}	home_country
163	{}	{}	2024-09-27 02:03:07.214406	2024-09-27 02:03:07.214406	{}	is_not_lead
164	{}	{}	2024-09-27 02:03:07.216254	2024-09-27 02:03:07.216254	{}	skip_agent_notification
165	{}	{}	2024-09-27 02:03:07.218025	2024-09-27 02:03:07.218025	{}	job_title
166	{}	{}	2024-09-27 02:03:07.219865	2024-09-27 02:03:07.219865	{}	occupation
167	{}	{}	2024-09-27 02:03:07.221565	2024-09-27 02:03:07.221565	{}	property_url
168	{}	{}	2024-09-27 02:03:07.223681	2024-09-27 02:03:07.223681	{}	property_mls_id
169	{}	{}	2024-09-27 02:03:07.225537	2024-09-27 02:03:07.225537	{}	property_street_address
170	{}	{}	2024-09-27 02:03:07.22748	2024-09-27 02:03:07.22748	{}	property_city
171	{}	{}	2024-09-27 02:03:07.229383	2024-09-27 02:03:07.229383	{}	property_state
172	{}	{}	2024-09-27 02:03:07.231301	2024-09-27 02:03:07.231301	{}	property_zip
173	{}	{}	2024-09-27 02:03:07.23303	2024-09-27 02:03:07.23303	{}	property_beds
174	{}	{}	2024-09-27 02:03:07.234843	2024-09-27 02:03:07.234843	{}	property_baths
175	{}	{}	2024-09-27 02:03:07.236616	2024-09-27 02:03:07.236616	{}	property_list_price
176	{}	{}	2024-09-27 02:03:07.238426	2024-09-27 02:03:07.238426	{}	property_listing_status
177	{}	{}	2024-09-27 02:03:07.240261	2024-09-27 02:03:07.240261	{}	property_photo_url
178	{}	{}	2024-09-27 02:03:07.242075	2024-09-27 02:03:07.242075	{}	search_city
179	{}	{}	2024-09-27 02:03:07.243929	2024-09-27 02:03:07.243929	{}	search_state
180	{}	{}	2024-09-27 02:03:07.245653	2024-09-27 02:03:07.245653	{}	search_zip
181	{}	{}	2024-09-27 02:03:07.247758	2024-09-27 02:03:07.247758	{}	search_min_baths
182	{}	{}	2024-09-27 02:03:07.249667	2024-09-27 02:03:07.249667	{}	search_min_beds
183	{}	{}	2024-09-27 02:03:07.251553	2024-09-27 02:03:07.251553	{}	search_min_price
184	{}	{}	2024-09-27 02:03:07.253406	2024-09-27 02:03:07.253406	{}	search_max_price
185	{}	{}	2024-09-27 02:03:07.255242	2024-09-27 02:03:07.255242	{}	search_min_sq_ft
186	{}	{}	2024-09-27 02:03:07.257066	2024-09-27 02:03:07.257066	{}	search_max_sq_ft
187	{}	{}	2024-09-27 02:03:07.258775	2024-09-27 02:03:07.258775	{}	search_min_lot_size
188	{}	{}	2024-09-27 02:03:07.260528	2024-09-27 02:03:07.260528	{}	search_max_lot_size
189	{}	{}	2024-09-27 02:03:07.262302	2024-09-27 02:03:07.262302	{}	search_min_year_built
190	{}	{}	2024-09-27 02:03:07.264099	2024-09-27 02:03:07.264099	{}	search_max_year_built
191	{}	{}	2024-09-27 02:03:07.265873	2024-09-27 02:03:07.265873	{}	search_property_types
192	{}	{}	2024-09-27 02:03:07.267694	2024-09-27 02:03:07.267694	{}	note
193	{}	{}	2024-09-27 02:03:07.269401	2024-09-27 02:03:07.269401	{}	websites
194	{}	{}	2024-09-27 02:03:07.271524	2024-09-27 02:03:07.271524	{}	birthday
195	{}	{}	2024-09-27 02:03:07.273433	2024-09-27 02:03:07.273433	{}	home_purchase_anniversaries
196	{}	{}	2024-09-27 02:03:07.275283	2024-09-27 02:03:07.275283	{}	company
197	{}	{}	2024-09-27 02:03:07.277152	2024-09-27 02:03:07.277152	{}	spouse_or_partner
198	{}	{}	2024-09-27 02:03:07.278951	2024-09-27 02:03:07.278951	{}	category_names
199	{}	{}	2024-09-27 02:03:07.282404	2024-09-27 02:03:07.282404	{}	is_deleted
200	{}	{}	2024-09-27 02:03:07.285859	2024-09-27 02:03:07.285859	{}	middle_name
201	{}	{}	2024-09-27 02:03:07.288062	2024-09-27 02:03:07.288062	{}	suffix
202	{}	{}	2024-09-27 02:03:07.29287	2024-09-27 02:03:07.29287	{}	phone_numbers
203	{}	{}	2024-09-27 02:03:07.298023	2024-09-27 02:03:07.298023	{}	is_new_contact
204	{}	{}	2024-09-27 02:03:07.300393	2024-09-27 02:03:07.300393	{}	anniversary
205	{}	{}	2024-09-27 02:03:07.302205	2024-09-27 02:03:07.302205	{}	home_purchase_anniversary
206	{}	{}	2024-09-27 02:03:07.303907	2024-09-27 02:03:07.303907	{}	social_media_profiles
207	{}	{}	2024-09-27 02:03:07.320193	2024-09-27 02:03:07.320193	{}	groups
208	{}	{}	2024-09-27 02:03:07.347718	2024-09-27 02:03:07.347718	{}	moxi_works_origin_lead_source_id
209	{}	{}	2024-09-27 02:03:07.398966	2024-09-27 02:03:07.398966	{}	email_address
210	{}	{}	2024-09-27 02:03:07.401048	2024-09-27 02:03:07.401048	{}	phone_number
211	{}	{}	2024-09-27 02:03:07.403829	2024-09-27 02:03:07.403829	{}	only_business_contacts
212	{}	{}	2024-09-27 02:03:07.406532	2024-09-27 02:03:07.406532	{}	total_pages
213	{}	{}	2024-09-27 02:03:07.408684	2024-09-27 02:03:07.408684	{}	contacts
214	{}	{}	2024-09-27 02:03:07.414306	2024-09-27 02:03:07.414306	{}	result
215	{}	{}	2024-09-27 02:03:07.419596	2024-09-27 02:03:07.419596	{}	subscription_type
216	{}	{}	2024-09-27 02:03:07.421736	2024-09-27 02:03:07.421736	{}	subscribed_at
217	{}	{}	2024-09-27 02:03:07.423557	2024-09-27 02:03:07.423557	{}	created_by
218	{}	{}	2024-09-27 02:03:07.425391	2024-09-27 02:03:07.425391	{}	area
219	{}	{}	2024-09-27 02:03:07.427181	2024-09-27 02:03:07.427181	{}	last_sent
220	{}	{}	2024-09-27 02:03:07.428955	2024-09-27 02:03:07.428955	{}	next_scheduled
221	{}	{}	2024-09-27 02:03:07.43115	2024-09-27 02:03:07.43115	{}	created_at
222	{}	{}	2024-09-27 02:03:07.433068	2024-09-27 02:03:07.433068	{}	unsubscribed_at
223	{}	{}	2024-09-27 02:03:07.434964	2024-09-27 02:03:07.434964	{}	unsubscribed_by
224	{}	{}	2024-09-27 02:03:07.436809	2024-09-27 02:03:07.436809	{}	listed
225	{}	{}	2024-09-27 02:03:07.43862	2024-09-27 02:03:07.43862	{}	sold
226	{}	{}	2024-09-27 02:03:07.440318	2024-09-27 02:03:07.440318	{}	zipcode
227	{}	{}	2024-09-27 02:03:07.442112	2024-09-27 02:03:07.442112	{}	nn_subscription_type
228	{}	{}	2024-09-27 02:03:07.444139	2024-09-27 02:03:07.444139	{}	nn_min_price
229	{}	{}	2024-09-27 02:03:07.445937	2024-09-27 02:03:07.445937	{}	nn_max_price
230	{}	{}	2024-09-27 02:03:07.447722	2024-09-27 02:03:07.447722	{}	nn_min_beds
231	{}	{}	2024-09-27 02:03:07.449517	2024-09-27 02:03:07.449517	{}	nn_max_beds
232	{}	{}	2024-09-27 02:03:07.451388	2024-09-27 02:03:07.451388	{}	nn_min_baths
233	{}	{}	2024-09-27 02:03:07.453105	2024-09-27 02:03:07.453105	{}	nn_min_sqft
234	{}	{}	2024-09-27 02:03:07.455264	2024-09-27 02:03:07.455264	{}	nn_max_sqft
235	{}	{}	2024-09-27 02:03:07.457203	2024-09-27 02:03:07.457203	{}	nn_property_type
236	{}	{}	2024-09-27 02:03:07.459309	2024-09-27 02:03:07.459309	{}	partner_event_id
237	{}	{}	2024-09-27 02:03:07.463125	2024-09-27 02:03:07.463125	{}	event_subject
238	{}	{}	2024-09-27 02:03:07.464841	2024-09-27 02:03:07.464841	{}	event_location
239	{}	{}	2024-09-27 02:03:07.466952	2024-09-27 02:03:07.466952	{}	send_reminder
240	{}	{}	2024-09-27 02:03:07.468646	2024-09-27 02:03:07.468646	{}	remind_minutes_before
241	{}	{}	2024-09-27 02:03:07.470379	2024-09-27 02:03:07.470379	{}	event_start
242	{}	{}	2024-09-27 02:03:07.472157	2024-09-27 02:03:07.472157	{}	event_end
243	{}	{}	2024-09-27 02:03:07.473952	2024-09-27 02:03:07.473952	{}	all_day
244	{}	{}	2024-09-27 02:03:07.475768	2024-09-27 02:03:07.475768	{}	attendees
245	{}	{}	2024-09-27 02:03:07.491989	2024-09-27 02:03:07.491989	{}	date_start
246	{}	{}	2024-09-27 02:03:07.493975	2024-09-27 02:03:07.493975	{}	date_end
247	{}	{}	2024-09-27 02:03:07.496622	2024-09-27 02:03:07.496622	{}	date
248	{}	{}	2024-09-27 02:03:07.49875	2024-09-27 02:03:07.49875	{}	events
249	{}	{}	2024-09-27 02:03:07.505724	2024-09-27 02:03:07.505724	{}	ListingID
250	{}	{}	2024-09-27 02:03:07.50745	2024-09-27 02:03:07.50745	{}	ListOfficeAOR
251	{}	{}	2024-09-27 02:03:07.509077	2024-09-27 02:03:07.509077	{}	ListingImages
252	{}	{}	2024-09-27 02:03:07.512267	2024-09-27 02:03:07.512267	{}	partner_group_id
253	{}	{}	2024-09-27 02:03:07.516394	2024-09-27 02:03:07.516394	{}	moxi_works_group_name
254	{}	{}	2024-09-27 02:03:07.518236	2024-09-27 02:03:07.518236	{}	moxi_works_group_id
255	{}	{}	2024-09-27 02:03:07.520246	2024-09-27 02:03:07.520246	{}	transient
256	{}	{}	2024-09-27 02:03:07.522461	2024-09-27 02:03:07.522461	{}	is_contact_removal
257	{}	{}	2024-09-27 02:03:07.52443	2024-09-27 02:03:07.52443	{}	updated_contacts
258	{}	{}	2024-09-27 02:03:07.542224	2024-09-27 02:03:07.542224	{}	is_partner_alias
259	{}	{}	2024-09-27 02:03:07.544346	2024-09-27 02:03:07.544346	{}	is_partner_default
260	{}	{}	2024-09-27 02:03:07.546354	2024-09-27 02:03:07.546354	{}	moxi_works_listing_id
261	{}	{}	2024-09-27 02:03:07.54889	2024-09-27 02:03:07.54889	{}	underscore_response
262	{}	{}	2024-09-27 02:03:07.550629	2024-09-27 02:03:07.550629	{}	LotSizeAcres
263	{}	{}	2024-09-27 02:03:07.552338	2024-09-27 02:03:07.552338	{}	BathroomsFull
264	{}	{}	2024-09-27 02:03:07.554044	2024-09-27 02:03:07.554044	{}	BathroomsHalf
265	{}	{}	2024-09-27 02:03:07.555811	2024-09-27 02:03:07.555811	{}	BathroomsOneQuarter
266	{}	{}	2024-09-27 02:03:07.55753	2024-09-27 02:03:07.55753	{}	BathroomsPartial
267	{}	{}	2024-09-27 02:03:07.559237	2024-09-27 02:03:07.559237	{}	BathroomsThreeQuarter
268	{}	{}	2024-09-27 02:03:07.561006	2024-09-27 02:03:07.561006	{}	BathroomsTotalInteger
269	{}	{}	2024-09-27 02:03:07.56282	2024-09-27 02:03:07.56282	{}	BathroomsTotal
270	{}	{}	2024-09-27 02:03:07.564998	2024-09-27 02:03:07.564998	{}	BedroomsTotal
271	{}	{}	2024-09-27 02:03:07.566912	2024-09-27 02:03:07.566912	{}	PublicTitle
272	{}	{}	2024-09-27 02:03:07.568812	2024-09-27 02:03:07.568812	{}	PublicRemarks
273	{}	{}	2024-09-27 02:03:07.570552	2024-09-27 02:03:07.570552	{}	ModificationTimestamp
274	{}	{}	2024-09-27 02:03:07.572451	2024-09-27 02:03:07.572451	{}	StatusChangeDate
275	{}	{}	2024-09-27 02:03:07.574293	2024-09-27 02:03:07.574293	{}	InternetAddressDisplayYN
276	{}	{}	2024-09-27 02:03:07.576096	2024-09-27 02:03:07.576096	{}	DaysOnMarket
277	{}	{}	2024-09-27 02:03:07.577975	2024-09-27 02:03:07.577975	{}	ListingContractDate
278	{}	{}	2024-09-27 02:03:07.579804	2024-09-27 02:03:07.579804	{}	CreatedDate
279	{}	{}	2024-09-27 02:03:07.581625	2024-09-27 02:03:07.581625	{}	ElementarySchool
280	{}	{}	2024-09-27 02:03:07.583423	2024-09-27 02:03:07.583423	{}	GarageSpaces
281	{}	{}	2024-09-27 02:03:07.585229	2024-09-27 02:03:07.585229	{}	WaterfrontYN
282	{}	{}	2024-09-27 02:03:07.587045	2024-09-27 02:03:07.587045	{}	HighSchool
283	{}	{}	2024-09-27 02:03:07.589214	2024-09-27 02:03:07.589214	{}	AssociationFee
284	{}	{}	2024-09-27 02:03:07.591163	2024-09-27 02:03:07.591163	{}	ListOfficeName
285	{}	{}	2024-09-27 02:03:07.593053	2024-09-27 02:03:07.593053	{}	ListPrice
286	{}	{}	2024-09-27 02:03:07.595457	2024-09-27 02:03:07.595457	{}	ListAgentFullName
287	{}	{}	2024-09-27 02:03:07.597316	2024-09-27 02:03:07.597316	{}	ListAgentUUID
288	{}	{}	2024-09-27 02:03:07.599071	2024-09-27 02:03:07.599071	{}	ListAgentOfficeID
289	{}	{}	2024-09-27 02:03:07.600863	2024-09-27 02:03:07.600863	{}	ListAgentMoxiWorksOfficeID
290	{}	{}	2024-09-27 02:03:07.602659	2024-09-27 02:03:07.602659	{}	SecondaryListAgentFullName
291	{}	{}	2024-09-27 02:03:07.60446	2024-09-27 02:03:07.60446	{}	SecondaryListAgentUUID
292	{}	{}	2024-09-27 02:03:07.606262	2024-09-27 02:03:07.606262	{}	SchoolDistrict
293	{}	{}	2024-09-27 02:03:07.608077	2024-09-27 02:03:07.608077	{}	Address
294	{}	{}	2024-09-27 02:03:07.60994	2024-09-27 02:03:07.60994	{}	Address2
295	{}	{}	2024-09-27 02:03:07.611659	2024-09-27 02:03:07.611659	{}	City
296	{}	{}	2024-09-27 02:03:07.61382	2024-09-27 02:03:07.61382	{}	CountyOrParish
297	{}	{}	2024-09-27 02:03:07.615724	2024-09-27 02:03:07.615724	{}	Latitude
298	{}	{}	2024-09-27 02:03:07.617838	2024-09-27 02:03:07.617838	{}	Longitude
299	{}	{}	2024-09-27 02:03:07.619724	2024-09-27 02:03:07.619724	{}	StateOrProvince
300	{}	{}	2024-09-27 02:03:07.621548	2024-09-27 02:03:07.621548	{}	PostalCode
301	{}	{}	2024-09-27 02:03:07.623363	2024-09-27 02:03:07.623363	{}	Community
302	{}	{}	2024-09-27 02:03:07.625073	2024-09-27 02:03:07.625073	{}	LotSizeSquareFeet
303	{}	{}	2024-09-27 02:03:07.626871	2024-09-27 02:03:07.626871	{}	InternetEntireListingDisplayYN
304	{}	{}	2024-09-27 02:03:07.628679	2024-09-27 02:03:07.628679	{}	MiddleOrJuniorSchool
305	{}	{}	2024-09-27 02:03:07.631061	2024-09-27 02:03:07.631061	{}	ListOfficeAORArea
306	{}	{}	2024-09-27 02:03:07.632833	2024-09-27 02:03:07.632833	{}	PoolYN
307	{}	{}	2024-09-27 02:03:07.634728	2024-09-27 02:03:07.634728	{}	PropertyType
308	{}	{}	2024-09-27 02:03:07.636887	2024-09-27 02:03:07.636887	{}	TaxAnnualAmount
309	{}	{}	2024-09-27 02:03:07.638812	2024-09-27 02:03:07.638812	{}	TaxYear
310	{}	{}	2024-09-27 02:03:07.640692	2024-09-27 02:03:07.640692	{}	SingleStory
311	{}	{}	2024-09-27 02:03:07.64241	2024-09-27 02:03:07.64241	{}	LivingArea
312	{}	{}	2024-09-27 02:03:07.64431	2024-09-27 02:03:07.64431	{}	ViewYN
313	{}	{}	2024-09-27 02:03:07.646136	2024-09-27 02:03:07.646136	{}	YearBuilt
314	{}	{}	2024-09-27 02:03:07.64794	2024-09-27 02:03:07.64794	{}	OnMarket
315	{}	{}	2024-09-27 02:03:07.649741	2024-09-27 02:03:07.649741	{}	Status
316	{}	{}	2024-09-27 02:03:07.651547	2024-09-27 02:03:07.651547	{}	MoxiWorksListingId
317	{}	{}	2024-09-27 02:03:07.653345	2024-09-27 02:03:07.653345	{}	AgentCreatedListing
318	{}	{}	2024-09-27 02:03:07.655147	2024-09-27 02:03:07.655147	{}	VirtualTourURL
319	{}	{}	2024-09-27 02:03:07.656964	2024-09-27 02:03:07.656964	{}	SharedPartnerData
320	{}	{}	2024-09-27 02:03:07.658793	2024-09-27 02:03:07.658793	{}	TaxParcelId
321	{}	{}	2024-09-27 02:03:07.660936	2024-09-27 02:03:07.660936	{}	ListingURL
322	{}	{}	2024-09-27 02:03:07.662867	2024-09-27 02:03:07.662867	{}	PropertyFeatures
323	{}	{}	2024-09-27 02:03:07.66475	2024-09-27 02:03:07.66475	{}	CompanyListingAttributes
324	{}	{}	2024-09-27 02:03:07.666673	2024-09-27 02:03:07.666673	{}	OpenHouse
325	{}	{}	2024-09-27 02:03:07.668419	2024-09-27 02:03:07.668419	{}	ImagesLastModified
326	{}	{}	2024-09-27 02:03:07.670722	2024-09-27 02:03:07.670722	{}	BuyerCommissionType
327	{}	{}	2024-09-27 02:03:07.67254	2024-09-27 02:03:07.67254	{}	BuyerCommissionValue
328	{}	{}	2024-09-27 02:03:07.713622	2024-09-27 02:03:07.713622	{}	last_moxi_works_listing_id
329	{}	{}	2024-09-27 02:03:07.715754	2024-09-27 02:03:07.715754	{}	shared_partner_data_updated_since
330	{}	{}	2024-09-27 02:03:07.717723	2024-09-27 02:03:07.717723	{}	market_status
331	{}	{}	2024-09-27 02:03:07.71965	2024-09-27 02:03:07.71965	{}	property_types
332	{}	{}	2024-09-27 02:03:07.721528	2024-09-27 02:03:07.721528	{}	only_agent_created
333	{}	{}	2024-09-27 02:03:07.723353	2024-09-27 02:03:07.723353	{}	coming_soon
334	{}	{}	2024-09-27 02:03:07.72606	2024-09-27 02:03:07.72606	{}	FinalPage
335	{}	{}	2024-09-27 02:03:07.727898	2024-09-27 02:03:07.727898	{}	Listings
336	{}	{}	2024-09-27 02:03:07.731069	2024-09-27 02:03:07.731069	{}	id
337	{}	{}	2024-09-27 02:03:07.733598	2024-09-27 02:03:07.733598	{}	common_name
338	{}	{}	2024-09-27 02:03:07.735466	2024-09-27 02:03:07.735466	{}	image_url
339	{}	{}	2024-09-27 02:03:07.738111	2024-09-27 02:03:07.738111	{}	address2
340	{}	{}	2024-09-27 02:03:07.74047	2024-09-27 02:03:07.74047	{}	county
341	{}	{}	2024-09-27 02:03:07.743383	2024-09-27 02:03:07.743383	{}	alt_phone
342	{}	{}	2024-09-27 02:03:07.745236	2024-09-27 02:03:07.745236	{}	email
343	{}	{}	2024-09-27 02:03:07.747867	2024-09-27 02:03:07.747867	{}	phone
344	{}	{}	2024-09-27 02:03:07.749699	2024-09-27 02:03:07.749699	{}	timezone
345	{}	{}	2024-09-27 02:03:07.751956	2024-09-27 02:03:07.751956	{}	office_website
346	{}	{}	2024-09-27 02:03:07.754131	2024-09-27 02:03:07.754131	{}	mailing_address
347	{}	{}	2024-09-27 02:03:07.755943	2024-09-27 02:03:07.755943	{}	mailing_address2
348	{}	{}	2024-09-27 02:03:07.757746	2024-09-27 02:03:07.757746	{}	mailing_city
349	{}	{}	2024-09-27 02:03:07.759593	2024-09-27 02:03:07.759593	{}	mailing_zip
350	{}	{}	2024-09-27 02:03:07.761752	2024-09-27 02:03:07.761752	{}	mailing_state
351	{}	{}	2024-09-27 02:03:07.765098	2024-09-27 02:03:07.765098	{}	logo_url
352	{}	{}	2024-09-27 02:03:07.770379	2024-09-27 02:03:07.770379	{}	offices
353	{}	{}	2024-09-27 02:03:07.774373	2024-09-27 02:03:07.774373	{}	created_after
354	{}	{}	2024-09-27 02:03:07.776163	2024-09-27 02:03:07.776163	{}	created_before
355	{}	{}	2024-09-27 02:03:07.777851	2024-09-27 02:03:07.777851	{}	updated_after
356	{}	{}	2024-09-27 02:03:07.779583	2024-09-27 02:03:07.779583	{}	updated_before
357	{}	{}	2024-09-27 02:03:07.781854	2024-09-27 02:03:07.781854	{}	include_times
358	{}	{}	2024-09-27 02:03:07.783637	2024-09-27 02:03:07.783637	{}	type
359	{}	{}	2024-09-27 02:03:07.786951	2024-09-27 02:03:07.786951	{}	presentations
360	{}	{}	2024-09-27 02:03:07.823034	2024-09-27 02:03:07.823034	{}	SoldDate
361	{}	{}	2024-09-27 02:03:07.825074	2024-09-27 02:03:07.825074	{}	SoldPrice
362	{}	{}	2024-09-27 02:03:07.826982	2024-09-27 02:03:07.826982	{}	BuyerAgentFullName
363	{}	{}	2024-09-27 02:03:07.828764	2024-09-27 02:03:07.828764	{}	BuyerAgentUUID
364	{}	{}	2024-09-27 02:03:07.830603	2024-09-27 02:03:07.830603	{}	BuyerAgentOfficeName
365	{}	{}	2024-09-27 02:03:07.832419	2024-09-27 02:03:07.832419	{}	BuyerAgentOfficeID
366	{}	{}	2024-09-27 02:03:07.834292	2024-09-27 02:03:07.834292	{}	BuyerAgentMoxiWorksOfficeID
367	{}	{}	2024-09-27 02:03:07.837271	2024-09-27 02:03:07.837271	{}	sold_since
368	{}	{}	2024-09-27 02:03:07.839428	2024-09-27 02:03:07.839428	{}	sold_before
369	{}	{}	2024-09-27 02:03:07.8435	2024-09-27 02:03:07.8435	{}	include_buyer_listings
370	{}	{}	2024-09-27 02:03:07.848164	2024-09-27 02:03:07.848164	{}	partner_task_id
371	{}	{}	2024-09-27 02:03:07.850649	2024-09-27 02:03:07.850649	{}	due_at
372	{}	{}	2024-09-27 02:03:07.853153	2024-09-27 02:03:07.853153	{}	duration
373	{}	{}	2024-09-27 02:03:07.854937	2024-09-27 02:03:07.854937	{}	description
374	{}	{}	2024-09-27 02:03:07.860726	2024-09-27 02:03:07.860726	{}	completed_at
375	{}	{}	2024-09-27 02:03:07.877207	2024-09-27 02:03:07.877207	{}	due_date_start
376	{}	{}	2024-09-27 02:03:07.879219	2024-09-27 02:03:07.879219	{}	due_date_end
377	{}	{}	2024-09-27 02:03:07.882935	2024-09-27 02:03:07.882935	{}	tasks
378	{}	{}	2024-09-27 02:03:07.885057	2024-09-27 02:03:07.885057	{}	moxi_works_team_id
379	{}	{}	2024-09-27 02:03:07.889202	2024-09-27 02:03:07.889202	{}	address1
380	{}	{}	2024-09-27 02:03:07.893171	2024-09-27 02:03:07.893171	{}	fax
381	{}	{}	2024-09-27 02:03:07.895391	2024-09-27 02:03:07.895391	{}	photo_url
382	{}	{}	2024-09-27 02:03:07.898295	2024-09-27 02:03:07.898295	{}	alt_email
383	{}	{}	2024-09-27 02:03:07.900125	2024-09-27 02:03:07.900125	{}	website_url
384	{}	{}	2024-09-27 02:03:07.901895	2024-09-27 02:03:07.901895	{}	active
385	{}	{}	2024-09-27 02:03:07.915735	2024-09-27 02:03:07.915735	{}	has_agent_association
386	{}	{}	2024-09-27 02:03:07.917522	2024-09-27 02:03:07.917522	{}	has_web_data
387	{}	{}	2024-09-27 02:03:07.919201	2024-09-27 02:03:07.919201	{}	has_favorites
388	{}	{}	2024-09-27 02:03:07.921022	2024-09-27 02:03:07.921022	{}	has_searches
389	{}	{}	2024-09-27 02:03:07.9244	2024-09-27 02:03:07.9244	{}	moxi_works_user_id
390	{}	{}	2024-09-27 02:03:07.927577	2024-09-27 02:03:07.927577	{}	associated_agent_uuid
391	{}	{}	2024-09-27 02:03:07.929417	2024-09-27 02:03:07.929417	{}	favorite_listing_ids
392	{}	{}	2024-09-27 02:03:07.931653	2024-09-27 02:03:07.931653	{}	saved_searches
4	{"ActionLog": ["Create Request", "Create Response"]}	{"APIText": "To include access level information for the agent in the response, pass true", "Products": ["API", "Roster"], "ActionLog": ["API", "Roster"], "RosterText": "The access level of the agent. This can return one of the possible access levels, as seen within the products and permissions page."}	2024-09-27 02:03:06.79129	2024-09-26 19:03:38.677899	{"Endpoints": ["ActionLog"]}	body
10	{"ActionLog": ["Create Request", "Create Response"]}	{"Products": ["ActionLog"], "ActionLog": ["ActionLog"], "ActionLogText": "This is the human readable plain-text string which will be presented to the Agent as the heading of the ActionLog entry. This can be any short, descriptive sentence which would be practical for the agent to see in the history of events associated with a Contact."}	2024-09-27 02:03:06.802251	2024-09-26 19:03:38.677899	{"Endpoints": ["ActionLog"]}	agent_action
11	{"ActionLog": ["Create Request", "Create Response"]}	{"Products": ["ActionLog"], "ActionLog": ["ActionLog"], "ActionLogText": "If creating an agent_action that has a location component (‘inperson’ ‘other’) use this field to denote the street address of the agent_action."}	2024-09-27 02:03:06.804005	2024-09-26 19:03:38.677899	{"Endpoints": ["ActionLog"]}	agent_action_address
12	{"ActionLog": ["Create Request", "Create Response"]}	{"Products": ["ActionLog"], "ActionLog": ["ActionLog"], "ActionLogText": "If creating an agent_action that has a location component (‘inperson’ ‘other’) use this field to denote the additonal street address info of the agent_action."}	2024-09-27 02:03:06.805749	2024-09-26 19:03:38.677899	{"Endpoints": ["ActionLog"]}	agent_action_address2
13	{"ActionLog": ["Create Request", "Create Response"]}	{"Products": ["ActionLog"], "ActionLog": ["ActionLog"], "ActionLogText": "If creating an agent_action that has a location component (‘inperson’ ‘other’) use this field to denote the city or locale of the agent_action."}	2024-09-27 02:03:06.808456	2024-09-26 19:03:38.677899	{"Endpoints": ["ActionLog"]}	agent_action_city
14	{"ActionLog": ["Create Request", "Create Response"]}	{"Products": ["ActionLog"], "ActionLog": ["ActionLog"], "ActionLogText": "If creating an agent_action that has a location component (‘inperson’ ‘other’) use this field to denote the state or province related info of the agent_action."}	2024-09-27 02:03:06.810462	2024-09-26 19:03:38.677899	{"Endpoints": ["ActionLog"]}	agent_action_state
15	{"ActionLog": ["Create Request", "Create Response"]}	{"Products": ["ActionLog"], "ActionLog": ["ActionLog"], "ActionLogText": "If creating an agent_action that has a location component (‘inperson’ ‘other’) use this field to denote the postal code of the agent_action."}	2024-09-27 02:03:06.812377	2024-09-26 19:03:38.677899	{"Endpoints": ["ActionLog"]}	agent_action_zip
16	{"ActionLog": ["Create Response"]}	{"APIText": "This is the Unix timestamp for the creation time of the ActionLog entry.", "Products": ["API"], "ActionLog": ["API"]}	2024-09-27 02:03:06.8164	2024-09-26 19:03:38.677899	{"Endpoints": ["ActionLog"]}	timestamp
17	{"ActionLog": ["Delete Request"]}	{"APIText": "This is the MoxiWorks Platform ID of the ActionLog entry to be deleted. This will be an RFC 4122 compliant UUID.", "Products": ["API"], "ActionLog": ["API"]}	2024-09-27 02:03:06.821059	2024-09-26 19:03:38.677899	{"Endpoints": ["ActionLog"]}	moxi_works_action_log_id
18	{"ActionLog": ["Delete Response"]}	{"APIText": "This will indicate what the status of the request is.", "Products": ["API"], "ActionLog": ["API"]}	2024-09-27 02:03:06.824904	2024-09-26 19:03:38.677899	{"Endpoints": ["ActionLog"]}	status
19	{"ActionLog": ["Delete Response"]}	{"APIText": "This will indicate whether the delete request was successful or not.", "Products": ["API"], "ActionLog": ["API"]}	2024-09-27 02:03:06.82707	2024-09-26 19:03:38.677899	{"Endpoints": ["ActionLog"]}	deleted
20	{"ActionLog": ["Delete Response"]}	{"APIText": "This is an arrray of strings. Any messages associated with the delete request status will be contained in this array.", "Products": ["API"], "ActionLog": ["API"]}	2024-09-27 02:03:06.829048	2024-09-26 19:03:38.677899	{"Endpoints": ["ActionLog"]}	messages
3	{"Agent": ["Create Request"], "Brand": ["Index Request"], "ActionLog": ["Create Request", "Delete Request", "Index Request"], "BuyerTransaction": ["Create Request", "Update Request", "Show Request", "Index Request"]}	{"Agent": ["API"], "Brand": ["API"], "APIText": "If you have access to agent data from the same company source that MoxiWorks uses as an upstream data source then you should use the source_agent_id request attribute. This identifier will be unique only within the scope of a given company or parent_company, and must be used in conjunction with the moxi_works_company_id or parent_company_id request attributes. Please email partners@moxiworks.com for clarification about this request attribute.", "Products": ["API"], "ActionLog": ["API"]}	2024-09-27 02:03:06.789292	2024-09-26 19:04:02.701932	{"Endpoints": ["ActionLog", "Agent", "Brand", "BuyerTransaction"]}	source_agent_id
21	{"ActionLog": ["Index Request"]}	{"APIText": "Only ActionLog records created later than this Unix timestamp will be included in the query. The upper bound of the time slice will be the 90 days higher than date_min value or the value of the the date_max; whichever is lower. If no timestamps are provided, ActionLogs from the last 90 days will be retrieved. The maximum timeframe for data is 90 days. date_min and date_max should be set in 90 day increments to retrieve the data from a specific historical point.", "Products": ["API"], "ActionLog": ["API"]}	2024-09-27 02:03:06.834122	2024-09-26 19:03:38.677899	{"Endpoints": ["ActionLog"]}	date_min
22	{"ActionLog": ["Index Request"]}	{"APIText": "Only ActionLog records created earlier than this Unix timestamp will be included in the query. Should be no higher than 90 days past the date_min attribute if it is provided. The maximum timeframe for data is 90 days. date_min and date_max should be set in 90 day increments to retrieve the data from a specific historical point.", "Products": ["API"], "ActionLog": ["API"]}	2024-09-27 02:03:06.835998	2024-09-26 19:03:38.677899	{"Endpoints": ["ActionLog"]}	date_max
23	{"ActionLog": ["Index Response"]}	{"APIText": "This is an Array containing any ActionLog entries found for the Index request - [moxi_works_action_log_id, type, timestamp, log_data].", "Products": ["API"], "ActionLog": ["API"]}	2024-09-27 02:03:06.839437	2024-09-26 19:03:38.677899	{"Endpoints": ["ActionLog"]}	actions
25	{"Agent": ["Create Request"]}	{"Agent": ["API", "Engage"], "APIText": "Whether to include agent’s GCI goals and commissions data in the response data.", "Products": ["API", "Engage"], "EngageText": "This represents the Gross Commission Income goal, as seen throughout the Engage UI."}	2024-09-27 02:03:06.845272	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent", "Agent"]}	include_gci_goals
78	{"Agent": ["Create Response"]}	{"Agent": ["Engage"], "Products": ["Engage"], "EngageText": "This is the agent’s Gross Commission Income goal, as seen throughout the Engage UI."}	2024-09-27 02:03:06.941601	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	gci_goal
79	{"Agent": ["Create Response"]}	{"Agent": ["Roster"], "Products": ["Roster"], "RosterText": "Percentage commission rate for the agent when acting as a buyer’s agent."}	2024-09-27 02:03:06.943366	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	buyer_commission_rate
80	{"Agent": ["Create Response"]}	{"Agent": ["Roster"], "Products": ["Roster"], "RosterText": "Percentage commission rate for the agent when acting as a seller’s agent."}	2024-09-27 02:03:06.94519	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	seller_commission_rate
27	{"Agent": ["Create Request", "Index Request"]}	{"Agent": ["API", "Roster"], "APIText": "To include ratings and reviews associated with the agent in the response, pass true.", "Products": ["API", "Roster"], "RosterText": "Referencing external agent reviews from platforms such as Zillow and Testimonial Tree."}	2024-09-27 02:03:06.848594	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	include_reviews
72	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This will be null. Deprecated.", "Products": ["API"]}	2024-09-27 02:03:06.931086	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	google_plus
24	{"Agent": ["Create Request", "Index Request"]}	{"Agent": ["API", "Roster"], "APIText": "To include access level information for the agent in the response, pass true.", "Products": ["API", "Roster"], "RosterText": "The access level of the agent. This can return one of the possible access levels, as seen within the products and permissions page."}	2024-09-27 02:03:06.843565	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent", "Agent"]}	include_access_level
26	{"Agent": ["Create Request", "Index Request"]}	{"Agent": ["API"], "APIText": "To include affiliate data associated with the agent in the response, pass true.", "Products": ["API"]}	2024-09-27 02:03:06.846915	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	include_partners
92	{"Agent": ["Index Request"]}	{"Agent": ["API"], "APIText": "Any Agent objects updated after this Unix timestamp will be returned in the response. If no updated_since parameter is included in the request, by default only Agent objects updated in the last seven days will be returned.", "Products": ["API"]}	2024-09-27 02:03:06.968982	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	updated_since
94	{"Agent": ["Index Request"]}	{"Agent": ["API"], "APIText": "To find Agent accounts deactivated within the specified timeframe, pass true for this boolean parameter.", "Products": ["API"]}	2024-09-27 02:03:06.97339	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	deactivated
96	{"Agent": ["Index Request"]}	{"Agent": ["API"], "APIText": "To include company specific programs associated with the agent in the response, pass true.", "Products": ["API"]}	2024-09-27 02:03:06.977628	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	include_company_programs
98	{"Agent": ["Index Request"]}	{"Agent": ["API"], "APIText": "To include only Agent objects associated with company specific programs pass true.", "Products": ["API"]}	2024-09-27 02:03:06.981291	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	has_company_programs
100	{"Agent": ["Index Request"]}	{"Agent": ["API", "Roster"], "APIText": "To include bio associated with the agent in the response, pass true.", "Products": ["API", "Roster"], "RosterText": "This references the bio of the agent, as seen on the about me > web info page."}	2024-09-27 02:03:06.985213	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	include_bio
97	{"Agent": ["Index Request"]}	{"Agent": ["API", "Websites"], "APIText": "To include the base url (website_base_url) of the agent’s MoxiWorks website pass true.", "Products": ["API", "Websites"], "WebsitesText": "This references the website url for the agent."}	2024-09-27 02:03:06.979516	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	include_website
95	{"Agent": ["Index Request"]}	{"Agent": ["API"], "APIText": "Any Agent objects deactivated after this Unix timestamp will be returned in the response. If no deactivated_since parameter is included in the request, only Agent objects deactivated in the last seven days will be returned.", "Products": ["API"]}	2024-09-27 02:03:06.975344	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	deactivated_since
51	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "The last name of the agent."}	2024-09-27 02:03:06.892248	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	last_name
52	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "The nickname of the agent."}	2024-09-27 02:03:06.894186	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	nickname
53	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "This is the agent’s main phone number. This number should be considered the number the agent would like to be contacted by."}	2024-09-27 02:03:06.895933	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	main_phone_number
54	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Mobile phone number of the agent. main_phone_number should be considered higher priority, if not the same."}	2024-09-27 02:03:06.89772	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	mobile_phone_number
28	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the ID of the Agent, as utilized by their brokerage or company.", "Products": ["API"]}	2024-09-27 02:03:06.850707	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	client_agent_id
50	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "The first name of the agent."}	2024-09-27 02:03:06.890464	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	first_name
93	{"Agent": ["Index Request"], "BuyerTransaction": ["Index Request"]}	{"Agent": ["API"], "APIText": "For queries with multi-page responses, use the page_number parameter to return data for specific pages. Data for page 1 is returned if this parameter is not included. Use this parameter if total_pages indicates that there is more than one page of data available.", "Products": ["API"]}	2024-09-27 02:03:06.970873	2024-09-26 19:04:02.701932	{"Endpoints": ["Agent"]}	page_number
99	{"Agent": ["Index Request"], "BuyerTransaction": ["Index Request"]}	{"Agent": ["API"], "APIText": "If supplied then the results will exclude all data except primary identifiers and a unix timestamp (last_updated) & iso8601 timestamp (modification_timestamp) of the last time this record was updated.", "Products": ["API"]}	2024-09-27 02:03:06.983461	2024-09-26 19:04:02.701932	{"Endpoints": ["Agent"]}	timestamps_only
29	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is the ID of the Agent utilized by their primary MLS. This ID allows listings to associate with the User Account.", "Products": ["API", "Roster"], "RosterText": "This ID can be found on the Manage MLS Associations page of the Agent or other User Account."}	2024-09-27 02:03:06.852522	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	mls_agent_id
30	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the number of the license granted to the agent. Please see mls_agent_id for the Agent MLS ID value.", "Products": ["API"]}	2024-09-27 02:03:06.854213	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	license
31	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is the name of the primary MLS for the agent.", "Products": ["API", "Roster"], "RosterText": "This name can be found on the Manage MLS Associations page of the Agent or other User Account."}	2024-09-27 02:03:06.856351	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	mls_name
32	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the standard abbreviation of the primary MLS utilized by the agent.", "Products": ["API"]}	2024-09-27 02:03:06.85825	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	mls_abbreviation
33	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the ID of this Agent. This will be an integer.", "Products": ["API"]}	2024-09-27 02:03:06.860092	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	agent_id
36	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the ID of the office for this Agent. This will be an integer.", "Products": ["API"]}	2024-09-27 02:03:06.865407	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	client_office_id
37	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the ID of the company for this Agent. This will be an integer.", "Products": ["API"]}	2024-09-27 02:03:06.867136	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	company_id
38	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the ID of the Company utilized by their brokerage or company.", "Products": ["API"]}	2024-09-27 02:03:06.868867	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	client_company_id
39	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is the main associated physical street address where the office is located. It can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Displays under the associated office page."}	2024-09-27 02:03:06.870545	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	office_address_street
40	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is the main associated secondary physical street address field, often populated with a suite or office number. This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Displays under the associated office page."}	2024-09-27 02:03:06.872259	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	office_address_street2
41	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "The city where the office is located, as associated with the physical address. This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Displays under the associated office page."}	2024-09-27 02:03:06.874035	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	office_address_city
42	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "The state where the office is located, as associated with the physical address. This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Displays under the associated office page."}	2024-09-27 02:03:06.875827	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	office_address_state
43	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "The postal code associated with the office physical address. This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Displays under the associated office page."}	2024-09-27 02:03:06.877926	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	office_address_zip
44	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the associated mailing address where the office is located. It can be null if there is no data for this attribute.", "Products": ["API"]}	2024-09-27 02:03:06.879575	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	office_mailing_address_street
45	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the associated secondary mailing street address field, often populated with a suite or office number. This can be null if there is no data for this attribute.", "Products": ["API"]}	2024-09-27 02:03:06.881494	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	office_mailing_address_street2
46	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "The city where the office receives mail, as associated with the mailing address. This can be null if there is no data for this attribute.", "Products": ["API"]}	2024-09-27 02:03:06.883375	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	office_mailing_address_city
47	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "The state where the office receives mail, as associated with the mailing address. This can be null if there is no data for this attribute.", "Products": ["API"]}	2024-09-27 02:03:06.885217	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	office_mailing_address_state
48	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "The postal code associated with the office mailing address. This can be null if there is no data for this attribute.", "Products": ["API"]}	2024-09-27 02:03:06.886973	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	office_mailing_address_zip
55	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Alternate phone number for the agent. This should be considered second in priority to main_phone_number."}	2024-09-27 02:03:06.899504	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	alt_phone_number
56	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "This is the agent’s fax phone number."}	2024-09-27 02:03:06.901587	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	fax_phone_number
57	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "This is the agent’s office phone number."}	2024-09-27 02:03:06.90345	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	office_phone_number
58	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "This is the agent’s main email address. This email address should be considered the email address the agent would prefer to be contacted by."}	2024-09-27 02:03:06.905141	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	primary_email_address
59	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "This is the agent’s alternate email address. This email address should be considered the email address the agent would want to be contacted by only if the address in primary_email_address is not functional."}	2024-09-27 02:03:06.906993	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	secondary_email_address
61	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Engage"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Engage"], "EngageText": "This is the agent’s lead routing email address. This can be null if there is no data for this attribute."}	2024-09-27 02:03:06.910615	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	lead_routing_email_address
7	{"Agent": ["Create Response", "Index Response"], "ActionLog": ["Create Request", "Create Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "ActionLog", "Roster"], "ActionLog": ["ActionLog"], "RosterText": "This is the business title of the agent.", "ActionLogText": "This is the human readable plain-text string which will be presented to the Agent as the heading of the ActionLog entry. This can be any short, descriptive sentence which would be practical for the agent to see in the history of events associated with a Contact."}	2024-09-27 02:03:06.796958	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	title
62	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "Array of key/value pairs. Each has a body and header, both strings, which can be null or blank.", "Products": ["API", "Roster"], "RosterText": "This is the bio of the agent, as seen on the about me > web info page."}	2024-09-27 02:03:06.912761	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	bio
63	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is a string that contains the agent’s designation(s), if any. This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": ""}	2024-09-27 02:03:06.914514	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	designations
64	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is an RFC 4122 compliant UUID. This UUID can be used as a unique identifier in determining associations between Agent objects and Listing objects.", "Products": ["API", "Roster"], "RosterText": "Displays within the about me section."}	2024-09-27 02:03:06.916249	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	uuid
65	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "Indicates whether the agent has access to MoxiWorks Products.", "Products": ["API", "Roster"], "RosterText": "Referring to each individual Moxi product offered, such as Engage, Present, Impress etc."}	2024-09-27 02:03:06.917971	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	has_product_access
66	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Engage"], "APIText": "Indicates whether the agent has access to MoxiWorks Engage Product.", "Products": ["API", "Engage"], "EngageText": "Referencing the agent’s ability to access Engage as a product."}	2024-09-27 02:03:06.919752	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	has_engage_access
67	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "If include_access_level was passed as true, this can return one of the possible access levels.", "Products": ["API", "Roster"], "RosterText": "Related to the products and permissions page, specific to user account permissions section."}	2024-09-27 02:03:06.921552	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	access_level
68	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This will return one of the possible view levels.", "Products": ["API", "Roster"], "RosterText": "The view level of the agent."}	2024-09-27 02:03:06.923405	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	view_level
69	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "The teams array contains Dictionary objects representing Team entries. These include [name, uuid, member_category].", "Products": ["API", "Roster"], "RosterText": "Related to Agent Teams, within My Account section."}	2024-09-27 02:03:06.925521	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	teams
70	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["Roster", "Websites"], "Products": ["Roster", "Websites"], "RosterText": "Seen within About Me > Web Info.", "WebsitesText": "The base url of the agent’s MoxiWorks agent website."}	2024-09-27 02:03:06.927401	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	website_base_url
71	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data available for this attribute.", "Products": ["API", "Roster"], "RosterText": "Agent’s Twitter URL. Seen within About Me > Web Info."}	2024-09-27 02:03:06.929275	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	twitter
73	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data available for this attribute.", "Products": ["API", "Roster"], "RosterText": "Agent’s Facebook page url. Seen within About Me > Web Info."}	2024-09-27 02:03:06.932835	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	facebook
74	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Websites"], "APIText": "You’ll need to prefix the domain with protocol if using this attribute for an href. This can be null if there is no data available for this attribute.", "Products": ["API", "Websites"], "WebsitesText": "Agent’s website domain. This will be returned without the HTTP(S) prefix."}	2024-09-27 02:03:06.934644	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	home_page
75	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is a valid URL for a larger size image for the agent. If no agent image has been uploaded for this agent a default image url will be provided.", "Products": ["API", "Roster"], "RosterText": "Agent’s associated profile image within About Me section."}	2024-09-27 02:03:06.936321	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	profile_image_url
76	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is a valid URL for a thumbnail size image for the agent. If no agent image has been uploaded for this agent a default image url will be provided.", "Products": ["API", "Roster"], "RosterText": "Agent’s associated profile image within About Me section, thumbnail."}	2024-09-27 02:03:06.938062	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	profile_thumb_url
77	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "The region the agent’s office is in."}	2024-09-27 02:03:06.939818	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	region
81	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["Engage"], "Products": ["Engage"], "EngageText": "A list of the lead service area zip codes covered by the agent."}	2024-09-27 02:03:06.946856	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	service_area_zip_codes
82	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["Websites"], "Products": ["Websites"], "WebsitesText": "This includes the base_url and bio_page_slug of the agent MoxiWorks website."}	2024-09-27 02:03:06.948928	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	agent_website
83	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "The alternate_offices array contains Dictionary objects representing AlternateOffice entries. These include [moxi_works_office_id, office_id, office_address_street, office_address_street2, office_address_city, office_address_state, office_address_zip, office_phone_number].", "Products": ["API", "Roster"], "RosterText": "Agent’s alternate offices, as seen within the additional offices page."}	2024-09-27 02:03:06.951473	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	alternate_offices
84	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "The available_mls Array contains Dictionary objects representing MLS entries. These include [name, display_name, mls_abbreviation, agent_id].", "Products": ["API", "Roster"], "RosterText": "Agent’s alternate offices, as seen within the additional offices page."}	2024-09-27 02:03:06.95338	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	available_mls
85	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "Existence of objects in the partners data structure is dependent upon external relationships existing between the agent represented by this Agent and the affiliate. Documented entities in the `partners` data structure may or may not be returned based on agent relationship. Your logic should be engineered to handle cases where the entity you are interested in is returned and where an empty data structure is returned.", "Products": ["API"]}	2024-09-27 02:03:06.955253	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	partners
86	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "A list of the company specific program names in which the agent participates or is a member.", "Products": ["API"]}	2024-09-27 02:03:06.957016	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	company_programs
87	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "A list of the source-specific user identifiers.", "Products": ["API"]}	2024-09-27 02:03:06.958784	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	source_metadata
88	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the Unix timestamp representing the date that this Agent was created in the MoxiWorks system.", "Products": ["API"]}	2024-09-27 02:03:06.960669	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	created_timestamp
90	{"Agent": ["Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "True corresponds to Yes (visible online); false corresponds to No (not visible online).", "Products": ["API", "Roster"], "RosterText": "Indicates the “Profile Visible Online” value for this Agent."}	2024-09-27 02:03:06.964258	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	profile_visible_online
91	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "Existence of objects in the user_reviews data structure is dependent upon external sources, i.e. Zillow, Testimonial Tree. Documented entities in the `user_reviews` data structure may or may not be returned when `include_reviews=true` is passed. Your logic should be engineered to handle cases where the entity you are interested in is returned and where an empty data structure is returned. Included in this - [source_name, agg_rating, reviews_count]", "Products": ["API", "Roster"], "RosterText": "External agent reviews from platforms such as Zillow and Testimonial Tree."}	2024-09-27 02:03:06.966013	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	user_reviews
60	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "The email_addresses Hash is a Dictionary object holding the email addresses associated with the Agent record. These include [primary, display, alternate, moxi_sync, lead_routing, zillow].", "Products": ["API", "Roster"], "RosterText": "Some of these will display on the About Me section, including primary, display, moxi sync."}	2024-09-27 02:03:06.908856	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	email_addresses
89	{"Agent": ["Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is the Unix timestamp representing the date that this Agent was deactivated in the MoxiWorks system. This will be returned null if the agent is still active.This is the Unix timestamp representing the date that this Agent was deactivated in the MoxiWorks system. This will be returned null if the agent is still active.", "Products": ["API", "Roster"], "RosterText": "Will display within Account Info section if user account is deactivated."}	2024-09-27 02:03:06.962502	2024-09-26 19:03:46.7228	{"Endpoints": ["Agent"]}	deactivated_timestamp
101	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Present"], "Products": ["Present"], "PresentText": "This is the logo associated with the Brokerage or Company."}	2024-09-27 02:03:07.014913	2024-09-26 19:03:53.733305	{"Endpoints": ["Brand"]}	image_logo
35	{"Agent": ["Create Response", "Index Response"], "Brand": ["Index Request"]}	{"Agent": ["API"], "Brand": ["API", "Roster"], "APIText": "This is the ID of the office for this Agent. This will be an integer.", "Products": ["API"]}	2024-09-27 02:03:06.863681	2024-09-26 19:03:53.733305	{"Endpoints": ["Agent", "Brand"]}	office_id
34	{"Agent": ["Create Response", "Index Request", "Index Response"], "Brand": ["Index Request"]}	{"Agent": ["API", "Roster"], "Brand": ["API", "Roster"], "APIText": "This will be an RFC 4122 compliant UUID.", "Products": ["API", "Roster"], "RosterText": "This is the MoxiWorks Platform ID of the office for this Agent."}	2024-09-27 02:03:06.861939	2024-09-26 19:03:53.733305	{"Endpoints": ["Agent", "Brand"]}	moxi_works_office_id
102	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "Accent color.", "Products": ["API", "Present"], "PresentText": "Within a Presentation, this will be the accent color."}	2024-09-27 02:03:07.016717	2024-09-26 19:03:53.733305	{"Endpoints": ["Brand"]}	cma_authoring_color
103	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Present"], "Products": ["Present"], "PresentText": "Within a Presentation, this will be the background color of a page."}	2024-09-27 02:03:07.01843	2024-09-26 19:03:53.733305	{"Endpoints": ["Brand"]}	background_color
104	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Present"], "Products": ["Present"], "PresentText": "Within a Presentation, this is the font color intended to overlay the background_color attribute."}	2024-09-27 02:03:07.02057	2024-09-26 19:03:53.733305	{"Endpoints": ["Brand"]}	background_font_color_primary
105	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Present"], "Products": ["Present"], "PresentText": "Within a Presentation, this is the background color of associated buttons."}	2024-09-27 02:03:07.022446	2024-09-26 19:03:53.733305	{"Endpoints": ["Brand"]}	button_background_color
106	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Present"], "Products": ["Present"], "PresentText": "Within a Presentation, this is the font color intended to overlay the button_background_color attribute."}	2024-09-27 02:03:07.0243	2024-09-26 19:03:53.733305	{"Endpoints": ["Brand"]}	button_font_color
107	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "This attribute may contain embedded HTML.", "Products": ["API", "Present"], "PresentText": "Within a Presentation, this will be the copyright notice information."}	2024-09-27 02:03:07.026138	2024-09-26 19:03:53.733305	{"Endpoints": ["Brand"]}	copyright
108	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "Relates to the Brokerage or Company name.", "Products": ["API", "Present"], "PresentText": "Within a Presentation, this is the name of the Brokerage or Company as displayed to the consumer."}	2024-09-27 02:03:07.02793	2024-09-26 19:03:53.733305	{"Endpoints": ["Brand"]}	display_name
109	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Engage"], "APIText": "This is specific to the background color that displays when sending an email from Present.", "Products": ["API", "Engage"], "EngageText": "Background color of sent email elements outside of the email body."}	2024-09-27 02:03:07.029671	2024-09-26 19:03:53.733305	{"Endpoints": ["Brand"]}	email_element_background_color
110	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Engage"], "APIText": "Font color intended to overlay email_element_background_color?", "Products": ["API", "Engage"], "EngageText": "The font color for font that overlays email_element_background_color?"}	2024-09-27 02:03:07.031438	2024-09-26 19:03:53.733305	{"Endpoints": ["Brand"]}	email_background_font_color
111	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "Brokerage or Company logo shown in Print (PDF) Presentations.", "Products": ["API", "Present"], "PresentText": "Within a Presentation - specifically Print (PDF) format, this will be the Brokerage or Company logo that displays."}	2024-09-27 02:03:07.033251	2024-09-26 19:03:53.733305	{"Endpoints": ["Brand"]}	image_cma_pdf_logo_header
112	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Engage"], "Products": ["Engage"], "EngageText": "Related to sent emails, this will be the Brokerage or Company logo as shown in email header."}	2024-09-27 02:03:07.035033	2024-09-26 19:03:53.733305	{"Endpoints": ["Brand"]}	image_email_logo_alt
113	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Present", "Websites"], "Products": ["Present", "Websites"], "PresentText": "Within a presentation, this will be the favicon that displays related to the Brokerage or Company.", "WebsitesText": "Favicon of Brokerage or Company."}	2024-09-27 02:03:07.036805	2024-09-26 19:03:53.733305	{"Endpoints": ["Brand"]}	image_favicon
114	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "Brokerage or Company logo for web view presentations.", "Products": ["API", "Present"], "PresentText": "Within a Presentation - specifically web view, this will be the Brokerage or Company logo."}	2024-09-27 02:03:07.038589	2024-09-26 19:03:53.733305	{"Endpoints": ["Brand"]}	image_pres_cover_logo
115	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "Block element background color for web view presentations.", "Products": ["API", "Present"], "PresentText": "Within a Presentation - specifically web view, this is the background color that displays."}	2024-09-27 02:03:07.040467	2024-09-26 19:03:53.733305	{"Endpoints": ["Brand"]}	pres_block_background_color
116	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "Font color intended to overlay pres_block_background_color attribute.", "Products": ["API", "Present"], "PresentText": "Within a Presentation - specifically web view, this is the font color for related text."}	2024-09-27 02:03:07.042148	2024-09-26 19:03:53.733305	{"Endpoints": ["Brand"]}	pres_block_text_color
49	{"Agent": ["Create Response", "Index Response"], "Brand": ["Index Response"]}	{"Agent": ["API"], "Brand": ["Present"], "APIText": "This name attribute is shared between several endpoints, and generally represents the full name of the entity.", "Products": ["API", "Present"], "PresentText": "This will be the name that displays related to the associated Brand."}	2024-09-27 02:03:06.888722	2024-09-26 19:03:53.733305	{"Endpoints": ["Brand"]}	name
146	{"BuyerTransaction": ["Update Request"]}	{"APIText": "If this is set to true then The MoxiWorks Platform will promote this transaction to the next stage.", "Products": ["API"], "BuyerTransaction": ["API"]}	2024-09-27 02:03:07.136362	2024-09-26 19:04:02.701932	{"Endpoints": ["BuyerTransaction"]}	promote_transaction
136	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Show Response", "Index Response"]}	{"APIText": "If payment for the transaction is based on a flat fee derived from sales volume, use this attribute.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, the total commission for the transaction based on percentage of purchase price.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 02:03:07.092183	2024-09-26 19:04:02.701932	{"Endpoints": ["BuyerTransaction"]}	sales_volume_flat_fee
8	{"Agent": ["Create Request", "Index Request"], "Brand": ["Show Request", "Index Request"], "ActionLog": ["Create Request", "Delete Request", "Index Request"], "BuyerTransaction": ["Create Request", "Update Request", "Show Request", "Index Request"]}	{"Agent": ["API", "Roster"], "Brand": ["API", "Roster"], "APIText": "MoxiWorks Plaform Company entities are your entry-point for determining the established relationships for your organization to companies on the MoxiWorks Platform and for accessing data about those companies. Many requests require a moxi_works_company_id, which can be derived from the Company Index endpoint.", "Products": ["API", "Roster"], "ActionLog": ["API", "Roster"], "RosterText": "", "BuyerTransaction": ["API", "Roster"]}	2024-09-27 02:03:06.798741	2024-09-26 19:04:02.701932	{"Endpoints": ["ActionLog", "Agent", "Brand", "BuyerTransaction"]}	moxi_works_company_id
9	{"Agent": ["Create Request", "Index Request"], "Brand": ["Show Request", "Index Request"], "ActionLog": ["Create Request", "Delete Request", "Index Request"], "BuyerTransaction": ["Create Request", "Update Request", "Show Request", "Index Request"]}	{"Agent": ["API", "Roster"], "Brand": ["API", "Roster"], "APIText": "This provides for a broad scope by which partners may be afforded permissions to perform MoxiWorks Platform actions, in scenarios where a partner does business with a parent company in the MoxiWorks System. It also provides broad scope under which agents may be looked up using the source_agent_id request attribute in many scenarios across different MoxiWorks Platform endpoints and actions.", "Products": ["API", "Roster"], "ActionLog": ["API", "Roster"], "RosterText": "This is the numeric_id or moxi_works_company_id of a company that is considered to be a parent company in the MoxiWorks Platform.", "BuyerTransaction": ["API", "Roster"]}	2024-09-27 02:03:06.800505	2024-09-26 19:04:02.701932	{"Endpoints": ["ActionLog", "Agent", "Brand", "BuyerTransaction"]}	parent_company_id
135	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Show Response", "Index Response"]}	{"APIText": "If the payment for the transaction is based on percentage of sales volume, use this attribute.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, the total commission for the transaction based on sales volume percentage.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 02:03:07.090284	2024-09-26 19:04:02.701932	{"Endpoints": ["BuyerTransaction"]}	sales_volume_percentage
137	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "The desired purchase price for a property if using target rather than range.", "BuyerTransaction": ["Engage"]}	2024-09-27 02:03:07.09387	2024-09-26 19:04:02.701932	{"Endpoints": ["BuyerTransaction"]}	target_price
140	{"BuyerTransaction": ["Create Request", "Create Response", "Update Response", "Show Response", "Index Response"]}	{"APIText": "The stage that the BuyerTransaction should be placed into.", "Products": ["API"], "BuyerTransaction": ["API"]}	2024-09-27 02:03:07.099358	2024-09-26 19:04:02.701932	{"Endpoints": ["BuyerTransaction"]}	stage
123	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the minimum desired living area for prospective properties.", "BuyerTransaction": ["Engage"]}	2024-09-27 02:03:07.068277	2024-09-26 19:04:02.701932	{"Endpoints": ["BuyerTransaction"]}	min_sqft
142	{"BuyerTransaction": ["Create Response", "Update Response", "Show Response", "Index Response"]}	{"APIText": "When created through the MoxiWorks Platform, BuyerTransaction objects will automatically be configured as active transactions. For more information about BuyerTransaction stages, see the MoxiCloud documentation, specific to BuyerTransaction Stages.", "Products": ["API", "Engage"], "EngageText": "For Buyer Transactions, this attribute displays the name or title that is associated with the current stage of the transaction.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 02:03:07.105975	2024-09-26 19:04:02.701932	{"Endpoints": ["BuyerTransaction"]}	stage_name
145	{"BuyerTransaction": ["Create Response", "Update Response", "Show Response", "Index Response"]}	{"APIText": "The stage that the BuyerTransaction should be placed into.", "Products": ["API"], "BuyerTransaction": ["API"]}	2024-09-27 02:03:07.121172	2024-09-26 19:04:02.701932	{"Endpoints": ["BuyerTransaction"]}	state_changed_at
128	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the maximum number of bathrooms for prospective properties.", "BuyerTransaction": ["Engage"]}	2024-09-27 02:03:07.077429	2024-09-26 19:04:02.701932	{"Endpoints": ["BuyerTransaction"]}	max_baths
117	{"BuyerTransaction": ["Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "A brief, human readable title that will be shown to the agent as the subject of the BuyerTransaction that you are creating.", "Products": ["API", "Engage"], "EngageText": "For Buyer Transactions, this will be the name or title of the transaction in question.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 02:03:07.056764	2024-09-26 19:04:02.701932	{"Endpoints": ["BuyerTransaction"]}	transaction_name
118	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "Brief, human readable content that will be shown to the agent as notes about the BuyerTransaction that you are creating.", "Products": ["API", "Engage"], "EngageText": "For Buyer Transactions, these will be the related notes.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 02:03:07.059294	2024-09-26 19:04:02.701932	{"Endpoints": ["BuyerTransaction"]}	notes
119	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This should be populated if this BuyerTransaction is_mls_transaction is false.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this is the street address of the property being purchased.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 02:03:07.060972	2024-09-26 19:04:02.701932	{"Endpoints": ["BuyerTransaction"]}	address
120	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This should be populated if this BuyerTransaction is_mls_transaction is false.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this will be the city or township of the property being purchased.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 02:03:07.062609	2024-09-26 19:04:02.701932	{"Endpoints": ["BuyerTransaction"]}	city
121	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This should be populated if this BuyerTransaction is_mls_transaction is false.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this will be the state or province of the property being purchased.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 02:03:07.064417	2024-09-26 19:04:02.701932	{"Endpoints": ["BuyerTransaction"]}	state
122	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This should be populated if this BuyerTransaction is_mls_transaction is false.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this will be the postal code of the property being purchased.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 02:03:07.066578	2024-09-26 19:04:02.701932	{"Endpoints": ["BuyerTransaction"]}	zip_code
124	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the maximum desired living area for prospective properties.", "BuyerTransaction": ["Engage"]}	2024-09-27 02:03:07.070174	2024-09-26 19:04:02.701932	{"Endpoints": ["BuyerTransaction"]}	max_sqft
125	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the minimum number of bedrooms for prospective properties.", "BuyerTransaction": ["Engage"]}	2024-09-27 02:03:07.072039	2024-09-26 19:04:02.701932	{"Endpoints": ["BuyerTransaction"]}	min_beds
126	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the maximum number of bedrooms for prospective properties.", "BuyerTransaction": ["Engage"]}	2024-09-27 02:03:07.07387	2024-09-26 19:04:02.701932	{"Endpoints": ["BuyerTransaction"]}	max_beds
127	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the minimum number of bathrooms for prospective properties.", "BuyerTransaction": ["Engage"]}	2024-09-27 02:03:07.075659	2024-09-26 19:04:02.701932	{"Endpoints": ["BuyerTransaction"]}	min_baths
129	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the name of a locality representing an area of interest for prospective properties.", "BuyerTransaction": ["Engage"]}	2024-09-27 02:03:07.079177	2024-09-26 19:04:02.701932	{"Endpoints": ["BuyerTransaction"]}	area_of_interest
130	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This should be false for paperwork-only, for sale by owner, off-market, or pocket listing type transactions or any transactions that will not be tracked through an MLS.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this attribute indictates whether the property being purchased is listed on an MLS.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 02:03:07.080951	2024-09-26 19:04:02.701932	{"Endpoints": ["BuyerTransaction"]}	is_mls_transaction
131	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "mls_number should be populated only if is_mls_transaction is true. If no commission (either commission_percentage or commission_flat_fee) is supplied during creation, commission_percentage is set to the default commission_percentage for the associated Agent.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, the MLS number of the the property being purchased.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 02:03:07.082791	2024-09-26 19:04:02.701932	{"Endpoints": ["BuyerTransaction"]}	mls_number
132	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This is the Unix timestamp representing the date that the agent initiated transaction discussions with the client.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this would be considered the date and time when the Agent first initiated transaction discussions with the client.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 02:03:07.084606	2024-09-26 19:04:02.701932	{"Endpoints": ["BuyerTransaction"]}	start_timestamp
134	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "If the commission for the transaction is based on a flat dollar amount, use this attribute.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this is the dollar amount of the total commission for the transaction.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 02:03:07.088168	2024-09-26 19:04:02.701932	{"Endpoints": ["BuyerTransaction"]}	commission_flat_fee
133	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "If the commission for the transaction is based on a percentage of the purchase amount, use this attribute. If no commission (either commission_percentage or commission_flat_fee) is supplied during creation, commission_percentage is set to the default commission_percentage for the associated Agent.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, the total commission for the transaction based on this percentage of the purchase price.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 02:03:07.086315	2024-09-26 19:04:02.701932	{"Endpoints": ["BuyerTransaction"]}	commission_percentage
138	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "The minimum price range for a property if using a price range rather than target price.", "BuyerTransaction": ["Engage"]}	2024-09-27 02:03:07.095735	2024-09-26 19:04:02.701932	{"Endpoints": ["BuyerTransaction"]}	min_price
139	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "The maximum price range for a property if using a price range rather than target price.", "BuyerTransaction": ["Engage"]}	2024-09-27 02:03:07.097556	2024-09-26 19:04:02.701932	{"Endpoints": ["BuyerTransaction"]}	max_price
143	{"BuyerTransaction": ["Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This should be null if the BuyerTransaction is not yet in complete state.", "Products": ["API", "Engage"], "EngageText": "This is the closing price for the transaction.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 02:03:07.117388	2024-09-26 19:04:02.701932	{"Endpoints": ["BuyerTransaction"]}	closing_price
144	{"BuyerTransaction": ["Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "A Unix timestamp. This should be null if the BuyerTransaction is not yet in complete state.", "Products": ["API", "Engage"], "EngageText": "For a Buyer Transaction, this represents the point in time when the transaction was completed.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 02:03:07.119308	2024-09-26 19:04:02.701932	{"Endpoints": ["BuyerTransaction"]}	closing_timestamp
141	{"BuyerTransaction": ["Create Response", "Update Request", "Update Response", "Show Request", "Show Response", "Index Response"]}	{"APIText": "This is the MoxiWorks Platform ID of the BuyerTransaction which you have created. This will be an RFC 4122 compliant UUID. This ID should be recorded on response as it is the key ID for updating the BuyerTransaction.", "Products": ["API"], "BuyerTransaction": ["API"]}	2024-09-27 02:03:07.102059	2024-09-26 19:04:02.701932	{"Endpoints": ["BuyerTransaction"]}	moxi_works_transaction_id
5	{"ActionLog": ["Create Request", "Create Response", "Index Request", "Index Response"], "BuyerTransaction": ["Create Request", "Create Response", "Update Response", "Show Response", "Index Request", "Index Response"]}	{"APIText": "This will be an RFC 4122 compliant UUID, and is the same as the moxi_works_contact_id attribute of the Contact response.", "Products": ["API", "ActionLog"], "ActionLog": ["API", "ActionLog"], "ActionLogText": "This is the MoxiWorks Platform ID of a Contact an ActionLog object is to be associated with. This data is required and must reference a valid MoxiWorks Contact ID for your ActionLog Create request to be accepted."}	2024-09-27 02:03:06.793216	2024-09-26 19:04:02.701932	{"Endpoints": ["ActionLog", "BuyerTransaction"]}	moxi_works_contact_id
6	{"ActionLog": ["Create Request", "Create Response", "Index Request", "Index Response"], "BuyerTransaction": ["Create Request", "Create Response", "Update Response", "Show Response", "Index Request", "Index Response"]}	{"APIText": "This is the unique identifer used in the system that will be connecting to the MoxiWorks platform.", "Products": ["API", "ActionLog"], "ActionLog": ["API", "ActionLog"], "ActionLogText": "This UUID will have already been associated with the Contact the ActionLog entry is created about. The Contact record on the MoxiWorks Platform can be created as necessary using Contact Create before attempting to use this contact ID to create an ActionLog entry. Failure to do so will result in the request being rejected."}	2024-09-27 02:03:06.795183	2024-09-26 19:04:02.701932	{"Endpoints": ["ActionLog", "BuyerTransaction"]}	partner_contact_id
1	{"Agent": ["Create Request"], "Brand": ["Index Request"], "ActionLog": ["Create Request", "Create Response", "Delete Request", "Index Request", "Index Response"], "BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Request", "Show Response", "Index Request", "Index Response"]}	{"Agent": ["API", "Roster"], "Brand": ["API", "Roster"], "APIText": "This will be an RFC 4122 compliant UUID. If data is being pulled from The MoxiWorks Platform and integrating with your own system in a managed or automated fashion, then using agent_uuid request attribute is preferable. It is guaranteed to be unique and to never change for the lifetime of the account.", "Products": ["API", "Roster"], "ActionLog": ["API", "Roster"], "RosterText": "Agent UUID, found on profile page within Roster/Client Manager and is the user account level UUID.", "BuyerTransaction": ["API", "Roster"]}	2024-09-27 02:03:06.784318	2024-09-26 19:04:02.701932	{"Endpoints": ["ActionLog", "Agent", "Brand", "BuyerTransaction"]}	agent_uuid
2	{"Agent": ["Create Request", "Create Response", "Index Response"], "Brand": ["Index Request"], "ActionLog": ["Create Request", "Create Response", "Delete Request", "Index Request", "Index Response"], "BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Request", "Show Response", "Index Request", "Index Response"]}	{"Agent": ["API", "Roster"], "Brand": ["API", "Roster"], "APIText": "If you have already existing agent data, agent accounts and your own user interface that agents can use to integrate your account with their MoxiWorks Platform account then you should use the moxi_works_agent_id request attribute. It is intended for use cases where integration is managed by end-user interaction.", "Products": ["API", "Roster"], "ActionLog": ["API", "Roster"], "RosterText": "This identifier is guaranteed to be unique, but may be either an alphanumeric string or an email address.", "BuyerTransaction": ["API", "Roster"]}	2024-09-27 02:03:06.787046	2024-09-26 19:04:02.701932	{"Endpoints": ["ActionLog", "Agent", "Brand", "BuyerTransaction"]}	moxi_works_agent_id
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: aaron
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
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: aaron
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at) FROM stdin;
\.


--
-- Name: associated_attrs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aaron
--

SELECT pg_catalog.setval('public.associated_attrs_id_seq', 392, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aaron
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: aaron
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: associated_attrs associated_attrs_pkey; Type: CONSTRAINT; Schema: public; Owner: aaron
--

ALTER TABLE ONLY public.associated_attrs
    ADD CONSTRAINT associated_attrs_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: aaron
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: aaron
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: aaron
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: aaron
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- PostgreSQL database dump complete
--

