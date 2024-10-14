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
    associated_endpoints jsonb DEFAULT '{}'::jsonb NOT NULL,
    attr_title character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
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
    updated_at timestamp(6) without time zone NOT NULL,
    approved boolean DEFAULT false NOT NULL
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
environment	development	2024-10-13 23:57:10.61822	2024-10-13 23:57:10.618222
\.


--
-- Data for Name: associated_attrs; Type: TABLE DATA; Schema: public; Owner: aaron
--

COPY public.associated_attrs (id, request_type, ui_info, associated_endpoints, attr_title, created_at, updated_at) FROM stdin;
25	{"Agent": ["Create Request"]}	{"Agent": ["API", "Engage"], "APIText": "Whether to include agent’s GCI goals and commissions data in the response data.", "Products": ["API", "Engage"], "EngageText": "This represents the Gross Commission Income goal, as seen throughout the Engage UI."}	{"Endpoints": ["Agent"]}	include_gci_goals	2024-10-13 23:57:14.216565	2024-10-13 16:57:39.394238
149	{"Company": ["Search Request"]}	{"APIText": "Number of companies records to return per page.", "Company": ["API"], "Products": ["API"]}	{"Endpoints": ["Company"]}	per_page	2024-10-13 23:57:14.551146	2024-10-13 16:58:08.545466
150	{"Company": ["Search Request"]}	{"APIText": "Page of companies records to return.", "Company": ["API"], "Products": ["API"]}	{"Endpoints": ["Company"]}	show_paging_totals	2024-10-13 23:57:14.553747	2024-10-13 16:58:08.545466
147	{"Company": ["Show Response", "Index Response", "Search Response"]}	{"APIText": "This is the numeric company id that is interchangeable with the moxi_works_agent_id in all request scenarios.", "Company": ["API"], "Products": ["API"]}	{"Endpoints": ["Company"]}	numeric_id	2024-10-13 23:57:14.544643	2024-10-13 16:58:08.545466
148	{"Company": ["Show Response", "Index Response", "Search Response"]}	{"APIText": "Exposed company attributes.", "Company": ["API"], "Products": ["API"]}	{"Endpoints": ["Company"]}	public_partner_attrs	2024-10-13 23:57:14.547337	2024-10-13 16:58:08.545466
252	{}	{}	{}	partner_group_id	2024-10-13 23:57:14.875246	2024-10-13 23:57:14.875246
253	{}	{}	{}	moxi_works_group_name	2024-10-13 23:57:14.879384	2024-10-13 23:57:14.879384
254	{}	{}	{}	moxi_works_group_id	2024-10-13 23:57:14.880988	2024-10-13 23:57:14.880988
255	{}	{}	{}	transient	2024-10-13 23:57:14.883319	2024-10-13 23:57:14.883319
256	{}	{}	{}	is_contact_removal	2024-10-13 23:57:14.885	2024-10-13 23:57:14.885
257	{}	{}	{}	updated_contacts	2024-10-13 23:57:14.886781	2024-10-13 23:57:14.886781
258	{}	{}	{}	is_partner_alias	2024-10-13 23:57:14.904263	2024-10-13 23:57:14.904263
259	{}	{}	{}	is_partner_default	2024-10-13 23:57:14.90608	2024-10-13 23:57:14.90608
260	{}	{}	{}	moxi_works_listing_id	2024-10-13 23:57:14.907961	2024-10-13 23:57:14.907961
261	{}	{}	{}	underscore_response	2024-10-13 23:57:14.910373	2024-10-13 23:57:14.910373
262	{}	{}	{}	LotSizeAcres	2024-10-13 23:57:14.912051	2024-10-13 23:57:14.912051
263	{}	{}	{}	BathroomsFull	2024-10-13 23:57:14.913755	2024-10-13 23:57:14.913755
264	{}	{}	{}	BathroomsHalf	2024-10-13 23:57:14.915779	2024-10-13 23:57:14.915779
265	{}	{}	{}	BathroomsOneQuarter	2024-10-13 23:57:14.917573	2024-10-13 23:57:14.917573
266	{}	{}	{}	BathroomsPartial	2024-10-13 23:57:14.919232	2024-10-13 23:57:14.919232
267	{}	{}	{}	BathroomsThreeQuarter	2024-10-13 23:57:14.921027	2024-10-13 23:57:14.921027
268	{}	{}	{}	BathroomsTotalInteger	2024-10-13 23:57:14.922903	2024-10-13 23:57:14.922903
269	{}	{}	{}	BathroomsTotal	2024-10-13 23:57:14.924684	2024-10-13 23:57:14.924684
270	{}	{}	{}	BedroomsTotal	2024-10-13 23:57:14.926479	2024-10-13 23:57:14.926479
271	{}	{}	{}	PublicTitle	2024-10-13 23:57:14.928284	2024-10-13 23:57:14.928284
272	{}	{}	{}	PublicRemarks	2024-10-13 23:57:14.929992	2024-10-13 23:57:14.929992
273	{}	{}	{}	ModificationTimestamp	2024-10-13 23:57:14.931773	2024-10-13 23:57:14.931773
274	{}	{}	{}	StatusChangeDate	2024-10-13 23:57:14.933566	2024-10-13 23:57:14.933566
275	{}	{}	{}	InternetAddressDisplayYN	2024-10-13 23:57:14.93535	2024-10-13 23:57:14.93535
276	{}	{}	{}	DaysOnMarket	2024-10-13 23:57:14.937188	2024-10-13 23:57:14.937188
277	{}	{}	{}	ListingContractDate	2024-10-13 23:57:14.939376	2024-10-13 23:57:14.939376
278	{}	{}	{}	CreatedDate	2024-10-13 23:57:14.941282	2024-10-13 23:57:14.941282
279	{}	{}	{}	ElementarySchool	2024-10-13 23:57:14.943213	2024-10-13 23:57:14.943213
280	{}	{}	{}	GarageSpaces	2024-10-13 23:57:14.944897	2024-10-13 23:57:14.944897
281	{}	{}	{}	WaterfrontYN	2024-10-13 23:57:14.946756	2024-10-13 23:57:14.946756
282	{}	{}	{}	HighSchool	2024-10-13 23:57:14.948547	2024-10-13 23:57:14.948547
283	{}	{}	{}	AssociationFee	2024-10-13 23:57:14.950335	2024-10-13 23:57:14.950335
284	{}	{}	{}	ListOfficeName	2024-10-13 23:57:14.952143	2024-10-13 23:57:14.952143
249	{}	{"APIText": "This is the MLS #, not the listing ID.", "Gallery": ["API", "Roster"], "Products": ["API", "Roster"], "RosterText": "The MLS number for the listing."}	{"Endpoints": ["Event"]}	ListingID	2024-10-13 23:57:14.868309	2024-10-13 16:58:49.311506
250	{}	{"APIText": "Name of the MLS associated with the listing.", "Gallery": ["API", "Roster"], "Products": ["API", "Roster"], "RosterText": "The name of the MLS which this listing is listed with."}	{"Endpoints": ["Event"]}	ListOfficeAOR	2024-10-13 23:57:14.870103	2024-10-13 16:58:49.311506
251	{}	{"APIText": "[FullURL, GalleryURL, RawURL, SmallURL, ThumbURL, Title, IsMainListingImage, Caption, Description, Width, Height, MimeType, EmbededHTMLContent]", "Gallery": ["API", "Roster"], "Products": ["API", "Roster"], "RosterText": "This represents any images in the gallery."}	{"Endpoints": ["Event"]}	ListingImages	2024-10-13 23:57:14.871807	2024-10-13 16:58:49.311506
285	{}	{}	{}	ListPrice	2024-10-13 23:57:14.953983	2024-10-13 23:57:14.953983
286	{}	{}	{}	ListAgentFullName	2024-10-13 23:57:14.956327	2024-10-13 23:57:14.956327
287	{}	{}	{}	ListAgentUUID	2024-10-13 23:57:14.958131	2024-10-13 23:57:14.958131
288	{}	{}	{}	ListAgentOfficeID	2024-10-13 23:57:14.959954	2024-10-13 23:57:14.959954
289	{}	{}	{}	ListAgentMoxiWorksOfficeID	2024-10-13 23:57:14.961659	2024-10-13 23:57:14.961659
290	{}	{}	{}	SecondaryListAgentFullName	2024-10-13 23:57:14.963838	2024-10-13 23:57:14.963838
291	{}	{}	{}	SecondaryListAgentUUID	2024-10-13 23:57:14.965771	2024-10-13 23:57:14.965771
292	{}	{}	{}	SchoolDistrict	2024-10-13 23:57:14.967683	2024-10-13 23:57:14.967683
293	{}	{}	{}	Address	2024-10-13 23:57:14.969555	2024-10-13 23:57:14.969555
294	{}	{}	{}	Address2	2024-10-13 23:57:14.971343	2024-10-13 23:57:14.971343
295	{}	{}	{}	City	2024-10-13 23:57:14.973045	2024-10-13 23:57:14.973045
296	{}	{}	{}	CountyOrParish	2024-10-13 23:57:14.974808	2024-10-13 23:57:14.974808
297	{}	{}	{}	Latitude	2024-10-13 23:57:14.976631	2024-10-13 23:57:14.976631
298	{}	{}	{}	Longitude	2024-10-13 23:57:14.978395	2024-10-13 23:57:14.978395
299	{}	{}	{}	StateOrProvince	2024-10-13 23:57:14.980221	2024-10-13 23:57:14.980221
300	{}	{}	{}	PostalCode	2024-10-13 23:57:14.982028	2024-10-13 23:57:14.982028
301	{}	{}	{}	Community	2024-10-13 23:57:14.983865	2024-10-13 23:57:14.983865
302	{}	{}	{}	LotSizeSquareFeet	2024-10-13 23:57:14.986028	2024-10-13 23:57:14.986028
303	{}	{}	{}	InternetEntireListingDisplayYN	2024-10-13 23:57:14.987981	2024-10-13 23:57:14.987981
304	{}	{}	{}	MiddleOrJuniorSchool	2024-10-13 23:57:14.989724	2024-10-13 23:57:14.989724
305	{}	{}	{}	ListOfficeAORArea	2024-10-13 23:57:14.992119	2024-10-13 23:57:14.992119
306	{}	{}	{}	PoolYN	2024-10-13 23:57:14.994008	2024-10-13 23:57:14.994008
307	{}	{}	{}	PropertyType	2024-10-13 23:57:14.995803	2024-10-13 23:57:14.995803
308	{}	{}	{}	TaxAnnualAmount	2024-10-13 23:57:14.997602	2024-10-13 23:57:14.997602
309	{}	{}	{}	TaxYear	2024-10-13 23:57:14.999382	2024-10-13 23:57:14.999382
310	{}	{}	{}	SingleStory	2024-10-13 23:57:15.00117	2024-10-13 23:57:15.00117
311	{}	{}	{}	LivingArea	2024-10-13 23:57:15.002979	2024-10-13 23:57:15.002979
312	{}	{}	{}	ViewYN	2024-10-13 23:57:15.004707	2024-10-13 23:57:15.004707
313	{}	{}	{}	YearBuilt	2024-10-13 23:57:15.006475	2024-10-13 23:57:15.006475
314	{}	{}	{}	OnMarket	2024-10-13 23:57:15.008299	2024-10-13 23:57:15.008299
315	{}	{}	{}	Status	2024-10-13 23:57:15.010465	2024-10-13 23:57:15.010465
316	{}	{}	{}	MoxiWorksListingId	2024-10-13 23:57:15.012385	2024-10-13 23:57:15.012385
317	{}	{}	{}	AgentCreatedListing	2024-10-13 23:57:15.014284	2024-10-13 23:57:15.014284
318	{}	{}	{}	VirtualTourURL	2024-10-13 23:57:15.016147	2024-10-13 23:57:15.016147
319	{}	{}	{}	SharedPartnerData	2024-10-13 23:57:15.017844	2024-10-13 23:57:15.017844
320	{}	{}	{}	TaxParcelId	2024-10-13 23:57:15.019642	2024-10-13 23:57:15.019642
321	{}	{}	{}	ListingURL	2024-10-13 23:57:15.02143	2024-10-13 23:57:15.02143
322	{}	{}	{}	PropertyFeatures	2024-10-13 23:57:15.023229	2024-10-13 23:57:15.023229
323	{}	{}	{}	CompanyListingAttributes	2024-10-13 23:57:15.025018	2024-10-13 23:57:15.025018
324	{}	{}	{}	OpenHouse	2024-10-13 23:57:15.026826	2024-10-13 23:57:15.026826
325	{}	{}	{}	ImagesLastModified	2024-10-13 23:57:15.028626	2024-10-13 23:57:15.028626
326	{}	{}	{}	BuyerCommissionType	2024-10-13 23:57:15.030921	2024-10-13 23:57:15.030921
327	{}	{}	{}	BuyerCommissionValue	2024-10-13 23:57:15.033089	2024-10-13 23:57:15.033089
328	{}	{}	{}	last_moxi_works_listing_id	2024-10-13 23:57:15.072676	2024-10-13 23:57:15.072676
329	{}	{}	{}	shared_partner_data_updated_since	2024-10-13 23:57:15.074943	2024-10-13 23:57:15.074943
330	{}	{}	{}	market_status	2024-10-13 23:57:15.076817	2024-10-13 23:57:15.076817
331	{}	{}	{}	property_types	2024-10-13 23:57:15.078565	2024-10-13 23:57:15.078565
332	{}	{}	{}	only_agent_created	2024-10-13 23:57:15.080351	2024-10-13 23:57:15.080351
333	{}	{}	{}	coming_soon	2024-10-13 23:57:15.082212	2024-10-13 23:57:15.082212
334	{}	{}	{}	FinalPage	2024-10-13 23:57:15.08523	2024-10-13 23:57:15.08523
335	{}	{}	{}	Listings	2024-10-13 23:57:15.087272	2024-10-13 23:57:15.087272
336	{}	{}	{}	id	2024-10-13 23:57:15.090781	2024-10-13 23:57:15.090781
337	{}	{}	{}	common_name	2024-10-13 23:57:15.093362	2024-10-13 23:57:15.093362
338	{}	{}	{}	image_url	2024-10-13 23:57:15.095344	2024-10-13 23:57:15.095344
339	{}	{}	{}	address2	2024-10-13 23:57:15.097691	2024-10-13 23:57:15.097691
340	{}	{}	{}	county	2024-10-13 23:57:15.099984	2024-10-13 23:57:15.099984
341	{}	{}	{}	alt_phone	2024-10-13 23:57:15.102697	2024-10-13 23:57:15.102697
342	{}	{}	{}	email	2024-10-13 23:57:15.104561	2024-10-13 23:57:15.104561
343	{}	{}	{}	phone	2024-10-13 23:57:15.107196	2024-10-13 23:57:15.107196
344	{}	{}	{}	timezone	2024-10-13 23:57:15.109433	2024-10-13 23:57:15.109433
345	{}	{}	{}	office_website	2024-10-13 23:57:15.111801	2024-10-13 23:57:15.111801
346	{}	{}	{}	mailing_address	2024-10-13 23:57:15.114136	2024-10-13 23:57:15.114136
347	{}	{}	{}	mailing_address2	2024-10-13 23:57:15.116043	2024-10-13 23:57:15.116043
348	{}	{}	{}	mailing_city	2024-10-13 23:57:15.117855	2024-10-13 23:57:15.117855
349	{}	{}	{}	mailing_zip	2024-10-13 23:57:15.119657	2024-10-13 23:57:15.119657
350	{}	{}	{}	mailing_state	2024-10-13 23:57:15.121447	2024-10-13 23:57:15.121447
351	{}	{}	{}	logo_url	2024-10-13 23:57:15.124487	2024-10-13 23:57:15.124487
352	{}	{}	{}	offices	2024-10-13 23:57:15.129618	2024-10-13 23:57:15.129618
353	{}	{}	{}	created_after	2024-10-13 23:57:15.134022	2024-10-13 23:57:15.134022
354	{}	{}	{}	created_before	2024-10-13 23:57:15.135998	2024-10-13 23:57:15.135998
355	{}	{}	{}	updated_after	2024-10-13 23:57:15.137857	2024-10-13 23:57:15.137857
356	{}	{}	{}	updated_before	2024-10-13 23:57:15.139661	2024-10-13 23:57:15.139661
357	{}	{}	{}	include_times	2024-10-13 23:57:15.141765	2024-10-13 23:57:15.141765
358	{}	{}	{}	type	2024-10-13 23:57:15.143568	2024-10-13 23:57:15.143568
359	{}	{}	{}	presentations	2024-10-13 23:57:15.146229	2024-10-13 23:57:15.146229
360	{}	{}	{}	SoldDate	2024-10-13 23:57:15.181988	2024-10-13 23:57:15.181988
361	{}	{}	{}	SoldPrice	2024-10-13 23:57:15.184284	2024-10-13 23:57:15.184284
362	{}	{}	{}	BuyerAgentFullName	2024-10-13 23:57:15.186304	2024-10-13 23:57:15.186304
363	{}	{}	{}	BuyerAgentUUID	2024-10-13 23:57:15.188306	2024-10-13 23:57:15.188306
364	{}	{}	{}	BuyerAgentOfficeName	2024-10-13 23:57:15.190143	2024-10-13 23:57:15.190143
365	{}	{}	{}	BuyerAgentOfficeID	2024-10-13 23:57:15.192078	2024-10-13 23:57:15.192078
366	{}	{}	{}	BuyerAgentMoxiWorksOfficeID	2024-10-13 23:57:15.193953	2024-10-13 23:57:15.193953
367	{}	{}	{}	sold_since	2024-10-13 23:57:15.196681	2024-10-13 23:57:15.196681
368	{}	{}	{}	sold_before	2024-10-13 23:57:15.198463	2024-10-13 23:57:15.198463
369	{}	{}	{}	include_buyer_listings	2024-10-13 23:57:15.20244	2024-10-13 23:57:15.20244
370	{}	{}	{}	partner_task_id	2024-10-13 23:57:15.207142	2024-10-13 23:57:15.207142
371	{}	{}	{}	due_at	2024-10-13 23:57:15.209976	2024-10-13 23:57:15.209976
372	{}	{}	{}	duration	2024-10-13 23:57:15.21274	2024-10-13 23:57:15.21274
373	{}	{}	{}	description	2024-10-13 23:57:15.214621	2024-10-13 23:57:15.214621
374	{}	{}	{}	completed_at	2024-10-13 23:57:15.220414	2024-10-13 23:57:15.220414
375	{}	{}	{}	due_date_start	2024-10-13 23:57:15.236821	2024-10-13 23:57:15.236821
376	{}	{}	{}	due_date_end	2024-10-13 23:57:15.238642	2024-10-13 23:57:15.238642
377	{}	{}	{}	tasks	2024-10-13 23:57:15.242093	2024-10-13 23:57:15.242093
378	{}	{}	{}	moxi_works_team_id	2024-10-13 23:57:15.244148	2024-10-13 23:57:15.244148
379	{}	{}	{}	address1	2024-10-13 23:57:15.247984	2024-10-13 23:57:15.247984
380	{}	{}	{}	fax	2024-10-13 23:57:15.252328	2024-10-13 23:57:15.252328
381	{}	{}	{}	photo_url	2024-10-13 23:57:15.254753	2024-10-13 23:57:15.254753
382	{}	{}	{}	alt_email	2024-10-13 23:57:15.257837	2024-10-13 23:57:15.257837
383	{}	{}	{}	website_url	2024-10-13 23:57:15.259781	2024-10-13 23:57:15.259781
384	{}	{}	{}	active	2024-10-13 23:57:15.261636	2024-10-13 23:57:15.261636
385	{}	{}	{}	has_agent_association	2024-10-13 23:57:15.274897	2024-10-13 23:57:15.274897
386	{}	{}	{}	has_web_data	2024-10-13 23:57:15.276669	2024-10-13 23:57:15.276669
387	{}	{}	{}	has_favorites	2024-10-13 23:57:15.278897	2024-10-13 23:57:15.278897
388	{}	{}	{}	has_searches	2024-10-13 23:57:15.280864	2024-10-13 23:57:15.280864
389	{}	{}	{}	moxi_works_user_id	2024-10-13 23:57:15.28441	2024-10-13 23:57:15.28441
390	{}	{}	{}	associated_agent_uuid	2024-10-13 23:57:15.287584	2024-10-13 23:57:15.287584
391	{}	{}	{}	favorite_listing_ids	2024-10-13 23:57:15.289434	2024-10-13 23:57:15.289434
392	{}	{}	{}	saved_searches	2024-10-13 23:57:15.2913	2024-10-13 23:57:15.2913
215	{"EmailCampaign": ["Index Response"]}	{"APIText": "This is a unique, internally defined string per EmailSubscription type. Documentation of available subscription_type responses is outside the scope of this documentation. If you need help determining available types, please email partners@moxiworks.com.", "Products": ["API", "Engage"], "EngageText": "A string representing the type of EmailSubscription is associated with the Contact for the supplied partner_contact_id.", "EmailCampaign": ["API", "Engage"]}	{"Endpoints": ["EmailCampaign"]}	subscription_type	2024-10-13 23:57:14.783692	2024-10-13 16:58:30.246752
216	{"EmailCampaign": ["Index Response"]}	{"APIText": "Unix timestamp representing when the EmailSubscription that is associated with the Contact for the supplied partner_contact_id was initiated.", "Products": ["API"], "EmailCampaign": ["API"]}	{"Endpoints": ["EmailCampaign"]}	subscribed_at	2024-10-13 23:57:14.786164	2024-10-13 16:58:30.246752
217	{"EmailCampaign": ["Index Response"]}	{"APIText": "This is a string representing the actor responsible for the subscription initiation.", "Products": ["API"], "EmailCampaign": ["API"]}	{"Endpoints": ["EmailCampaign"]}	created_by	2024-10-13 23:57:14.788062	2024-10-13 16:58:30.246752
218	{"EmailCampaign": ["Index Response"]}	{"APIText": "A string representing a geographic area that the EmailSubscription regards.", "Products": ["API"], "EmailCampaign": ["API"]}	{"Endpoints": ["EmailCampaign"]}	area	2024-10-13 23:57:14.789958	2024-10-13 16:58:30.246752
219	{"EmailCampaign": ["Index Response"]}	{"APIText": "This is a Unix timestamp representing the point in time that the last EmailSubscription message was sent.", "Products": ["API"], "EmailCampaign": ["API"]}	{"Endpoints": ["EmailCampaign"]}	last_sent	2024-10-13 23:57:14.791807	2024-10-13 16:58:30.246752
221	{"EmailCampaign": ["Index Response"]}	{"APIText": "Unix timestamp representing when the EmailSubscription was created.", "Products": ["API"], "EmailCampaign": ["API"]}	{"Endpoints": ["EmailCampaign"]}	created_at	2024-10-13 23:57:14.795404	2024-10-13 16:58:30.246752
223	{"EmailCampaign": ["Index Response"]}	{"APIText": "Who the EmailSubscription that is associated with the Contact for the supplied partner_contact_id was unsubscribed by.", "Products": ["API"], "EmailCampaign": ["API"]}	{"Endpoints": ["EmailCampaign"]}	unsubscribed_by	2024-10-13 23:57:14.798883	2024-10-13 16:58:30.246752
226	{"EmailCampaign": ["Index Response"]}	{"APIText": "", "Products": ["API"], "EmailCampaign": ["API"]}	{"Endpoints": ["EmailCampaign"]}	zipcode	2024-10-13 23:57:14.804139	2024-10-13 16:58:30.246752
4	{"ActionLog": ["Create Request", "Create Response"]}	{"APIText": "This can be any arbitrary plain-text string which would be practical for the agent to see in the history of events associated with a Contact. It must be greater than 0 and must be less than 5000 characters (including white space).", "Products": ["API", "ActionLog"], "ActionLog": ["API", "ActionLog"], "ActionLogText": "The text that displays as the content of the message in relation to the ActionLog entry."}	{"Endpoints": ["ActionLog"]}	body	2024-10-13 23:57:14.162009	2024-10-13 16:57:30.168054
10	{"ActionLog": ["Create Request", "Create Response"]}	{"Products": ["ActionLog"], "ActionLog": ["ActionLog"], "ActionLogText": "This is the human readable plain-text string which will be presented to the Agent as the heading of the ActionLog entry. This can be any short, descriptive sentence which would be practical for the agent to see in the history of events associated with a Contact."}	{"Endpoints": ["ActionLog"]}	agent_action	2024-10-13 23:57:14.17493	2024-10-13 16:57:30.168054
11	{"ActionLog": ["Create Request", "Create Response"]}	{"Products": ["ActionLog"], "ActionLog": ["ActionLog"], "ActionLogText": "If creating an agent_action that has a location component (‘inperson’ ‘other’) use this field to denote the street address of the agent_action."}	{"Endpoints": ["ActionLog"]}	agent_action_address	2024-10-13 23:57:14.176914	2024-10-13 16:57:30.168054
12	{"ActionLog": ["Create Request", "Create Response"]}	{"Products": ["ActionLog"], "ActionLog": ["ActionLog"], "ActionLogText": "If creating an agent_action that has a location component (‘inperson’ ‘other’) use this field to denote the additonal street address info of the agent_action."}	{"Endpoints": ["ActionLog"]}	agent_action_address2	2024-10-13 23:57:14.178808	2024-10-13 16:57:30.168054
13	{"ActionLog": ["Create Request", "Create Response"]}	{"Products": ["ActionLog"], "ActionLog": ["ActionLog"], "ActionLogText": "If creating an agent_action that has a location component (‘inperson’ ‘other’) use this field to denote the city or locale of the agent_action."}	{"Endpoints": ["ActionLog"]}	agent_action_city	2024-10-13 23:57:14.180564	2024-10-13 16:57:30.168054
16	{"ActionLog": ["Create Response"]}	{"APIText": "This is the Unix timestamp for the creation time of the ActionLog entry.", "Products": ["API"], "ActionLog": ["API"]}	{"Endpoints": ["ActionLog"]}	timestamp	2024-10-13 23:57:14.187991	2024-10-13 16:57:30.168054
14	{"ActionLog": ["Create Request", "Create Response"]}	{"Products": ["ActionLog"], "ActionLog": ["ActionLog"], "ActionLogText": "If creating an agent_action that has a location component (‘inperson’ ‘other’) use this field to denote the state or province related info of the agent_action."}	{"Endpoints": ["ActionLog"]}	agent_action_state	2024-10-13 23:57:14.182355	2024-10-13 16:57:30.168054
15	{"ActionLog": ["Create Request", "Create Response"]}	{"Products": ["ActionLog"], "ActionLog": ["ActionLog"], "ActionLogText": "If creating an agent_action that has a location component (‘inperson’ ‘other’) use this field to denote the postal code of the agent_action."}	{"Endpoints": ["ActionLog"]}	agent_action_zip	2024-10-13 23:57:14.184177	2024-10-13 16:57:30.168054
17	{"ActionLog": ["Delete Request"]}	{"APIText": "This is the MoxiWorks Platform ID of the ActionLog entry to be deleted. This will be an RFC 4122 compliant UUID.", "Products": ["API"], "ActionLog": ["API"]}	{"Endpoints": ["ActionLog"]}	moxi_works_action_log_id	2024-10-13 23:57:14.193217	2024-10-13 16:57:30.168054
21	{"ActionLog": ["Index Request"]}	{"APIText": "Only ActionLog records created later than this Unix timestamp will be included in the query. The upper bound of the time slice will be the 90 days higher than date_min value or the value of the the date_max; whichever is lower. If no timestamps are provided, ActionLogs from the last 90 days will be retrieved. The maximum timeframe for data is 90 days. date_min and date_max should be set in 90 day increments to retrieve the data from a specific historical point.", "Products": ["API"], "ActionLog": ["API"]}	{"Endpoints": ["ActionLog"]}	date_min	2024-10-13 23:57:14.206037	2024-10-13 16:57:30.168054
22	{"ActionLog": ["Index Request"]}	{"APIText": "Only ActionLog records created earlier than this Unix timestamp will be included in the query. Should be no higher than 90 days past the date_min attribute if it is provided. The maximum timeframe for data is 90 days. date_min and date_max should be set in 90 day increments to retrieve the data from a specific historical point.", "Products": ["API"], "ActionLog": ["API"]}	{"Endpoints": ["ActionLog"]}	date_max	2024-10-13 23:57:14.207769	2024-10-13 16:57:30.168054
163	{"Contact": ["Create Request"]}	{"APIText": "If the created Contact record is not for a lead set this to true. By default this is false.", "Contact": ["API"], "Products": ["API"]}	{"Endpoints": ["Contact"]}	is_not_lead	2024-10-13 23:57:14.582231	2024-10-13 16:58:21.195751
164	{"Contact": ["Create Request"]}	{"APIText": "If the created Contact record should be treated as a lead but it is not desired that the agent should receive an email or text that they have received a lead.", "Contact": ["API"], "Products": ["API"]}	{"Endpoints": ["Contact"]}	skip_agent_notification	2024-10-13 23:57:14.584146	2024-10-13 16:58:21.195751
23	{"ActionLog": ["Index Response"]}	{"APIText": "This is an Array containing any ActionLog entries found for the Index request - [moxi_works_action_log_id, type, timestamp, log_data].", "Products": ["API"], "ActionLog": ["API"]}	{"Endpoints": ["ActionLog"]}	actions	2024-10-13 23:57:14.211071	2024-10-13 16:57:30.168054
225	{"EmailCampaign": ["Index Response"]}	{"APIText": "Boolean representing whether email subscription is a listing announcement for sold homes.", "Products": ["API"], "EmailCampaign": ["API"]}	{"Endpoints": ["EmailCampaign"]}	sold	2024-10-13 23:57:14.802386	2024-10-13 16:58:30.246752
227	{"EmailCampaign": ["Index Response"]}	{"APIText": "Type of neighborhood email subscription. This can either be “quick” or “custom”.", "Products": ["API"], "EmailCampaign": ["API"]}	{"Endpoints": ["EmailCampaign"]}	nn_subscription_type	2024-10-13 23:57:14.805926	2024-10-13 16:58:30.246752
228	{"EmailCampaign": ["Index Response"]}	{"APIText": "For “custom” neighborhood email subscription , search filter with min price.", "Products": ["API"], "EmailCampaign": ["API"]}	{"Endpoints": ["EmailCampaign"]}	nn_min_price	2024-10-13 23:57:14.808018	2024-10-13 16:58:30.246752
229	{"EmailCampaign": ["Index Response"]}	{"APIText": "For “custom” neighborhood email subscription , search filter with max price.", "Products": ["API"], "EmailCampaign": ["API"]}	{"Endpoints": ["EmailCampaign"]}	nn_max_price	2024-10-13 23:57:14.809876	2024-10-13 16:58:30.246752
230	{"EmailCampaign": ["Index Response"]}	{"APIText": "For “custom” neighborhood email subscription , search filter with min number of bedrooms.", "Products": ["API"], "EmailCampaign": ["API"]}	{"Endpoints": ["EmailCampaign"]}	nn_min_beds	2024-10-13 23:57:14.811552	2024-10-13 16:58:30.246752
231	{"EmailCampaign": ["Index Response"]}	{"APIText": "For “custom” neighborhood email subscription , search filter with max number of bedrooms.", "Products": ["API"], "EmailCampaign": ["API"]}	{"Endpoints": ["EmailCampaign"]}	nn_max_beds	2024-10-13 23:57:14.813451	2024-10-13 16:58:30.246752
232	{"EmailCampaign": ["Index Response"]}	{"APIText": "For “custom” neighborhood email subscription , search filter with min number of bathrooms.", "Products": ["API"], "EmailCampaign": ["API"]}	{"Endpoints": ["EmailCampaign"]}	nn_min_baths	2024-10-13 23:57:14.815288	2024-10-13 16:58:30.246752
233	{"EmailCampaign": ["Index Response"]}	{"APIText": "For “custom” neighborhood email subscription , search filter with min square feet", "Products": ["API"], "EmailCampaign": ["API"]}	{"Endpoints": ["EmailCampaign"]}	nn_min_sqft	2024-10-13 23:57:14.817054	2024-10-13 16:58:30.246752
234	{"EmailCampaign": ["Index Response"]}	{"APIText": "For “custom” neighborhood email subscription , search filter with max square feet.", "Products": ["API"], "EmailCampaign": ["API"]}	{"Endpoints": ["EmailCampaign"]}	nn_max_sqft	2024-10-13 23:57:14.81882	2024-10-13 16:58:30.246752
235	{"EmailCampaign": ["Index Response"]}	{"APIText": "For “custom” neighborhood email subscription, property_tye selected in the search filter. This value can be either Residential, Condominium, Manufactured Homes, Multi-family, Townhouse.", "Products": ["API"], "EmailCampaign": ["API"]}	{"Endpoints": ["EmailCampaign"]}	nn_property_type	2024-10-13 23:57:14.82061	2024-10-13 16:58:30.246752
224	{"EmailCampaign": ["Index Response"]}	{"APIText": "Boolean representing whether email subscription is a listing announcement for listed homes.", "Products": ["API"], "EmailCampaign": ["API"]}	{"Endpoints": ["EmailCampaign"]}	listed	2024-10-13 23:57:14.800608	2024-10-13 16:58:30.246752
220	{"EmailCampaign": ["Index Response"]}	{"APIText": "This is a Unix timestamp representing the point in time that the next EmailSubscription message will be sent.", "Products": ["API"], "EmailCampaign": ["API"]}	{"Endpoints": ["EmailCampaign"]}	next_scheduled	2024-10-13 23:57:14.793619	2024-10-13 16:58:30.246752
222	{"EmailCampaign": ["Index Response"]}	{"APIText": "Unix timestamp representing when the EmailSubscription that is associated with the Contact for the supplied partner_contact_id was unsubscribed.", "Products": ["API"], "EmailCampaign": ["API"]}	{"Endpoints": ["EmailCampaign"]}	unsubscribed_at	2024-10-13 23:57:14.797117	2024-10-13 16:58:30.246752
240	{"Event": ["Create Request", "Create Response", "Update Request", "Update Response"]}	{"Event": ["API", "Engage"], "APIText": "If send_reminder is true, this is how many minutes before the start of the event to send the reminder. Default is 15 minutes before.", "Products": ["API", "Engage"], "EngageText": "If a reminder is being sent, this will allow the user control of when it sends."}	{"Endpoints": ["Event"]}	remind_minutes_before	2024-10-13 23:57:14.83193	2024-10-13 16:58:39.612091
241	{"Event": ["Create Request", "Create Response", "Update Request", "Update Response"]}	{"Event": ["API", "Engage"], "APIText": "This is the Unix timestamp representing the start time of the Event that you are creating. This data is required and must be a valid Unix timestamp.", "Products": ["API", "Engage"], "EngageText": "Start time of the Event."}	{"Endpoints": ["Event"]}	event_start	2024-10-13 23:57:14.833821	2024-10-13 16:58:39.612091
78	{"Agent": ["Create Response"]}	{"Agent": ["Engage"], "Products": ["Engage"], "EngageText": "This is the agent’s Gross Commission Income goal, as seen throughout the Engage UI."}	{"Endpoints": ["Agent"]}	gci_goal	2024-10-13 23:57:14.311764	2024-10-13 16:57:39.394238
79	{"Agent": ["Create Response"]}	{"Agent": ["Roster"], "Products": ["Roster"], "RosterText": "Percentage commission rate for the agent when acting as a buyer’s agent."}	{"Endpoints": ["Agent"]}	buyer_commission_rate	2024-10-13 23:57:14.313601	2024-10-13 16:57:39.394238
80	{"Agent": ["Create Response"]}	{"Agent": ["Roster"], "Products": ["Roster"], "RosterText": "Percentage commission rate for the agent when acting as a seller’s agent."}	{"Endpoints": ["Agent"]}	seller_commission_rate	2024-10-13 23:57:14.31545	2024-10-13 16:57:39.394238
24	{"Agent": ["Index Request"]}	{"Agent": ["API", "Roster"], "APIText": "To include access level information for the agent in the response, pass true.", "Products": ["API", "Roster"], "RosterText": "The access level of the agent. This can return one of the possible access levels, as seen within the products and permissions page."}	{"Endpoints": ["Agent", "Agent"]}	include_access_level	2024-10-13 23:57:14.214941	2024-10-13 16:57:39.394238
27	{"Agent": ["Create Request", "Index Request"]}	{"Agent": ["API", "Roster"], "APIText": "To include ratings and reviews associated with the agent in the response, pass true.", "Products": ["API", "Roster"], "RosterText": "Referencing external agent reviews from platforms such as Zillow and Testimonial Tree."}	{"Endpoints": ["Agent"]}	include_reviews	2024-10-13 23:57:14.220517	2024-10-13 16:57:39.394238
26	{"Agent": ["Create Request", "Index Request"]}	{"Agent": ["API"], "APIText": "To include affiliate data associated with the agent in the response, pass true.", "Products": ["API"]}	{"Endpoints": ["Agent"]}	include_partners	2024-10-13 23:57:14.218426	2024-10-13 16:57:39.394238
94	{"Agent": ["Index Request"]}	{"Agent": ["API"], "APIText": "To find Agent accounts deactivated within the specified timeframe, pass true for this boolean parameter.", "Products": ["API"]}	{"Endpoints": ["Agent"]}	deactivated	2024-10-13 23:57:14.342253	2024-10-13 16:57:39.394238
96	{"Agent": ["Index Request"]}	{"Agent": ["API"], "APIText": "To include company specific programs associated with the agent in the response, pass true.", "Products": ["API"]}	{"Endpoints": ["Agent"]}	include_company_programs	2024-10-13 23:57:14.346674	2024-10-13 16:57:39.394238
98	{"Agent": ["Index Request"]}	{"Agent": ["API"], "APIText": "To include only Agent objects associated with company specific programs pass true.", "Products": ["API"]}	{"Endpoints": ["Agent"]}	has_company_programs	2024-10-13 23:57:14.350107	2024-10-13 16:57:39.394238
100	{"Agent": ["Index Request"]}	{"Agent": ["API", "Roster"], "APIText": "To include bio associated with the agent in the response, pass true.", "Products": ["API", "Roster"], "RosterText": "This references the bio of the agent, as seen on the about me > web info page."}	{"Endpoints": ["Agent"]}	include_bio	2024-10-13 23:57:14.353977	2024-10-13 16:57:39.394238
97	{"Agent": ["Index Request"]}	{"Agent": ["API", "Websites"], "APIText": "To include the base url (website_base_url) of the agent’s MoxiWorks website pass true.", "Products": ["API", "Websites"], "WebsitesText": "This references the website url for the agent."}	{"Endpoints": ["Agent"]}	include_website	2024-10-13 23:57:14.348443	2024-10-13 16:57:39.394238
95	{"Agent": ["Index Request"]}	{"Agent": ["API"], "APIText": "Any Agent objects deactivated after this Unix timestamp will be returned in the response. If no deactivated_since parameter is included in the request, only Agent objects deactivated in the last seven days will be returned.", "Products": ["API"]}	{"Endpoints": ["Agent"]}	deactivated_since	2024-10-13 23:57:14.34397	2024-10-13 16:57:39.394238
28	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the ID of the Agent, as utilized by their brokerage or company.", "Products": ["API"]}	{"Endpoints": ["Agent"]}	client_agent_id	2024-10-13 23:57:14.222749	2024-10-13 16:57:39.394238
29	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is the ID of the Agent utilized by their primary MLS. This ID allows listings to associate with the User Account.", "Products": ["API", "Roster"], "RosterText": "This ID can be found on the Manage MLS Associations page of the Agent or other User Account."}	{"Endpoints": ["Agent"]}	mls_agent_id	2024-10-13 23:57:14.224623	2024-10-13 16:57:39.394238
30	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the number of the license granted to the agent. Please see mls_agent_id for the Agent MLS ID value.", "Products": ["API"]}	{"Endpoints": ["Agent"]}	license	2024-10-13 23:57:14.226468	2024-10-13 16:57:39.394238
31	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is the name of the primary MLS for the agent.", "Products": ["API", "Roster"], "RosterText": "This name can be found on the Manage MLS Associations page of the Agent or other User Account."}	{"Endpoints": ["Agent"]}	mls_name	2024-10-13 23:57:14.228104	2024-10-13 16:57:39.394238
32	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the standard abbreviation of the primary MLS utilized by the agent.", "Products": ["API"]}	{"Endpoints": ["Agent"]}	mls_abbreviation	2024-10-13 23:57:14.229806	2024-10-13 16:57:39.394238
33	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the ID of this Agent. This will be an integer.", "Products": ["API"]}	{"Endpoints": ["Agent"]}	agent_id	2024-10-13 23:57:14.231723	2024-10-13 16:57:39.394238
36	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the ID of the office for this Agent. This will be an integer.", "Products": ["API"]}	{"Endpoints": ["Agent"]}	client_office_id	2024-10-13 23:57:14.236881	2024-10-13 16:57:39.394238
37	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the ID of the company for this Agent. This will be an integer.", "Products": ["API"]}	{"Endpoints": ["Agent"]}	company_id	2024-10-13 23:57:14.238597	2024-10-13 16:57:39.394238
39	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is the main associated physical street address where the office is located. It can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Displays under the associated office page."}	{"Endpoints": ["Agent"]}	office_address_street	2024-10-13 23:57:14.242028	2024-10-13 16:57:39.394238
40	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is the main associated secondary physical street address field, often populated with a suite or office number. This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Displays under the associated office page."}	{"Endpoints": ["Agent"]}	office_address_street2	2024-10-13 23:57:14.24412	2024-10-13 16:57:39.394238
41	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "The city where the office is located, as associated with the physical address. This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Displays under the associated office page."}	{"Endpoints": ["Agent"]}	office_address_city	2024-10-13 23:57:14.245955	2024-10-13 16:57:39.394238
42	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "The state where the office is located, as associated with the physical address. This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Displays under the associated office page."}	{"Endpoints": ["Agent"]}	office_address_state	2024-10-13 23:57:14.247794	2024-10-13 16:57:39.394238
43	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "The postal code associated with the office physical address. This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Displays under the associated office page."}	{"Endpoints": ["Agent"]}	office_address_zip	2024-10-13 23:57:14.249591	2024-10-13 16:57:39.394238
44	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the associated mailing address where the office is located. It can be null if there is no data for this attribute.", "Products": ["API"]}	{"Endpoints": ["Agent"]}	office_mailing_address_street	2024-10-13 23:57:14.251306	2024-10-13 16:57:39.394238
45	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the associated secondary mailing street address field, often populated with a suite or office number. This can be null if there is no data for this attribute.", "Products": ["API"]}	{"Endpoints": ["Agent"]}	office_mailing_address_street2	2024-10-13 23:57:14.252931	2024-10-13 16:57:39.394238
46	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "The city where the office receives mail, as associated with the mailing address. This can be null if there is no data for this attribute.", "Products": ["API"]}	{"Endpoints": ["Agent"]}	office_mailing_address_city	2024-10-13 23:57:14.254632	2024-10-13 16:57:39.394238
47	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "The state where the office receives mail, as associated with the mailing address. This can be null if there is no data for this attribute.", "Products": ["API"]}	{"Endpoints": ["Agent"]}	office_mailing_address_state	2024-10-13 23:57:14.256351	2024-10-13 16:57:39.394238
48	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "The postal code associated with the office mailing address. This can be null if there is no data for this attribute.", "Products": ["API"]}	{"Endpoints": ["Agent"]}	office_mailing_address_zip	2024-10-13 23:57:14.258103	2024-10-13 16:57:39.394238
52	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "The nickname of the agent."}	{"Endpoints": ["Agent"]}	nickname	2024-10-13 23:57:14.265028	2024-10-13 16:57:39.394238
53	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "This is the agent’s main phone number. This number should be considered the number the agent would like to be contacted by."}	{"Endpoints": ["Agent"]}	main_phone_number	2024-10-13 23:57:14.267123	2024-10-13 16:57:39.394238
54	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Mobile phone number of the agent. main_phone_number should be considered higher priority, if not the same."}	{"Endpoints": ["Agent"]}	mobile_phone_number	2024-10-13 23:57:14.268955	2024-10-13 16:57:39.394238
55	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "Alternate phone number for the agent. This should be considered second in priority to main_phone_number."}	{"Endpoints": ["Agent"]}	alt_phone_number	2024-10-13 23:57:14.270792	2024-10-13 16:57:39.394238
56	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "This is the agent’s fax phone number."}	{"Endpoints": ["Agent"]}	fax_phone_number	2024-10-13 23:57:14.272624	2024-10-13 16:57:39.394238
57	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "This is the agent’s office phone number."}	{"Endpoints": ["Agent"]}	office_phone_number	2024-10-13 23:57:14.274343	2024-10-13 16:57:39.394238
61	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Engage"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Engage"], "EngageText": "This is the agent’s lead routing email address. This can be null if there is no data for this attribute."}	{"Endpoints": ["Agent"]}	lead_routing_email_address	2024-10-13 23:57:14.281146	2024-10-13 16:57:39.394238
7	{"Agent": ["Create Response", "Index Response"], "ActionLog": ["Create Request", "Create Response"]}	{"Agent": ["API", "Roster"], "Products": ["ActionLog", "Roster"], "ActionLog": ["ActionLog"], "RosterText": "This is the business title of the agent.", "ActionLogText": "This is the human readable plain-text string which will be presented to the Agent as the heading of the ActionLog entry. This can be any short, descriptive sentence which would be practical for the agent to see in the history of events associated with a Contact."}	{"Endpoints": ["Agent"]}	title	2024-10-13 23:57:14.167063	2024-10-13 16:57:39.394238
62	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "Array of key/value pairs. Each has a body and header, both strings, which can be null or blank.", "Products": ["API", "Roster"], "RosterText": "This is the bio of the agent, as seen on the about me > web info page."}	{"Endpoints": ["Agent"]}	bio	2024-10-13 23:57:14.283277	2024-10-13 16:57:39.394238
63	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is a string that contains the agent’s designation(s), if any. This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": ""}	{"Endpoints": ["Agent"]}	designations	2024-10-13 23:57:14.285007	2024-10-13 16:57:39.394238
64	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is an RFC 4122 compliant UUID. This UUID can be used as a unique identifier in determining associations between Agent objects and Listing objects.", "Products": ["API", "Roster"], "RosterText": "Displays within the about me section."}	{"Endpoints": ["Agent"]}	uuid	2024-10-13 23:57:14.286789	2024-10-13 16:57:39.394238
65	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "Indicates whether the agent has access to MoxiWorks Products.", "Products": ["API", "Roster"], "RosterText": "Referring to each individual Moxi product offered, such as Engage, Present, Impress etc."}	{"Endpoints": ["Agent"]}	has_product_access	2024-10-13 23:57:14.288837	2024-10-13 16:57:39.394238
66	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Engage"], "APIText": "Indicates whether the agent has access to MoxiWorks Engage Product.", "Products": ["API", "Engage"], "EngageText": "Referencing the agent’s ability to access Engage as a product."}	{"Endpoints": ["Agent"]}	has_engage_access	2024-10-13 23:57:14.29069	2024-10-13 16:57:39.394238
67	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "If include_access_level was passed as true, this can return one of the possible access levels.", "Products": ["API", "Roster"], "RosterText": "Related to the products and permissions page, specific to user account permissions section."}	{"Endpoints": ["Agent"]}	access_level	2024-10-13 23:57:14.292321	2024-10-13 16:57:39.394238
68	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This will return one of the possible view levels.", "Products": ["API", "Roster"], "RosterText": "The view level of the agent."}	{"Endpoints": ["Agent"]}	view_level	2024-10-13 23:57:14.294155	2024-10-13 16:57:39.394238
69	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "The teams array contains Dictionary objects representing Team entries. These include [name, uuid, member_category].", "Products": ["API", "Roster"], "RosterText": "Related to Agent Teams, within My Account section."}	{"Endpoints": ["Agent"]}	teams	2024-10-13 23:57:14.29597	2024-10-13 16:57:39.394238
70	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["Roster", "Websites"], "Products": ["Roster", "Websites"], "RosterText": "Seen within About Me > Web Info.", "WebsitesText": "The base url of the agent’s MoxiWorks agent website."}	{"Endpoints": ["Agent"]}	website_base_url	2024-10-13 23:57:14.297699	2024-10-13 16:57:39.394238
71	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data available for this attribute.", "Products": ["API", "Roster"], "RosterText": "Agent’s Twitter URL. Seen within About Me > Web Info."}	{"Endpoints": ["Agent"]}	twitter	2024-10-13 23:57:14.299409	2024-10-13 16:57:39.394238
72	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This will be null. Deprecated.", "Products": ["API"]}	{"Endpoints": ["Agent"]}	google_plus	2024-10-13 23:57:14.301124	2024-10-13 16:57:39.394238
73	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data available for this attribute.", "Products": ["API", "Roster"], "RosterText": "Agent’s Facebook page url. Seen within About Me > Web Info."}	{"Endpoints": ["Agent"]}	facebook	2024-10-13 23:57:14.302855	2024-10-13 16:57:39.394238
74	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Websites"], "APIText": "You’ll need to prefix the domain with protocol if using this attribute for an href. This can be null if there is no data available for this attribute.", "Products": ["API", "Websites"], "WebsitesText": "Agent’s website domain. This will be returned without the HTTP(S) prefix."}	{"Endpoints": ["Agent"]}	home_page	2024-10-13 23:57:14.304585	2024-10-13 16:57:39.394238
75	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is a valid URL for a larger size image for the agent. If no agent image has been uploaded for this agent a default image url will be provided.", "Products": ["API", "Roster"], "RosterText": "Agent’s associated profile image within About Me section."}	{"Endpoints": ["Agent"]}	profile_image_url	2024-10-13 23:57:14.306221	2024-10-13 16:57:39.394238
76	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is a valid URL for a thumbnail size image for the agent. If no agent image has been uploaded for this agent a default image url will be provided.", "Products": ["API", "Roster"], "RosterText": "Agent’s associated profile image within About Me section, thumbnail."}	{"Endpoints": ["Agent"]}	profile_thumb_url	2024-10-13 23:57:14.307936	2024-10-13 16:57:39.394238
77	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Products": ["API", "Roster"], "RosterText": "The region the agent’s office is in."}	{"Endpoints": ["Agent"]}	region	2024-10-13 23:57:14.309718	2024-10-13 16:57:39.394238
81	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["Engage"], "Products": ["Engage"], "EngageText": "A list of the lead service area zip codes covered by the agent."}	{"Endpoints": ["Agent"]}	service_area_zip_codes	2024-10-13 23:57:14.31729	2024-10-13 16:57:39.394238
82	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["Websites"], "Products": ["Websites"], "WebsitesText": "This includes the base_url and bio_page_slug of the agent MoxiWorks website."}	{"Endpoints": ["Agent"]}	agent_website	2024-10-13 23:57:14.318957	2024-10-13 16:57:39.394238
83	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "The alternate_offices array contains Dictionary objects representing AlternateOffice entries. These include [moxi_works_office_id, office_id, office_address_street, office_address_street2, office_address_city, office_address_state, office_address_zip, office_phone_number].", "Products": ["API", "Roster"], "RosterText": "Agent’s alternate offices, as seen within the additional offices page."}	{"Endpoints": ["Agent"]}	alternate_offices	2024-10-13 23:57:14.320757	2024-10-13 16:57:39.394238
84	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "The available_mls Array contains Dictionary objects representing MLS entries. These include [name, display_name, mls_abbreviation, agent_id].", "Products": ["API", "Roster"], "RosterText": "Agent’s alternate offices, as seen within the additional offices page."}	{"Endpoints": ["Agent"]}	available_mls	2024-10-13 23:57:14.322512	2024-10-13 16:57:39.394238
86	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "A list of the company specific program names in which the agent participates or is a member.", "Products": ["API"]}	{"Endpoints": ["Agent"]}	company_programs	2024-10-13 23:57:14.326085	2024-10-13 16:57:39.394238
87	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "A list of the source-specific user identifiers.", "Products": ["API"]}	{"Endpoints": ["Agent"]}	source_metadata	2024-10-13 23:57:14.327831	2024-10-13 16:57:39.394238
88	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API"], "APIText": "This is the Unix timestamp representing the date that this Agent was created in the MoxiWorks system.", "Products": ["API"]}	{"Endpoints": ["Agent"]}	created_timestamp	2024-10-13 23:57:14.329603	2024-10-13 16:57:39.394238
90	{"Agent": ["Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "True corresponds to Yes (visible online); false corresponds to No (not visible online).", "Products": ["API", "Roster"], "RosterText": "Indicates the “Profile Visible Online” value for this Agent."}	{"Endpoints": ["Agent"]}	profile_visible_online	2024-10-13 23:57:14.333056	2024-10-13 16:57:39.394238
91	{"Agent": ["Create Response", "Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "Existence of objects in the user_reviews data structure is dependent upon external sources, i.e. Zillow, Testimonial Tree. Documented entities in the `user_reviews` data structure may or may not be returned when `include_reviews=true` is passed. Your logic should be engineered to handle cases where the entity you are interested in is returned and where an empty data structure is returned. Included in this - [source_name, agg_rating, reviews_count]", "Products": ["API", "Roster"], "RosterText": "External agent reviews from platforms such as Zillow and Testimonial Tree."}	{"Endpoints": ["Agent"]}	user_reviews	2024-10-13 23:57:14.33514	2024-10-13 16:57:39.394238
89	{"Agent": ["Index Response"]}	{"Agent": ["API", "Roster"], "APIText": "This is the Unix timestamp representing the date that this Agent was deactivated in the MoxiWorks system. This will be returned null if the agent is still active.This is the Unix timestamp representing the date that this Agent was deactivated in the MoxiWorks system. This will be returned null if the agent is still active.", "Products": ["API", "Roster"], "RosterText": "Will display within Account Info section if user account is deactivated."}	{"Endpoints": ["Agent"]}	deactivated_timestamp	2024-10-13 23:57:14.331309	2024-10-13 16:57:39.394238
155	{"Contact": ["Create Request", "Create Response"]}	{"APIText": "This is used to keep track of the original lead source for this Contact record, if different than the lead source associated with the moxi_works_lead_source_id.", "Contact": ["API"], "Products": ["API"], "EngageText": "This is used to keep track of the original lead source for this Contact record, if different than the lead source associated with the moxi_works_lead_source_id.This is used to keep track of the original lead source for this Contact record, if different than the lead source associated with the moxi_works_lead_source_id."}	{"Endpoints": ["Contact"]}	original_lead_source	2024-10-13 23:57:14.567914	2024-10-13 16:58:21.195751
35	{"Agent": ["Create Response", "Index Response"], "Brand": ["Index Request"]}	{"Agent": ["API"], "Brand": ["API", "Roster"], "APIText": "This is the ID of the office for this Agent. This will be an integer.", "Products": ["API"]}	{"Endpoints": ["Agent", "Brand"]}	office_id	2024-10-13 23:57:14.235162	2024-10-13 16:57:48.572543
112	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Engage"], "Products": ["Engage"], "EngageText": "Related to sent emails, this will be the Brokerage or Company logo as shown in email header."}	{"Endpoints": ["Brand"]}	image_email_logo_alt	2024-10-13 23:57:14.404871	2024-10-13 16:57:48.572543
34	{"Agent": ["Create Response", "Index Request", "Index Response"], "Brand": ["Index Request"]}	{"Agent": ["API", "Roster"], "Brand": ["API", "Roster"], "APIText": "This will be an RFC 4122 compliant UUID.", "Products": ["API", "Roster"], "RosterText": "This is the MoxiWorks Platform ID of the office for this Agent."}	{"Endpoints": ["Agent", "Brand"]}	moxi_works_office_id	2024-10-13 23:57:14.233433	2024-10-13 16:57:48.572543
101	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Present"], "Products": ["Present"], "PresentText": "This is the logo associated with the Brokerage or Company."}	{"Endpoints": ["Brand"]}	image_logo	2024-10-13 23:57:14.385043	2024-10-13 16:57:48.572543
103	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Present"], "Products": ["Present"], "PresentText": "Within a Presentation, this will be the background color of a page."}	{"Endpoints": ["Brand"]}	background_color	2024-10-13 23:57:14.389003	2024-10-13 16:57:48.572543
102	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "Accent color.", "Products": ["API", "Present"], "PresentText": "Within a Presentation, this will be the accent color."}	{"Endpoints": ["Brand"]}	cma_authoring_color	2024-10-13 23:57:14.387133	2024-10-13 16:57:48.572543
104	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Present"], "Products": ["Present"], "PresentText": "Within a Presentation, this is the font color intended to overlay the background_color attribute."}	{"Endpoints": ["Brand"]}	background_font_color_primary	2024-10-13 23:57:14.390783	2024-10-13 16:57:48.572543
105	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Present"], "Products": ["Present"], "PresentText": "Within a Presentation, this is the background color of associated buttons."}	{"Endpoints": ["Brand"]}	button_background_color	2024-10-13 23:57:14.392554	2024-10-13 16:57:48.572543
106	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Present"], "Products": ["Present"], "PresentText": "Within a Presentation, this is the font color intended to overlay the button_background_color attribute."}	{"Endpoints": ["Brand"]}	button_font_color	2024-10-13 23:57:14.394325	2024-10-13 16:57:48.572543
107	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "This attribute may contain embedded HTML.", "Products": ["API", "Present"], "PresentText": "Within a Presentation, this will be the copyright notice information."}	{"Endpoints": ["Brand"]}	copyright	2024-10-13 23:57:14.396183	2024-10-13 16:57:48.572543
108	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "Relates to the Brokerage or Company name.", "Products": ["API", "Present"], "PresentText": "Within a Presentation, this is the name of the Brokerage or Company as displayed to the consumer."}	{"Endpoints": ["Brand"]}	display_name	2024-10-13 23:57:14.397904	2024-10-13 16:57:48.572543
109	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Engage"], "APIText": "This is specific to the background color that displays when sending an email from Present.", "Products": ["API", "Engage"], "EngageText": "Background color of sent email elements outside of the email body."}	{"Endpoints": ["Brand"]}	email_element_background_color	2024-10-13 23:57:14.399645	2024-10-13 16:57:48.572543
110	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Engage"], "APIText": "Font color intended to overlay email_element_background_color?", "Products": ["API", "Engage"], "EngageText": "The font color for font that overlays email_element_background_color?"}	{"Endpoints": ["Brand"]}	email_background_font_color	2024-10-13 23:57:14.401382	2024-10-13 16:57:48.572543
111	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "Brokerage or Company logo shown in Print (PDF) Presentations.", "Products": ["API", "Present"], "PresentText": "Within a Presentation - specifically Print (PDF) format, this will be the Brokerage or Company logo that displays."}	{"Endpoints": ["Brand"]}	image_cma_pdf_logo_header	2024-10-13 23:57:14.403204	2024-10-13 16:57:48.572543
113	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["Present", "Websites"], "Products": ["Present", "Websites"], "PresentText": "Within a presentation, this will be the favicon that displays related to the Brokerage or Company.", "WebsitesText": "Favicon of Brokerage or Company."}	{"Endpoints": ["Brand"]}	image_favicon	2024-10-13 23:57:14.407009	2024-10-13 16:57:48.572543
114	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "Brokerage or Company logo for web view presentations.", "Products": ["API", "Present"], "PresentText": "Within a Presentation - specifically web view, this will be the Brokerage or Company logo."}	{"Endpoints": ["Brand"]}	image_pres_cover_logo	2024-10-13 23:57:14.40886	2024-10-13 16:57:48.572543
115	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "Block element background color for web view presentations.", "Products": ["API", "Present"], "PresentText": "Within a Presentation - specifically web view, this is the background color that displays."}	{"Endpoints": ["Brand"]}	pres_block_background_color	2024-10-13 23:57:14.410724	2024-10-13 16:57:48.572543
116	{"Brand": ["Show Response", "Index Response"]}	{"Brand": ["API", "Present"], "APIText": "Font color intended to overlay pres_block_background_color attribute.", "Products": ["API", "Present"], "PresentText": "Within a Presentation - specifically web view, this is the font color for related text."}	{"Endpoints": ["Brand"]}	pres_block_text_color	2024-10-13 23:57:14.412557	2024-10-13 16:57:48.572543
49	{"Agent": ["Create Response", "Index Response"], "Brand": ["Index Response"], "Company": ["Show Response", "Index Response", "Search Response"]}	{"Agent": ["API"], "Brand": ["Present"], "APIText": "This name attribute is shared between several endpoints, and generally represents the full name of the entity.", "Company": ["Roster"], "Products": ["API", "Present", "Roster"], "RosterText": "This is a human readable name of the company which this Company object represents.", "PresentText": "This will be the name that displays related to the associated Brand."}	{"Endpoints": ["Company"]}	name	2024-10-13 23:57:14.259826	2024-10-13 16:58:08.545466
160	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "This value will be null if no data is available for this attribute.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "The state of the contact’s home address."}	{"Endpoints": ["Contact"]}	home_state	2024-10-13 23:57:14.576616	2024-10-13 16:58:21.195751
248	{"Event": ["Index Response"]}	{"Event": ["API", "Engage"], "APIText": "This is the payload of Event objects that fall on this day. If no Event objects span this duration, then the events array will be emtpy.", "Products": ["API", "Engage"], "EngageText": "All events that fall on the selected date within the Engage calendar."}	{"Endpoints": ["Event"]}	events	2024-10-13 23:57:14.861669	2024-10-13 16:58:39.612091
245	{}	{"Event": ["API", "Engage"], "APIText": "This is the earliest time that you are searching for an Event to be in. This data is required and must be a Unix timestamp before date_end.", "Products": ["API", "Engage"], "EngageText": "All events that fall after this selected date."}	{"Endpoints": ["Event"]}	date_start	2024-10-13 23:57:14.855284	2024-10-13 16:58:39.612091
246	{}	{"Event": ["API", "Engage"], "APIText": "This is the latest time that you are searching for an Event to be in. This data is required and must be a Unix timestamp before date_end.", "Products": ["API", "Engage"], "EngageText": "All events that fall before this selected date."}	{"Endpoints": ["Event"]}	date_end	2024-10-13 23:57:14.857303	2024-10-13 16:58:39.612091
8	{"Agent": ["Create Request", "Index Request"], "Brand": ["Show Request", "Index Request"], "Event": ["Create Request", "Update Request", "Index Request", "Delete Request"], "Company": ["Show Request", "Show Response", "Index Response"], "Contact": ["Create Request", "Update Request", "Show Request", "Delete Request", "Index Request"], "ActionLog": ["Create Request", "Delete Request", "Index Request"], "BuyerTransaction": ["Create Request", "Update Request", "Show Request", "Index Request"]}	{"Agent": ["API", "Roster"], "Brand": ["API", "Roster"], "Event": ["API", "Roster"], "APIText": "MoxiWorks Plaform Company entities are your entry-point for determining the established relationships for your organization to companies on the MoxiWorks Platform and for accessing data about those companies. Many requests require a moxi_works_company_id, which can be derived from the Company Index endpoint.", "Company": ["API", "Roster"], "Contact": ["API", "Roster"], "Gallery": ["API", "Roster"], "Products": ["API", "Roster"], "ActionLog": ["API", "Roster"], "RosterText": "", "EmailCampaign": ["API", "Roster"], "BuyerTransaction": ["API", "Roster"]}	{"Endpoints": ["ActionLog", "Agent", "Brand", "BuyerTransaction", "Company", "Contact"]}	moxi_works_company_id	2024-10-13 23:57:14.168937	2024-10-13 16:58:39.612091
191	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "This attribute can be utilized if you have data about listing searches that this contact has performed. This can be any arbitrary human readable string, but using recognized property types such as Condo, Single-Family, Townhouse, Land, Multifamily will provide more value to the agent.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "The property types used in the listing search criteria."}	{"Endpoints": ["Contact"]}	search_property_types	2024-10-13 23:57:14.633312	2024-10-13 16:58:21.195751
194	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "UNIX Timestamp.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "This represents the Special Date - birthday for the associated contact."}	{"Endpoints": ["Contact"]}	birthday	2024-10-13 23:57:14.638628	2024-10-13 16:58:21.195751
146	{"BuyerTransaction": ["Update Request"]}	{"APIText": "If this is set to true then The MoxiWorks Platform will promote this transaction to the next stage.", "Products": ["API"], "BuyerTransaction": ["API"]}	{"Endpoints": ["BuyerTransaction"]}	promote_transaction	2024-10-13 23:57:14.504852	2024-10-13 16:58:00.850731
203	{"Contact": ["Create Response", "Update Response", "Show Response"]}	{"APIText": "Indicates if the contact was recently added to the Agent’s database.", "Contact": ["API"], "Products": ["API"]}	{"Endpoints": ["Contact"]}	is_new_contact	2024-10-13 23:57:14.664296	2024-10-13 16:58:21.195751
199	{"Contact": ["Create Response", "Update Response", "Show Response"]}	{"APIText": "Will be true if this Contact has been deleted from the Agents contacts.", "Contact": ["API"], "Products": ["API"]}	{"Endpoints": ["Contact"]}	is_deleted	2024-10-13 23:57:14.649062	2024-10-13 16:58:21.195751
50	{"Agent": ["Create Response", "Index Response"], "Contact": ["Create Response", "Update Response", "Show Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.This value will be null if no data is available for this attribute.", "Contact": ["API", "Engage"], "Products": ["API", "Engage", "Roster"], "EngageText": "This is the first name of the contact associated with this Contact record.", "RosterText": "The first name of the agent."}	{"Endpoints": ["Contact"]}	first_name	2024-10-13 23:57:14.261532	2024-10-13 16:58:21.195751
200	{"Contact": ["Create Response", "Update Response", "Show Response"]}	{"APIText": "This value will be null if no data is available for this attribute.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "This is the middle name of the contact associated with this Contact record."}	{"Endpoints": ["Contact"]}	middle_name	2024-10-13 23:57:14.652907	2024-10-13 16:58:21.195751
51	{"Agent": ["Create Response", "Index Response"], "Contact": ["Create Response", "Update Response", "Show Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.This value will be null if no data is available for this attribute.", "Contact": ["API", "Engage"], "Products": ["API", "Engage", "Roster"], "EngageText": "This is the last name of the contact associated with this Contact record.", "RosterText": "The last name of the agent."}	{"Endpoints": ["Contact"]}	last_name	2024-10-13 23:57:14.263245	2024-10-13 16:58:21.195751
201	{"Contact": ["Create Response", "Update Response", "Show Response"]}	{"APIText": "This value will be null if no data is available for this attribute. Supported suffixes are II III IV JR JR..", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "This is the generational suffix of the name of the contact associated with this Contact record. This value will be null if no data is available for this attribute."}	{"Endpoints": ["Contact"]}	suffix	2024-10-13 23:57:14.655163	2024-10-13 16:58:21.195751
204	{"Contact": ["Create Response", "Update Response", "Show Response"]}	{"APIText": "Represented as a Unix Timestamp.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "Wedding anniversary of the contact."}	{"Endpoints": ["Contact"]}	anniversary	2024-10-13 23:57:14.666508	2024-10-13 16:58:21.195751
205	{"Contact": ["Create Response", "Update Response", "Show Response"]}	{"APIText": "UNIX Timestamp.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "This represents a Special Date - house-iversary for the associated contact."}	{"Endpoints": ["Contact"]}	home_purchase_anniversary	2024-10-13 23:57:14.668258	2024-10-13 16:58:21.195751
206	{"Contact": ["Create Response", "Update Response", "Show Response"]}	{"APIText": "Objects in the social_media_profiles are structured as follows - [key, url].", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "The social media profiles that are associated with the contact."}	{"Endpoints": ["Contact"]}	social_media_profiles	2024-10-13 23:57:14.670014	2024-10-13 16:58:21.195751
207	{"Contact": ["Create Response", "Update Response", "Show Response"]}	{"APIText": "An array of the agent’s mail server groups / categories to which this contact belongs.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "Related to groups in Engage, and will also correspond to the synced email account’s groups or categories."}	{"Endpoints": ["Contact"]}	groups	2024-10-13 23:57:14.686131	2024-10-13 16:58:21.195751
154	{"Contact": ["Create Request", "Create Response", "Update Response", "Show Response"]}	{"APIText": "This is the unique MoxiWorks Platform ID of the LeadSource that generated this Contact.", "Contact": ["API"], "Products": ["API"], "EngageText": "This is the unique MoxiWorks Platform ID of the LeadSource that generated this Contact.The Contact will be created in MoxiEngage as a lead sourced from the LeadSource associated with this moxi_works_lead_source_id. Send a LeadSource index request to determine which lead sources your organization has permission to impersonate during lead generation."}	{"Endpoints": ["Contact"]}	moxi_works_lead_source_id	2024-10-13 23:57:14.566145	2024-10-13 16:58:21.195751
60	{"Agent": ["Create Response", "Index Response"], "Contact": ["Create Response", "Update Response", "Show Response"]}	{"Agent": ["API", "Roster"], "APIText": "The email_addresses Hash is a Dictionary object holding the email addresses associated with the Agent record. These include [primary, display, alternate, moxi_sync, lead_routing, zillow].", "Contact": ["Engage"], "Products": ["API", "Engage", "Roster"], "EngageText": "These email addresses correspond to agent created Contact entities. Only email fields present in this Contact record will be returned. This is an object - [key, address].", "RosterText": "Some of these will display on the About Me section, including primary, display, moxi sync."}	{"Endpoints": ["Contact"]}	email_addresses	2024-10-13 23:57:14.279423	2024-10-13 16:58:21.195751
197	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"Contact": ["Engage"], "Products": ["Engage"], "EngageText": "This represents the spouse or partner associated with the contact record."}	{"Endpoints": ["Contact"]}	spouse_or_partner	2024-10-13 23:57:14.643806	2024-10-13 16:58:21.195751
158	{"Contact": ["Create Request", "Update Request", "Update Response", "Show Response"]}	{"APIText": "This value will be null if no data is available for this attribute.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "The contact’s home address street, including number and any suite / apartment number information."}	{"Endpoints": ["Contact"]}	home_street_address	2024-10-13 23:57:14.57316	2024-10-13 16:58:21.195751
182	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "This attribute can be utilized if you have data about listing searches that this contact has performed.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "The minimum bedrooms used in the listing search criteria."}	{"Endpoints": ["Contact"]}	search_min_beds	2024-10-13 23:57:14.616894	2024-10-13 16:58:21.195751
196	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"Contact": ["Engage"], "Products": ["Engage"], "EngageText": "The name of the company associated with the Contact record."}	{"Endpoints": ["Contact"]}	company	2024-10-13 23:57:14.642055	2024-10-13 16:58:21.195751
159	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "This value will be null if no data is available for this attribute.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "The city of the contact’s home address."}	{"Endpoints": ["Contact"]}	home_city	2024-10-13 23:57:14.574921	2024-10-13 16:58:21.195751
58	{"Agent": ["Create Response", "Index Response"], "Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Contact": ["API"], "Products": ["API", "Roster"], "RosterText": "This is the agent’s main email address. This email address should be considered the email address the agent would prefer to be contacted by."}	{"Endpoints": ["Agent", "Contact"]}	primary_email_address	2024-10-13 23:57:14.276051	2024-10-13 16:58:21.195751
59	{"Agent": ["Create Response", "Index Response"], "Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"Agent": ["API", "Roster"], "APIText": "This can be null if there is no data for this attribute.", "Contact": ["API"], "Products": ["API", "Roster"], "RosterText": "This is the agent’s alternate email address. This email address should be considered the email address the agent would want to be contacted by only if the address in primary_email_address is not functional."}	{"Endpoints": ["Agent", "Contact"]}	secondary_email_address	2024-10-13 23:57:14.277762	2024-10-13 16:58:21.195751
152	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "This should be a 10 digit phone number.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "This is the phone number that should be used first as a phone contact method, and displays as the primary phone number."}	{"Endpoints": ["Contact"]}	primary_phone_number	2024-10-13 23:57:14.561911	2024-10-13 16:58:21.195751
153	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "This should be a 10 digit phone number.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "This is the phone number that should be used as an alternate phone contact method, and displays as the alternate phone number."}	{"Endpoints": ["Contact"]}	secondary_phone_number	2024-10-13 23:57:14.563661	2024-10-13 16:58:21.195751
156	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "This can be male, female, m or f. No matter what is provided in the request, the response payload will return m or f. This value will be null if no data is available for this attribute.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "The gender of the contact."}	{"Endpoints": ["Contact"]}	gender	2024-10-13 23:57:14.569635	2024-10-13 16:58:21.195751
157	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "This value will be null if no data is available for this attribute.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "This is the name used to address the contact when creating mailing labels for the contact associated with this Contact record."}	{"Endpoints": ["Contact"]}	label_name	2024-10-13 23:57:14.571399	2024-10-13 16:58:21.195751
161	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "This value will be null if no data is available for this attribute.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "The zip code of the contact’s home address."}	{"Endpoints": ["Contact"]}	home_zip	2024-10-13 23:57:14.578372	2024-10-13 16:58:21.195751
162	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "This value will be null if no data is available for this attribute.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "The country of the contact’s home address."}	{"Endpoints": ["Contact"]}	home_country	2024-10-13 23:57:14.580148	2024-10-13 16:58:21.195751
165	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"Contact": ["Engage"], "Products": ["Engage"], "EngageText": "The contact’s professional job title."}	{"Endpoints": ["Contact"]}	job_title	2024-10-13 23:57:14.586066	2024-10-13 16:58:21.195751
166	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"Contact": ["Engage"], "Products": ["Engage"], "EngageText": "The contact’s profession."}	{"Endpoints": ["Contact"]}	occupation	2024-10-13 23:57:14.587949	2024-10-13 16:58:21.195751
167	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "This should be a valid URL for a property of interest within the system that is connecting to the MoxiCloud platform.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "A related property of interest for a contact that can be viewed by the agent."}	{"Endpoints": ["Contact"]}	property_url	2024-10-13 23:57:14.589737	2024-10-13 16:58:21.195751
168	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "This is the MLS ID of the property of interest.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "This is data about a property that the contact has shown interest in (property of interest)."}	{"Endpoints": ["Contact"]}	property_mls_id	2024-10-13 23:57:14.591435	2024-10-13 16:58:21.195751
169	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "This attribute can be utilized if you have data about a property that this contact has shown interest in (property of interest).", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "This is the street address of the property of interest, including number and suite/apartment number information."}	{"Endpoints": ["Contact"]}	property_street_address	2024-10-13 23:57:14.593187	2024-10-13 16:58:21.195751
170	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "This attribute can be utilized if you have data about a property that this contact has shown interest in (property of interest).", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "This is the city in which the property of interest exists."}	{"Endpoints": ["Contact"]}	property_city	2024-10-13 23:57:14.594947	2024-10-13 16:58:21.195751
171	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "This attribute can be utilized if you have data about a property that this contact has shown interest in (property of interest).", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "This is the state or province in which the property of interest exists."}	{"Endpoints": ["Contact"]}	property_state	2024-10-13 23:57:14.596723	2024-10-13 16:58:21.195751
172	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "This attribute can be utilized if you have data about a property that this contact has shown interest in (property of interest).", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "This is the postal code in which the property of interest exists."}	{"Endpoints": ["Contact"]}	property_zip	2024-10-13 23:57:14.598502	2024-10-13 16:58:21.195751
173	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "This attribute can be utilized if you have data about a property that this contact has shown interest in (property of interest).", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "This is the number of bedrooms in the property of interest."}	{"Endpoints": ["Contact"]}	property_beds	2024-10-13 23:57:14.600171	2024-10-13 16:58:21.195751
174	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "This attribute can be utilized if you have data about a property that this contact has shown interest in (property of interest).", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "This is the number of bathrooms in the property of interest."}	{"Endpoints": ["Contact"]}	property_baths	2024-10-13 23:57:14.601944	2024-10-13 16:58:21.195751
175	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "This attribute can be utilized if you have data about a property that this contact has shown interest in (property of interest).", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "This is the list price of the property of interest."}	{"Endpoints": ["Contact"]}	property_list_price	2024-10-13 23:57:14.603735	2024-10-13 16:58:21.195751
92	{"Agent": ["Index Request"], "Contact": ["Index Request"]}	{"Agent": ["API"], "APIText": "Any Agent objects updated after this Unix timestamp will be returned in the response. If no updated_since parameter is included in the request, by default only Agent objects updated in the last seven days will be returned.", "Products": ["API", "Engage"], "#Endpoint": ["Engage"], "EngageText": "Paged responses of all Contact objects updated after this Unix timestamp will be returned in the response."}	{"Endpoints": ["Company"]}	updated_since	2024-10-13 23:57:14.338302	2024-10-13 16:58:21.195751
176	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "This attribute can be utilized if you have data about a property that this contact has shown interest in (property of interest). This can be any arbitrary string, but for best results, this should be a state like Active, Pending, Sold, Cancelled or any other human readable state that would be useful when presented to the agent.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "This is the listing status of the property of interest."}	{"Endpoints": ["Contact"]}	property_listing_status	2024-10-13 23:57:14.605827	2024-10-13 16:58:21.195751
177	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "This attribute can be utilized if you have data about a property that this contact has shown interest in (property of interest). This must be a valid URL to an image", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "This is the URL to an image displaying the property of interest."}	{"Endpoints": ["Contact"]}	property_photo_url	2024-10-13 23:57:14.607699	2024-10-13 16:58:21.195751
178	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "This attribute can be utilized if you have data about listing searches that this contact has performed.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "The city / locale used in the listing search criteria."}	{"Endpoints": ["Contact"]}	search_city	2024-10-13 23:57:14.609577	2024-10-13 16:58:21.195751
179	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "This attribute can be utilized if you have data about listing searches that this contact has performed.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "The state / region used in the listing search criteria."}	{"Endpoints": ["Contact"]}	search_state	2024-10-13 23:57:14.611412	2024-10-13 16:58:21.195751
180	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "This attribute can be utilized if you have data about listing searches that this contact has performed.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "The zip / postal code used in the listing search criteria."}	{"Endpoints": ["Contact"]}	search_zip	2024-10-13 23:57:14.613481	2024-10-13 16:58:21.195751
181	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "This attribute can be utilized if you have data about listing searches that this contact has performed.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "The minimum bathrooms used in the listing search criteria."}	{"Endpoints": ["Contact"]}	search_min_baths	2024-10-13 23:57:14.615152	2024-10-13 16:58:21.195751
183	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "This attribute can be utilized if you have data about listing searches that this contact has performed.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "The minimum price used in the listing search criteria."}	{"Endpoints": ["Contact"]}	search_min_price	2024-10-13 23:57:14.61866	2024-10-13 16:58:21.195751
184	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "This attribute can be utilized if you have data about listing searches that this contact has performed.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "The maximum price used in the listing search criteria."}	{"Endpoints": ["Contact"]}	search_max_price	2024-10-13 23:57:14.620443	2024-10-13 16:58:21.195751
185	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "This attribute can be utilized if you have data about listing searches that this contact has performed.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "The minimum square feet of the total living area used in the listing search criteria."}	{"Endpoints": ["Contact"]}	search_min_sq_ft	2024-10-13 23:57:14.622213	2024-10-13 16:58:21.195751
186	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "This attribute can be utilized if you have data about listing searches that this contact has performed.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "The maximum square feet of the total living area used in the listing search criteria."}	{"Endpoints": ["Contact"]}	search_max_sq_ft	2024-10-13 23:57:14.624005	2024-10-13 16:58:21.195751
187	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "This attribute can be utilized if you have data about listing searches that this contact has performed.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "The minimum lot size used in the listing search criteria."}	{"Endpoints": ["Contact"]}	search_min_lot_size	2024-10-13 23:57:14.625778	2024-10-13 16:58:21.195751
188	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "This attribute can be utilized if you have data about listing searches that this contact has performed.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "The maximum lot size used in the listing search criteria."}	{"Endpoints": ["Contact"]}	search_max_lot_size	2024-10-13 23:57:14.627431	2024-10-13 16:58:21.195751
189	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "This attribute can be utilized if you have data about listing searches that this contact has performed.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "The minimum allowable year built used in the listing search criteria."}	{"Endpoints": ["Contact"]}	search_min_year_built	2024-10-13 23:57:14.629528	2024-10-13 16:58:21.195751
137	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "The desired purchase price for a property if using target rather than range.", "BuyerTransaction": ["Engage"]}	{"Endpoints": ["BuyerTransaction"]}	target_price	2024-10-13 23:57:14.462834	2024-10-13 16:58:00.850731
190	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "This attribute can be utilized if you have data about listing searches that this contact has performed.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "The maximum allowable year built used in the listing search criteria."}	{"Endpoints": ["Contact"]}	search_max_year_built	2024-10-13 23:57:14.63146	2024-10-13 16:58:21.195751
193	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "Websites should be submitted as a json array of objects. Each object should include website prioritized ‘rank’ and ‘value’. The number of website fields available for update for a given Contact record depends on the agent email client type.", "Contact": ["API"], "Products": ["API"]}	{"Endpoints": ["Contact"]}	websites	2024-10-13 23:57:14.636879	2024-10-13 16:58:21.195751
195	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "Comma separated list, UNIX Timestamps.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "This represents the Special Date(s) - house-iversary for the associated contact."}	{"Endpoints": ["Contact"]}	home_purchase_anniversaries	2024-10-13 23:57:14.640379	2024-10-13 16:58:21.195751
198	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "A comma separated string of the agent’s mail server categories / groups in which the Contact exists or will be placed.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "Related to groups in Engage, and will also correspond to the synced email account’s groups or categories."}	{"Endpoints": ["Contact"]}	category_names	2024-10-13 23:57:14.645568	2024-10-13 16:58:21.195751
212	{"Contact": ["Index Response"]}	{}	{}	total_pages	2024-10-13 23:57:14.771435	2024-10-13 16:58:21.195751
213	{"Contact": ["Index Response"]}	{}	{}	contacts	2024-10-13 23:57:14.773235	2024-10-13 16:58:21.195751
5	{"Contact": ["Create Response", "Update Response", "Show Request", "Show Response"], "ActionLog": ["Create Request", "Create Response", "Index Request", "Index Response"], "BuyerTransaction": ["Create Request", "Create Response", "Update Response", "Show Response", "Index Request", "Index Response"]}	{"APIText": "This will be an RFC 4122 compliant UUID, and is the same as the moxi_works_contact_id attribute of the Contact response.", "Contact": ["API"], "Products": ["API", "ActionLog"], "ActionLog": ["API", "ActionLog"], "ActionLogText": "This is the MoxiWorks Platform ID of a Contact an ActionLog object is to be associated with. This data is required and must reference a valid MoxiWorks Contact ID for your ActionLog Create request to be accepted.", "EmailCampaign": ["API", "Roster"]}	{"Endpoints": ["Contact"]}	moxi_works_contact_id	2024-10-13 23:57:14.163719	2024-10-13 16:58:21.195751
192	{"Event": ["Create Request", "Create Response", "Update Request", "Update Response"], "Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response"]}	{"APIText": "Agent created notes are not reflected in this attribute. This is a string which reflects the partner created notes. Any Notes added here will be displayed to the agent in an Activity Log record. Any HTML formatting included will be stripped from the note attribute’s data. This value will be null if no data is available for this attribute. This text field is limited to 3k.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "Partner created notes that display within the Activity Log."}	{"Endpoints": ["Contact"]}	note	2024-10-13 23:57:14.63513	2024-10-13 16:58:39.612091
118	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "Brief, human readable content that will be shown to the agent as notes about the BuyerTransaction that you are creating.", "Products": ["API", "Engage"], "EngageText": "For Buyer Transactions, these will be the related notes.", "BuyerTransaction": ["API", "Engage"]}	{"Endpoints": ["BuyerTransaction"]}	notes	2024-10-13 23:57:14.429078	2024-10-13 16:58:00.850731
93	{"Agent": ["Index Request"], "Company": ["Search Request"], "Contact": ["Index Response", "Index Request"], "BuyerTransaction": ["Index Request"]}	{"Agent": ["API"], "APIText": "For queries with multi-page responses, use the page_number parameter to return data for specific pages. Data for page 1 is returned if this parameter is not included. Use this parameter if total_pages indicates that there is more than one page of data available.Page of companies records to return.", "Company": ["API"], "Products": ["API"]}	{"Endpoints": ["Company"]}	page_number	2024-10-13 23:57:14.340122	2024-10-13 16:58:21.195751
138	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "The minimum price range for a property if using a price range rather than target price.", "BuyerTransaction": ["Engage"]}	{"Endpoints": ["BuyerTransaction"]}	min_price	2024-10-13 23:57:14.464602	2024-10-13 16:58:00.850731
136	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Show Response", "Index Response"]}	{"APIText": "If payment for the transaction is based on a flat fee derived from sales volume, use this attribute.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, the total commission for the transaction based on percentage of purchase price.", "BuyerTransaction": ["API", "Engage"]}	{"Endpoints": ["BuyerTransaction"]}	sales_volume_flat_fee	2024-10-13 23:57:14.461092	2024-10-13 16:58:00.850731
135	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Show Response", "Index Response"]}	{"APIText": "If the payment for the transaction is based on percentage of sales volume, use this attribute.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, the total commission for the transaction based on sales volume percentage.", "BuyerTransaction": ["API", "Engage"]}	{"Endpoints": ["BuyerTransaction"]}	sales_volume_percentage	2024-10-13 23:57:14.459323	2024-10-13 16:58:00.850731
140	{"BuyerTransaction": ["Create Request", "Create Response", "Update Response", "Show Response", "Index Response"]}	{"APIText": "The stage that the BuyerTransaction should be placed into.", "Products": ["API"], "BuyerTransaction": ["API"]}	{"Endpoints": ["BuyerTransaction"]}	stage	2024-10-13 23:57:14.46808	2024-10-13 16:58:00.850731
142	{"BuyerTransaction": ["Create Response", "Update Response", "Show Response", "Index Response"]}	{"APIText": "When created through the MoxiWorks Platform, BuyerTransaction objects will automatically be configured as active transactions. For more information about BuyerTransaction stages, see the MoxiCloud documentation, specific to BuyerTransaction Stages.", "Products": ["API", "Engage"], "EngageText": "For Buyer Transactions, this attribute displays the name or title that is associated with the current stage of the transaction.", "BuyerTransaction": ["API", "Engage"]}	{"Endpoints": ["BuyerTransaction"]}	stage_name	2024-10-13 23:57:14.474761	2024-10-13 16:58:00.850731
145	{"BuyerTransaction": ["Create Response", "Update Response", "Show Response", "Index Response"]}	{"APIText": "The stage that the BuyerTransaction should be placed into.", "Products": ["API"], "BuyerTransaction": ["API"]}	{"Endpoints": ["BuyerTransaction"]}	state_changed_at	2024-10-13 23:57:14.489328	2024-10-13 16:58:00.850731
123	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the minimum desired living area for prospective properties.", "BuyerTransaction": ["Engage"]}	{"Endpoints": ["BuyerTransaction"]}	min_sqft	2024-10-13 23:57:14.43791	2024-10-13 16:58:00.850731
124	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the maximum desired living area for prospective properties.", "BuyerTransaction": ["Engage"]}	{"Endpoints": ["BuyerTransaction"]}	max_sqft	2024-10-13 23:57:14.439646	2024-10-13 16:58:00.850731
117	{"BuyerTransaction": ["Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "A brief, human readable title that will be shown to the agent as the subject of the BuyerTransaction that you are creating.", "Products": ["API", "Engage"], "EngageText": "For Buyer Transactions, this will be the name or title of the transaction in question.", "BuyerTransaction": ["API", "Engage"]}	{"Endpoints": ["BuyerTransaction"]}	transaction_name	2024-10-13 23:57:14.426152	2024-10-13 16:58:00.850731
119	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This should be populated if this BuyerTransaction is_mls_transaction is false.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this is the street address of the property being purchased.", "BuyerTransaction": ["API", "Engage"]}	{"Endpoints": ["BuyerTransaction"]}	address	2024-10-13 23:57:14.430838	2024-10-13 16:58:00.850731
120	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This should be populated if this BuyerTransaction is_mls_transaction is false.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this will be the city or township of the property being purchased.", "BuyerTransaction": ["API", "Engage"]}	{"Endpoints": ["BuyerTransaction"]}	city	2024-10-13 23:57:14.432696	2024-10-13 16:58:00.850731
121	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This should be populated if this BuyerTransaction is_mls_transaction is false.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this will be the state or province of the property being purchased.", "BuyerTransaction": ["API", "Engage"]}	{"Endpoints": ["BuyerTransaction"]}	state	2024-10-13 23:57:14.434353	2024-10-13 16:58:00.850731
122	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This should be populated if this BuyerTransaction is_mls_transaction is false.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this will be the postal code of the property being purchased.", "BuyerTransaction": ["API", "Engage"]}	{"Endpoints": ["BuyerTransaction"]}	zip_code	2024-10-13 23:57:14.436165	2024-10-13 16:58:00.850731
125	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the minimum number of bedrooms for prospective properties.", "BuyerTransaction": ["Engage"]}	{"Endpoints": ["BuyerTransaction"]}	min_beds	2024-10-13 23:57:14.441416	2024-10-13 16:58:00.850731
126	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the maximum number of bedrooms for prospective properties.", "BuyerTransaction": ["Engage"]}	{"Endpoints": ["BuyerTransaction"]}	max_beds	2024-10-13 23:57:14.443137	2024-10-13 16:58:00.850731
127	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the minimum number of bathrooms for prospective properties.", "BuyerTransaction": ["Engage"]}	{"Endpoints": ["BuyerTransaction"]}	min_baths	2024-10-13 23:57:14.444871	2024-10-13 16:58:00.850731
128	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the maximum number of bathrooms for prospective properties.", "BuyerTransaction": ["Engage"]}	{"Endpoints": ["BuyerTransaction"]}	max_baths	2024-10-13 23:57:14.446541	2024-10-13 16:58:00.850731
129	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "In relation to a Buyer Transaction, the name of a locality representing an area of interest for prospective properties.", "BuyerTransaction": ["Engage"]}	{"Endpoints": ["BuyerTransaction"]}	area_of_interest	2024-10-13 23:57:14.448279	2024-10-13 16:58:00.850731
130	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This should be false for paperwork-only, for sale by owner, off-market, or pocket listing type transactions or any transactions that will not be tracked through an MLS.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this attribute indictates whether the property being purchased is listed on an MLS.", "BuyerTransaction": ["API", "Engage"]}	{"Endpoints": ["BuyerTransaction"]}	is_mls_transaction	2024-10-13 23:57:14.450098	2024-10-13 16:58:00.850731
131	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "mls_number should be populated only if is_mls_transaction is true. If no commission (either commission_percentage or commission_flat_fee) is supplied during creation, commission_percentage is set to the default commission_percentage for the associated Agent.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, the MLS number of the the property being purchased.", "BuyerTransaction": ["API", "Engage"]}	{"Endpoints": ["BuyerTransaction"]}	mls_number	2024-10-13 23:57:14.452167	2024-10-13 16:58:00.850731
132	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This is the Unix timestamp representing the date that the agent initiated transaction discussions with the client.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this would be considered the date and time when the Agent first initiated transaction discussions with the client.", "BuyerTransaction": ["API", "Engage"]}	{"Endpoints": ["BuyerTransaction"]}	start_timestamp	2024-10-13 23:57:14.453993	2024-10-13 16:58:00.850731
134	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "If the commission for the transaction is based on a flat dollar amount, use this attribute.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, this is the dollar amount of the total commission for the transaction.", "BuyerTransaction": ["API", "Engage"]}	{"Endpoints": ["BuyerTransaction"]}	commission_flat_fee	2024-10-13 23:57:14.457654	2024-10-13 16:58:00.850731
133	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "If the commission for the transaction is based on a percentage of the purchase amount, use this attribute. If no commission (either commission_percentage or commission_flat_fee) is supplied during creation, commission_percentage is set to the default commission_percentage for the associated Agent.", "Products": ["API", "Engage"], "EngageText": "In relation to a Buyer Transaction, the total commission for the transaction based on this percentage of the purchase price.", "BuyerTransaction": ["API", "Engage"]}	{"Endpoints": ["BuyerTransaction"]}	commission_percentage	2024-10-13 23:57:14.455843	2024-10-13 16:58:00.850731
139	{"BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"Products": ["Engage"], "EngageText": "The maximum price range for a property if using a price range rather than target price.", "BuyerTransaction": ["Engage"]}	{"Endpoints": ["BuyerTransaction"]}	max_price	2024-10-13 23:57:14.46634	2024-10-13 16:58:00.850731
143	{"BuyerTransaction": ["Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "This should be null if the BuyerTransaction is not yet in complete state.", "Products": ["API", "Engage"], "EngageText": "This is the closing price for the transaction.", "BuyerTransaction": ["API", "Engage"]}	{"Endpoints": ["BuyerTransaction"]}	closing_price	2024-10-13 23:57:14.48579	2024-10-13 16:58:00.850731
144	{"BuyerTransaction": ["Create Response", "Update Request", "Update Response", "Show Response", "Index Response"]}	{"APIText": "A Unix timestamp. This should be null if the BuyerTransaction is not yet in complete state.", "Products": ["API", "Engage"], "EngageText": "For a Buyer Transaction, this represents the point in time when the transaction was completed.", "BuyerTransaction": ["API", "Engage"]}	{"Endpoints": ["BuyerTransaction"]}	closing_timestamp	2024-10-13 23:57:14.487585	2024-10-13 16:58:00.850731
141	{"BuyerTransaction": ["Create Response", "Update Request", "Update Response", "Show Request", "Show Response", "Index Response"]}	{"APIText": "This is the MoxiWorks Platform ID of the BuyerTransaction which you have created. This will be an RFC 4122 compliant UUID. This ID should be recorded on response as it is the key ID for updating the BuyerTransaction.", "Products": ["API"], "BuyerTransaction": ["API"]}	{"Endpoints": ["BuyerTransaction"]}	moxi_works_transaction_id	2024-10-13 23:57:14.470553	2024-10-13 16:58:00.850731
85	{"Agent": ["Create Response", "Index Response"], "Company": ["Show Response"]}	{"Agent": ["API"], "APIText": "Existence of objects in the partners data structure is dependent upon external relationships existing between the agent represented by this Agent and the affiliate. Documented entities in the `partners` data structure may or may not be returned based on agent relationship. Your logic should be engineered to handle cases where the entity you are interested in is returned and where an empty data structure is returned.", "Company": ["Roster"], "Products": ["API", "Roster"], "RosterText": "Integrated partner data associated with this company."}	{"Endpoints": ["Company"]}	partners	2024-10-13 23:57:14.324299	2024-10-13 16:58:08.545466
38	{"Agent": ["Create Response", "Index Response"], "Company": ["Show Response", "Index Response", "Search Response"]}	{"Agent": ["API"], "APIText": "This is the ID of the Company utilized by their brokerage or company.This is a client-specified identifier of the company which this Company object represents, or null if absent.", "Company": ["API"], "Products": ["API"]}	{"Endpoints": ["Company"]}	client_company_id	2024-10-13 23:57:14.240267	2024-10-13 16:58:08.545466
20	{"Contact": ["Delete Response"], "ActionLog": ["Delete Response"]}	{"APIText": "This is an arrray of strings. Any messages associated with the delete request status will be contained in this array.", "Products": ["API"], "ActionLog": ["API"]}	{"Endpoints": ["ActionLog"]}	messages	2024-10-13 23:57:14.201232	2024-10-13 16:58:21.195751
214	{}	{"Contact": ["Engage"], "Products": ["Engage"], "EngageText": "The resulting Contact object associated with this Delete request."}	{"Endpoints": ["Company"]}	result	2024-10-13 23:57:14.77853	2024-10-13 16:58:21.195751
99	{"Agent": ["Index Request"], "Contact": ["Index Request"], "BuyerTransaction": ["Index Request"]}	{"Agent": ["API"], "APIText": "If supplied then the results will exclude all data except primary identifiers and a unix timestamp (last_updated) & iso8601 timestamp (modification_timestamp) of the last time this record was updated.", "Products": ["API"]}	{"Endpoints": ["Agent"]}	timestamps_only	2024-10-13 23:57:14.352245	2024-10-13 16:58:21.195751
151	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Response", "Index Request"]}	{"APIText": "This value will be null if no data is available for this attribute. You should format this information as first middle last.", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "This is the full name of the contact you are creating a Contact record for."}	{"Endpoints": ["Contact"]}	contact_name	2024-10-13 23:57:14.559367	2024-10-13 16:58:21.195751
6	{"Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Request", "Show Response", "Delete Request"], "ActionLog": ["Create Request", "Create Response", "Index Request", "Index Response"], "BuyerTransaction": ["Create Request", "Create Response", "Update Response", "Show Response", "Index Request", "Index Response"]}	{"APIText": "This is the unique identifer used in the system that will be connecting to the MoxiWorks platform.", "Contact": ["API"], "Products": ["API", "ActionLog"], "ActionLog": ["API", "ActionLog"], "ActionLogText": "This UUID will have already been associated with the Contact the ActionLog entry is created about. The Contact record on the MoxiWorks Platform can be created as necessary using Contact Create before attempting to use this contact ID to create an ActionLog entry. Failure to do so will result in the request being rejected.", "EmailCampaign": ["API", "Roster"]}	{"Endpoints": ["ActionLog", "BuyerTransaction", "Contact"]}	partner_contact_id	2024-10-13 23:57:14.165411	2024-10-13 16:58:21.195751
209	{"Contact": ["Index Request"], "EmailCampaign": ["Index Response"]}	{"Contact": ["Engage"], "Products": ["Engage"], "EngageText": "An email address associated with the Contact record."}	{"Endpoints": ["Company"]}	email_address	2024-10-13 23:57:14.763788	2024-10-13 16:58:30.246752
18	{"Event": ["Delete Response"], "Contact": ["Delete Response"], "ActionLog": ["Delete Response"]}	{"APIText": "This will indicate what the status of the request is.", "Products": ["API"], "ActionLog": ["API"]}	{"Endpoints": ["ActionLog"]}	status	2024-10-13 23:57:14.197571	2024-10-13 16:58:39.612091
19	{"Event": ["Delete Response"], "Contact": ["Delete Response"], "ActionLog": ["Delete Response"]}	{"APIText": "This will indicate whether the delete request was successful or not.", "Products": ["API"], "ActionLog": ["API"]}	{"Endpoints": ["ActionLog"]}	deleted	2024-10-13 23:57:14.199532	2024-10-13 16:58:39.612091
211	{"Contact": ["Index Request"]}	{"APIText": "Whether to only include Contact records for contacts that are neither considered personal contacts nor work collaborators in the payload response. By default all Contact records will be returned. Use the personal_contact and collaborator response attributes to determine the status of any given contact.", "Contact": ["API"], "Products": ["API"]}	{"Endpoints": ["Company"]}	only_business_contacts	2024-10-13 23:57:14.768736	2024-10-13 16:58:21.195751
210	{"Contact": ["Index Request"]}	{"Products": ["Engage"], "#Endpoint": ["Engage"], "EngageText": "A phone number associated with the Contact record."}	{"Endpoints": ["Company"]}	phone_number	2024-10-13 23:57:14.765945	2024-10-13 16:58:21.195751
202	{"Contact": ["Create Response", "Update Response", "Show Response"]}	{"APIText": "[key, number]", "Contact": ["API", "Engage"], "Products": ["API", "Engage"], "EngageText": "These phone numbers correspond to agent created Contact entities. Only phone fields present in this Contact record will be returned."}	{"Endpoints": ["Contact"]}	phone_numbers	2024-10-13 23:57:14.659923	2024-10-13 16:58:21.195751
208	{"Contact": ["Update Response", "Show Response"]}	{"APIText": "This is used to keep track of the original lead source for this Contact record. This field will not be displayed in MoxiEngage, and is for the parter’s own tracking purposes. This key will be associated with valid moxi_works_lead_source_id. Send a LeadSource index request for a full list of applicable lead sources and their ids.", "Contact": ["API"], "Products": ["API"]}	{"Endpoints": ["Company"]}	moxi_works_origin_lead_source_id	2024-10-13 23:57:14.712897	2024-10-13 16:58:21.195751
236	{"Event": ["Create Request", "Create Response", "Update Request", "Update Response", "Delete Request"]}	{"Event": ["API"], "APIText": "This is the unique identifer you use in your system that has been associated with the Event that you are creating. This data is required and must be a unique key.", "Products": ["API"]}	{"Endpoints": ["Event"]}	partner_event_id	2024-10-13 23:57:14.822469	2024-10-13 16:58:39.612091
237	{"Event": ["Create Request", "Create Response", "Update Request", "Update Response"]}	{"Event": ["API", "Engage"], "APIText": "This is a short, descriptive, human readable phrase to be displayed to the agent which lets them know what this Event regards.", "Products": ["API", "Engage"], "EngageText": "Event title, or other short description about this event."}	{"Endpoints": ["Event"]}	event_subject	2024-10-13 23:57:14.826051	2024-10-13 16:58:39.612091
238	{"Event": ["Create Request", "Create Response", "Update Request", "Update Response"]}	{"Event": ["API", "Engage"], "APIText": "This is a human readable locatition reference regarding where the event is located that will be meaningful to the agent.", "Products": ["API", "Engage"], "EngageText": "Location information for the event, such as an address or building title."}	{"Endpoints": ["Event"]}	event_location	2024-10-13 23:57:14.827715	2024-10-13 16:58:39.612091
239	{"Event": ["Create Request", "Create Response", "Update Request", "Update Response"]}	{"Event": ["API", "Engage"], "APIText": "Boolean.", "Products": ["API", "Engage"], "EngageText": "Whether to send a reminder about the event to attendees before the event starts."}	{"Endpoints": ["Event"]}	send_reminder	2024-10-13 23:57:14.829808	2024-10-13 16:58:39.612091
242	{"Event": ["Create Request", "Create Response", "Update Request", "Update Response"]}	{"Event": ["API", "Engage"], "APIText": "This is the Unix timestamp representing the end time of the Event that you are creating. This data is required and must be a valid Unix timestamp.", "Products": ["API", "Engage"], "EngageText": "End time of the Event."}	{"Endpoints": ["Event"]}	event_end	2024-10-13 23:57:14.835722	2024-10-13 16:58:39.612091
243	{"Event": ["Create Request", "Create Response", "Update Request", "Update Response"]}	{"Event": ["API", "Engage"], "APIText": "Boolean.", "Products": ["API", "Engage"], "EngageText": "Calendar event associates as an all day event."}	{"Endpoints": ["Event"]}	all_day	2024-10-13 23:57:14.83755	2024-10-13 16:58:39.612091
244	{"Event": ["Create Request", "Create Response", "Update Request", "Update Response"]}	{"Event": ["API", "Engage"], "APIText": "This is a comma separated list of contacts that have already been added through the MoxiWorks Platform API who will be present at the referenced event. (Use IDs from your system – i.e. partner_contact_id from Contact Create ).", "Products": ["API", "Engage"], "EngageText": "Contacts that are in Engage and will attend the event."}	{"Endpoints": ["Event"]}	attendees	2024-10-13 23:57:14.839335	2024-10-13 16:58:39.612091
247	{"Event": ["Index Response"]}	{"Event": ["API", "Engage"], "APIText": "This is a string representing a date in MM/DD/YYYY format.", "Products": ["API", "Engage"], "EngageText": "Any event Event whose duration spans or falls within this day will be included in the results for this day."}	{"Endpoints": ["Event"]}	date	2024-10-13 23:57:14.85987	2024-10-13 16:58:39.612091
1	{"Agent": ["Create Request"], "Brand": ["Index Request"], "Event": ["Create Request", "Create Response", "Update Request", "Update Response", "Index Request", "Delete Request"], "Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Request", "Show Response", "Delete Request", "Index Request"], "ActionLog": ["Create Request", "Create Response", "Delete Request", "Index Request", "Index Response"], "EmailCampaign": ["Index Response"], "BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Request", "Show Response", "Index Request", "Index Response"]}	{"Agent": ["API", "Roster"], "Brand": ["API", "Roster"], "Event": ["API", "Roster"], "APIText": "This will be an RFC 4122 compliant UUID. If data is being pulled from The MoxiWorks Platform and integrating with your own system in a managed or automated fashion, then using agent_uuid request attribute is preferable. It is guaranteed to be unique and to never change for the lifetime of the account.", "Contact": ["API", "Roster"], "Gallery": ["API", "Roster"], "Products": ["API", "Roster"], "ActionLog": ["API", "Roster"], "RosterText": "Agent UUID, found on profile page within Roster/Client Manager and is the user account level UUID.", "EmailCampaign": ["API", "Roster"], "BuyerTransaction": ["API", "Roster"]}	{"Endpoints": ["ActionLog", "Agent", "Brand", "BuyerTransaction", "Contact"]}	agent_uuid	2024-10-13 23:57:14.155935	2024-10-13 16:58:39.612091
2	{"Agent": ["Create Request", "Create Response", "Index Response"], "Brand": ["Index Request"], "Event": ["Create Request", "Create Response", "Update Request", "Update Response", "Index Request", "Delete Request"], "Contact": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Request", "Show Response", "Delete Request", "Index Request"], "ActionLog": ["Create Request", "Create Response", "Delete Request", "Index Request", "Index Response"], "EmailCampaign": ["Index Response"], "BuyerTransaction": ["Create Request", "Create Response", "Update Request", "Update Response", "Show Request", "Show Response", "Index Request", "Index Response"]}	{"Agent": ["API", "Roster"], "Brand": ["API", "Roster"], "Event": ["API", "Roster"], "APIText": "If you have already existing agent data, agent accounts and your own user interface that agents can use to integrate your account with their MoxiWorks Platform account then you should use the moxi_works_agent_id request attribute. It is intended for use cases where integration is managed by end-user interaction.", "Contact": ["API", "Roster"], "Gallery": ["API", "Roster"], "Products": ["API", "Roster"], "ActionLog": ["API", "Roster"], "RosterText": "This identifier is guaranteed to be unique, but may be either an alphanumeric string or an email address.", "EmailCampaign": ["API", "Roster"], "BuyerTransaction": ["API", "Roster"]}	{"Endpoints": ["ActionLog", "Agent", "Brand", "BuyerTransaction", "Contact"]}	moxi_works_agent_id	2024-10-13 23:57:14.158419	2024-10-13 16:58:39.612091
9	{"Agent": ["Create Request", "Index Request"], "Brand": ["Show Request", "Index Request"], "Event": ["Create Request", "Update Request", "Index Request", "Delete Request"], "Company": ["Search Request"], "Contact": ["Create Request", "Update Request", "Show Request", "Delete Request", "Index Request"], "ActionLog": ["Create Request", "Delete Request", "Index Request"], "BuyerTransaction": ["Create Request", "Update Request", "Show Request", "Index Request"]}	{"Agent": ["API", "Roster"], "Brand": ["API", "Roster"], "Event": ["API", "Roster"], "APIText": "This provides for a broad scope by which partners may be afforded permissions to perform MoxiWorks Platform actions, in scenarios where a partner does business with a parent company in the MoxiWorks System. It also provides broad scope under which agents may be looked up using the source_agent_id request attribute in many scenarios across different MoxiWorks Platform endpoints and actions.", "Company": ["API", "Roster"], "Contact": ["API", "Roster"], "Gallery": ["API", "Roster"], "Products": ["API", "Roster"], "ActionLog": ["API", "Roster"], "RosterText": "This is the numeric_id or moxi_works_company_id of a company that is considered to be a parent company in the MoxiWorks Platform.", "EmailCampaign": ["API", "Roster"], "BuyerTransaction": ["API", "Roster"]}	{"Endpoints": ["ActionLog", "Agent", "Brand", "BuyerTransaction", "Company", "Contact"]}	parent_company_id	2024-10-13 23:57:14.170706	2024-10-13 16:58:39.612091
3	{"Agent": ["Create Request"], "Brand": ["Index Request"], "Event": ["Create Request", "Update Request", "Index Request", "Delete Request"], "Contact": ["Create Request", "Update Request", "Show Request", "Delete Request", "Index Request"], "ActionLog": ["Create Request", "Delete Request", "Index Request"], "BuyerTransaction": ["Create Request", "Update Request", "Show Request", "Index Request"]}	{"Agent": ["API"], "Brand": ["API"], "Event": ["API", "Roster"], "APIText": "If you have access to agent data from the same company source that MoxiWorks uses as an upstream data source then you should use the source_agent_id request attribute. This identifier will be unique only within the scope of a given company or parent_company, and must be used in conjunction with the moxi_works_company_id or parent_company_id request attributes. Please email partners@moxiworks.com for clarification about this request attribute.", "Contact": ["API"], "Gallery": ["API", "Roster"], "Products": ["API"], "ActionLog": ["API"], "EmailCampaign": ["API", "Roster"]}	{"Endpoints": ["ActionLog", "Agent", "Brand", "BuyerTransaction", "Contact"]}	source_agent_id	2024-10-13 23:57:14.160253	2024-10-13 16:58:39.612091
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: aaron
--

COPY public.schema_migrations (version) FROM stdin;
20241012015940
20241012023428
20241012024021
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: aaron
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, approved) FROM stdin;
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
-- Name: index_users_on_approved; Type: INDEX; Schema: public; Owner: aaron
--

CREATE INDEX index_users_on_approved ON public.users USING btree (approved);


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

