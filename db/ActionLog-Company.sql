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
environment	development	2024-09-27 06:42:57.436883	2024-09-27 06:42:57.436886
\.


--
-- Data for Name: associated_attrs; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.associated_attrs (id, request_type, ui_info, created_at, updated_at, associated_endpoints, attr_title) FROM stdin;
85	{"Agent": ["Create Response", "Index Response"], "Company": ["Show Response"]}	{"Agent": ["API"], "APIText": "Existence of objects in the partners data structure is dependent upon external relationships existing between the agent represented by this Agent and the affiliate. Documented entities in the `partners` data structure may or may not be returned based on agent relationship. Your logic should be engineered to handle cases where the entity you are interested in is returned and where an empty data structure is returned.", "Company": ["Roster"], "Products": ["API", "Roster"], "RosterText": "Integrated partner data associated with this company."}	2024-09-27 06:43:02.22683	2024-09-26 23:44:40.012731	{"Endpoints": ["Company"]}	partners
8	{"Agent": ["Create Request", "Index Request"], "Brand": ["Show Request", "Index Request"], "Company": ["Show Request", "Show Response", "Index Response"], "ActionLog": ["Create Request", "Delete Request", "Index Request"], "BuyerTransaction": ["Create Request", "Update Request", "Show Request", "Index Request"]}	{"Agent": ["API", "Roster"], "Brand": ["API", "Roster"], "APIText": "MoxiWorks Plaform Company entities are your entry-point for determining the established relationships for your organization to companies on the MoxiWorks Platform and for accessing data about those companies. Many requests require a moxi_works_company_id, which can be derived from the Company Index endpoint.", "Company": ["API", "Roster"], "Products": ["API", "Roster"], "ActionLog": ["API", "Roster"], "RosterText": "", "BuyerTransaction": ["API", "Roster"]}	2024-09-27 06:43:01.822054	2024-09-26 23:44:40.012731	{"Endpoints": ["ActionLog", "Agent", "Brand", "BuyerTransaction", "Company"]}	moxi_works_company_id
93	{"Agent": ["Index Request"], "Company": ["Search Request"], "BuyerTransaction": ["Index Request"]}	{"Agent": ["API"], "APIText": "For queries with multi-page responses, use the page_number parameter to return data for specific pages. Data for page 1 is returned if this parameter is not included. Use this parameter if total_pages indicates that there is more than one page of data available.Page of companies records to return.", "Company": ["API"], "Products": ["API"]}	2024-09-27 06:43:02.268955	2024-09-26 23:44:40.012731	{"Endpoints": ["Company"]}	page_number
38	{"Agent": ["Create Response", "Index Response"], "Company": ["Show Response", "Index Response", "Search Response"]}	{"Agent": ["API"], "APIText": "This is the ID of the Company utilized by their brokerage or company.This is a client-specified identifier of the company which this Company object represents, or null if absent.", "Company": ["API"], "Products": ["API"]}	2024-09-27 06:43:02.003357	2024-09-26 23:44:40.012731	{"Endpoints": ["Company"]}	client_company_id
25	{"Agent": ["Create Request"]}	{"Agent": ["API", "Engage"], "APIText": "Whether to include agent’s GCI goals and commissions data in the response data.", "Products": ["API", "Engage"], "EngageText": "This represents the Gross Commission Income goal, as seen throughout the Engage UI."}	2024-09-27 06:43:01.938182	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	include_gci_goals
149	{"Company": ["Search Request"]}	{"APIText": "Number of companies records to return per page.", "Company": ["API"], "Products": ["API"]}	2024-09-27 06:43:02.754306	2024-09-26 23:44:40.012731	{"Endpoints": ["Company"]}	per_page
150	{"Company": ["Search Request"]}	{"APIText": "Page of companies records to return.", "Company": ["API"], "Products": ["API"]}	2024-09-27 06:43:02.760799	2024-09-26 23:44:40.012731	{"Endpoints": ["Company"]}	show_paging_totals
147	{"Company": ["Show Response", "Index Response", "Search Response"]}	{"APIText": "This is the numeric company id that is interchangeable with the moxi_works_agent_id in all request scenarios.", "Company": ["API"], "Products": ["API"]}	2024-09-27 06:43:02.737769	2024-09-26 23:44:40.012731	{"Endpoints": ["Company"]}	numeric_id
148	{"Company": ["Show Response", "Index Response", "Search Response"]}	{"APIText": "Exposed company attributes.", "Company": ["API"], "Products": ["API"]}	2024-09-27 06:43:02.744238	2024-09-26 23:44:40.012731	{"Endpoints": ["Company"]}	public_partner_attrs
9	{"Agent": ["Create Request", "Index Request"], "Brand": ["Show Request", "Index Request"], "Company": ["Search Request"], "ActionLog": ["Create Request", "Delete Request", "Index Request"], "BuyerTransaction": ["Create Request", "Update Request", "Show Request", "Index Request"]}	{"Agent": ["API", "Roster"], "Brand": ["API", "Roster"], "APIText": "This provides for a broad scope by which partners may be afforded permissions to perform MoxiWorks Platform actions, in scenarios where a partner does business with a parent company in the MoxiWorks System. It also provides broad scope under which agents may be looked up using the source_agent_id request attribute in many scenarios across different MoxiWorks Platform endpoints and actions.", "Company": ["API", "Roster"], "Products": ["API", "Roster"], "ActionLog": ["API", "Roster"], "RosterText": "This is the numeric_id or moxi_works_company_id of a company that is considered to be a parent company in the MoxiWorks Platform.", "BuyerTransaction": ["API", "Roster"]}	2024-09-27 06:43:01.828057	2024-09-26 23:44:40.012731	{"Endpoints": ["ActionLog", "Agent", "Brand", "BuyerTransaction", "Company"]}	parent_company_id
151	{}	{}	2024-09-27 06:43:02.772638	2024-09-27 06:43:02.772638	{}	contact_name
152	{}	{}	2024-09-27 06:43:02.778471	2024-09-27 06:43:02.778471	{}	primary_phone_number
153	{}	{}	2024-09-27 06:43:02.782803	2024-09-27 06:43:02.782803	{}	secondary_phone_number
154	{}	{}	2024-09-27 06:43:02.788814	2024-09-27 06:43:02.788814	{}	moxi_works_lead_source_id
155	{}	{}	2024-09-27 06:43:02.793402	2024-09-27 06:43:02.793402	{}	original_lead_source
156	{}	{}	2024-09-27 06:43:02.798673	2024-09-27 06:43:02.798673	{}	gender
157	{}	{}	2024-09-27 06:43:02.803581	2024-09-27 06:43:02.803581	{}	label_name
158	{}	{}	2024-09-27 06:43:02.808303	2024-09-27 06:43:02.808303	{}	home_street_address
159	{}	{}	2024-09-27 06:43:02.813083	2024-09-27 06:43:02.813083	{}	home_city
160	{}	{}	2024-09-27 06:43:02.817392	2024-09-27 06:43:02.817392	{}	home_state
161	{}	{}	2024-09-27 06:43:02.821753	2024-09-27 06:43:02.821753	{}	home_zip
162	{}	{}	2024-09-27 06:43:02.826134	2024-09-27 06:43:02.826134	{}	home_country
163	{}	{}	2024-09-27 06:43:02.830811	2024-09-27 06:43:02.830811	{}	is_not_lead
164	{}	{}	2024-09-27 06:43:02.835224	2024-09-27 06:43:02.835224	{}	skip_agent_notification
165	{}	{}	2024-09-27 06:43:02.839983	2024-09-27 06:43:02.839983	{}	job_title
166	{}	{}	2024-09-27 06:43:02.845084	2024-09-27 06:43:02.845084	{}	occupation
167	{}	{}	2024-09-27 06:43:02.850158	2024-09-27 06:43:02.850158	{}	property_url
168	{}	{}	2024-09-27 06:43:02.85486	2024-09-27 06:43:02.85486	{}	property_mls_id
169	{}	{}	2024-09-27 06:43:02.858831	2024-09-27 06:43:02.858831	{}	property_street_address
170	{}	{}	2024-09-27 06:43:02.863506	2024-09-27 06:43:02.863506	{}	property_city
171	{}	{}	2024-09-27 06:43:02.868439	2024-09-27 06:43:02.868439	{}	property_state
172	{}	{}	2024-09-27 06:43:02.873003	2024-09-27 06:43:02.873003	{}	property_zip
173	{}	{}	2024-09-27 06:43:02.877127	2024-09-27 06:43:02.877127	{}	property_beds
174	{}	{}	2024-09-27 06:43:02.881202	2024-09-27 06:43:02.881202	{}	property_baths
175	{}	{}	2024-09-27 06:43:02.885613	2024-09-27 06:43:02.885613	{}	property_list_price
176	{}	{}	2024-09-27 06:43:02.890149	2024-09-27 06:43:02.890149	{}	property_listing_status
177	{}	{}	2024-09-27 06:43:02.894307	2024-09-27 06:43:02.894307	{}	property_photo_url
178	{}	{}	2024-09-27 06:43:02.898759	2024-09-27 06:43:02.898759	{}	search_city
179	{}	{}	2024-09-27 06:43:02.904369	2024-09-27 06:43:02.904369	{}	search_state
180	{}	{}	2024-09-27 06:43:02.909525	2024-09-27 06:43:02.909525	{}	search_zip
181	{}	{}	2024-09-27 06:43:02.91432	2024-09-27 06:43:02.91432	{}	search_min_baths
182	{}	{}	2024-09-27 06:43:02.919292	2024-09-27 06:43:02.919292	{}	search_min_beds
183	{}	{}	2024-09-27 06:43:02.923525	2024-09-27 06:43:02.923525	{}	search_min_price
184	{}	{}	2024-09-27 06:43:02.927613	2024-09-27 06:43:02.927613	{}	search_max_price
185	{}	{}	2024-09-27 06:43:02.931752	2024-09-27 06:43:02.931752	{}	search_min_sq_ft
186	{}	{}	2024-09-27 06:43:02.935908	2024-09-27 06:43:02.935908	{}	search_max_sq_ft
187	{}	{}	2024-09-27 06:43:02.940528	2024-09-27 06:43:02.940528	{}	search_min_lot_size
188	{}	{}	2024-09-27 06:43:02.944632	2024-09-27 06:43:02.944632	{}	search_max_lot_size
189	{}	{}	2024-09-27 06:43:02.948822	2024-09-27 06:43:02.948822	{}	search_min_year_built
190	{}	{}	2024-09-27 06:43:02.953806	2024-09-27 06:43:02.953806	{}	search_max_year_built
191	{}	{}	2024-09-27 06:43:02.95845	2024-09-27 06:43:02.95845	{}	search_property_types
192	{}	{}	2024-09-27 06:43:02.962786	2024-09-27 06:43:02.962786	{}	note
193	{}	{}	2024-09-27 06:43:02.967147	2024-09-27 06:43:02.967147	{}	websites
194	{}	{}	2024-09-27 06:43:02.971082	2024-09-27 06:43:02.971082	{}	birthday
195	{}	{}	2024-09-27 06:43:02.976413	2024-09-27 06:43:02.976413	{}	home_purchase_anniversaries
196	{}	{}	2024-09-27 06:43:02.980851	2024-09-27 06:43:02.980851	{}	company
197	{}	{}	2024-09-27 06:43:02.985352	2024-09-27 06:43:02.985352	{}	spouse_or_partner
198	{}	{}	2024-09-27 06:43:02.989686	2024-09-27 06:43:02.989686	{}	category_names
199	{}	{}	2024-09-27 06:43:02.997087	2024-09-27 06:43:02.997087	{}	is_deleted
200	{}	{}	2024-09-27 06:43:03.005482	2024-09-27 06:43:03.005482	{}	middle_name
201	{}	{}	2024-09-27 06:43:03.010892	2024-09-27 06:43:03.010892	{}	suffix
202	{}	{}	2024-09-27 06:43:03.021047	2024-09-27 06:43:03.021047	{}	phone_numbers
203	{}	{}	2024-09-27 06:43:03.030114	2024-09-27 06:43:03.030114	{}	is_new_contact
204	{}	{}	2024-09-27 06:43:03.035252	2024-09-27 06:43:03.035252	{}	anniversary
205	{}	{}	2024-09-27 06:43:03.03916	2024-09-27 06:43:03.03916	{}	home_purchase_anniversary
206	{}	{}	2024-09-27 06:43:03.043381	2024-09-27 06:43:03.043381	{}	social_media_profiles
207	{}	{}	2024-09-27 06:43:03.075477	2024-09-27 06:43:03.075477	{}	groups
208	{}	{}	2024-09-27 06:43:03.127382	2024-09-27 06:43:03.127382	{}	moxi_works_origin_lead_source_id
209	{}	{}	2024-09-27 06:43:03.238849	2024-09-27 06:43:03.238849	{}	email_address
210	{}	{}	2024-09-27 06:43:03.243304	2024-09-27 06:43:03.243304	{}	phone_number
211	{}	{}	2024-09-27 06:43:03.249876	2024-09-27 06:43:03.249876	{}	only_business_contacts
212	{}	{}	2024-09-27 06:43:03.25658	2024-09-27 06:43:03.25658	{}	total_pages
213	{}	{}	2024-09-27 06:43:03.262364	2024-09-27 06:43:03.262364	{}	contacts
214	{}	{}	2024-09-27 06:43:03.27592	2024-09-27 06:43:03.27592	{}	result
215	{}	{}	2024-09-27 06:43:03.289444	2024-09-27 06:43:03.289444	{}	subscription_type
216	{}	{}	2024-09-27 06:43:03.294608	2024-09-27 06:43:03.294608	{}	subscribed_at
217	{}	{}	2024-09-27 06:43:03.298371	2024-09-27 06:43:03.298371	{}	created_by
218	{}	{}	2024-09-27 06:43:03.302506	2024-09-27 06:43:03.302506	{}	area
219	{}	{}	2024-09-27 06:43:03.306871	2024-09-27 06:43:03.306871	{}	last_sent
220	{}	{}	2024-09-27 06:43:03.31199	2024-09-27 06:43:03.31199	{}	next_scheduled
221	{}	{}	2024-09-27 06:43:03.316781	2024-09-27 06:43:03.316781	{}	created_at
222	{}	{}	2024-09-27 06:43:03.321698	2024-09-27 06:43:03.321698	{}	unsubscribed_at
223	{}	{}	2024-09-27 06:43:03.326184	2024-09-27 06:43:03.326184	{}	unsubscribed_by
224	{}	{}	2024-09-27 06:43:03.330374	2024-09-27 06:43:03.330374	{}	listed
225	{}	{}	2024-09-27 06:43:03.334548	2024-09-27 06:43:03.334548	{}	sold
226	{}	{}	2024-09-27 06:43:03.338528	2024-09-27 06:43:03.338528	{}	zipcode
227	{}	{}	2024-09-27 06:43:03.342818	2024-09-27 06:43:03.342818	{}	nn_subscription_type
228	{}	{}	2024-09-27 06:43:03.34718	2024-09-27 06:43:03.34718	{}	nn_min_price
229	{}	{}	2024-09-27 06:43:03.351962	2024-09-27 06:43:03.351962	{}	nn_max_price
230	{}	{}	2024-09-27 06:43:03.356568	2024-09-27 06:43:03.356568	{}	nn_min_beds
231	{}	{}	2024-09-27 06:43:03.361499	2024-09-27 06:43:03.361499	{}	nn_max_beds
232	{}	{}	2024-09-27 06:43:03.366008	2024-09-27 06:43:03.366008	{}	nn_min_baths
233	{}	{}	2024-09-27 06:43:03.370573	2024-09-27 06:43:03.370573	{}	nn_min_sqft
234	{}	{}	2024-09-27 06:43:03.374822	2024-09-27 06:43:03.374822	{}	nn_max_sqft
235	{}	{}	2024-09-27 06:43:03.3791	2024-09-27 06:43:03.3791	{}	nn_property_type
236	{}	{}	2024-09-27 06:43:03.383834	2024-09-27 06:43:03.383834	{}	partner_event_id
237	{}	{}	2024-09-27 06:43:03.391961	2024-09-27 06:43:03.391961	{}	event_subject
238	{}	{}	2024-09-27 06:43:03.396183	2024-09-27 06:43:03.396183	{}	event_location
239	{}	{}	2024-09-27 06:43:03.401232	2024-09-27 06:43:03.401232	{}	send_reminder
240	{}	{}	2024-09-27 06:43:03.405442	2024-09-27 06:43:03.405442	{}	remind_minutes_before
241	{}	{}	2024-09-27 06:43:03.410644	2024-09-27 06:43:03.410644	{}	event_start
242	{}	{}	2024-09-27 06:43:03.415371	2024-09-27 06:43:03.415371	{}	event_end
243	{}	{}	2024-09-27 06:43:03.420153	2024-09-27 06:43:03.420153	{}	all_day
244	{}	{}	2024-09-27 06:43:03.424756	2024-09-27 06:43:03.424756	{}	attendees
245	{}	{}	2024-09-27 06:43:03.46146	2024-09-27 06:43:03.46146	{}	date_start
246	{}	{}	2024-09-27 06:43:03.467138	2024-09-27 06:43:03.467138	{}	date_end
247	{}	{}	2024-09-27 06:43:03.473347	2024-09-27 06:43:03.473347	{}	date
248	{}	{}	2024-09-27 06:43:03.477766	2024-09-27 06:43:03.477766	{}	events
249	{}	{}	2024-09-27 06:43:03.493461	2024-09-27 06:43:03.493461	{}	ListingID
250	{}	{}	2024-09-27 06:43:03.498574	2024-09-27 06:43:03.498574	{}	ListOfficeAOR
251	{}	{}	2024-09-27 06:43:03.503924	2024-09-27 06:43:03.503924	{}	ListingImages
252	{}	{}	2024-09-27 06:43:03.512033	2024-09-27 06:43:03.512033	{}	partner_group_id
253	{}	{}	2024-09-27 06:43:03.521951	2024-09-27 06:43:03.521951	{}	moxi_works_group_name
254	{}	{}	2024-09-27 06:43:03.526479	2024-09-27 06:43:03.526479	{}	moxi_works_group_id
255	{}	{}	2024-09-27 06:43:03.531605	2024-09-27 06:43:03.531605	{}	transient
256	{}	{}	2024-09-27 06:43:03.535717	2024-09-27 06:43:03.535717	{}	is_contact_removal
257	{}	{}	2024-09-27 06:43:03.540069	2024-09-27 06:43:03.540069	{}	updated_contacts
258	{}	{}	2024-09-27 06:43:03.579445	2024-09-27 06:43:03.579445	{}	is_partner_alias
259	{}	{}	2024-09-27 06:43:03.584888	2024-09-27 06:43:03.584888	{}	is_partner_default
260	{}	{}	2024-09-27 06:43:03.591419	2024-09-27 06:43:03.591419	{}	moxi_works_listing_id
261	{}	{}	2024-09-27 06:43:03.598828	2024-09-27 06:43:03.598828	{}	underscore_response
262	{}	{}	2024-09-27 06:43:03.604563	2024-09-27 06:43:03.604563	{}	LotSizeAcres
263	{}	{}	2024-09-27 06:43:03.609784	2024-09-27 06:43:03.609784	{}	BathroomsFull
264	{}	{}	2024-09-27 06:43:03.61534	2024-09-27 06:43:03.61534	{}	BathroomsHalf
265	{}	{}	2024-09-27 06:43:03.620754	2024-09-27 06:43:03.620754	{}	BathroomsOneQuarter
266	{}	{}	2024-09-27 06:43:03.625856	2024-09-27 06:43:03.625856	{}	BathroomsPartial
267	{}	{}	2024-09-27 06:43:03.630946	2024-09-27 06:43:03.630946	{}	BathroomsThreeQuarter
268	{}	{}	2024-09-27 06:43:03.635194	2024-09-27 06:43:03.635194	{}	BathroomsTotalInteger
269	{}	{}	2024-09-27 06:43:03.639517	2024-09-27 06:43:03.639517	{}	BathroomsTotal
270	{}	{}	2024-09-27 06:43:03.643946	2024-09-27 06:43:03.643946	{}	BedroomsTotal
271	{}	{}	2024-09-27 06:43:03.649099	2024-09-27 06:43:03.649099	{}	PublicTitle
272	{}	{}	2024-09-27 06:43:03.656042	2024-09-27 06:43:03.656042	{}	PublicRemarks
273	{}	{}	2024-09-27 06:43:03.661885	2024-09-27 06:43:03.661885	{}	ModificationTimestamp
274	{}	{}	2024-09-27 06:43:03.666807	2024-09-27 06:43:03.666807	{}	StatusChangeDate
275	{}	{}	2024-09-27 06:43:03.671472	2024-09-27 06:43:03.671472	{}	InternetAddressDisplayYN
276	{}	{}	2024-09-27 06:43:03.676108	2024-09-27 06:43:03.676108	{}	DaysOnMarket
277	{}	{}	2024-09-27 06:43:03.680873	2024-09-27 06:43:03.680873	{}	ListingContractDate
278	{}	{}	2024-09-27 06:43:03.685304	2024-09-27 06:43:03.685304	{}	CreatedDate
279	{}	{}	2024-09-27 06:43:03.689715	2024-09-27 06:43:03.689715	{}	ElementarySchool
280	{}	{}	2024-09-27 06:43:03.694772	2024-09-27 06:43:03.694772	{}	GarageSpaces
281	{}	{}	2024-09-27 06:43:03.699428	2024-09-27 06:43:03.699428	{}	WaterfrontYN
282	{}	{}	2024-09-27 06:43:03.704542	2024-09-27 06:43:03.704542	{}	HighSchool
283	{}	{}	2024-09-27 06:43:03.71001	2024-09-27 06:43:03.71001	{}	AssociationFee
284	{}	{}	2024-09-27 06:43:03.714809	2024-09-27 06:43:03.714809	{}	ListOfficeName
285	{}	{}	2024-09-27 06:43:03.719437	2024-09-27 06:43:03.719437	{}	ListPrice
286	{}	{}	2024-09-27 06:43:03.724854	2024-09-27 06:43:03.724854	{}	ListAgentFullName
287	{}	{}	2024-09-27 06:43:03.72989	2024-09-27 06:43:03.72989	{}	ListAgentUUID
288	{}	{}	2024-09-27 06:43:03.734447	2024-09-27 06:43:03.734447	{}	ListAgentOfficeID
289	{}	{}	2024-09-27 06:43:03.738568	2024-09-27 06:43:03.738568	{}	ListAgentMoxiWorksOfficeID
290	{}	{}	2024-09-27 06:43:03.742936	2024-09-27 06:43:03.742936	{}	SecondaryListAgentFullName
291	{}	{}	2024-09-27 06:43:03.747544	2024-09-27 06:43:03.747544	{}	SecondaryListAgentUUID
292	{}	{}	2024-09-27 06:43:03.752347	2024-09-27 06:43:03.752347	{}	SchoolDistrict
293	{}	{}	2024-09-27 06:43:03.757601	2024-09-27 06:43:03.757601	{}	Address
294	{}	{}	2024-09-27 06:43:03.763333	2024-09-27 06:43:03.763333	{}	Address2
295	{}	{}	2024-09-27 06:43:03.768216	2024-09-27 06:43:03.768216	{}	City
296	{}	{}	2024-09-27 06:43:03.772779	2024-09-27 06:43:03.772779	{}	CountyOrParish
297	{}	{}	2024-09-27 06:43:03.777474	2024-09-27 06:43:03.777474	{}	Latitude
298	{}	{}	2024-09-27 06:43:03.781839	2024-09-27 06:43:03.781839	{}	Longitude
299	{}	{}	2024-09-27 06:43:03.786092	2024-09-27 06:43:03.786092	{}	StateOrProvince
300	{}	{}	2024-09-27 06:43:03.790749	2024-09-27 06:43:03.790749	{}	PostalCode
301	{}	{}	2024-09-27 06:43:03.795143	2024-09-27 06:43:03.795143	{}	Community
302	{}	{}	2024-09-27 06:43:03.799637	2024-09-27 06:43:03.799637	{}	LotSizeSquareFeet
303	{}	{}	2024-09-27 06:43:03.804341	2024-09-27 06:43:03.804341	{}	InternetEntireListingDisplayYN
304	{}	{}	2024-09-27 06:43:03.80937	2024-09-27 06:43:03.80937	{}	MiddleOrJuniorSchool
305	{}	{}	2024-09-27 06:43:03.815653	2024-09-27 06:43:03.815653	{}	ListOfficeAORArea
306	{}	{}	2024-09-27 06:43:03.820531	2024-09-27 06:43:03.820531	{}	PoolYN
307	{}	{}	2024-09-27 06:43:03.825734	2024-09-27 06:43:03.825734	{}	PropertyType
308	{}	{}	2024-09-27 06:43:03.830712	2024-09-27 06:43:03.830712	{}	TaxAnnualAmount
309	{}	{}	2024-09-27 06:43:03.835465	2024-09-27 06:43:03.835465	{}	TaxYear
310	{}	{}	2024-09-27 06:43:03.839964	2024-09-27 06:43:03.839964	{}	SingleStory
311	{}	{}	2024-09-27 06:43:03.844329	2024-09-27 06:43:03.844329	{}	LivingArea
312	{}	{}	2024-09-27 06:43:03.848977	2024-09-27 06:43:03.848977	{}	ViewYN
313	{}	{}	2024-09-27 06:43:03.853312	2024-09-27 06:43:03.853312	{}	YearBuilt
314	{}	{}	2024-09-27 06:43:03.857441	2024-09-27 06:43:03.857441	{}	OnMarket
315	{}	{}	2024-09-27 06:43:03.861858	2024-09-27 06:43:03.861858	{}	Status
316	{}	{}	2024-09-27 06:43:03.867404	2024-09-27 06:43:03.867404	{}	MoxiWorksListingId
317	{}	{}	2024-09-27 06:43:03.871789	2024-09-27 06:43:03.871789	{}	AgentCreatedListing
318	{}	{}	2024-09-27 06:43:03.876386	2024-09-27 06:43:03.876386	{}	VirtualTourURL
319	{}	{}	2024-09-27 06:43:03.881184	2024-09-27 06:43:03.881184	{}	SharedPartnerData
320	{}	{}	2024-09-27 06:43:03.885886	2024-09-27 06:43:03.885886	{}	TaxParcelId
321	{}	{}	2024-09-27 06:43:03.890113	2024-09-27 06:43:03.890113	{}	ListingURL
322	{}	{}	2024-09-27 06:43:03.89427	2024-09-27 06:43:03.89427	{}	PropertyFeatures
323	{}	{}	2024-09-27 06:43:03.898748	2024-09-27 06:43:03.898748	{}	CompanyListingAttributes
324	{}	{}	2024-09-27 06:43:03.90325	2024-09-27 06:43:03.90325	{}	OpenHouse
325	{}	{}	2024-09-27 06:43:03.907502	2024-09-27 06:43:03.907502	{}	ImagesLastModified
326	{}	{}	2024-09-27 06:43:03.91318	2024-09-27 06:43:03.91318	{}	BuyerCommissionType
327	{}	{}	2024-09-27 06:43:03.917233	2024-09-27 06:43:03.917233	{}	BuyerCommissionValue
328	{}	{}	2024-09-27 06:43:03.991574	2024-09-27 06:43:03.991574	{}	last_moxi_works_listing_id
329	{}	{}	2024-09-27 06:43:03.996088	2024-09-27 06:43:03.996088	{}	shared_partner_data_updated_since
330	{}	{}	2024-09-27 06:43:04.000321	2024-09-27 06:43:04.000321	{}	market_status
331	{}	{}	2024-09-27 06:43:04.004859	2024-09-27 06:43:04.004859	{}	property_types
332	{}	{}	2024-09-27 06:43:04.010109	2024-09-27 06:43:04.010109	{}	only_agent_created
333	{}	{}	2024-09-27 06:43:04.015004	2024-09-27 06:43:04.015004	{}	coming_soon
334	{}	{}	2024-09-27 06:43:04.021682	2024-09-27 06:43:04.021682	{}	FinalPage
335	{}	{}	2024-09-27 06:43:04.026268	2024-09-27 06:43:04.026268	{}	Listings
336	{}	{}	2024-09-27 06:43:04.033787	2024-09-27 06:43:04.033787	{}	id
337	{}	{}	2024-09-27 06:43:04.039736	2024-09-27 06:43:04.039736	{}	common_name
338	{}	{}	2024-09-27 06:43:04.043627	2024-09-27 06:43:04.043627	{}	image_url
339	{}	{}	2024-09-27 06:43:04.049079	2024-09-27 06:43:04.049079	{}	address2
340	{}	{}	2024-09-27 06:43:04.055045	2024-09-27 06:43:04.055045	{}	county
341	{}	{}	2024-09-27 06:43:04.062102	2024-09-27 06:43:04.062102	{}	alt_phone
342	{}	{}	2024-09-27 06:43:04.067373	2024-09-27 06:43:04.067373	{}	email
343	{}	{}	2024-09-27 06:43:04.074028	2024-09-27 06:43:04.074028	{}	phone
344	{}	{}	2024-09-27 06:43:04.079039	2024-09-27 06:43:04.079039	{}	timezone
345	{}	{}	2024-09-27 06:43:04.084576	2024-09-27 06:43:04.084576	{}	office_website
346	{}	{}	2024-09-27 06:43:04.089903	2024-09-27 06:43:04.089903	{}	mailing_address
347	{}	{}	2024-09-27 06:43:04.094192	2024-09-27 06:43:04.094192	{}	mailing_address2
348	{}	{}	2024-09-27 06:43:04.098488	2024-09-27 06:43:04.098488	{}	mailing_city
349	{}	{}	2024-09-27 06:43:04.102743	2024-09-27 06:43:04.102743	{}	mailing_zip
350	{}	{}	2024-09-27 06:43:04.107231	2024-09-27 06:43:04.107231	{}	mailing_state
351	{}	{}	2024-09-27 06:43:04.114903	2024-09-27 06:43:04.114903	{}	logo_url
352	{}	{}	2024-09-27 06:43:04.127153	2024-09-27 06:43:04.127153	{}	offices
353	{}	{}	2024-09-27 06:43:04.136167	2024-09-27 06:43:04.136167	{}	created_after
354	{}	{}	2024-09-27 06:43:04.140287	2024-09-27 06:43:04.140287	{}	created_before
355	{}	{}	2024-09-27 06:43:04.144539	2024-09-27 06:43:04.144539	{}	updated_after
356	{}	{}	2024-09-27 06:43:04.148877	2024-09-27 06:43:04.148877	{}	updated_before
357	{}	{}	2024-09-27 06:43:04.155323	2024-09-27 06:43:04.155323	{}	include_times
358	{}	{}	2024-09-27 06:43:04.159619	2024-09-27 06:43:04.159619	{}	type
359	{}	{}	2024-09-27 06:43:04.167169	2024-09-27 06:43:04.167169	{}	presentations
360	{}	{}	2024-09-27 06:43:04.232395	2024-09-27 06:43:04.232395	{}	SoldDate
361	{}	{}	2024-09-27 06:43:04.23681	2024-09-27 06:43:04.23681	{}	SoldPrice
362	{}	{}	2024-09-27 06:43:04.240813	2024-09-27 06:43:04.240813	{}	BuyerAgentFullName
363	{}	{}	2024-09-27 06:43:04.245222	2024-09-27 06:43:04.245222	{}	BuyerAgentUUID
364	{}	{}	2024-09-27 06:43:04.249939	2024-09-27 06:43:04.249939	{}	BuyerAgentOfficeName
365	{}	{}	2024-09-27 06:43:04.255258	2024-09-27 06:43:04.255258	{}	BuyerAgentOfficeID
366	{}	{}	2024-09-27 06:43:04.260148	2024-09-27 06:43:04.260148	{}	BuyerAgentMoxiWorksOfficeID
367	{}	{}	2024-09-27 06:43:04.266527	2024-09-27 06:43:04.266527	{}	sold_since
368	{}	{}	2024-09-27 06:43:04.271257	2024-09-27 06:43:04.271257	{}	sold_before
369	{}	{}	2024-09-27 06:43:04.279585	2024-09-27 06:43:04.279585	{}	include_buyer_listings
370	{}	{}	2024-09-27 06:43:04.28931	2024-09-27 06:43:04.28931	{}	partner_task_id
371	{}	{}	2024-09-27 06:43:04.295455	2024-09-27 06:43:04.295455	{}	due_at
372	{}	{}	2024-09-27 06:43:04.3015	2024-09-27 06:43:04.3015	{}	duration
373	{}	{}	2024-09-27 06:43:04.307041	2024-09-27 06:43:04.307041	{}	description
374	{}	{}	2024-09-27 06:43:04.320022	2024-09-27 06:43:04.320022	{}	completed_at
375	{}	{}	2024-09-27 06:43:04.355415	2024-09-27 06:43:04.355415	{}	due_date_start
376	{}	{}	2024-09-27 06:43:04.359954	2024-09-27 06:43:04.359954	{}	due_date_end
377	{}	{}	2024-09-27 06:43:04.367448	2024-09-27 06:43:04.367448	{}	tasks
378	{}	{}	2024-09-27 06:43:04.372134	2024-09-27 06:43:04.372134	{}	moxi_works_team_id
379	{}	{}	2024-09-27 06:43:04.380379	2024-09-27 06:43:04.380379	{}	address1
380	{}	{}	2024-09-27 06:43:04.389439	2024-09-27 06:43:04.389439	{}	fax
381	{}	{}	2024-09-27 06:43:04.395046	2024-09-27 06:43:04.395046	{}	photo_url
382	{}	{}	2024-09-27 06:43:04.401035	2024-09-27 06:43:04.401035	{}	alt_email
383	{}	{}	2024-09-27 06:43:04.40546	2024-09-27 06:43:04.40546	{}	website_url
384	{}	{}	2024-09-27 06:43:04.409676	2024-09-27 06:43:04.409676	{}	active
385	{}	{}	2024-09-27 06:43:04.433528	2024-09-27 06:43:04.433528	{}	has_agent_association
386	{}	{}	2024-09-27 06:43:04.438811	2024-09-27 06:43:04.438811	{}	has_web_data
387	{}	{}	2024-09-27 06:43:04.443698	2024-09-27 06:43:04.443698	{}	has_favorites
388	{}	{}	2024-09-27 06:43:04.448357	2024-09-27 06:43:04.448357	{}	has_searches
389	{}	{}	2024-09-27 06:43:04.455298	2024-09-27 06:43:04.455298	{}	moxi_works_user_id
390	{}	{}	2024-09-27 06:43:04.462619	2024-09-27 06:43:04.462619	{}	associated_agent_uuid
391	{}	{}	2024-09-27 06:43:04.466831	2024-09-27 06:43:04.466831	{}	favorite_listing_ids
392	{}	{}	2024-09-27 06:43:04.471005	2024-09-27 06:43:04.471005	{}	saved_searches
4	{"ActionLog": ["Create Request", "Create Response"]}	{"APIText": "To include access level information for the agent in the response, pass true", "Products": ["API", "Roster"], "ActionLog": ["API", "Roster"], "RosterText": "The access level of the agent. This can return one of the possible access levels, as seen within the products and permissions page."}	2024-09-27 06:43:01.801414	2024-09-26 23:43:14.982846	{"Endpoints": ["ActionLog"]}	body
10	{"ActionLog": ["Create Request", "Create Response"]}	{"Products": ["ActionLog"], "ActionLog": ["ActionLog"], "ActionLogText": "This is the human readable plain-text string which will be presented to the Agent as the heading of the ActionLog entry. This can be any short, descriptive sentence which would be practical for the agent to see in the history of events associated with a Contact."}	2024-09-27 06:43:01.834054	2024-09-26 23:43:14.982846	{"Endpoints": ["ActionLog"]}	agent_action
11	{"ActionLog": ["Create Request", "Create Response"]}	{"Products": ["ActionLog"], "ActionLog": ["ActionLog"], "ActionLogText": "If creating an agent_action that has a location component (‘inperson’ ‘other’) use this field to denote the street address of the agent_action."}	2024-09-27 06:43:01.839049	2024-09-26 23:43:14.982846	{"Endpoints": ["ActionLog"]}	agent_action_address
12	{"ActionLog": ["Create Request", "Create Response"]}	{"Products": ["ActionLog"], "ActionLog": ["ActionLog"], "ActionLogText": "If creating an agent_action that has a location component (‘inperson’ ‘other’) use this field to denote the additonal street address info of the agent_action."}	2024-09-27 06:43:01.843227	2024-09-26 23:43:14.982846	{"Endpoints": ["ActionLog"]}	agent_action_address2
13	{"ActionLog": ["Create Request", "Create Response"]}	{"Products": ["ActionLog"], "ActionLog": ["ActionLog"], "ActionLogText": "If creating an agent_action that has a location component (‘inperson’ ‘other’) use this field to denote the city or locale of the agent_action."}	2024-09-27 06:43:01.848133	2024-09-26 23:43:14.982846	{"Endpoints": ["ActionLog"]}	agent_action_city
14	{"ActionLog": ["Create Request", "Create Response"]}	{"Products": ["ActionLog"], "ActionLog": ["ActionLog"], "ActionLogText": "If creating an agent_action that has a location component (‘inperson’ ‘other’) use this field to denote the state or province related info of the agent_action."}	2024-09-27 06:43:01.852997	2024-09-26 23:43:14.982846	{"Endpoints": ["ActionLog"]}	agent_action_state
15	{"ActionLog": ["Create Request", "Create Response"]}	{"Products": ["ActionLog"], "ActionLog": ["ActionLog"], "ActionLogText": "If creating an agent_action that has a location component (‘inperson’ ‘other’) use this field to denote the postal code of the agent_action."}	2024-09-27 06:43:01.858924	2024-09-26 23:43:14.982846	{"Endpoints": ["ActionLog"]}	agent_action_zip
16	{"ActionLog": ["Create Response"]}	{"APIText": "This is the Unix timestamp for the creation time of the ActionLog entry.", "Products": ["API"], "ActionLog": ["API"]}	2024-09-27 06:43:01.868929	2024-09-26 23:43:14.982846	{"Endpoints": ["ActionLog"]}	timestamp
17	{"ActionLog": ["Delete Request"]}	{"APIText": "This is the MoxiWorks Platform ID of the ActionLog entry to be deleted. This will be an RFC 4122 compliant UUID.", "Products": ["API"], "ActionLog": ["API"]}	2024-09-27 06:43:01.879567	2024-09-26 23:43:14.982846	{"Endpoints": ["ActionLog"]}	moxi_works_action_log_id
18	{"ActionLog": ["Delete Response"]}	{"APIText": "This will indicate what the status of the request is.", "Products": ["API"], "ActionLog": ["API"]}	2024-09-27 06:43:01.888074	2024-09-26 23:43:14.982846	{"Endpoints": ["ActionLog"]}	status
19	{"ActionLog": ["Delete Response"]}	{"APIText": "This will indicate whether the delete request was successful or not.", "Products": ["API"], "ActionLog": ["API"]}	2024-09-27 06:43:01.892347	2024-09-26 23:43:14.982846	{"Endpoints": ["ActionLog"]}	deleted
20	{"ActionLog": ["Delete Response"]}	{"APIText": "This is an arrray of strings. Any messages associated with the delete request status will be contained in this array.", "Products": ["API"], "ActionLog": ["API"]}	2024-09-27 06:43:01.896689	2024-09-26 23:43:14.982846	{"Endpoints": ["ActionLog"]}	messages
21	{"ActionLog": ["Index Request"]}	{"APIText": "Only ActionLog records created later than this Unix timestamp will be included in the query. The upper bound of the time slice will be the 90 days higher than date_min value or the value of the the date_max; whichever is lower. If no timestamps are provided, ActionLogs from the last 90 days will be retrieved. The maximum timeframe for data is 90 days. date_min and date_max should be set in 90 day increments to retrieve the data from a specific historical point.", "Products": ["API"], "ActionLog": ["API"]}	2024-09-27 06:43:01.909791	2024-09-26 23:43:14.982846	{"Endpoints": ["ActionLog"]}	date_min
22	{"ActionLog": ["Index Request"]}	{"APIText": "Only ActionLog records created earlier than this Unix timestamp will be included in the query. Should be no higher than 90 days past the date_min attribute if it is provided. The maximum timeframe for data is 90 days. date_min and date_max should be set in 90 day increments to retrieve the data from a specific historical point.", "Products": ["API"], "ActionLog": ["API"]}	2024-09-27 06:43:01.914817	2024-09-26 23:43:14.982846	{"Endpoints": ["ActionLog"]}	date_max
23	{"ActionLog": ["Index Response"]}	{"APIText": "This is an Array containing any ActionLog entries found for the Index request - [moxi_works_action_log_id, type, timestamp, log_data].", "Products": ["API"], "ActionLog": ["API"]}	2024-09-27 06:43:01.923892	2024-09-26 23:43:14.982846	{"Endpoints": ["ActionLog"]}	actions
146	{"BuyerTransaction": ["Update Request"]}	{"APIText": "If this is set to true then The MoxiWorks Platform will promote this transaction to the next stage.", "Products": ["API"], "BuyerTransaction": ["API"]}	2024-09-27 06:43:02.6501	2024-09-26 23:43:38.792875	{"Endpoints": ["BuyerTransaction"]}	promote_transaction
78	{"Agent": ["Create Response"]}	{"Agent": ["Engage"], "Products": ["Engage"], "EngageText": "This is the agent’s Gross Commission Income goal, as seen throughout the Engage UI."}	2024-09-27 06:43:02.195894	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	gci_goal
79	{"Agent": ["Create Response"]}	{"Agent": ["Roster"], "Products": ["Roster"], "RosterText": "Percentage commission rate for the agent when acting as a buyer’s agent."}	2024-09-27 06:43:02.200499	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	buyer_commission_rate
80	{"Agent": ["Create Response"]}	{"Agent": ["Roster"], "Products": ["Roster"], "RosterText": "Percentage commission rate for the agent when acting as a seller’s agent."}	2024-09-27 06:43:02.204845	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	seller_commission_rate
24	{"Agent": ["Index Request"]}	{"Agent": ["API", "Roster"], "APIText": "To include access level information for the agent in the response, pass true.", "Products": ["API", "Roster"], "RosterText": "The access level of the agent. This can return one of the possible access levels, as seen within the products and permissions page."}	2024-09-27 06:43:01.933479	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent", "Agent"]}	include_access_level
27	{"Agent": ["Create Request", "Index Request"]}	{"Agent": ["API", "Roster"], "APIText": "To include ratings and reviews associated with the agent in the response, pass true.", "Products": ["API", "Roster"], "RosterText": "Referencing external agent reviews from platforms such as Zillow and Testimonial Tree."}	2024-09-27 06:43:01.947155	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	include_reviews
26	{"Agent": ["Create Request", "Index Request"]}	{"Agent": ["API"], "APIText": "To include affiliate data associated with the agent in the response, pass true.", "Products": ["API"]}	2024-09-27 06:43:01.942962	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	include_partners
92	{"Agent": ["Index Request"]}	{"Agent": ["API"], "APIText": "Any Agent objects updated after this Unix timestamp will be returned in the response. If no updated_since parameter is included in the request, by default only Agent objects updated in the last seven days will be returned.", "Products": ["API"]}	2024-09-27 06:43:02.264349	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	updated_since
94	{"Agent": ["Index Request"]}	{"Agent": ["API"], "APIText": "To find Agent accounts deactivated within the specified timeframe, pass true for this boolean parameter.", "Products": ["API"]}	2024-09-27 06:43:02.27392	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	deactivated
96	{"Agent": ["Index Request"]}	{"Agent": ["API"], "APIText": "To include company specific programs associated with the agent in the response, pass true.", "Products": ["API"]}	2024-09-27 06:43:02.283564	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	include_company_programs
98	{"Agent": ["Index Request"]}	{"Agent": ["API"], "APIText": "To include only Agent objects associated with company specific programs pass true.", "Products": ["API"]}	2024-09-27 06:43:02.293633	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	has_company_programs
100	{"Agent": ["Index Request"]}	{"Agent": ["API", "Roster"], "APIText": "To include bio associated with the agent in the response, pass true.", "Products": ["API", "Roster"], "RosterText": "This references the bio of the agent, as seen on the about me > web info page."}	2024-09-27 06:43:02.304227	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	include_bio
97	{"Agent": ["Index Request"]}	{"Agent": ["API", "Websites"], "APIText": "To include the base url (website_base_url) of the agent’s MoxiWorks website pass true.", "Products": ["API", "Websites"], "WebsitesText": "This references the website url for the agent."}	2024-09-27 06:43:02.288952	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	include_website
95	{"Agent": ["Index Request"]}	{"Agent": ["API"], "APIText": "Any Agent objects deactivated after this Unix timestamp will be returned in the response. If no deactivated_since parameter is included in the request, only Agent objects deactivated in the last seven days will be returned.", "Products": ["API"]}	2024-09-27 06:43:02.278089	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	deactivated_since
32	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the standard abbreviation of the primary MLS utilized by the agent.", "Products": ["API"]}	2024-09-27 06:43:01.973486	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	mls_abbreviation
33	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the ID of this Agent. This will be an integer.", "Products": ["API"]}	2024-09-27 06:43:01.978282	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	agent_id
36	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the ID of the office for this Agent. This will be an integer.", "Products": ["API"]}	2024-09-27 06:43:01.993519	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	client_office_id
99	{"Agent": ["Index Request"], "BuyerTransaction": ["Index Request"]}	{"Agent": ["API"], "APIText": "If supplied then the results will exclude all data except primary identifiers and a unix timestamp (last_updated) & iso8601 timestamp (modification_timestamp) of the last time this record was updated.", "Products": ["API"]}	2024-09-27 06:43:02.299411	2024-09-26 23:43:38.792875	{"Endpoints": ["Agent"]}	timestamps_only
28	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the ID of the Agent, as utilized by their brokerage or company.", "Products": ["API"]}	2024-09-27 06:43:01.952551	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	client_agent_id
29	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is the ID of the Agent utilized by their primary MLS. This ID allows listings to associate with the User Account.", "Products": ["API", "Roster"], "RosterText": "This ID can be found on the Manage MLS Associations page of the Agent or other User Account."}	2024-09-27 06:43:01.957919	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	mls_agent_id
30	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the number of the license granted to the agent. Please see mls_agent_id for the Agent MLS ID value.", "Products": ["API"]}	2024-09-27 06:43:01.963528	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	license
37	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the ID of the company for this Agent. This will be an integer.", "Products": ["API"]}	2024-09-27 06:43:01.998307	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	company_id
31	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is the name of the primary MLS for the agent.", "Products": ["API", "Roster"], "RosterText": "This name can be found on the Manage MLS Associations page of the Agent or other User Account."}	2024-09-27 06:43:01.968496	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	mls_name
39	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is the main associated physical street address where the office is located. It can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Displays under the associated office page."}	2024-09-27 06:43:02.008523	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	office_address_street
40	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is the main associated secondary physical street address field, often populated with a suite or office number. This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Displays under the associated office page."}	2024-09-27 06:43:02.014243	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	office_address_street2
41	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "The city where the office is located, as associated with the physical address. This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Displays under the associated office page."}	2024-09-27 06:43:02.019366	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	office_address_city
42	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "The state where the office is located, as associated with the physical address. This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Displays under the associated office page."}	2024-09-27 06:43:02.025174	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	office_address_state
43	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "The postal code associated with the office physical address. This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Displays under the associated office page."}	2024-09-27 06:43:02.029691	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	office_address_zip
44	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the associated mailing address where the office is located. It can be null if there is no data for this attribute.", "Products": ["API"]}	2024-09-27 06:43:02.034971	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	office_mailing_address_street
45	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the associated secondary mailing street address field, often populated with a suite or office number. This can be null if there is no data for this attribute.", "Products": ["API"]}	2024-09-27 06:43:02.039695	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	office_mailing_address_street2
46	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "The city where the office receives mail, as associated with the mailing address. This can be null if there is no data for this attribute.", "Products": ["API"]}	2024-09-27 06:43:02.044074	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	office_mailing_address_city
47	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "The state where the office receives mail, as associated with the mailing address. This can be null if there is no data for this attribute.", "Products": ["API"]}	2024-09-27 06:43:02.048367	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	office_mailing_address_state
48	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "The postal code associated with the office mailing address. This can be null if there is no data for this attribute.", "Products": ["API"]}	2024-09-27 06:43:02.053116	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	office_mailing_address_zip
50	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "The first name of the agent."}	2024-09-27 06:43:02.061875	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	first_name
51	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "The last name of the agent."}	2024-09-27 06:43:02.066606	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	last_name
52	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "The nickname of the agent."}	2024-09-27 06:43:02.071557	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	nickname
53	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "This is the agent’s main phone number. This number should be considered the number the agent would like to be contacted by."}	2024-09-27 06:43:02.076824	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	main_phone_number
54	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Mobile phone number of the agent. main_phone_number should be considered higher priority, if not the same."}	2024-09-27 06:43:02.081925	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	mobile_phone_number
55	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Alternate phone number for the agent. This should be considered second in priority to main_phone_number."}	2024-09-27 06:43:02.087561	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	alt_phone_number
56	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "This is the agent’s fax phone number."}	2024-09-27 06:43:02.092433	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	fax_phone_number
57	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "This is the agent’s office phone number."}	2024-09-27 06:43:02.097193	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	office_phone_number
58	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "This is the agent’s main email address. This email address should be considered the email address the agent would prefer to be contacted by."}	2024-09-27 06:43:02.101894	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	primary_email_address
59	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "This is the agent’s alternate email address. This email address should be considered the email address the agent would want to be contacted by only if the address in primary_email_address is not functional."}	2024-09-27 06:43:02.106386	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	secondary_email_address
61	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Engage"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Engage"], "EngageText": "This is the agent’s lead routing email address. This can be null if there is no data for this attribute."}	2024-09-27 06:43:02.115531	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	lead_routing_email_address
7	{"Agent": ["Create Response", "Index Response"], "ActionLog": ["Create Request", "Create Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "ActionLog", "Roster"], "ActionLog": ["ActionLog"], "RosterText": "This is the business title of the agent.", "ActionLogText": "This is the human readable plain-text string which will be presented to the Agent as the heading of the ActionLog entry. This can be any short, descriptive sentence which would be practical for the agent to see in the history of events associated with a Contact."}	2024-09-27 06:43:01.817005	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	title
62	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "Array of key/value pairs. Each has a body and header, both strings, which can be null or blank.", "Products": ["API", "Roster"], "RosterText": "This is the bio of the agent, as seen on the about me > web info page."}	2024-09-27 06:43:02.121126	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	bio
63	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is a string that contains the agent’s designation(s), if any. This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": ""}	2024-09-27 06:43:02.125704	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	designations
64	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is an RFC 4122 compliant UUID. This UUID can be used as a unique identifier in determining associations between Agent objects and Listing objects.", "Products": ["API", "Roster"], "RosterText": "Displays within the about me section."}	2024-09-27 06:43:02.130951	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	uuid
65	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "Indicates whether the agent has access to MoxiWorks Products.", "Products": ["API", "Roster"], "RosterText": "Referring to each individual Moxi product offered, such as Engage, Present, Impress etc."}	2024-09-27 06:43:02.136284	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	has_product_access
66	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Engage"], "APIText": "Indicates whether the agent has access to MoxiWorks Engage Product.", "Products": ["API", "Engage"], "EngageText": "Referencing the agent’s ability to access Engage as a product."}	2024-09-27 06:43:02.140775	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	has_engage_access
67	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "If include_access_level was passed as true, this can return one of the possible access levels.", "Products": ["API", "Roster"], "RosterText": "Related to the products and permissions page, specific to user account permissions section."}	2024-09-27 06:43:02.145243	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	access_level
68	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This will return one of the possible view levels.", "Products": ["API", "Roster"], "RosterText": "The view level of the agent."}	2024-09-27 06:43:02.149577	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	view_level
69	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "The teams array contains Dictionary objects representing Team entries. These include [name, uuid, member_category].", "Products": ["API", "Roster"], "RosterText": "Related to Agent Teams, within My Account section."}	2024-09-27 06:43:02.154321	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	teams
70	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["Roster", "Websites"], "Products": ["Roster", "Websites"], "RosterText": "Seen within About Me > Web Info.", "WebsitesText": "The base url of the agent’s MoxiWorks agent website."}	2024-09-27 06:43:02.158717	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	website_base_url
71	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data available for this attribute.", "Products": ["API", "Roster"], "RosterText": "Agent’s Twitter URL. Seen within About Me > Web Info."}	2024-09-27 06:43:02.163124	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	twitter
72	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This will be null. Deprecated.", "Products": ["API"]}	2024-09-27 06:43:02.167959	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	google_plus
73	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data available for this attribute.", "Products": ["API", "Roster"], "RosterText": "Agent’s Facebook page url. Seen within About Me > Web Info."}	2024-09-27 06:43:02.172633	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	facebook
74	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Websites"], "APIText": "You’ll need to prefix the domain with protocol if using this attribute for an href. This can be null if there is no data available for this attribute.", "Products": ["API", "Websites"], "WebsitesText": "Agent’s website domain. This will be returned without the HTTP(S) prefix."}	2024-09-27 06:43:02.177093	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	home_page
75	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is a valid URL for a larger size image for the agent. If no agent image has been uploaded for this agent a default image url will be provided.", "Products": ["API", "Roster"], "RosterText": "Agent’s associated profile image within About Me section."}	2024-09-27 06:43:02.182044	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	profile_image_url
76	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is a valid URL for a thumbnail size image for the agent. If no agent image has been uploaded for this agent a default image url will be provided.", "Products": ["API", "Roster"], "RosterText": "Agent’s associated profile image within About Me section, thumbnail."}	2024-09-27 06:43:02.187119	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	profile_thumb_url
77	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "The region the agent’s office is in."}	2024-09-27 06:43:02.191777	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	region
81	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["Engage"], "Products": ["Engage"], "EngageText": "A list of the lead service area zip codes covered by the agent."}	2024-09-27 06:43:02.208959	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	service_area_zip_codes
82	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["Websites"], "Products": ["Websites"], "WebsitesText": "This includes the base_url and bio_page_slug of the agent MoxiWorks website."}	2024-09-27 06:43:02.213063	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	agent_website
83	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "The alternate_offices array contains Dictionary objects representing AlternateOffice entries. These include [moxi_works_office_id, office_id, office_address_street, office_address_street2, office_address_city, office_address_state, office_address_zip, office_phone_number].", "Products": ["API", "Roster"], "RosterText": "Agent’s alternate offices, as seen within the additional offices page."}	2024-09-27 06:43:02.217445	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	alternate_offices
84	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "The available_mls Array contains Dictionary objects representing MLS entries. These include [name, display_name, mls_abbreviation, agent_id].", "Products": ["API", "Roster"], "RosterText": "Agent’s alternate offices, as seen within the additional offices page."}	2024-09-27 06:43:02.221917	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	available_mls
86	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "A list of the company specific program names in which the agent participates or is a member.", "Products": ["API"]}	2024-09-27 06:43:02.231109	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	company_programs
87	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "A list of the source-specific user identifiers.", "Products": ["API"]}	2024-09-27 06:43:02.237266	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	source_metadata
88	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the Unix timestamp representing the date that this Agent was created in the MoxiWorks system.", "Products": ["API"]}	2024-09-27 06:43:02.242797	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	created_timestamp
90	{"Agent": ["Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "True corresponds to Yes (visible online); false corresponds to No (not visible online).", "Products": ["API", "Roster"], "RosterText": "Indicates the “Profile Visible Online” value for this Agent."}	2024-09-27 06:43:02.25339	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	profile_visible_online
91	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "Existence of objects in the user_reviews data structure is dependent upon external sources, i.e. Zillow, Testimonial Tree. Documented entities in the `user_reviews` data structure may or may not be returned when `include_reviews=true` is passed. Your logic should be engineered to handle cases where the entity you are interested in is returned and where an empty data structure is returned. Included in this - [source_name, agg_rating, reviews_count]", "Products": ["API", "Roster"], "RosterText": "External agent reviews from platforms such as Zillow and Testimonial Tree."}	2024-09-27 06:43:02.25792	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	user_reviews
60	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "The email_addresses Hash is a Dictionary object holding the email addresses associated with the Agent record. These include [primary, display, alternate, moxi_sync, lead_routing, zillow].", "Products": ["API", "Roster"], "RosterText": "Some of these will display on the About Me section, including primary, display, moxi sync."}	2024-09-27 06:43:02.110825	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	email_addresses
118	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "Brief, human readable content that will be shown to the agent as notes about the BuyerTransaction that you are creating.", "Products": ["API", "Engage"], "EngageText": "For Buyer Transactions, these will be the related notes.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 06:43:02.467503	2024-09-26 23:43:38.792875	{"Endpoints": ["BuyerTransaction"]}	notes
89	{"Agent": ["Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is the Unix timestamp representing the date that this Agent was deactivated in the MoxiWorks system. This will be returned null if the agent is still active.This is the Unix timestamp representing the date that this Agent was deactivated in the MoxiWorks system. This will be returned null if the agent is still active.", "Products": ["API", "Roster"], "RosterText": "Will display within Account Info section if user account is deactivated."}	2024-09-27 06:43:02.248323	2024-09-26 23:43:21.262623	{"Endpoints": ["Agent"]}	deactivated_timestamp
35	{"Agent": ["Create Response", "Index Response"], "Brand": ["Index Request"]}	{"Agent": ["API"], "Brand": ["API", "Roster"], "APIText": "This is the ID of the office for this Agent. This will be an integer.", "Products": ["API"]}	2024-09-27 06:43:01.988546	2024-09-26 23:43:26.919557	{"Endpoints": ["Agent", "Brand"]}	office_id
34	{"Agent": ["Create Response", "Index Request", "Index Response"], "Brand": ["Index Request"]}	{"Agent": ["API", "Roster"], "Brand": ["API", "Roster"], "APIText": "This will be an RFC 4122 compliant UUID.", "Products": ["API", "Roster"], "RosterText": "This is the MoxiWorks Platform ID of the office for this Agent."}	2024-09-27 06:43:01.982966	2024-09-26 23:43:26.919557	{"Endpoints": ["Agent", "Brand"]}	moxi_works_office_id
108	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "Relates to the Brokerage or Company name.", "Products": ["API", "Present"], "PresentText": "Within a Presentation, this is the name of the Brokerage or Company as displayed to the consumer."}	2024-09-27 06:43:02.399137	2024-09-26 23:43:26.919557	{"Endpoints": ["Brand"]}	display_name
101	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Present"], "Products": ["Present"], "PresentText": "This is the logo associated with the Brokerage or Company."}	2024-09-27 06:43:02.365605	2024-09-26 23:43:26.919557	{"Endpoints": ["Brand"]}	image_logo
102	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "Accent color.", "Products": ["API", "Present"], "PresentText": "Within a Presentation, this will be the accent color."}	2024-09-27 06:43:02.370479	2024-09-26 23:43:26.919557	{"Endpoints": ["Brand"]}	cma_authoring_color
103	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Present"], "Products": ["Present"], "PresentText": "Within a Presentation, this will be the background color of a page."}	2024-09-27 06:43:02.375158	2024-09-26 23:43:26.919557	{"Endpoints": ["Brand"]}	background_color
104	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Present"], "Products": ["Present"], "PresentText": "Within a Presentation, this is the font color intended to overlay the background_color attribute."}	2024-09-27 06:43:02.379339	2024-09-26 23:43:26.919557	{"Endpoints": ["Brand"]}	background_font_color_primary
105	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Present"], "Products": ["Present"], "PresentText": "Within a Presentation, this is the background color of associated buttons."}	2024-09-27 06:43:02.385416	2024-09-26 23:43:26.919557	{"Endpoints": ["Brand"]}	button_background_color
106	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Present"], "Products": ["Present"], "PresentText": "Within a Presentation, this is the font color intended to overlay the button_background_color attribute."}	2024-09-27 06:43:02.390222	2024-09-26 23:43:26.919557	{"Endpoints": ["Brand"]}	button_font_color
107	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "This attribute may contain embedded HTML.", "Products": ["API", "Present"], "PresentText": "Within a Presentation, this will be the copyright notice information."}	2024-09-27 06:43:02.394666	2024-09-26 23:43:26.919557	{"Endpoints": ["Brand"]}	copyright
109	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Engage"], "APIText": "This is specific to the background color that displays when sending an email from Present.", "Products": ["API", "Engage"], "EngageText": "Background color of sent email elements outside of the email body."}	2024-09-27 06:43:02.40364	2024-09-26 23:43:26.919557	{"Endpoints": ["Brand"]}	email_element_background_color
110	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Engage"], "APIText": "Font color intended to overlay email_element_background_color?", "Products": ["API", "Engage"], "EngageText": "The font color for font that overlays email_element_background_color?"}	2024-09-27 06:43:02.407533	2024-09-26 23:43:26.919557	{"Endpoints": ["Brand"]}	email_background_font_color
111	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "Brokerage or Company logo shown in Print (PDF) Presentations.", "Products": ["API", "Present"], "PresentText": "Within a Presentation - specifically Print (PDF) format, this will be the Brokerage or Company logo that displays."}	2024-09-27 06:43:02.411383	2024-09-26 23:43:26.919557	{"Endpoints": ["Brand"]}	image_cma_pdf_logo_header
112	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Engage"], "Products": ["Engage"], "EngageText": "Related to sent emails, this will be the Brokerage or Company logo as shown in email header."}	2024-09-27 06:43:02.41541	2024-09-26 23:43:26.919557	{"Endpoints": ["Brand"]}	image_email_logo_alt
113	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Present", "Websites"], "Products": ["Present", "Websites"], "PresentText": "Within a presentation, this will be the favicon that displays related to the Brokerage or Company.", "WebsitesText": "Favicon of Brokerage or Company."}	2024-09-27 06:43:02.419491	2024-09-26 23:43:26.919557	{"Endpoints": ["Brand"]}	image_favicon
114	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "Brokerage or Company logo for web view presentations.", "Products": ["API", "Present"], "PresentText": "Within a Presentation - specifically web view, this will be the Brokerage or Company logo."}	2024-09-27 06:43:02.423669	2024-09-26 23:43:26.919557	{"Endpoints": ["Brand"]}	image_pres_cover_logo
115	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "Block element background color for web view presentations.", "Products": ["API", "Present"], "PresentText": "Within a Presentation - specifically web view, this is the background color that displays."}	2024-09-27 06:43:02.428084	2024-09-26 23:43:26.919557	{"Endpoints": ["Brand"]}	pres_block_background_color
116	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "Font color intended to overlay pres_block_background_color attribute.", "Products": ["API", "Present"], "PresentText": "Within a Presentation - specifically web view, this is the font color for related text."}	2024-09-27 06:43:02.433001	2024-09-26 23:43:26.919557	{"Endpoints": ["Brand"]}	pres_block_text_color
49	{"Agent": ["Create Response", "Index Response"], "Brand": ["Index Response"], "Company": ["Show Response", "Index Response", "Search Response"]}	{"Agent": ["API"], "Brand": ["Present"], "APIText": "This name attribute is shared between several endpoints, and generally represents the full name of the entity.", "Company": ["Roster"], "Products": ["API", "Present", "Roster"], "RosterText": "This is a human readable name of the company which this Company object represents.", "PresentText": "This will be the name that displays related to the associated Brand."}	2024-09-27 06:43:02.057647	2024-09-26 23:44:40.012731	{"Endpoints": ["Company"]}	name
3	{"Agent": ["Create Request"], "Brand": ["Index Request"], "ActionLog": ["Create Request", "Delete Request", "Index Request"], "BuyerTransaction": ["Create Request", "Update Request", "Show Request", "Index Request"]}	{"Agent": ["API"], "Brand": ["API"], "APIText": "If you have access to agent data from the same company source that MoxiWorks uses as an upstream data source then you should use the source_agent_id request attribute. This identifier will be unique only within the scope of a given company or parent_company, and must be used in conjunction with the moxi_works_company_id or parent_company_id request attributes. Please email partners@moxiworks.com for clarification about this request attribute.", "Products": ["API"], "ActionLog": ["API"]}	2024-09-27 06:43:01.791424	2024-09-26 23:43:38.792875	{"Endpoints": ["ActionLog", "Agent", "Brand", "BuyerTransaction"]}	source_agent_id
140	{"BuyerTransaction": ["Create Request", "Create Response", "Update Response", "Show Response", "Index Response"]}	{"APIText": "The stage that the BuyerTransaction should be placed into.", "Products": ["API"], "BuyerTransaction": ["API"]}	2024-09-27 06:43:02.570711	2024-09-26 23:43:38.792875	{"Endpoints": ["BuyerTransaction"]}	stage
144	{"BuyerTransaction": ["Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "A Unix timestamp. This should be null if the BuyerTransaction is not yet in complete state.", "Products": ["API", "Engage"], "EngageText": "For a Buyer Transaction, this represents the point in time when the transaction was completed.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 06:43:02.614144	2024-09-26 23:43:38.792875	{"Endpoints": ["BuyerTransaction"]}	closing_timestamp
136	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Show Response", "Index Response"]}	{"APIText": "If payment for the transaction is based on a flat fee derived from sales volume, use this attribute.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, the total commission for the transaction based on percentage of purchase price.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 06:43:02.552078	2024-09-26 23:43:38.792875	{"Endpoints": ["BuyerTransaction"]}	sales_volume_flat_fee
135	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Show Response", "Index Response"]}	{"APIText": "If the payment for the transaction is based on percentage of sales volume, use this attribute.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, the total commission for the transaction based on sales volume percentage.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 06:43:02.547494	2024-09-26 23:43:38.792875	{"Endpoints": ["BuyerTransaction"]}	sales_volume_percentage
137	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "The desired purchase price for a property if using target rather than range.", "BuyerTransaction": ["Engage"]}	2024-09-27 06:43:02.556827	2024-09-26 23:43:38.792875	{"Endpoints": ["BuyerTransaction"]}	target_price
141	{"BuyerTransaction": ["Create Response", "Update Request", "Update Response", "Show Request", "Show Response", "Index Response"]}	{"APIText": "This is the MoxiWorks Platform ID of the BuyerTransaction which you have created. This will be an RFC 4122 compliant UUID. This ID should be recorded on response as it is the key ID for updating the BuyerTransaction.", "Products": ["API"], "BuyerTransaction": ["API"]}	2024-09-27 06:43:02.577261	2024-09-26 23:43:38.792875	{"Endpoints": ["BuyerTransaction"]}	moxi_works_transaction_id
142	{"BuyerTransaction": ["Create Response", "Update Response", "Show Response", "Index Response"]}	{"APIText": "When created through the MoxiWorks Platform, BuyerTransaction objects will automatically be configured as active transactions. For more information about BuyerTransaction stages, see the MoxiCloud documentation, specific to BuyerTransaction Stages.", "Products": ["API", "Engage"], "EngageText": "For Buyer Transactions, this attribute displays the name or title that is associated with the current stage of the transaction.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 06:43:02.586893	2024-09-26 23:43:38.792875	{"Endpoints": ["BuyerTransaction"]}	stage_name
145	{"BuyerTransaction": ["Create Response", "Update Response", "Show Response", "Index Response"]}	{"APIText": "The stage that the BuyerTransaction should be placed into.", "Products": ["API"], "BuyerTransaction": ["API"]}	2024-09-27 06:43:02.618698	2024-09-26 23:43:38.792875	{"Endpoints": ["BuyerTransaction"]}	state_changed_at
138	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "The minimum price range for a property if using a price range rather than target price.", "BuyerTransaction": ["Engage"]}	2024-09-27 06:43:02.561314	2024-09-26 23:43:38.792875	{"Endpoints": ["BuyerTransaction"]}	min_price
117	{"BuyerTransaction": ["Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "A brief, human readable title that will be shown to the agent as the subject of the BuyerTransaction that you are creating.", "Products": ["API", "Engage"], "EngageText": "For Buyer Transactions, this will be the name or title of the transaction in question.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 06:43:02.461325	2024-09-26 23:43:38.792875	{"Endpoints": ["BuyerTransaction"]}	transaction_name
119	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This should be populated if this BuyerTransaction is_mls_transaction is false.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this is the street address of the property being purchased.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 06:43:02.471992	2024-09-26 23:43:38.792875	{"Endpoints": ["BuyerTransaction"]}	address
120	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This should be populated if this BuyerTransaction is_mls_transaction is false.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this will be the city or township of the property being purchased.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 06:43:02.477447	2024-09-26 23:43:38.792875	{"Endpoints": ["BuyerTransaction"]}	city
121	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This should be populated if this BuyerTransaction is_mls_transaction is false.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this will be the state or province of the property being purchased.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 06:43:02.482214	2024-09-26 23:43:38.792875	{"Endpoints": ["BuyerTransaction"]}	state
122	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This should be populated if this BuyerTransaction is_mls_transaction is false.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this will be the postal code of the property being purchased.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 06:43:02.486744	2024-09-26 23:43:38.792875	{"Endpoints": ["BuyerTransaction"]}	zip_code
123	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the minimum desired living area for prospective properties.", "BuyerTransaction": ["Engage"]}	2024-09-27 06:43:02.490815	2024-09-26 23:43:38.792875	{"Endpoints": ["BuyerTransaction"]}	min_sqft
124	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the maximum desired living area for prospective properties.", "BuyerTransaction": ["Engage"]}	2024-09-27 06:43:02.495244	2024-09-26 23:43:38.792875	{"Endpoints": ["BuyerTransaction"]}	max_sqft
125	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the minimum number of bedrooms for prospective properties.", "BuyerTransaction": ["Engage"]}	2024-09-27 06:43:02.499344	2024-09-26 23:43:38.792875	{"Endpoints": ["BuyerTransaction"]}	min_beds
126	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the maximum number of bedrooms for prospective properties.", "BuyerTransaction": ["Engage"]}	2024-09-27 06:43:02.50387	2024-09-26 23:43:38.792875	{"Endpoints": ["BuyerTransaction"]}	max_beds
127	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the minimum number of bathrooms for prospective properties.", "BuyerTransaction": ["Engage"]}	2024-09-27 06:43:02.508738	2024-09-26 23:43:38.792875	{"Endpoints": ["BuyerTransaction"]}	min_baths
128	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the maximum number of bathrooms for prospective properties.", "BuyerTransaction": ["Engage"]}	2024-09-27 06:43:02.512968	2024-09-26 23:43:38.792875	{"Endpoints": ["BuyerTransaction"]}	max_baths
129	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the name of a locality representing an area of interest for prospective properties.", "BuyerTransaction": ["Engage"]}	2024-09-27 06:43:02.517421	2024-09-26 23:43:38.792875	{"Endpoints": ["BuyerTransaction"]}	area_of_interest
130	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This should be false for paperwork-only, for sale by owner, off-market, or pocket listing type transactions or any transactions that will not be tracked through an MLS.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this attribute indictates whether the property being purchased is listed on an MLS.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 06:43:02.522559	2024-09-26 23:43:38.792875	{"Endpoints": ["BuyerTransaction"]}	is_mls_transaction
131	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "mls_number should be populated only if is_mls_transaction is true. If no commission (either commission_percentage or commission_flat_fee) is supplied during creation, commission_percentage is set to the default commission_percentage for the associated Agent.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, the MLS number of the the property being purchased.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 06:43:02.527021	2024-09-26 23:43:38.792875	{"Endpoints": ["BuyerTransaction"]}	mls_number
132	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This is the Unix timestamp representing the date that the agent initiated transaction discussions with the client.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this would be considered the date and time when the Agent first initiated transaction discussions with the client.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 06:43:02.532586	2024-09-26 23:43:38.792875	{"Endpoints": ["BuyerTransaction"]}	start_timestamp
134	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "If the commission for the transaction is based on a flat dollar amount, use this attribute.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this is the dollar amount of the total commission for the transaction.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 06:43:02.542857	2024-09-26 23:43:38.792875	{"Endpoints": ["BuyerTransaction"]}	commission_flat_fee
133	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "If the commission for the transaction is based on a percentage of the purchase amount, use this attribute. If no commission (either commission_percentage or commission_flat_fee) is supplied during creation, commission_percentage is set to the default commission_percentage for the associated Agent.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, the total commission for the transaction based on this percentage of the purchase price.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 06:43:02.537871	2024-09-26 23:43:38.792875	{"Endpoints": ["BuyerTransaction"]}	commission_percentage
139	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "The maximum price range for a property if using a price range rather than target price.", "BuyerTransaction": ["Engage"]}	2024-09-27 06:43:02.56588	2024-09-26 23:43:38.792875	{"Endpoints": ["BuyerTransaction"]}	max_price
143	{"BuyerTransaction": ["Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This should be null if the BuyerTransaction is not yet in complete state.", "Products": ["API", "Engage"], "EngageText": "This is the closing price for the transaction.", "BuyerTransaction": ["API", "Engage"]}	2024-09-27 06:43:02.609507	2024-09-26 23:43:38.792875	{"Endpoints": ["BuyerTransaction"]}	closing_price
5	{"ActionLog": ["Create Request", "Create Response", "Index Request", "Index Response"], "BuyerTransaction": ["Create Request", "Create Response", "Update Response", "Show Response", "Index Request", "Index Response"]}	{"APIText": "This will be an RFC 4122 compliant UUID, and is the same as the moxi_works_contact_id attribute of the Contact response.", "Products": ["API", "ActionLog"], "ActionLog": ["API", "ActionLog"], "ActionLogText": "This is the MoxiWorks Platform ID of a Contact an ActionLog object is to be associated with. This data is required and must reference a valid MoxiWorks Contact ID for your ActionLog Create request to be accepted."}	2024-09-27 06:43:01.806806	2024-09-26 23:43:38.792875	{"Endpoints": ["ActionLog", "BuyerTransaction"]}	moxi_works_contact_id
6	{"ActionLog": ["Create Request", "Create Response", "Index Request", "Index Response"], "BuyerTransaction": ["Create Request", "Create Response", "Update Response", "Show Response", "Index Request", "Index Response"]}	{"APIText": "This is the unique identifer used in the system that will be connecting to the MoxiWorks platform.", "Products": ["API", "ActionLog"], "ActionLog": ["API", "ActionLog"], "ActionLogText": "This UUID will have already been associated with the Contact the ActionLog entry is created about. The Contact record on the MoxiWorks Platform can be created as necessary using Contact Create before attempting to use this contact ID to create an ActionLog entry. Failure to do so will result in the request being rejected."}	2024-09-27 06:43:01.811902	2024-09-26 23:43:38.792875	{"Endpoints": ["ActionLog", "BuyerTransaction"]}	partner_contact_id
2	{"Agent": ["Create Request", "Create Response", "Index Response"], "Brand": ["Index Request"], "ActionLog": ["Create Request", "Create Response", "Delete Request", "Index Request", "Index Response"], "BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Request", "Show Response", "Index Request", "Index Response"]}	{"Agent": ["API", "Roster"], "Brand": ["API", "Roster"], "APIText": "If you have already existing agent data, agent accounts and your own user interface that agents can use to integrate your account with their MoxiWorks Platform account then you should use the moxi_works_agent_id request attribute. It is intended for use cases where integration is managed by end-user interaction.", "Products": ["API", "Roster"], "ActionLog": ["API", "Roster"], "RosterText": "This identifier is guaranteed to be unique, but may be either an alphanumeric string or an email address.", "BuyerTransaction": ["API", "Roster"]}	2024-09-27 06:43:01.787401	2024-09-26 23:43:38.792875	{"Endpoints": ["ActionLog", "Agent", "Brand", "BuyerTransaction"]}	moxi_works_agent_id
1	{"Agent": ["Create Request"], "Brand": ["Index Request"], "ActionLog": ["Create Request", "Create Response", "Delete Request", "Index Request", "Index Response"], "BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Request", "Show Response", "Index Request", "Index Response"]}	{"Agent": ["API", "Roster"], "Brand": ["API", "Roster"], "APIText": "This will be an RFC 4122 compliant UUID. If data is being pulled from The MoxiWorks Platform and integrating with your own system in a managed or automated fashion, then using agent_uuid request attribute is preferable. It is guaranteed to be unique and to never change for the lifetime of the account.", "Products": ["API", "Roster"], "ActionLog": ["API", "Roster"], "RosterText": "Agent UUID, found on profile page within Roster/Client Manager and is the user account level UUID.", "BuyerTransaction": ["API", "Roster"]}	2024-09-27 06:43:01.78344	2024-09-26 23:43:38.792875	{"Endpoints": ["ActionLog", "Agent", "Brand", "BuyerTransaction"]}	agent_uuid
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

