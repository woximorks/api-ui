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
environment	development	2024-09-27 00:07:49.45442	2024-09-27 00:07:49.454422
\.


--
-- Data for Name: associated_attrs; Type: TABLE DATA; Schema: public; Owner: aaron
--

COPY public.associated_attrs (id, request_type, ui_info, created_at, updated_at, associated_endpoints, attr_title) FROM stdin;
147	{}	{}	2024-09-27 00:07:53.215758	2024-09-27 00:07:53.215758	{}	numeric_id
148	{}	{}	2024-09-27 00:07:53.218483	2024-09-27 00:07:53.218483	{}	public_partner_attrs
149	{}	{}	2024-09-27 00:07:53.222868	2024-09-27 00:07:53.222868	{}	per_page
150	{}	{}	2024-09-27 00:07:53.225312	2024-09-27 00:07:53.225312	{}	show_paging_totals
151	{}	{}	2024-09-27 00:07:53.230437	2024-09-27 00:07:53.230437	{}	contact_name
152	{}	{}	2024-09-27 00:07:53.233024	2024-09-27 00:07:53.233024	{}	primary_phone_number
153	{}	{}	2024-09-27 00:07:53.234662	2024-09-27 00:07:53.234662	{}	secondary_phone_number
154	{}	{}	2024-09-27 00:07:53.237083	2024-09-27 00:07:53.237083	{}	moxi_works_lead_source_id
155	{}	{}	2024-09-27 00:07:53.239126	2024-09-27 00:07:53.239126	{}	original_lead_source
156	{}	{}	2024-09-27 00:07:53.240974	2024-09-27 00:07:53.240974	{}	gender
157	{}	{}	2024-09-27 00:07:53.242832	2024-09-27 00:07:53.242832	{}	label_name
158	{}	{}	2024-09-27 00:07:53.244719	2024-09-27 00:07:53.244719	{}	home_street_address
159	{}	{}	2024-09-27 00:07:53.246538	2024-09-27 00:07:53.246538	{}	home_city
160	{}	{}	2024-09-27 00:07:53.248312	2024-09-27 00:07:53.248312	{}	home_state
161	{}	{}	2024-09-27 00:07:53.250072	2024-09-27 00:07:53.250072	{}	home_zip
162	{}	{}	2024-09-27 00:07:53.251846	2024-09-27 00:07:53.251846	{}	home_country
163	{}	{}	2024-09-27 00:07:53.253724	2024-09-27 00:07:53.253724	{}	is_not_lead
164	{}	{}	2024-09-27 00:07:53.255587	2024-09-27 00:07:53.255587	{}	skip_agent_notification
165	{}	{}	2024-09-27 00:07:53.257439	2024-09-27 00:07:53.257439	{}	job_title
166	{}	{}	2024-09-27 00:07:53.259332	2024-09-27 00:07:53.259332	{}	occupation
167	{}	{}	2024-09-27 00:07:53.261057	2024-09-27 00:07:53.261057	{}	property_url
168	{}	{}	2024-09-27 00:07:53.263186	2024-09-27 00:07:53.263186	{}	property_mls_id
169	{}	{}	2024-09-27 00:07:53.265115	2024-09-27 00:07:53.265115	{}	property_street_address
170	{}	{}	2024-09-27 00:07:53.266996	2024-09-27 00:07:53.266996	{}	property_city
171	{}	{}	2024-09-27 00:07:53.268869	2024-09-27 00:07:53.268869	{}	property_state
172	{}	{}	2024-09-27 00:07:53.270665	2024-09-27 00:07:53.270665	{}	property_zip
173	{}	{}	2024-09-27 00:07:53.272426	2024-09-27 00:07:53.272426	{}	property_beds
174	{}	{}	2024-09-27 00:07:53.274189	2024-09-27 00:07:53.274189	{}	property_baths
175	{}	{}	2024-09-27 00:07:53.275985	2024-09-27 00:07:53.275985	{}	property_list_price
176	{}	{}	2024-09-27 00:07:53.277769	2024-09-27 00:07:53.277769	{}	property_listing_status
177	{}	{}	2024-09-27 00:07:53.279482	2024-09-27 00:07:53.279482	{}	property_photo_url
178	{}	{}	2024-09-27 00:07:53.281293	2024-09-27 00:07:53.281293	{}	search_city
179	{}	{}	2024-09-27 00:07:53.283152	2024-09-27 00:07:53.283152	{}	search_state
180	{}	{}	2024-09-27 00:07:53.284892	2024-09-27 00:07:53.284892	{}	search_zip
181	{}	{}	2024-09-27 00:07:53.287053	2024-09-27 00:07:53.287053	{}	search_min_baths
182	{}	{}	2024-09-27 00:07:53.288952	2024-09-27 00:07:53.288952	{}	search_min_beds
183	{}	{}	2024-09-27 00:07:53.290826	2024-09-27 00:07:53.290826	{}	search_min_price
184	{}	{}	2024-09-27 00:07:53.292692	2024-09-27 00:07:53.292692	{}	search_max_price
185	{}	{}	2024-09-27 00:07:53.294487	2024-09-27 00:07:53.294487	{}	search_min_sq_ft
186	{}	{}	2024-09-27 00:07:53.296254	2024-09-27 00:07:53.296254	{}	search_max_sq_ft
187	{}	{}	2024-09-27 00:07:53.298073	2024-09-27 00:07:53.298073	{}	search_min_lot_size
188	{}	{}	2024-09-27 00:07:53.299934	2024-09-27 00:07:53.299934	{}	search_max_lot_size
189	{}	{}	2024-09-27 00:07:53.301759	2024-09-27 00:07:53.301759	{}	search_min_year_built
190	{}	{}	2024-09-27 00:07:53.30349	2024-09-27 00:07:53.30349	{}	search_max_year_built
191	{}	{}	2024-09-27 00:07:53.30529	2024-09-27 00:07:53.30529	{}	search_property_types
192	{}	{}	2024-09-27 00:07:53.307168	2024-09-27 00:07:53.307168	{}	note
193	{}	{}	2024-09-27 00:07:53.309321	2024-09-27 00:07:53.309321	{}	websites
194	{}	{}	2024-09-27 00:07:53.311263	2024-09-27 00:07:53.311263	{}	birthday
195	{}	{}	2024-09-27 00:07:53.313034	2024-09-27 00:07:53.313034	{}	home_purchase_anniversaries
196	{}	{}	2024-09-27 00:07:53.314902	2024-09-27 00:07:53.314902	{}	company
197	{}	{}	2024-09-27 00:07:53.316792	2024-09-27 00:07:53.316792	{}	spouse_or_partner
198	{}	{}	2024-09-27 00:07:53.318593	2024-09-27 00:07:53.318593	{}	category_names
199	{}	{}	2024-09-27 00:07:53.322072	2024-09-27 00:07:53.322072	{}	is_deleted
200	{}	{}	2024-09-27 00:07:53.325518	2024-09-27 00:07:53.325518	{}	middle_name
201	{}	{}	2024-09-27 00:07:53.327702	2024-09-27 00:07:53.327702	{}	suffix
202	{}	{}	2024-09-27 00:07:53.332537	2024-09-27 00:07:53.332537	{}	phone_numbers
203	{}	{}	2024-09-27 00:07:53.337645	2024-09-27 00:07:53.337645	{}	is_new_contact
204	{}	{}	2024-09-27 00:07:53.340034	2024-09-27 00:07:53.340034	{}	anniversary
205	{}	{}	2024-09-27 00:07:53.341865	2024-09-27 00:07:53.341865	{}	home_purchase_anniversary
206	{}	{}	2024-09-27 00:07:53.34367	2024-09-27 00:07:53.34367	{}	social_media_profiles
207	{}	{}	2024-09-27 00:07:53.360184	2024-09-27 00:07:53.360184	{}	groups
208	{}	{}	2024-09-27 00:07:53.387448	2024-09-27 00:07:53.387448	{}	moxi_works_origin_lead_source_id
209	{}	{}	2024-09-27 00:07:53.441544	2024-09-27 00:07:53.441544	{}	email_address
210	{}	{}	2024-09-27 00:07:53.44384	2024-09-27 00:07:53.44384	{}	phone_number
211	{}	{}	2024-09-27 00:07:53.446742	2024-09-27 00:07:53.446742	{}	only_business_contacts
212	{}	{}	2024-09-27 00:07:53.45018	2024-09-27 00:07:53.45018	{}	total_pages
213	{}	{}	2024-09-27 00:07:53.452306	2024-09-27 00:07:53.452306	{}	contacts
214	{}	{}	2024-09-27 00:07:53.4582	2024-09-27 00:07:53.4582	{}	result
215	{}	{}	2024-09-27 00:07:53.463533	2024-09-27 00:07:53.463533	{}	subscription_type
216	{}	{}	2024-09-27 00:07:53.46571	2024-09-27 00:07:53.46571	{}	subscribed_at
217	{}	{}	2024-09-27 00:07:53.46744	2024-09-27 00:07:53.46744	{}	created_by
218	{}	{}	2024-09-27 00:07:53.469238	2024-09-27 00:07:53.469238	{}	area
219	{}	{}	2024-09-27 00:07:53.471108	2024-09-27 00:07:53.471108	{}	last_sent
220	{}	{}	2024-09-27 00:07:53.472887	2024-09-27 00:07:53.472887	{}	next_scheduled
221	{}	{}	2024-09-27 00:07:53.475193	2024-09-27 00:07:53.475193	{}	created_at
222	{}	{}	2024-09-27 00:07:53.477146	2024-09-27 00:07:53.477146	{}	unsubscribed_at
223	{}	{}	2024-09-27 00:07:53.479054	2024-09-27 00:07:53.479054	{}	unsubscribed_by
224	{}	{}	2024-09-27 00:07:53.480971	2024-09-27 00:07:53.480971	{}	listed
225	{}	{}	2024-09-27 00:07:53.482909	2024-09-27 00:07:53.482909	{}	sold
226	{}	{}	2024-09-27 00:07:53.48478	2024-09-27 00:07:53.48478	{}	zipcode
227	{}	{}	2024-09-27 00:07:53.486522	2024-09-27 00:07:53.486522	{}	nn_subscription_type
228	{}	{}	2024-09-27 00:07:53.488356	2024-09-27 00:07:53.488356	{}	nn_min_price
229	{}	{}	2024-09-27 00:07:53.490164	2024-09-27 00:07:53.490164	{}	nn_max_price
230	{}	{}	2024-09-27 00:07:53.491992	2024-09-27 00:07:53.491992	{}	nn_min_beds
231	{}	{}	2024-09-27 00:07:53.493816	2024-09-27 00:07:53.493816	{}	nn_max_beds
232	{}	{}	2024-09-27 00:07:53.495718	2024-09-27 00:07:53.495718	{}	nn_min_baths
233	{}	{}	2024-09-27 00:07:53.497669	2024-09-27 00:07:53.497669	{}	nn_min_sqft
234	{}	{}	2024-09-27 00:07:53.499883	2024-09-27 00:07:53.499883	{}	nn_max_sqft
235	{}	{}	2024-09-27 00:07:53.501921	2024-09-27 00:07:53.501921	{}	nn_property_type
236	{}	{}	2024-09-27 00:07:53.503993	2024-09-27 00:07:53.503993	{}	partner_event_id
237	{}	{}	2024-09-27 00:07:53.507715	2024-09-27 00:07:53.507715	{}	event_subject
238	{}	{}	2024-09-27 00:07:53.509437	2024-09-27 00:07:53.509437	{}	event_location
239	{}	{}	2024-09-27 00:07:53.511574	2024-09-27 00:07:53.511574	{}	send_reminder
240	{}	{}	2024-09-27 00:07:53.513362	2024-09-27 00:07:53.513362	{}	remind_minutes_before
241	{}	{}	2024-09-27 00:07:53.515151	2024-09-27 00:07:53.515151	{}	event_start
242	{}	{}	2024-09-27 00:07:53.516963	2024-09-27 00:07:53.516963	{}	event_end
243	{}	{}	2024-09-27 00:07:53.518768	2024-09-27 00:07:53.518768	{}	all_day
244	{}	{}	2024-09-27 00:07:53.520587	2024-09-27 00:07:53.520587	{}	attendees
245	{}	{}	2024-09-27 00:07:53.537185	2024-09-27 00:07:53.537185	{}	date_start
246	{}	{}	2024-09-27 00:07:53.539343	2024-09-27 00:07:53.539343	{}	date_end
247	{}	{}	2024-09-27 00:07:53.542006	2024-09-27 00:07:53.542006	{}	date
248	{}	{}	2024-09-27 00:07:53.54436	2024-09-27 00:07:53.54436	{}	events
249	{}	{}	2024-09-27 00:07:53.551628	2024-09-27 00:07:53.551628	{}	ListingID
250	{}	{}	2024-09-27 00:07:53.553502	2024-09-27 00:07:53.553502	{}	ListOfficeAOR
251	{}	{}	2024-09-27 00:07:53.55529	2024-09-27 00:07:53.55529	{}	ListingImages
252	{}	{}	2024-09-27 00:07:53.558259	2024-09-27 00:07:53.558259	{}	partner_group_id
253	{}	{}	2024-09-27 00:07:53.562237	2024-09-27 00:07:53.562237	{}	moxi_works_group_name
254	{}	{}	2024-09-27 00:07:53.564056	2024-09-27 00:07:53.564056	{}	moxi_works_group_id
255	{}	{}	2024-09-27 00:07:53.566588	2024-09-27 00:07:53.566588	{}	transient
256	{}	{}	2024-09-27 00:07:53.568521	2024-09-27 00:07:53.568521	{}	is_contact_removal
257	{}	{}	2024-09-27 00:07:53.570302	2024-09-27 00:07:53.570302	{}	updated_contacts
258	{}	{}	2024-09-27 00:07:53.588	2024-09-27 00:07:53.588	{}	is_partner_alias
259	{}	{}	2024-09-27 00:07:53.589849	2024-09-27 00:07:53.589849	{}	is_partner_default
260	{}	{}	2024-09-27 00:07:53.591805	2024-09-27 00:07:53.591805	{}	moxi_works_listing_id
261	{}	{}	2024-09-27 00:07:53.594408	2024-09-27 00:07:53.594408	{}	underscore_response
262	{}	{}	2024-09-27 00:07:53.596163	2024-09-27 00:07:53.596163	{}	LotSizeAcres
263	{}	{}	2024-09-27 00:07:53.597889	2024-09-27 00:07:53.597889	{}	BathroomsFull
264	{}	{}	2024-09-27 00:07:53.599594	2024-09-27 00:07:53.599594	{}	BathroomsHalf
265	{}	{}	2024-09-27 00:07:53.601294	2024-09-27 00:07:53.601294	{}	BathroomsOneQuarter
266	{}	{}	2024-09-27 00:07:53.603002	2024-09-27 00:07:53.603002	{}	BathroomsPartial
267	{}	{}	2024-09-27 00:07:53.604693	2024-09-27 00:07:53.604693	{}	BathroomsThreeQuarter
268	{}	{}	2024-09-27 00:07:53.60643	2024-09-27 00:07:53.60643	{}	BathroomsTotalInteger
269	{}	{}	2024-09-27 00:07:53.608267	2024-09-27 00:07:53.608267	{}	BathroomsTotal
270	{}	{}	2024-09-27 00:07:53.610446	2024-09-27 00:07:53.610446	{}	BedroomsTotal
271	{}	{}	2024-09-27 00:07:53.612385	2024-09-27 00:07:53.612385	{}	PublicTitle
272	{}	{}	2024-09-27 00:07:53.614265	2024-09-27 00:07:53.614265	{}	PublicRemarks
273	{}	{}	2024-09-27 00:07:53.616186	2024-09-27 00:07:53.616186	{}	ModificationTimestamp
274	{}	{}	2024-09-27 00:07:53.61794	2024-09-27 00:07:53.61794	{}	StatusChangeDate
275	{}	{}	2024-09-27 00:07:53.619805	2024-09-27 00:07:53.619805	{}	InternetAddressDisplayYN
276	{}	{}	2024-09-27 00:07:53.621709	2024-09-27 00:07:53.621709	{}	DaysOnMarket
277	{}	{}	2024-09-27 00:07:53.623673	2024-09-27 00:07:53.623673	{}	ListingContractDate
278	{}	{}	2024-09-27 00:07:53.625823	2024-09-27 00:07:53.625823	{}	CreatedDate
279	{}	{}	2024-09-27 00:07:53.627804	2024-09-27 00:07:53.627804	{}	ElementarySchool
280	{}	{}	2024-09-27 00:07:53.629674	2024-09-27 00:07:53.629674	{}	GarageSpaces
281	{}	{}	2024-09-27 00:07:53.63156	2024-09-27 00:07:53.63156	{}	WaterfrontYN
282	{}	{}	2024-09-27 00:07:53.633528	2024-09-27 00:07:53.633528	{}	HighSchool
283	{}	{}	2024-09-27 00:07:53.635894	2024-09-27 00:07:53.635894	{}	AssociationFee
284	{}	{}	2024-09-27 00:07:53.638086	2024-09-27 00:07:53.638086	{}	ListOfficeName
285	{}	{}	2024-09-27 00:07:53.639966	2024-09-27 00:07:53.639966	{}	ListPrice
286	{}	{}	2024-09-27 00:07:53.642221	2024-09-27 00:07:53.642221	{}	ListAgentFullName
287	{}	{}	2024-09-27 00:07:53.643908	2024-09-27 00:07:53.643908	{}	ListAgentUUID
288	{}	{}	2024-09-27 00:07:53.645581	2024-09-27 00:07:53.645581	{}	ListAgentOfficeID
289	{}	{}	2024-09-27 00:07:53.647162	2024-09-27 00:07:53.647162	{}	ListAgentMoxiWorksOfficeID
290	{}	{}	2024-09-27 00:07:53.648881	2024-09-27 00:07:53.648881	{}	SecondaryListAgentFullName
291	{}	{}	2024-09-27 00:07:53.650492	2024-09-27 00:07:53.650492	{}	SecondaryListAgentUUID
292	{}	{}	2024-09-27 00:07:53.652208	2024-09-27 00:07:53.652208	{}	SchoolDistrict
293	{}	{}	2024-09-27 00:07:53.654144	2024-09-27 00:07:53.654144	{}	Address
294	{}	{}	2024-09-27 00:07:53.656059	2024-09-27 00:07:53.656059	{}	Address2
295	{}	{}	2024-09-27 00:07:53.657805	2024-09-27 00:07:53.657805	{}	City
296	{}	{}	2024-09-27 00:07:53.660005	2024-09-27 00:07:53.660005	{}	CountyOrParish
297	{}	{}	2024-09-27 00:07:53.661943	2024-09-27 00:07:53.661943	{}	Latitude
298	{}	{}	2024-09-27 00:07:53.663745	2024-09-27 00:07:53.663745	{}	Longitude
299	{}	{}	2024-09-27 00:07:53.665527	2024-09-27 00:07:53.665527	{}	StateOrProvince
300	{}	{}	2024-09-27 00:07:53.667188	2024-09-27 00:07:53.667188	{}	PostalCode
301	{}	{}	2024-09-27 00:07:53.668802	2024-09-27 00:07:53.668802	{}	Community
302	{}	{}	2024-09-27 00:07:53.670491	2024-09-27 00:07:53.670491	{}	LotSizeSquareFeet
303	{}	{}	2024-09-27 00:07:53.672057	2024-09-27 00:07:53.672057	{}	InternetEntireListingDisplayYN
304	{}	{}	2024-09-27 00:07:53.673622	2024-09-27 00:07:53.673622	{}	MiddleOrJuniorSchool
305	{}	{}	2024-09-27 00:07:53.675543	2024-09-27 00:07:53.675543	{}	ListOfficeAORArea
306	{}	{}	2024-09-27 00:07:53.677055	2024-09-27 00:07:53.677055	{}	PoolYN
307	{}	{}	2024-09-27 00:07:53.678626	2024-09-27 00:07:53.678626	{}	PropertyType
308	{}	{}	2024-09-27 00:07:53.680473	2024-09-27 00:07:53.680473	{}	TaxAnnualAmount
309	{}	{}	2024-09-27 00:07:53.68208	2024-09-27 00:07:53.68208	{}	TaxYear
310	{}	{}	2024-09-27 00:07:53.683689	2024-09-27 00:07:53.683689	{}	SingleStory
311	{}	{}	2024-09-27 00:07:53.685301	2024-09-27 00:07:53.685301	{}	LivingArea
312	{}	{}	2024-09-27 00:07:53.686752	2024-09-27 00:07:53.686752	{}	ViewYN
313	{}	{}	2024-09-27 00:07:53.688306	2024-09-27 00:07:53.688306	{}	YearBuilt
314	{}	{}	2024-09-27 00:07:53.689834	2024-09-27 00:07:53.689834	{}	OnMarket
315	{}	{}	2024-09-27 00:07:53.691382	2024-09-27 00:07:53.691382	{}	Status
316	{}	{}	2024-09-27 00:07:53.69316	2024-09-27 00:07:53.69316	{}	MoxiWorksListingId
317	{}	{}	2024-09-27 00:07:53.695105	2024-09-27 00:07:53.695105	{}	AgentCreatedListing
318	{}	{}	2024-09-27 00:07:53.697079	2024-09-27 00:07:53.697079	{}	VirtualTourURL
319	{}	{}	2024-09-27 00:07:53.698935	2024-09-27 00:07:53.698935	{}	SharedPartnerData
320	{}	{}	2024-09-27 00:07:53.700894	2024-09-27 00:07:53.700894	{}	TaxParcelId
321	{}	{}	2024-09-27 00:07:53.702991	2024-09-27 00:07:53.702991	{}	ListingURL
322	{}	{}	2024-09-27 00:07:53.704954	2024-09-27 00:07:53.704954	{}	PropertyFeatures
323	{}	{}	2024-09-27 00:07:53.706922	2024-09-27 00:07:53.706922	{}	CompanyListingAttributes
324	{}	{}	2024-09-27 00:07:53.708859	2024-09-27 00:07:53.708859	{}	OpenHouse
325	{}	{}	2024-09-27 00:07:53.710735	2024-09-27 00:07:53.710735	{}	ImagesLastModified
326	{}	{}	2024-09-27 00:07:53.713069	2024-09-27 00:07:53.713069	{}	BuyerCommissionType
327	{}	{}	2024-09-27 00:07:53.714835	2024-09-27 00:07:53.714835	{}	BuyerCommissionValue
328	{}	{}	2024-09-27 00:07:53.756286	2024-09-27 00:07:53.756286	{}	last_moxi_works_listing_id
329	{}	{}	2024-09-27 00:07:53.758312	2024-09-27 00:07:53.758312	{}	shared_partner_data_updated_since
330	{}	{}	2024-09-27 00:07:53.760255	2024-09-27 00:07:53.760255	{}	market_status
331	{}	{}	2024-09-27 00:07:53.762157	2024-09-27 00:07:53.762157	{}	property_types
332	{}	{}	2024-09-27 00:07:53.764016	2024-09-27 00:07:53.764016	{}	only_agent_created
333	{}	{}	2024-09-27 00:07:53.765848	2024-09-27 00:07:53.765848	{}	coming_soon
334	{}	{}	2024-09-27 00:07:53.768562	2024-09-27 00:07:53.768562	{}	FinalPage
335	{}	{}	2024-09-27 00:07:53.770378	2024-09-27 00:07:53.770378	{}	Listings
336	{}	{}	2024-09-27 00:07:53.773706	2024-09-27 00:07:53.773706	{}	id
337	{}	{}	2024-09-27 00:07:53.776277	2024-09-27 00:07:53.776277	{}	common_name
338	{}	{}	2024-09-27 00:07:53.778068	2024-09-27 00:07:53.778068	{}	image_url
339	{}	{}	2024-09-27 00:07:53.780708	2024-09-27 00:07:53.780708	{}	address2
340	{}	{}	2024-09-27 00:07:53.783073	2024-09-27 00:07:53.783073	{}	county
341	{}	{}	2024-09-27 00:07:53.786009	2024-09-27 00:07:53.786009	{}	alt_phone
342	{}	{}	2024-09-27 00:07:53.787879	2024-09-27 00:07:53.787879	{}	email
343	{}	{}	2024-09-27 00:07:53.790544	2024-09-27 00:07:53.790544	{}	phone
344	{}	{}	2024-09-27 00:07:53.792381	2024-09-27 00:07:53.792381	{}	timezone
345	{}	{}	2024-09-27 00:07:53.794634	2024-09-27 00:07:53.794634	{}	office_website
346	{}	{}	2024-09-27 00:07:53.796887	2024-09-27 00:07:53.796887	{}	mailing_address
347	{}	{}	2024-09-27 00:07:53.798709	2024-09-27 00:07:53.798709	{}	mailing_address2
348	{}	{}	2024-09-27 00:07:53.800602	2024-09-27 00:07:53.800602	{}	mailing_city
349	{}	{}	2024-09-27 00:07:53.802363	2024-09-27 00:07:53.802363	{}	mailing_zip
350	{}	{}	2024-09-27 00:07:53.804551	2024-09-27 00:07:53.804551	{}	mailing_state
351	{}	{}	2024-09-27 00:07:53.808021	2024-09-27 00:07:53.808021	{}	logo_url
352	{}	{}	2024-09-27 00:07:53.813243	2024-09-27 00:07:53.813243	{}	offices
353	{}	{}	2024-09-27 00:07:53.81738	2024-09-27 00:07:53.81738	{}	created_after
354	{}	{}	2024-09-27 00:07:53.819139	2024-09-27 00:07:53.819139	{}	created_before
355	{}	{}	2024-09-27 00:07:53.820939	2024-09-27 00:07:53.820939	{}	updated_after
356	{}	{}	2024-09-27 00:07:53.822816	2024-09-27 00:07:53.822816	{}	updated_before
357	{}	{}	2024-09-27 00:07:53.825151	2024-09-27 00:07:53.825151	{}	include_times
358	{}	{}	2024-09-27 00:07:53.826933	2024-09-27 00:07:53.826933	{}	type
359	{}	{}	2024-09-27 00:07:53.830217	2024-09-27 00:07:53.830217	{}	presentations
360	{}	{}	2024-09-27 00:07:53.866478	2024-09-27 00:07:53.866478	{}	SoldDate
361	{}	{}	2024-09-27 00:07:53.868421	2024-09-27 00:07:53.868421	{}	SoldPrice
362	{}	{}	2024-09-27 00:07:53.87032	2024-09-27 00:07:53.87032	{}	BuyerAgentFullName
363	{}	{}	2024-09-27 00:07:53.872133	2024-09-27 00:07:53.872133	{}	BuyerAgentUUID
364	{}	{}	2024-09-27 00:07:53.874077	2024-09-27 00:07:53.874077	{}	BuyerAgentOfficeName
365	{}	{}	2024-09-27 00:07:53.87605	2024-09-27 00:07:53.87605	{}	BuyerAgentOfficeID
366	{}	{}	2024-09-27 00:07:53.877977	2024-09-27 00:07:53.877977	{}	BuyerAgentMoxiWorksOfficeID
367	{}	{}	2024-09-27 00:07:53.88109	2024-09-27 00:07:53.88109	{}	sold_since
368	{}	{}	2024-09-27 00:07:53.883052	2024-09-27 00:07:53.883052	{}	sold_before
369	{}	{}	2024-09-27 00:07:53.887099	2024-09-27 00:07:53.887099	{}	include_buyer_listings
370	{}	{}	2024-09-27 00:07:53.891821	2024-09-27 00:07:53.891821	{}	partner_task_id
371	{}	{}	2024-09-27 00:07:53.894386	2024-09-27 00:07:53.894386	{}	due_at
372	{}	{}	2024-09-27 00:07:53.897071	2024-09-27 00:07:53.897071	{}	duration
373	{}	{}	2024-09-27 00:07:53.898846	2024-09-27 00:07:53.898846	{}	description
374	{}	{}	2024-09-27 00:07:53.905068	2024-09-27 00:07:53.905068	{}	completed_at
375	{}	{}	2024-09-27 00:07:53.920963	2024-09-27 00:07:53.920963	{}	due_date_start
376	{}	{}	2024-09-27 00:07:53.922867	2024-09-27 00:07:53.922867	{}	due_date_end
377	{}	{}	2024-09-27 00:07:53.926558	2024-09-27 00:07:53.926558	{}	tasks
378	{}	{}	2024-09-27 00:07:53.928661	2024-09-27 00:07:53.928661	{}	moxi_works_team_id
379	{}	{}	2024-09-27 00:07:53.93273	2024-09-27 00:07:53.93273	{}	address1
380	{}	{}	2024-09-27 00:07:53.936603	2024-09-27 00:07:53.936603	{}	fax
381	{}	{}	2024-09-27 00:07:53.938819	2024-09-27 00:07:53.938819	{}	photo_url
382	{}	{}	2024-09-27 00:07:53.941716	2024-09-27 00:07:53.941716	{}	alt_email
383	{}	{}	2024-09-27 00:07:53.94357	2024-09-27 00:07:53.94357	{}	website_url
384	{}	{}	2024-09-27 00:07:53.945449	2024-09-27 00:07:53.945449	{}	active
385	{}	{}	2024-09-27 00:07:53.959011	2024-09-27 00:07:53.959011	{}	has_agent_association
386	{}	{}	2024-09-27 00:07:53.960786	2024-09-27 00:07:53.960786	{}	has_web_data
387	{}	{}	2024-09-27 00:07:53.962516	2024-09-27 00:07:53.962516	{}	has_favorites
388	{}	{}	2024-09-27 00:07:53.964321	2024-09-27 00:07:53.964321	{}	has_searches
389	{}	{}	2024-09-27 00:07:53.967503	2024-09-27 00:07:53.967503	{}	moxi_works_user_id
390	{}	{}	2024-09-27 00:07:53.970805	2024-09-27 00:07:53.970805	{}	associated_agent_uuid
391	{}	{}	2024-09-27 00:07:53.972626	2024-09-27 00:07:53.972626	{}	favorite_listing_ids
392	{}	{}	2024-09-27 00:07:53.974871	2024-09-27 00:07:53.974871	{}	saved_searches
4	{"ActionLog": ["Create Request", "Create Response"]}	{"APIText": "To include access level information for the agent in the response, pass true", "Products": ["API", "Roster"], "ActionLog": ["API", "Roster"], "RosterText": "The access level of the agent. This can return one of the possible access levels, as seen within the products and permissions page."}	2024-09-27 00:07:52.831051	2024-09-26 17:08:02.180632	{"Endpoints": ["ActionLog"]}	body
10	{"ActionLog": ["Create Request", "Create Response"]}	{"Products": ["ActionLog"], "ActionLog": ["ActionLog"], "ActionLogText": "This is the human readable plain-text string which will be presented to the Agent as the heading of the ActionLog entry. This can be any short, descriptive sentence which would be practical for the agent to see in the history of events associated with a Contact."}	2024-09-27 00:07:52.842108	2024-09-26 17:08:02.180632	{"Endpoints": ["ActionLog"]}	agent_action
11	{"ActionLog": ["Create Request", "Create Response"]}	{"Products": ["ActionLog"], "ActionLog": ["ActionLog"], "ActionLogText": "If creating an agent_action that has a location component (‘inperson’ ‘other’) use this field to denote the street address of the agent_action."}	2024-09-27 00:07:52.843942	2024-09-26 17:08:02.180632	{"Endpoints": ["ActionLog"]}	agent_action_address
12	{"ActionLog": ["Create Request", "Create Response"]}	{"Products": ["ActionLog"], "ActionLog": ["ActionLog"], "ActionLogText": "If creating an agent_action that has a location component (‘inperson’ ‘other’) use this field to denote the additonal street address info of the agent_action."}	2024-09-27 00:07:52.845749	2024-09-26 17:08:02.180632	{"Endpoints": ["ActionLog"]}	agent_action_address2
13	{"ActionLog": ["Create Request", "Create Response"]}	{"Products": ["ActionLog"], "ActionLog": ["ActionLog"], "ActionLogText": "If creating an agent_action that has a location component (‘inperson’ ‘other’) use this field to denote the city or locale of the agent_action."}	2024-09-27 00:07:52.848468	2024-09-26 17:08:02.180632	{"Endpoints": ["ActionLog"]}	agent_action_city
14	{"ActionLog": ["Create Request", "Create Response"]}	{"Products": ["ActionLog"], "ActionLog": ["ActionLog"], "ActionLogText": "If creating an agent_action that has a location component (‘inperson’ ‘other’) use this field to denote the state or province related info of the agent_action."}	2024-09-27 00:07:52.85046	2024-09-26 17:08:02.180632	{"Endpoints": ["ActionLog"]}	agent_action_state
15	{"ActionLog": ["Create Request", "Create Response"]}	{"Products": ["ActionLog"], "ActionLog": ["ActionLog"], "ActionLogText": "If creating an agent_action that has a location component (‘inperson’ ‘other’) use this field to denote the postal code of the agent_action."}	2024-09-27 00:07:52.852346	2024-09-26 17:08:02.180632	{"Endpoints": ["ActionLog"]}	agent_action_zip
16	{"ActionLog": ["Create Response"]}	{"APIText": "This is the Unix timestamp for the creation time of the ActionLog entry.", "Products": ["API"], "ActionLog": ["API"]}	2024-09-27 00:07:52.856354	2024-09-26 17:08:02.180632	{"Endpoints": ["ActionLog"]}	timestamp
17	{"ActionLog": ["Delete Request"]}	{"APIText": "This is the MoxiWorks Platform ID of the ActionLog entry to be deleted. This will be an RFC 4122 compliant UUID.", "Products": ["API"], "ActionLog": ["API"]}	2024-09-27 00:07:52.860831	2024-09-26 17:08:02.180632	{"Endpoints": ["ActionLog"]}	moxi_works_action_log_id
18	{"ActionLog": ["Delete Response"]}	{"APIText": "This will indicate what the status of the request is.", "Products": ["API"], "ActionLog": ["API"]}	2024-09-27 00:07:52.864568	2024-09-26 17:08:02.180632	{"Endpoints": ["ActionLog"]}	status
19	{"ActionLog": ["Delete Response"]}	{"APIText": "This will indicate whether the delete request was successful or not.", "Products": ["API"], "ActionLog": ["API"]}	2024-09-27 00:07:52.866308	2024-09-26 17:08:02.180632	{"Endpoints": ["ActionLog"]}	deleted
20	{"ActionLog": ["Delete Response"]}	{"APIText": "This is an arrray of strings. Any messages associated with the delete request status will be contained in this array.", "Products": ["API"], "ActionLog": ["API"]}	2024-09-27 00:07:52.868269	2024-09-26 17:08:02.180632	{"Endpoints": ["ActionLog"]}	messages
21	{"ActionLog": ["Index Request"]}	{"APIText": "Only ActionLog records created later than this Unix timestamp will be included in the query. The upper bound of the time slice will be the 90 days higher than date_min value or the value of the the date_max; whichever is lower. If no timestamps are provided, ActionLogs from the last 90 days will be retrieved. The maximum timeframe for data is 90 days. date_min and date_max should be set in 90 day increments to retrieve the data from a specific historical point.", "Products": ["API"], "ActionLog": ["API"]}	2024-09-27 00:07:52.873298	2024-09-26 17:08:02.180632	{"Endpoints": ["ActionLog"]}	date_min
22	{"ActionLog": ["Index Request"]}	{"APIText": "Only ActionLog records created earlier than this Unix timestamp will be included in the query. Should be no higher than 90 days past the date_min attribute if it is provided. The maximum timeframe for data is 90 days. date_min and date_max should be set in 90 day increments to retrieve the data from a specific historical point.", "Products": ["API"], "ActionLog": ["API"]}	2024-09-27 00:07:52.875145	2024-09-26 17:08:02.180632	{"Endpoints": ["ActionLog"]}	date_max
23	{"ActionLog": ["Index Response"]}	{"APIText": "This is an Array containing any ActionLog entries found for the Index request - [moxi_works_action_log_id, type, timestamp, log_data].", "Products": ["API"], "ActionLog": ["API"]}	2024-09-27 00:07:52.878773	2024-09-26 17:08:02.180632	{"Endpoints": ["ActionLog"]}	actions
25	{"Agent": ["Create Request"]}	{"Agent": ["API", "Engage"], "APIText": "Whether to include agent’s GCI goals and commissions data in the response data.", "Products": ["API", "Engage"], "EngageText": "This represents the Gross Commission Income goal, as seen throughout the Engage UI."}	2024-09-27 00:07:52.884498	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent", "Agent"]}	include_gci_goals
146	{"BuyerTransaction": ["Update Request"]}	{"APIText": "If this is set to true then The MoxiWorks Platform will promote this transaction to the next stage.", "Products": ["API"], "BuyerTransaction": ["API"]}	2024-09-27 00:07:53.17567	2024-09-26 17:08:28.074908	{"Endpoints": ["BuyerTransaction"]}	promote_transaction
78	{"Agent": ["Create Response"]}	{"Agent": ["Engage"], "Products": ["Engage"], "EngageText": "This is the agent’s Gross Commission Income goal, as seen throughout the Engage UI."}	2024-09-27 00:07:52.980404	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	gci_goal
79	{"Agent": ["Create Response"]}	{"Agent": ["Roster"], "Products": ["Roster"], "RosterText": "Percentage commission rate for the agent when acting as a buyer’s agent."}	2024-09-27 00:07:52.982151	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	buyer_commission_rate
80	{"Agent": ["Create Response"]}	{"Agent": ["Roster"], "Products": ["Roster"], "RosterText": "Percentage commission rate for the agent when acting as a seller’s agent."}	2024-09-27 00:07:52.98398	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	seller_commission_rate
27	{"Agent": ["Create Request", "Index Request"]}	{"Agent": ["API", "Roster"], "APIText": "To include ratings and reviews associated with the agent in the response, pass true.", "Products": ["API", "Roster"], "RosterText": "Referencing external agent reviews from platforms such as Zillow and Testimonial Tree."}	2024-09-27 00:07:52.887875	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	include_reviews
72	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This will be null. Deprecated.", "Products": ["API"]}	2024-09-27 00:07:52.969979	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	google_plus
24	{"Agent": ["Create Request", "Index Request"]}	{"Agent": ["API", "Roster"], "APIText": "To include access level information for the agent in the response, pass true.", "Products": ["API", "Roster"], "RosterText": "The access level of the agent. This can return one of the possible access levels, as seen within the products and permissions page."}	2024-09-27 00:07:52.882853	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent", "Agent"]}	include_access_level
26	{"Agent": ["Create Request", "Index Request"]}	{"Agent": ["API"], "APIText": "To include affiliate data associated with the agent in the response, pass true.", "Products": ["API"]}	2024-09-27 00:07:52.886227	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	include_partners
92	{"Agent": ["Index Request"]}	{"Agent": ["API"], "APIText": "Any Agent objects updated after this Unix timestamp will be returned in the response. If no updated_since parameter is included in the request, by default only Agent objects updated in the last seven days will be returned.", "Products": ["API"]}	2024-09-27 00:07:53.007685	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	updated_since
94	{"Agent": ["Index Request"]}	{"Agent": ["API"], "APIText": "To find Agent accounts deactivated within the specified timeframe, pass true for this boolean parameter.", "Products": ["API"]}	2024-09-27 00:07:53.012199	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	deactivated
96	{"Agent": ["Index Request"]}	{"Agent": ["API"], "APIText": "To include company specific programs associated with the agent in the response, pass true.", "Products": ["API"]}	2024-09-27 00:07:53.01653	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	include_company_programs
98	{"Agent": ["Index Request"]}	{"Agent": ["API"], "APIText": "To include only Agent objects associated with company specific programs pass true.", "Products": ["API"]}	2024-09-27 00:07:53.020299	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	has_company_programs
100	{"Agent": ["Index Request"]}	{"Agent": ["API", "Roster"], "APIText": "To include bio associated with the agent in the response, pass true.", "Products": ["API", "Roster"], "RosterText": "This references the bio of the agent, as seen on the about me > web info page."}	2024-09-27 00:07:53.024272	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	include_bio
97	{"Agent": ["Index Request"]}	{"Agent": ["API", "Websites"], "APIText": "To include the base url (website_base_url) of the agent’s MoxiWorks website pass true.", "Products": ["API", "Websites"], "WebsitesText": "This references the website url for the agent."}	2024-09-27 00:07:53.018429	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	include_website
95	{"Agent": ["Index Request"]}	{"Agent": ["API"], "APIText": "Any Agent objects deactivated after this Unix timestamp will be returned in the response. If no deactivated_since parameter is included in the request, only Agent objects deactivated in the last seven days will be returned.", "Products": ["API"]}	2024-09-27 00:07:53.014071	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	deactivated_since
51	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "The last name of the agent."}	2024-09-27 00:07:52.931714	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	last_name
52	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "The nickname of the agent."}	2024-09-27 00:07:52.933491	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	nickname
53	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "This is the agent’s main phone number. This number should be considered the number the agent would like to be contacted by."}	2024-09-27 00:07:52.935255	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	main_phone_number
54	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Mobile phone number of the agent. main_phone_number should be considered higher priority, if not the same."}	2024-09-27 00:07:52.936956	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	mobile_phone_number
28	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the ID of the Agent, as utilized by their brokerage or company.", "Products": ["API"]}	2024-09-27 00:07:52.889997	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	client_agent_id
50	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "The first name of the agent."}	2024-09-27 00:07:52.929963	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	first_name
29	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is the ID of the Agent utilized by their primary MLS. This ID allows listings to associate with the User Account.", "Products": ["API", "Roster"], "RosterText": "This ID can be found on the Manage MLS Associations page of the Agent or other User Account."}	2024-09-27 00:07:52.891808	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	mls_agent_id
30	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the number of the license granted to the agent. Please see mls_agent_id for the Agent MLS ID value.", "Products": ["API"]}	2024-09-27 00:07:52.89346	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	license
31	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is the name of the primary MLS for the agent.", "Products": ["API", "Roster"], "RosterText": "This name can be found on the Manage MLS Associations page of the Agent or other User Account."}	2024-09-27 00:07:52.89561	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	mls_name
32	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the standard abbreviation of the primary MLS utilized by the agent.", "Products": ["API"]}	2024-09-27 00:07:52.897498	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	mls_abbreviation
33	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the ID of this Agent. This will be an integer.", "Products": ["API"]}	2024-09-27 00:07:52.899355	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	agent_id
36	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the ID of the office for this Agent. This will be an integer.", "Products": ["API"]}	2024-09-27 00:07:52.90468	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	client_office_id
37	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the ID of the company for this Agent. This will be an integer.", "Products": ["API"]}	2024-09-27 00:07:52.906415	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	company_id
38	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the ID of the Company utilized by their brokerage or company.", "Products": ["API"]}	2024-09-27 00:07:52.908155	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	client_company_id
39	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is the main associated physical street address where the office is located. It can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Displays under the associated office page."}	2024-09-27 00:07:52.909909	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	office_address_street
40	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is the main associated secondary physical street address field, often populated with a suite or office number. This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Displays under the associated office page."}	2024-09-27 00:07:52.911588	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	office_address_street2
41	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "The city where the office is located, as associated with the physical address. This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Displays under the associated office page."}	2024-09-27 00:07:52.913371	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	office_address_city
42	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "The state where the office is located, as associated with the physical address. This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Displays under the associated office page."}	2024-09-27 00:07:52.915195	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	office_address_state
43	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "The postal code associated with the office physical address. This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Displays under the associated office page."}	2024-09-27 00:07:52.917275	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	office_address_zip
44	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the associated mailing address where the office is located. It can be null if there is no data for this attribute.", "Products": ["API"]}	2024-09-27 00:07:52.91897	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	office_mailing_address_street
45	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the associated secondary mailing street address field, often populated with a suite or office number. This can be null if there is no data for this attribute.", "Products": ["API"]}	2024-09-27 00:07:52.920856	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	office_mailing_address_street2
46	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "The city where the office receives mail, as associated with the mailing address. This can be null if there is no data for this attribute.", "Products": ["API"]}	2024-09-27 00:07:52.922697	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	office_mailing_address_city
47	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "The state where the office receives mail, as associated with the mailing address. This can be null if there is no data for this attribute.", "Products": ["API"]}	2024-09-27 00:07:52.924545	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	office_mailing_address_state
48	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "The postal code associated with the office mailing address. This can be null if there is no data for this attribute.", "Products": ["API"]}	2024-09-27 00:07:52.926401	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	office_mailing_address_zip
55	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Alternate phone number for the agent. This should be considered second in priority to main_phone_number."}	2024-09-27 00:07:52.938769	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	alt_phone_number
56	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "This is the agent’s fax phone number."}	2024-09-27 00:07:52.940831	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	fax_phone_number
57	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "This is the agent’s office phone number."}	2024-09-27 00:07:52.942686	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	office_phone_number
58	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "This is the agent’s main email address. This email address should be considered the email address the agent would prefer to be contacted by."}	2024-09-27 00:07:52.94436	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	primary_email_address
59	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "This is the agent’s alternate email address. This email address should be considered the email address the agent would want to be contacted by only if the address in primary_email_address is not functional."}	2024-09-27 00:07:52.946181	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	secondary_email_address
61	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Engage"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Engage"], "EngageText": "This is the agent’s lead routing email address. This can be null if there is no data for this attribute."}	2024-09-27 00:07:52.949742	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	lead_routing_email_address
7	{"Agent": ["Create Response", "Index Response"], "ActionLog": ["Create Request", "Create Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "ActionLog", "Roster"], "ActionLog": ["ActionLog"], "RosterText": "This is the business title of the agent.", "ActionLogText": "This is the human readable plain-text string which will be presented to the Agent as the heading of the ActionLog entry. This can be any short, descriptive sentence which would be practical for the agent to see in the history of events associated with a Contact."}	2024-09-27 00:07:52.836594	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	title
62	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "Array of key/value pairs. Each has a body and header, both strings, which can be null or blank.", "Products": ["API", "Roster"], "RosterText": "This is the bio of the agent, as seen on the about me > web info page."}	2024-09-27 00:07:52.951906	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	bio
63	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is a string that contains the agent’s designation(s), if any. This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": ""}	2024-09-27 00:07:52.953632	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	designations
64	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is an RFC 4122 compliant UUID. This UUID can be used as a unique identifier in determining associations between Agent objects and Listing objects.", "Products": ["API", "Roster"], "RosterText": "Displays within the about me section."}	2024-09-27 00:07:52.955365	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	uuid
65	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "Indicates whether the agent has access to MoxiWorks Products.", "Products": ["API", "Roster"], "RosterText": "Referring to each individual Moxi product offered, such as Engage, Present, Impress etc."}	2024-09-27 00:07:52.9571	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	has_product_access
66	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Engage"], "APIText": "Indicates whether the agent has access to MoxiWorks Engage Product.", "Products": ["API", "Engage"], "EngageText": "Referencing the agent’s ability to access Engage as a product."}	2024-09-27 00:07:52.958854	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	has_engage_access
67	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "If include_access_level was passed as true, this can return one of the possible access levels.", "Products": ["API", "Roster"], "RosterText": "Related to the products and permissions page, specific to user account permissions section."}	2024-09-27 00:07:52.960585	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	access_level
68	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This will return one of the possible view levels.", "Products": ["API", "Roster"], "RosterText": "The view level of the agent."}	2024-09-27 00:07:52.962373	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	view_level
69	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "The teams array contains Dictionary objects representing Team entries. These include [name, uuid, member_category].", "Products": ["API", "Roster"], "RosterText": "Related to Agent Teams, within My Account section."}	2024-09-27 00:07:52.964432	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	teams
70	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["Roster", "Websites"], "Products": ["Roster", "Websites"], "RosterText": "Seen within About Me > Web Info.", "WebsitesText": "The base url of the agent’s MoxiWorks agent website."}	2024-09-27 00:07:52.966299	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	website_base_url
71	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data available for this attribute.", "Products": ["API", "Roster"], "RosterText": "Agent’s Twitter URL. Seen within About Me > Web Info."}	2024-09-27 00:07:52.968149	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	twitter
73	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data available for this attribute.", "Products": ["API", "Roster"], "RosterText": "Agent’s Facebook page url. Seen within About Me > Web Info."}	2024-09-27 00:07:52.971741	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	facebook
74	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Websites"], "APIText": "You’ll need to prefix the domain with protocol if using this attribute for an href. This can be null if there is no data available for this attribute.", "Products": ["API", "Websites"], "WebsitesText": "Agent’s website domain. This will be returned without the HTTP(S) prefix."}	2024-09-27 00:07:52.973489	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	home_page
75	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is a valid URL for a larger size image for the agent. If no agent image has been uploaded for this agent a default image url will be provided.", "Products": ["API", "Roster"], "RosterText": "Agent’s associated profile image within About Me section."}	2024-09-27 00:07:52.975159	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	profile_image_url
76	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is a valid URL for a thumbnail size image for the agent. If no agent image has been uploaded for this agent a default image url will be provided.", "Products": ["API", "Roster"], "RosterText": "Agent’s associated profile image within About Me section, thumbnail."}	2024-09-27 00:07:52.976911	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	profile_thumb_url
77	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "The region the agent’s office is in."}	2024-09-27 00:07:52.978653	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	region
81	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["Engage"], "Products": ["Engage"], "EngageText": "A list of the lead service area zip codes covered by the agent."}	2024-09-27 00:07:52.985709	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	service_area_zip_codes
82	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["Websites"], "Products": ["Websites"], "WebsitesText": "This includes the base_url and bio_page_slug of the agent MoxiWorks website."}	2024-09-27 00:07:52.987798	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	agent_website
83	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "The alternate_offices array contains Dictionary objects representing AlternateOffice entries. These include [moxi_works_office_id, office_id, office_address_street, office_address_street2, office_address_city, office_address_state, office_address_zip, office_phone_number].", "Products": ["API", "Roster"], "RosterText": "Agent’s alternate offices, as seen within the additional offices page."}	2024-09-27 00:07:52.990345	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	alternate_offices
84	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "The available_mls Array contains Dictionary objects representing MLS entries. These include [name, display_name, mls_abbreviation, agent_id].", "Products": ["API", "Roster"], "RosterText": "Agent’s alternate offices, as seen within the additional offices page."}	2024-09-27 00:07:52.992187	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	available_mls
85	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "Existence of objects in the partners data structure is dependent upon external relationships existing between the agent represented by this Agent and the affiliate. Documented entities in the `partners` data structure may or may not be returned based on agent relationship. Your logic should be engineered to handle cases where the entity you are interested in is returned and where an empty data structure is returned.", "Products": ["API"]}	2024-09-27 00:07:52.994019	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	partners
86	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "A list of the company specific program names in which the agent participates or is a member.", "Products": ["API"]}	2024-09-27 00:07:52.995795	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	company_programs
87	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "A list of the source-specific user identifiers.", "Products": ["API"]}	2024-09-27 00:07:52.997544	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	source_metadata
88	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the Unix timestamp representing the date that this Agent was created in the MoxiWorks system.", "Products": ["API"]}	2024-09-27 00:07:52.999273	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	created_timestamp
90	{"Agent": ["Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "True corresponds to Yes (visible online); false corresponds to No (not visible online).", "Products": ["API", "Roster"], "RosterText": "Indicates the “Profile Visible Online” value for this Agent."}	2024-09-27 00:07:53.002803	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	profile_visible_online
91	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "Existence of objects in the user_reviews data structure is dependent upon external sources, i.e. Zillow, Testimonial Tree. Documented entities in the `user_reviews` data structure may or may not be returned when `include_reviews=true` is passed. Your logic should be engineered to handle cases where the entity you are interested in is returned and where an empty data structure is returned. Included in this - [source_name, agg_rating, reviews_count]", "Products": ["API", "Roster"], "RosterText": "External agent reviews from platforms such as Zillow and Testimonial Tree."}	2024-09-27 00:07:53.004556	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	user_reviews
60	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "The email_addresses Hash is a Dictionary object holding the email addresses associated with the Agent record. These include [primary, display, alternate, moxi_sync, lead_routing, zillow].", "Products": ["API", "Roster"], "RosterText": "Some of these will display on the About Me section, including primary, display, moxi sync."}	2024-09-27 00:07:52.94799	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	email_addresses
89	{"Agent": ["Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is the Unix timestamp representing the date that this Agent was deactivated in the MoxiWorks system. This will be returned null if the agent is still active.This is the Unix timestamp representing the date that this Agent was deactivated in the MoxiWorks system. This will be returned null if the agent is still active.", "Products": ["API", "Roster"], "RosterText": "Will display within Account Info section if user account is deactivated."}	2024-09-27 00:07:53.00104	2024-09-26 17:08:11.080557	{"Endpoints": ["Agent"]}	deactivated_timestamp
101	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Present"], "Products": ["Present"], "PresentText": "This is the logo associated with the Brokerage or Company."}	2024-09-27 00:07:53.054024	2024-09-26 17:08:18.39324	{"Endpoints": ["Brand"]}	image_logo
105	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Present"], "Products": ["Present"], "PresentText": "Within a Presentation, this is the background color of associated buttons."}	2024-09-27 00:07:53.061489	2024-09-26 17:08:18.39324	{"Endpoints": ["Brand"]}	button_background_color
35	{"Agent": ["Create Response", "Index Response"], "Brand": ["Index Request"]}	{"Agent": ["API"], "Brand": ["API", "Roster"], "APIText": "This is the ID of the office for this Agent. This will be an integer.", "Products": ["API"]}	2024-09-27 00:07:52.902956	2024-09-26 17:08:18.39324	{"Endpoints": ["Agent", "Brand"]}	office_id
34	{"Agent": ["Create Response", "Index Request", "Index Response"], "Brand": ["Index Request"]}	{"Agent": ["API", "Roster"], "Brand": ["API", "Roster"], "APIText": "This will be an RFC 4122 compliant UUID.", "Products": ["API", "Roster"], "RosterText": "This is the MoxiWorks Platform ID of the office for this Agent."}	2024-09-27 00:07:52.901197	2024-09-26 17:08:18.39324	{"Endpoints": ["Agent", "Brand"]}	moxi_works_office_id
102	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "Accent color.", "Products": ["API", "Present"], "PresentText": "Within a Presentation, this will be the accent color."}	2024-09-27 00:07:53.055852	2024-09-26 17:08:18.39324	{"Endpoints": ["Brand"]}	cma_authoring_color
103	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Present"], "Products": ["Present"], "PresentText": "Within a Presentation, this will be the background color of a page."}	2024-09-27 00:07:53.057481	2024-09-26 17:08:18.39324	{"Endpoints": ["Brand"]}	background_color
104	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Present"], "Products": ["Present"], "PresentText": "Within a Presentation, this is the font color intended to overlay the background_color attribute."}	2024-09-27 00:07:53.059581	2024-09-26 17:08:18.39324	{"Endpoints": ["Brand"]}	background_font_color_primary
106	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Present"], "Products": ["Present"], "PresentText": "Within a Presentation, this is the font color intended to overlay the button_background_color attribute."}	2024-09-27 00:07:53.063327	2024-09-26 17:08:18.39324	{"Endpoints": ["Brand"]}	button_font_color
107	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "This attribute may contain embedded HTML.", "Products": ["API", "Present"], "PresentText": "Within a Presentation, this will be the copyright notice information."}	2024-09-27 00:07:53.065188	2024-09-26 17:08:18.39324	{"Endpoints": ["Brand"]}	copyright
108	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "Relates to the Brokerage or Company name.", "Products": ["API", "Present"], "PresentText": "Within a Presentation, this is the name of the Brokerage or Company as displayed to the consumer."}	2024-09-27 00:07:53.066985	2024-09-26 17:08:18.39324	{"Endpoints": ["Brand"]}	display_name
109	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Engage"], "APIText": "This is specific to the background color that displays when sending an email from Present.", "Products": ["API", "Engage"], "EngageText": "Background color of sent email elements outside of the email body."}	2024-09-27 00:07:53.068771	2024-09-26 17:08:18.39324	{"Endpoints": ["Brand"]}	email_element_background_color
110	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Engage"], "APIText": "Font color intended to overlay email_element_background_color?", "Products": ["API", "Engage"], "EngageText": "The font color for font that overlays email_element_background_color?"}	2024-09-27 00:07:53.070464	2024-09-26 17:08:18.39324	{"Endpoints": ["Brand"]}	email_background_font_color
111	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "Brokerage or Company logo shown in Print (PDF) Presentations.", "Products": ["API", "Present"], "PresentText": "Within a Presentation - specifically Print (PDF) format, this will be the Brokerage or Company logo that displays."}	2024-09-27 00:07:53.072234	2024-09-26 17:08:18.39324	{"Endpoints": ["Brand"]}	image_cma_pdf_logo_header
112	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Engage"], "Products": ["Engage"], "EngageText": "Related to sent emails, this will be the Brokerage or Company logo as shown in email header."}	2024-09-27 00:07:53.073996	2024-09-26 17:08:18.39324	{"Endpoints": ["Brand"]}	image_email_logo_alt
113	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Present", "Websites"], "Products": ["Present", "Websites"], "PresentText": "Within a presentation, this will be the favicon that displays related to the Brokerage or Company.", "WebsitesText": "Favicon of Brokerage or Company."}	2024-09-27 00:07:53.07578	2024-09-26 17:08:18.39324	{"Endpoints": ["Brand"]}	image_favicon
114	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "Brokerage or Company logo for web view presentations.", "Products": ["API", "Present"], "PresentText": "Within a Presentation - specifically web view, this will be the Brokerage or Company logo."}	2024-09-27 00:07:53.077558	2024-09-26 17:08:18.39324	{"Endpoints": ["Brand"]}	image_pres_cover_logo
115	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "Block element background color for web view presentations.", "Products": ["API", "Present"], "PresentText": "Within a Presentation - specifically web view, this is the background color that displays."}	2024-09-27 00:07:53.079434	2024-09-26 17:08:18.39324	{"Endpoints": ["Brand"]}	pres_block_background_color
116	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "Font color intended to overlay pres_block_background_color attribute.", "Products": ["API", "Present"], "PresentText": "Within a Presentation - specifically web view, this is the font color for related text."}	2024-09-27 00:07:53.081124	2024-09-26 17:08:18.39324	{"Endpoints": ["Brand"]}	pres_block_text_color
49	{"Agent": ["Create Response", "Index Response"], "Brand": ["Index Response"]}	{"Agent": ["API", "Roster"], "Brand": ["Present"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Present", "Roster"], "RosterText": "The full name of the agent.", "PresentText": "This will be the name that displays related to the associated Brand."}	2024-09-27 00:07:52.928182	2024-09-26 17:08:18.39324	{"Endpoints": ["Brand"]}	name
8	{"Agent": ["Create Request", "Index Request"], "Brand": ["Show Request", "Index Request"], "ActionLog": ["Create Request", "Delete Request", "Index Request"], "BuyerTransaction": ["Create Request", "Update Request", "Show Request", "Index Request"]}	{"Agent": ["API", "Roster"], "Brand": ["API", "Roster"], "APIText": "MoxiWorks Plaform Company entities are your entry-point for determining the established relationships for your organization to companies on the MoxiWorks Platform and for accessing data about those companies. Many requests require a moxi_works_company_id, which can be derived from the Company Index endpoint.", "Products": ["API", "Roster"], "ActionLog": ["API", "Roster"], "RosterText": "", "BuyerTransaction": ["API", "Roster"]}	2024-09-27 00:07:52.838337	2024-09-26 17:08:28.074908	{"Endpoints": ["ActionLog", "Agent", "Brand", "Brand", "BuyerTransaction"]}	moxi_works_company_id
9	{"Agent": ["Create Request", "Index Request"], "Brand": ["Show Request", "Index Request"], "ActionLog": ["Create Request", "Delete Request", "Index Request"], "BuyerTransaction": ["Create Request", "Update Request", "Show Request", "Index Request"]}	{"Agent": ["API", "Roster"], "Brand": ["API", "Roster"], "APIText": "This provides for a broad scope by which partners may be afforded permissions to perform MoxiWorks Platform actions, in scenarios where a partner does business with a parent company in the MoxiWorks System. It also provides broad scope under which agents may be looked up using the source_agent_id request attribute in many scenarios across different MoxiWorks Platform endpoints and actions.", "Products": ["API", "Roster"], "ActionLog": ["API", "Roster"], "RosterText": "This is the numeric_id or moxi_works_company_id of a company that is considered to be a parent company in the MoxiWorks Platform.", "BuyerTransaction": ["API", "Roster"]}	2024-09-27 00:07:52.840265	2024-09-26 17:08:28.074908	{"Endpoints": ["ActionLog", "Agent", "Brand", "Brand", "BuyerTransaction"]}	parent_company_id
3	{"Agent": ["Create Request"], "Brand": ["Index Request"], "ActionLog": ["Create Request", "Delete Request", "Index Request"], "BuyerTransaction": ["Create Request", "Update Request", "Show Request", "Index Request"]}	{"Agent": ["API"], "Brand": ["API"], "APIText": "If you have access to agent data from the same company source that MoxiWorks uses as an upstream data source then you should use the source_agent_id request attribute. This identifier will be unique only within the scope of a given company or parent_company, and must be used in conjunction with the moxi_works_company_id or parent_company_id request attributes. Please email partners@moxiworks.com for clarification about this request attribute.", "Products": ["API"], "ActionLog": ["API"]}	2024-09-27 00:07:52.829111	2024-09-26 17:08:28.074908	{"Endpoints": ["ActionLog", "Agent", "Brand", "BuyerTransaction"]}	source_agent_id
93	{"Agent": ["Index Request"], "BuyerTransaction": ["Index Request"]}	{"Agent": ["API"], "APIText": "For queries with multi-page responses, use the page_number parameter to return data for specific pages. Data for page 1 is returned if this parameter is not included. Use this parameter if total_pages indicates that there is more than one page of data available.", "Products": ["API"]}	2024-09-27 00:07:53.009692	2024-09-26 17:08:28.074908	{"Endpoints": ["Agent"]}	page_number
99	{"Agent": ["Index Request"], "BuyerTransaction": ["Index Request"]}	{"Agent": ["API"], "APIText": "If supplied then the results will exclude all data except primary identifiers and a unix timestamp (last_updated) & iso8601 timestamp (modification_timestamp) of the last time this record was updated.", "Products": ["API"]}	2024-09-27 00:07:53.022498	2024-09-26 17:08:28.074908	{"Endpoints": ["Agent"]}	timestamps_only
120	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This should be populated if this BuyerTransaction is_mls_transaction is false.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this will be the city or township of the property being purchased.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 00:07:53.101699	2024-09-26 17:08:28.074908	{"Endpoints": ["BuyerTransaction"]}	city
126	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the maximum number of bedrooms for prospective properties.", "BuyerTransaction": ["Engage"]}	2024-09-27 00:07:53.112993	2024-09-26 17:08:28.074908	{"Endpoints": ["BuyerTransaction"]}	max_beds
136	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Show Response", "Index Response"]}	{"APIText": "If payment for the transaction is based on a flat fee derived from sales volume, use this attribute.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, the total commission for the transaction based on percentage of purchase price.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 00:07:53.131259	2024-09-26 17:08:28.074908	{"Endpoints": ["BuyerTransaction"]}	sales_volume_flat_fee
135	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Show Response", "Index Response"]}	{"APIText": "If the payment for the transaction is based on percentage of sales volume, use this attribute.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, the total commission for the transaction based on sales volume percentage.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 00:07:53.129355	2024-09-26 17:08:28.074908	{"Endpoints": ["BuyerTransaction"]}	sales_volume_percentage
137	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "The desired purchase price for a property if using target rather than range.", "BuyerTransaction": ["Engage"]}	2024-09-27 00:07:53.133125	2024-09-26 17:08:28.074908	{"Endpoints": ["BuyerTransaction"]}	target_price
140	{"BuyerTransaction": ["Create Request", "Create Response", "Update Response", "Show Response", "Index Response"]}	{"APIText": "The stage that the BuyerTransaction should be placed into.", "Products": ["API"], "BuyerTransaction": ["API"]}	2024-09-27 00:07:53.138602	2024-09-26 17:08:28.074908	{"Endpoints": ["BuyerTransaction"]}	stage
145	{"BuyerTransaction": ["Create Response", "Update Response", "Show Response", "Index Response"]}	{"APIText": "The stage that the BuyerTransaction should be placed into.", "Products": ["API"], "BuyerTransaction": ["API"]}	2024-09-27 00:07:53.160361	2024-09-26 17:08:28.074908	{"Endpoints": ["BuyerTransaction"]}	state_changed_at
129	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the name of a locality representing an area of interest for prospective properties.", "BuyerTransaction": ["Engage"]}	2024-09-27 00:07:53.118328	2024-09-26 17:08:28.074908	{"Endpoints": ["BuyerTransaction"]}	area_of_interest
142	{"BuyerTransaction": ["Create Response", "Update Response", "Show Response", "Index Response"]}	{"APIText": "When created through the MoxiWorks Platform, BuyerTransaction objects will automatically be configured as active transactions. For more information about BuyerTransaction stages, see the MoxiCloud documentation, specific to BuyerTransaction Stages.", "Products": ["API", "Engage"], "EngageText": "For Buyer Transactions, this attribute displays the name or title that is associated with the current stage of the transaction.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 00:07:53.145144	2024-09-26 17:08:28.074908	{"Endpoints": ["BuyerTransaction"]}	stage_name
118	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "Brief, human readable content that will be shown to the agent as notes about the BuyerTransaction that you are creating.", "Products": ["API", "Engage"], "EngageText": "For Buyer Transactions, these will be the related notes.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 00:07:53.098185	2024-09-26 17:08:28.074908	{"Endpoints": ["BuyerTransaction"]}	notes
119	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This should be populated if this BuyerTransaction is_mls_transaction is false.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this is the street address of the property being purchased.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 00:07:53.099975	2024-09-26 17:08:28.074908	{"Endpoints": ["BuyerTransaction"]}	address
139	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "The maximum price range for a property if using a price range rather than target price.", "BuyerTransaction": ["Engage"]}	2024-09-27 00:07:53.136775	2024-09-26 17:08:28.074908	{"Endpoints": ["BuyerTransaction"]}	max_price
117	{"BuyerTransaction": ["Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "A brief, human readable title that will be shown to the agent as the subject of the BuyerTransaction that you are creating.", "Products": ["API", "Engage"], "EngageText": "For Buyer Transactions, this will be the name or title of the transaction in question.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 00:07:53.095727	2024-09-26 17:08:28.074908	{"Endpoints": ["BuyerTransaction"]}	transaction_name
121	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This should be populated if this BuyerTransaction is_mls_transaction is false.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this will be the state or province of the property being purchased.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 00:07:53.103511	2024-09-26 17:08:28.074908	{"Endpoints": ["BuyerTransaction"]}	state
122	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This should be populated if this BuyerTransaction is_mls_transaction is false.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this will be the postal code of the property being purchased.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 00:07:53.105651	2024-09-26 17:08:28.074908	{"Endpoints": ["BuyerTransaction"]}	zip_code
123	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the minimum desired living area for prospective properties.", "BuyerTransaction": ["Engage"]}	2024-09-27 00:07:53.107569	2024-09-26 17:08:28.074908	{"Endpoints": ["BuyerTransaction"]}	min_sqft
124	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the maximum desired living area for prospective properties.", "BuyerTransaction": ["Engage"]}	2024-09-27 00:07:53.109296	2024-09-26 17:08:28.074908	{"Endpoints": ["BuyerTransaction"]}	max_sqft
125	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the minimum number of bedrooms for prospective properties.", "BuyerTransaction": ["Engage"]}	2024-09-27 00:07:53.111141	2024-09-26 17:08:28.074908	{"Endpoints": ["BuyerTransaction"]}	min_beds
127	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the minimum number of bathrooms for prospective properties.", "BuyerTransaction": ["Engage"]}	2024-09-27 00:07:53.114799	2024-09-26 17:08:28.074908	{"Endpoints": ["BuyerTransaction"]}	min_baths
128	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the maximum number of bathrooms for prospective properties.", "BuyerTransaction": ["Engage"]}	2024-09-27 00:07:53.116545	2024-09-26 17:08:28.074908	{"Endpoints": ["BuyerTransaction"]}	max_baths
130	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This should be false for paperwork-only, for sale by owner, off-market, or pocket listing type transactions or any transactions that will not be tracked through an MLS.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this attribute indictates whether the property being purchased is listed on an MLS.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 00:07:53.120109	2024-09-26 17:08:28.074908	{"Endpoints": ["BuyerTransaction"]}	is_mls_transaction
131	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "mls_number should be populated only if is_mls_transaction is true. If no commission (either commission_percentage or commission_flat_fee) is supplied during creation, commission_percentage is set to the default commission_percentage for the associated Agent.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, the MLS number of the the property being purchased.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 00:07:53.121875	2024-09-26 17:08:28.074908	{"Endpoints": ["BuyerTransaction"]}	mls_number
132	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This is the Unix timestamp representing the date that the agent initiated transaction discussions with the client.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this would be considered the date and time when the Agent first initiated transaction discussions with the client.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 00:07:53.123671	2024-09-26 17:08:28.074908	{"Endpoints": ["BuyerTransaction"]}	start_timestamp
134	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "If the commission for the transaction is based on a flat dollar amount, use this attribute.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this is the dollar amount of the total commission for the transaction.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 00:07:53.127258	2024-09-26 17:08:28.074908	{"Endpoints": ["BuyerTransaction"]}	commission_flat_fee
133	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "If the commission for the transaction is based on a percentage of the purchase amount, use this attribute. If no commission (either commission_percentage or commission_flat_fee) is supplied during creation, commission_percentage is set to the default commission_percentage for the associated Agent.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, the total commission for the transaction based on this percentage of the purchase price.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 00:07:53.125434	2024-09-26 17:08:28.074908	{"Endpoints": ["BuyerTransaction"]}	commission_percentage
138	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "The minimum price range for a property if using a price range rather than target price.", "BuyerTransaction": ["Engage"]}	2024-09-27 00:07:53.134839	2024-09-26 17:08:28.074908	{"Endpoints": ["BuyerTransaction"]}	min_price
143	{"BuyerTransaction": ["Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This should be null if the BuyerTransaction is not yet in complete state.", "Products": ["API", "Engage"], "EngageText": "This is the closing price for the transaction.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 00:07:53.156664	2024-09-26 17:08:28.074908	{"Endpoints": ["BuyerTransaction"]}	closing_price
144	{"BuyerTransaction": ["Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "A Unix timestamp. This should be null if the BuyerTransaction is not yet in complete state.", "Products": ["API", "Engage"], "EngageText": "For a Buyer Transaction, this represents the point in time when the transaction was completed.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 00:07:53.158523	2024-09-26 17:08:28.074908	{"Endpoints": ["BuyerTransaction"]}	closing_timestamp
141	{"BuyerTransaction": ["Create Response", "Update Request", "Update Response", "Show Request", "Show Response", "Index Response"]}	{"APIText": "This is the MoxiWorks Platform ID of the BuyerTransaction which you have created. This will be an RFC 4122 compliant UUID. This ID should be recorded on response as it is the key ID for updating the BuyerTransaction.", "Products": ["API"], "BuyerTransaction": ["API"]}	2024-09-27 00:07:53.141237	2024-09-26 17:08:28.074908	{"Endpoints": ["BuyerTransaction"]}	moxi_works_transaction_id
5	{"ActionLog": ["Create Request", "Create Response", "Index Request", "Index Response"], "BuyerTransaction": ["Create Request", "Create Response", "Update Response", "Show Response", "Index Request", "Index Response"]}	{"APIText": "This will be an RFC 4122 compliant UUID, and is the same as the moxi_works_contact_id attribute of the Contact response.", "Products": ["API", "ActionLog"], "ActionLog": ["API", "ActionLog"], "ActionLogText": "This is the MoxiWorks Platform ID of a Contact an ActionLog object is to be associated with. This data is required and must reference a valid MoxiWorks Contact ID for your ActionLog Create request to be accepted."}	2024-09-27 00:07:52.832877	2024-09-26 17:08:28.074908	{"Endpoints": ["ActionLog", "BuyerTransaction"]}	moxi_works_contact_id
6	{"ActionLog": ["Create Request", "Create Response", "Index Request", "Index Response"], "BuyerTransaction": ["Create Request", "Create Response", "Update Response", "Show Response", "Index Request", "Index Response"]}	{"APIText": "This is the unique identifer used in the system that will be connecting to the MoxiWorks platform.", "Products": ["API", "ActionLog"], "ActionLog": ["API", "ActionLog"], "ActionLogText": "This UUID will have already been associated with the Contact the ActionLog entry is created about. The Contact record on the MoxiWorks Platform can be created as necessary using Contact Create before attempting to use this contact ID to create an ActionLog entry. Failure to do so will result in the request being rejected."}	2024-09-27 00:07:52.834836	2024-09-26 17:08:28.074908	{"Endpoints": ["ActionLog", "BuyerTransaction"]}	partner_contact_id
2	{"Agent": ["Create Request", "Create Response", "Index Response"], "Brand": ["Index Request"], "ActionLog": ["Create Request", "Create Response", "Delete Request", "Index Request", "Index Response"], "BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Request", "Show Response", "Index Request", "Index Response"]}	{"Agent": ["API", "Roster"], "Brand": ["API", "Roster"], "APIText": "If you have already existing agent data, agent accounts and your own user interface that agents can use to integrate your account with their MoxiWorks Platform account then you should use the moxi_works_agent_id request attribute. It is intended for use cases where integration is managed by end-user interaction.", "Products": ["API", "Roster"], "ActionLog": ["API", "Roster"], "RosterText": "This identifier is guaranteed to be unique, but may be either an alphanumeric string or an email address.", "BuyerTransaction": ["API", "Roster"]}	2024-09-27 00:07:52.826913	2024-09-26 17:08:28.074908	{"Endpoints": ["ActionLog", "Agent", "Brand", "BuyerTransaction"]}	moxi_works_agent_id
1	{"Agent": ["Create Request"], "Brand": ["Index Request"], "ActionLog": ["Create Request", "Create Response", "Delete Request", "Index Request", "Index Response"], "BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Request", "Show Response", "Index Request", "Index Response"]}	{"Agent": ["API", "Roster"], "Brand": ["API", "Roster"], "APIText": "This will be an RFC 4122 compliant UUID. If data is being pulled from The MoxiWorks Platform and integrating with your own system in a managed or automated fashion, then using agent_uuid request attribute is preferable. It is guaranteed to be unique and to never change for the lifetime of the account.", "Products": ["API", "Roster"], "ActionLog": ["API", "Roster"], "RosterText": "Agent UUID, found on profile page within Roster/Client Manager and is the user account level UUID.", "BuyerTransaction": ["API", "Roster"]}	2024-09-27 00:07:52.824365	2024-09-26 17:08:28.074908	{"Endpoints": ["ActionLog", "Agent", "Brand", "BuyerTransaction"]}	agent_uuid
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

