-- ************************************ Adding UI Information

UPDATE associated_attrs 
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Agent UUID, found on profile page, seen as an RFC 4122 compliant UUID. This will be seen within Roster/Client Manager and is the user account level UUID"')
WHERE attr_id = 1; -- agent_uuid

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Roster upload, user external key field. Intended for use cases where integration is managed by end-user interaction."')
WHERE attr_id = 2; -- moxi_works_agent_id

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"DEPRECATED field related to Roster Feed."')
WHERE attr_id = 3; -- source_agent_id

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"Human readable string which would be presented to the Agent as the content of the ActionLog entry."')
WHERE attr_id = 4; -- body

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"API related data, the Platform ID the action is associated with."')
WHERE attr_id = 5; -- moxi_works_contact_id

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"ID partner passed when creating a contact through the API, the unique identifer in the system utilized by the user that has been associated with the entry."')
WHERE attr_id = 6; -- partner_contact_id

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"Human readable string which would be presented to the Agent as the title of the ActionLog entry."')
WHERE attr_id = 7; -- title

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Seen within Roster/Client Manager as the associated Company level UUID. A valid MoxiWorks Company ID. Use Company Endpoint to determine what moxi_works_company_id you can use."')
WHERE attr_id = 8; -- moxi_works_company_id

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Seen within Roster/Client Manager as the associated Parent Company level UUID. This is the numeric_id or moxi_works_company_id of a company that is considered to be a parent company in the MoxiWorks Platform."')
WHERE attr_id = 9; -- parent_company_id

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"Activity Stream content, this is the human readable plain-text string which will be presented to the Agent as the heading of the ActionLog entry. This can be any short, descriptive sentence which would be practical for the agent to see in the history of events associated with a Contact."')
WHERE attr_id = 10; -- agent_action

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"Location related to activity stream content, the agent_action location component (inperson / other etc) uses this field to denote the street address of the agent_action."')
WHERE attr_id = 11; -- agent_action_address

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"Location related to activity stream content, the agent_action location component (inperson / other etc) uses this field to denote the additonal street address info of the agent_action."')
WHERE attr_id = 12; -- agent_action_address2

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"Location related to activity stream content, the agent_action location component (inperson / other etc) uses this field to denote the city or locale of the agent_action."')
WHERE attr_id = 13; -- agent_action_city

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"Location related to activity stream content, the agent_action location component (inperson / other etc) uses this field to denote the state or province of the agent_action.."')
WHERE attr_id = 14; -- agent_action_state

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"Location related to activity stream content, the agent_action location component (inperson / other etc) uses this field to denote the postal code of the agent_action."')
WHERE attr_id = 15; -- agent_action_zip

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"API and database related information, this is the Unix timestamp for the creation time of the ActionLog entry."')
WHERE attr_id = 16; -- timestamp

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"API and database related information, this is the MoxiWorks Platform ID of the ActionLog entry to be deleted. This will be an RFC 4122 compliant UUID."')
WHERE attr_id = 17; -- moxi_works_action_log_id

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"API related information referencing the call submitted, which will indicate what the status of the request is."')
WHERE attr_id = 18; -- status

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"API related information referencing the call submitted, which will indicate whether the delete request was successful or not."')
WHERE attr_id = 19; -- deleted

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"API related information referencing the call submitted, an object (array of strings). Any messages associated with the delete request status will be contained in this array."')
WHERE attr_id = 20; -- messages

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"API related information referencing the call submitted, only records created later than this Unix timestamp will be included in the query. The upper bound of the time slice will be the 90 days higher than date_min value or the value of the the date_max; whichever is lower. If no timestamps are provided, records from the last 90 days will be retrieved."')
WHERE attr_id = 21; -- date_min

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"API related information referencing the call submitted, only records created before this Unix timestamp will be included in the query. The upper bound of the time slice will be the 90 days higher than date_min value or the value of the the date_max; whichever is lower. If no timestamps are provided, records from the last 90 days will be retrieved."')
WHERE attr_id = 22; -- date_max

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"The actions array contains Dictionary objects representing endpoint entries. These include moxi_works_action_log_id - the unique identifier for the MoxiWorks Platform ActionLog entry. type - a string from an enumerated set representing the type of ActionLog entry it is, formatted in lowercase with an underscore between each word. Individual ActionLog types are outside the scope of this document. timestamp - the Unix timestamp for the creation time of the ActionLog entry. And finally log_data - The actual payload data of the ActionLog entry, structure depending on type selected."')
WHERE attr_id = 23; -- actions

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"To include access level information for the agent in the response, pass true."')
WHERE attr_id = 24; -- include_access_level

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"Related to the agent’s GCI goal set within Engage, Pass true to include the agent’s GCI goals and commissions data in the response."')
WHERE attr_id = 25; -- include_gci_goals

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"To include affiliate data associated with the agent in the response, pass true. Likely not used at all?."')
WHERE attr_id = 26; -- include_partners

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"These will populate into Roster, and include reviews from Zillow and Testimonial Tree. To include these ratings and reviews associated with the agent in the response, pass true."')
WHERE attr_id = 27; -- include_reviews

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"This is an external ID for the Agent in question. This ID will be utilized by the agent’s company or brokerage externally."')
WHERE attr_id = 28; -- client_agent_id

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Found within Roster under the Manage MLS Associations section of an agent account, This is the MLS ID of the Agent as utilized and provided by the MLS."')
WHERE attr_id = 29; -- mls_agent_id

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the number of the license granted to the agent."')
WHERE attr_id = 30; -- license

UPDATE associated_attrs
SET ui_info = jsonb_set(ui_info, '{general}', '"As seen within listings under the MLS field as an example?, this is the name of the primary MLS for the agent."')
WHERE attr_id = 31; -- mls_name

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the standard abbreviation of the primary MLS utilized by the agent."')
WHERE attr_id = 32; -- mls_abbreviation

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the UUID (agent_uuid) of the user in question. This will be an integer. Displays within Roster under personal info > UUID."')
WHERE attr_id = 33; -- agent_id

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Within Roster associated with the Public Key field, this is the MoxiWorks Platform ID of the Office for this Agent. This will be an RFC 4122 compliant UUID."')
WHERE attr_id = 34; -- moxi_works_office_id

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Within Roster associated with the ID field, this is the ID of the Office for this Agent. This will be an integer."')
WHERE attr_id = 35; -- office_id

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Within Roster associated with the Internal Office ID field, this is the ID of the Office for this Agent as utilized by their company."')
WHERE attr_id = 36; -- client_office_id

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Within Roster associated with the Company UUID field, this is the ID of the Company for this Agent. This will be an integer."')
WHERE attr_id = 37; -- company_id

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Within Roster associated with the Company ID field, this is the ID of the Company utilized by the brokerage."')
WHERE attr_id = 38; -- client_company_id

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The street address of the agent’s office. This can be null if there is no data for this attribute. Displays within Roster under the office address section."')
WHERE attr_id = 39; -- office_address_street

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The suite or office number of the agent’s office. This can be null if there is no data for this attribute. Displays within Roster under the office address section."')
WHERE attr_id = 40; -- office_address_street2

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The city the agent’s office is in. This can be null if there is no data for this attribute. Displays within Roster under the office address section."')
WHERE attr_id = 41; -- office_address_city

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The state or provice the agent’s office is in. This can be null if there is no data for this attribute. Displays within Roster under the office address section."')
WHERE attr_id = 42; -- office_address_state

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The postal code the agent’s office is in. This can be null if there is no data for this attribute. Displays within Roster under the office address section."')
WHERE attr_id = 43; -- office_address_zip

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The street address of the agent’s office’s mailing address. This can be null if there is no data for this attribute. Displays within Roster under the office address section."')
WHERE attr_id = 44; -- office_mailing_address_street

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The suite or office number of the agent’s office’s mailing address. This can be null if there is no data for this attribute. Displays within Roster under the office address section."')
WHERE attr_id = 45; -- office_mailing_address_street2

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The city the agent’s office’s mailing address is in. This can be null if there is no data for this attribute. Displays within Roster under the office address section."')
WHERE attr_id = 46; -- office_mailing_address_city

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The state or provice the agent’s office’s mailing address is in. This can be null if there is no data for this attribute. Displays within Roster under the office address section."')
WHERE attr_id = 47; -- office_mailing_address_state

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The postal code the agent’s office’s mailing address is in. This can be null if there is no data for this attribute. Displays within Roster under the office address section."')
WHERE attr_id = 48; -- office_mailing_address_zip

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The full name of the agent, contact, or other entity in question, depending on the endpoint selected."')
WHERE attr_id = 49; -- name

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The first name of the agent, contact, or other entity in question, depending on the endpoint selected."')
WHERE attr_id = 50; -- first_name

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The last name of the agent, contact, or other entity in question, depending on the endpoint selected."')
WHERE attr_id = 51; -- last_name

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The nickname of the agent, contact, or other entity in question, depending on the endpoint selected."')
WHERE attr_id =52; -- nickname

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the main associated phone number. This number should be considered the number to be contacted by, in relation to the endpoint selected."')
WHERE attr_id = 53; -- main_phone_number

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Associated mobile phone number. main_phone_number should be considered higher priority, if not the same, in relation to the endpoint selected."')
WHERE attr_id = 54; -- mobile_phone_number

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Alternate phone number. This should be considered second in priority to main_phone_number, in relation to the endpoint selected."')
WHERE attr_id = 55; -- alt_phone_number

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the fax phone number, in relation to the endpoint selected."')
WHERE attr_id = 56; -- fax_phone_number

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the office phone number, in relation to the endpoint selected."')
WHERE attr_id = 57; -- office_phone_number

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the main email address. This email address should be considered the email address with preference to be contacted by, in relation to the endpoint selected."')
WHERE attr_id = 58; -- primary_email_address

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the agent’s alternate email address. This email address should be considered a backup email to be contacted by, in the event that the primary_email_address is not functional, in relation to the endpoint selected."')
WHERE attr_id = 59; -- secondary_email_address

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The email_addresses Hash is a Dictionary object holding the email addresses associated with the record, in relation to the endpoint selected."')
WHERE attr_id = 60; -- email_addresses

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the agent’s lead routing email address. This can be null if there is no data for this attribute."')
WHERE attr_id = 61; -- lead_routing_email_address

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the bio of the agent. Array of key/value pairs. Each has a body and header, both strings, which can be null or blank. Displays within Roster under the web info > About Me."')
WHERE attr_id =62; -- bio

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"This is a string that contains the agent’s designation(s), if any. This can be null if there is no data for this attribute."')
WHERE attr_id = 63; -- designations

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"This is an RFC 4122 compliant UUID associated with the agent. This UUID can be used as a unique identifier in determining associations between Agent objects and Listing objects. Displays within Roster under personal info > UUID."')
WHERE attr_id = 64; -- uuid

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Indicates whether the agent has access to MoxiWorks Products. Displays within Roster under Products & Permissions."')
WHERE attr_id = 65; -- has_product_access

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Indicates whether the agent has access to MoxiWorks Engage."')
WHERE attr_id = 66; -- has_engage_access

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The access level of the agent. If include_access_level was passed as true, this can return one of the possible access levels: company-admin, manager, office-admin, office-owner, region-admin, user. Displays within Roster under Products & Permissions > Permission Levels."')
WHERE attr_id = 67; -- access_level

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The view level of the agent. This will return one of the possible view levels: COMPANY_ADMIN, OFFICE_ADMIN, USER."')
WHERE attr_id = 68; -- view_level

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The teams array contains Dictionary objects representing Team entries. These include name - The human readable name identifying the team entry, uuid - the MoxiWorks Platform ID of the Team, and member_category - The role of the agent in the team.} Within the UI, team info can be found under Management Tools > Agent Teams."')
WHERE attr_id = 69; -- teams

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The base url of the agent’s MoxiWorks agent website. Displays within Roster under Web Info."')
WHERE attr_id = 70; -- website_base_url

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Agent’s Twitter URL. This can be null if there is no data available for this attribute. Displays within Roster under Web Info > Social Media."')
WHERE attr_id = 71; -- twitter

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"DEPRICATED. Displays within Roster under Web Info > Social Media."')
WHERE attr_id =72; -- google_plus

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Agent’s Facebook page url. This can be null if there is no data for this attribute. Displays within Roster under Web Info > Social Media."')
WHERE attr_id = 73; -- facebook

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Agent’s website domain. This will be returned without the HTTP(S) prefix. You’ll need to prefix the domain with protocol if using this attribute for an href. This can be null if there is no data for this attribute. Displays within Roster under Web Info."')
WHERE attr_id = 74; -- home_page

UPDATE associated_attrs 
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"This is a valid URL for a larger size image for the agent. If no agent image has been uploaded for this agent a default image url will be provided. Displays within Roster under agent info page."')
WHERE attr_id = 75; -- profile_image_url

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"This is a valid URL for a thumbnail size image for the agent. If no agent image has been uploaded for this agent a default image url will be provided. Displays within Roster under agent info page."')
WHERE attr_id = 76; -- profile_thumb_url

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The region the agent’s office is in. This can be null if there is no data for this attribute."')
WHERE attr_id = 77; -- region

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"The agent’s stated gross commission income goal. Displays within Engage in various places as the Gross Commission Income (GCI) Goal."')
WHERE attr_id = 78; -- gci_goal

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Percentage commission rate for the agent when acting as a buyer’s agent. Displays within Roster under listing Manager. Also displays on websites."')
WHERE attr_id = 79; -- buyer_commission_rate

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Percentage commission rate for the agent when acting as a seller’s agent. Displays within Roster under listing Manager. Also displays on websites."')
WHERE attr_id = 80; -- seller_commission_rate

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"A list of the lead service area zip codes covered by the agent."')
WHERE attr_id = 81; -- service_area_zip_codes

UPDATE associated_attrs
SET product_id = 5,
	ui_info = jsonb_set(ui_info, '{general}', '"This is an Array that includes the base_url and bio_page_slug of the agent MoxiWorks website."')
WHERE attr_id = 82; -- agent_website

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The alternate_offices array contains Dictionary objects representing AlternateOffice entries."')
WHERE attr_id = 83; -- alternate_offices

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The available_mls Array contains Dictionary objects representing MLS entries."')
WHERE attr_id = 84; -- available_mls

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"Existence of objects in the partners data structure is dependent upon external relationships existing between the agent represented by this Agent and the affiliate. Documented entities in the `partners` data structure may or may not be returned based on agent relationship. Your logic should be engineered to handle cases where the entity you are interested in is returned and where an empty data structure is returned."')
WHERE attr_id = 85; -- partners

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"A list of the company specific program names in which the agent participates or is a member."')
WHERE attr_id = 86; -- company_programs

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"A list of the source-specific user identifiers."')
WHERE attr_id = 87; -- source_metadata

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the Unix timestamp representing the date that this Agent was created in the MoxiWorks system."')
WHERE attr_id = 88; -- created_timestamp

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the Unix timestamp representing the date that this Agent was deactivated in the MoxiWorks system. This will be returned null if the agent is still active."')
WHERE attr_id = 89; -- deactivated_timestamp

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Indicates the “Profile Visible Online” value in Roster for this Agent. True corresponds to Yes (visible online); false corresponds to No (not visible online)."')
WHERE attr_id = 90; -- profile_visible_online

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"Existence of objects in the user_reviews data structure is dependent upon external sources, i.e. Zillow, Testimonial Tree."')
WHERE attr_id = 91; -- user_reviews

UPDATE associated_attrs
SET	product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"any Agent objects updated after this Unix timestamp will be returned in the response. If no updated_since parameter is included in the request, only Agent objects updated in the last seven days will be returned."')
WHERE attr_id = 92; -- updated_since

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"For queries with multi-page responses, use the page_number parameter to return data for specific pages. Data for page 1 is returned if this parameter is not included. Use this parameter if total_pages indicates that there is more than one page of data available."')
WHERE attr_id = 93; -- page_number

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"To find Agent accounts deactivated within the specified timeframe, pass true for this boolean parameter."')
WHERE attr_id = 94; -- deactivated

UPDATE associated_attrs 
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"any Agent objects deactivated after this Unix timestamp will be returned in the response. If no deactivated_since parameter is included in the request, only Agent objects deactivated in the last seven days will be returned."')
WHERE attr_id = 95; -- deactivated_since

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"To include company specific programs associated with the agent in the response, pass true."')
WHERE attr_id = 96; -- include_company_programs

UPDATE associated_attrs
SET product_id = 5,
	ui_info = jsonb_set(ui_info, '{general}', '"To include the base url (website_base_url) of the agent’s MoxiWorks website pass true."')
WHERE attr_id = 97; -- include_website

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"To include only Agent objects associated with company specific programs pass true."')
WHERE attr_id = 98; -- has_company_programs

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"If supplied then the results will exclude all data except primary identifiers and a unix timestamp (last_updated) & iso8601 timestamp (modification_timestamp) of the last time this record was updated."')
WHERE attr_id = 99; -- timestamps_only

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"To include bio associated with the agent in the response, pass true."')
WHERE attr_id = 100; -- include_bio

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Company Logo."')
WHERE attr_id = 101; -- image_logo

UPDATE associated_attrs
SET product_id = 7,
	ui_info = jsonb_set(ui_info, '{general}', '"Presentation accent color."')
WHERE attr_id = 102; -- cma_authoring_color

UPDATE associated_attrs
SET product_id = 7,
	ui_info = jsonb_set(ui_info, '{general}', '"background color."')
WHERE attr_id = 103; -- background_color

UPDATE associated_attrs
SET product_id = 7,
	ui_info = jsonb_set(ui_info, '{general}', '"font color intended to overlay background_color."')
WHERE attr_id = 104; -- background_font_color_primary

UPDATE associated_attrs 
SET product_id = 7,
	ui_info = jsonb_set(ui_info, '{general}', '"background color of buttons."')
WHERE attr_id = 105; -- button_background_color

UPDATE associated_attrs
SET product_id = 7,
	ui_info = jsonb_set(ui_info, '{general}', '"font color intended to overlay button_background_color."')
WHERE attr_id = 106; -- button_font_color

UPDATE associated_attrs
SET product_id = 7,
	ui_info = jsonb_set(ui_info, '{general}', '"copyright notice – this may contain embedded HTML."')
WHERE attr_id = 107; -- copyright

UPDATE associated_attrs
SET product_id = 7,
	ui_info = jsonb_set(ui_info, '{general}', '"name of company as displayed to consumer."')
WHERE attr_id = 108; -- display_name

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"background color of email elements outside body."')
WHERE attr_id = 109; -- email_element_background_color

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"font color intended to overlay email_background_font_color."')
WHERE attr_id = 110; -- email_background_font_color

UPDATE associated_attrs
SET product_id = 7,
	ui_info = jsonb_set(ui_info, '{general}', '"company logo shown in pdf version of presentations."')
WHERE attr_id = 111; -- image_cma_pdf_logo_header

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"company logo as shown in email header."')
WHERE attr_id = 112; -- image_email_logo_alt

UPDATE associated_attrs
SET product_id = 5,
	ui_info = jsonb_set(ui_info, '{general}', '"favicon of company."')
WHERE attr_id = 113; -- image_favicon

UPDATE associated_attrs
SET product_id = 7,
	ui_info = jsonb_set(ui_info, '{general}', '"company logo shown in the online version of presentations."')
WHERE attr_id = 114; -- image_pres_cover_logo

UPDATE associated_attrs
SET product_id = 7,
	ui_info = jsonb_set(ui_info, '{general}', '"block element background color shown in online version of presentations."')
WHERE attr_id = 115; -- pres_block_background_color

UPDATE associated_attrs
SET product_id = 7,
	ui_info = jsonb_set(ui_info, '{general}', '"font color intended to overlay pres_block_background_color."')
WHERE attr_id = 116; -- pres_block_text_color

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"A brief, human readable title that will be shown to the agent as the subject of the BuyerTransaction that you are creating."')
WHERE attr_id = 117; -- transaction_name

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"Brief, human readable content that will be shown to the agent as notes about the BuyerTransaction that you are creating."')
WHERE attr_id = 118; -- notes

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"The street address of the property being purchased. This should be populated if this BuyerTransaction - is_mls_transaction attribute is false."')
WHERE attr_id = 119; -- address

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"The city or township of the property being purchased. This should be populated if this BuyerTransaction - is_mls_transaction attribute is false."')
WHERE attr_id = 120; -- city

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"The state or province of the property being purchased. This should be populated if this BuyerTransaction - is_mls_transaction attribute is false."')
WHERE attr_id = 121; -- state

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"The postal code of the property being purchased. This should be populated if this BuyerTransaction - is_mls_transaction attribute is false."')
WHERE attr_id = 122; -- zip_code

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"The minimum desired living area for prospective properties."')
WHERE attr_id = 123; -- min_sqft

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"The maximum desired living area for prospective properties."')
WHERE attr_id = 124; -- max_sqft

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"The minimum number of bedrooms for prospective properties."')
WHERE attr_id = 125; -- min_beds

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"The maximum number of bedrooms for prospective properties."')
WHERE attr_id = 126; -- max_beds

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"The minimum number of bathrooms for prospective properties."')
WHERE attr_id = 127; -- min_baths

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"The maximum number of bathrooms for prospective properties."')
WHERE attr_id = 128; -- max_baths

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"The name of a locality representing an area of interest for prospective properties."')
WHERE attr_id = 129; -- area_of_interest

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"Whether the property being purchased is being listed on an MLS. This should be false for paperwork-only, for sale by owner, off-market, or pocket listing type transactions or any transactions that will not be tracked through an MLS."')
WHERE attr_id = 130; -- is_mls_transaction

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"The MLS number of the the property being purchased. mls_number should be populated only if is_mls_transaction is true."')
WHERE attr_id = 131; -- mls_number

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the Unix timestamp representing the date that the agent initiated transaction discussions with the client."')
WHERE attr_id = 132; -- start_timestamp

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"Commission for the transaction. If the commission for the transaction is based on a percentage of the purchase amount, use this attribute. Use either this or commission_flat_fee depending on how the transaction is structured, both attributes cannot be populated. If no commission (either commission_percentage or commission_flat_fee) is supplied during creation, commission_percentage is set to the default commission_percentage for the associated Agent."')
WHERE attr_id = 133; -- commission_percentage

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"Commission for the transaction. If the commission for the transaction is based on a flat dollar amount, use this attribute. Use either this or commission_percentage, both cannot be populated."')
WHERE attr_id = 134; -- commission_flat_fee

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"If the payment for the transaction is based on percentage of sales volume, use this attribute. Use either this or sales_volume_flat_fee depending on how the transaction is structured, both attributes cannot be populated."')
WHERE attr_id = 135; -- sales_volume_percentage

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"If payment for the transaction is based on a flat fee derived from sales volume, use this attribute. Use either this or sales_volume_percentage depending on how the transaction is structured, both attributes cannot be populated."')
WHERE attr_id = 136; -- sales_volume_flat_fee

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"The desired purchase price for a property if using target rather than range."')
WHERE attr_id = 137; -- target_price

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"The minimum price range for a property if using a price range rather than target price."')
WHERE attr_id = 138; -- min_price

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"The maximum price range for a property if using a price range rather than target price."')
WHERE attr_id = 139; -- max_price

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"The stage that the BuyerTransaction should be placed into (see section header)."')
WHERE attr_id = 140; -- stage

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the MoxiWorks Platform ID of the BuyerTransaction which you have created. This will be an RFC 4122 compliant UUID. This ID should be recorded on response as it is the key ID for updating the BuyerTransaction."')
WHERE attr_id = 141; -- moxi_works_transaction_id

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"This attribute displays a human readable stage name that is associated with the current stage attribute. When created through the MoxiWorks Platform BuyerTransaction objects will automatically be configured as active transactions. For more information about BuyerTransaction stages, see BuyerTransaction Stages."')
WHERE attr_id = 142; -- stage_name

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the closing price for the transaction . This should be null if the BuyerTransaction is not yet in complete state."')
WHERE attr_id = 143; -- closing_price

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"A Unix timestamp representing the point in time when the transaction for this BuyerTransaction object was completed. This should be null if the BuyerTransaction is not yet in complete state."')
WHERE attr_id = 144; -- closing_timestamp

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"A Unix timestamp representing the point in time when the transaction for this BuyerTransaction object entered into its current state."')
WHERE attr_id = 145; -- state_changed_at

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"If this is set to true then The MoxiWorks Platform will promote this transaction to the next stage."')
WHERE attr_id = 146; -- promote_transaction

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the numeric company id that is interchangeable with the moxi_works_agent_id in all request scenarios."')
WHERE attr_id = 147; -- numeric_id

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"Exposed company attributes."')
WHERE attr_id = 148; -- public_partner_attrs

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"This is related to the Company endpoint, search action, and refers to the number of records to return per page."')
WHERE attr_id = 149; -- per_page

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"Displays two additional attributes on response payload. Use for troubleshooting purposes only. Paging should be performed again the provided paging_complete attribute."')
WHERE attr_id = 150; -- show_paging_totals

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the full name of the contact you are creating a Contact record for - first middle last."')
WHERE attr_id = 151; -- contact_name

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the phone number that should be used first. It should be a 10 digit phone number."')
WHERE attr_id = 152; -- primary_phone_number

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the phone number that should be used as an alternate. It should be a 10 digit phone number."')
WHERE attr_id = 153; -- secondary_phone_number

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"The Contact will be created in MoxiEngage as a lead sourced from the LeadSource associated with this moxi_works_lead_source_id. Send a LeadSource index request to determine which lead sources your organization has permission to impersonate during lead generation."')
WHERE attr_id = 154; -- moxi_works_lead_source_id

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"This is used to keep track of the original lead source for this Contact record, if different than the lead source associated with the moxi_works_lead_source_id."')
WHERE attr_id = 155; -- original_lead_source

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"The gender of the contact. This can be male, female, m or f. No matter what is provided in the request, the response payload will return m or f."')
WHERE attr_id = 156; -- gender

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the name used to address the contact when creating mailing labels for the contact associated with this Contact record. It should be a human readable string."')
WHERE attr_id = 157; -- label_name

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"The contact’s home address street, including number and any suite / apartment number information."')
WHERE attr_id = 158; -- home_street_address

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"The city of the contact’s home address."')
WHERE attr_id = 159; -- home_city

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"The state of the contact’s home address."')
WHERE attr_id = 160; -- home_state

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"The zip code of the contact’s home address."')
WHERE attr_id = 161; -- home_zip

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"The country of the contact’s home address."')
WHERE attr_id = 162; -- home_country

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"If the created Contact record is not for a lead set this to true. By default this is false."')
WHERE attr_id = 163; -- is_not_lead

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"If the created Contact record should be treated as a lead but it is not desired that the agent should receive an email or text that they have received a lead."')
WHERE attr_id = 164; -- skip_agent_notification

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"The contact’s professional job title."')
WHERE attr_id = 165; -- job_title

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"The contact’s profession."')
WHERE attr_id = 166; -- occupation

UPDATE associated_attrs
SET product_id = 5,
	ui_info = jsonb_set(ui_info, '{general}', '"This should be a valid URL for a property of interest in your system that can be viewed by the agent."')
WHERE attr_id = 167; -- property_url

UPDATE associated_attrs
SET product_id = 5,
	ui_info = jsonb_set(ui_info, '{general}', '"Use this if you have data about a property that this contact has shown interest in (property of interest); this should be the MLS ID of the property of interest."')
WHERE attr_id = 168; -- property_mls_id

UPDATE associated_attrs
SET product_id = 5,
	ui_info = jsonb_set(ui_info, '{general}', '"Use this if you have data about a property that this contact has shown interest in (property of interest); this should be the street address of the property of interest, including number and suite/apartment number information."')
WHERE attr_id = 169; -- property_street_address

UPDATE associated_attrs
SET product_id = 5,
	ui_info = jsonb_set(ui_info, '{general}', '"Use this if you have data about a property that this contact has shown interest in (property of interest); this should be the city in which the property of interest exists."')
WHERE attr_id = 170; -- property_city

UPDATE associated_attrs
SET product_id = 5,
	ui_info = jsonb_set(ui_info, '{general}', '"Use this if you have data about a property that this contact has shown interest in (property of interest); this should be the state or province in which the property of interest exists."')
WHERE attr_id = 171; -- property_state

UPDATE associated_attrs
SET product_id = 5,
	ui_info = jsonb_set(ui_info, '{general}', '"Use this if you have data about a property that this contact has shown interest in (property of interest); this should be the postal code in which the property of interest exists."')
WHERE attr_id = 172; -- property_zip

UPDATE associated_attrs
SET product_id = 5,
	ui_info = jsonb_set(ui_info, '{general}', '"Use this if you have data about a property that this contact has shown interest in (property of interest); this should be the number of bedrooms in the property of interest."')
WHERE attr_id = 173; -- property_beds

UPDATE associated_attrs
SET product_id = 5,
	ui_info = jsonb_set(ui_info, '{general}', '"Use this if you have data about a property that this contact has shown interest in (property of interest); this should be the number of bathrooms in the property of interest."')
WHERE attr_id = 174; -- property_baths

UPDATE associated_attrs
SET product_id = 5,
	ui_info = jsonb_set(ui_info, '{general}', '"Use this if you have data about a property that this contact has shown interest in (property of interest); this should be the list price of the property of interest."')
WHERE attr_id = 175; -- property_list_price

UPDATE associated_attrs
SET product_id = 5,
	ui_info = jsonb_set(ui_info, '{general}', '"Use this if you have data about a property that this contact has shown interest in (property of interest); this should be the listing status of the property of interest. This can be any arbitrary string, but for best results, this should be a state like Active, Pending, Sold, Cancelled or any other human readable state that would be useful when presented to the agent."')
WHERE attr_id = 176; -- property_listing_status

UPDATE associated_attrs
SET product_id = 5,
	ui_info = jsonb_set(ui_info, '{general}', '"Use this if you have data about a property that this contact has shown interest in (property of interest); this should be a valid URL to an image of the property of interest."')
WHERE attr_id = 177; -- property_photo_url

UPDATE associated_attrs
SET product_id = 5,
	ui_info = jsonb_set(ui_info, '{general}', '"Use this if you have data about listing searches that this contact has performed; this should be the city / locale used in the listing search criteria."')
WHERE attr_id = 178; -- search_city

UPDATE associated_attrs
SET product_id = 5,
	ui_info = jsonb_set(ui_info, '{general}', '"Use this if you have data about listing searches that this contact has performed; this should be the state / region used in the listing search criteria."')
WHERE attr_id = 179; -- search_state

UPDATE associated_attrs
SET product_id = 5,
	ui_info = jsonb_set(ui_info, '{general}', '"Use this if you have data about listing searches that this contact has performed; this should be the zip / postal code used in the listing search criteria."')
WHERE attr_id = 180; -- search_zip

UPDATE associated_attrs
SET product_id = 5,
	ui_info = jsonb_set(ui_info, '{general}', '"Use this if you have data about listing searches that this contact has performed; this should be the minimum bathrooms used in the listing search criteria."')
WHERE attr_id = 181; -- search_min_baths

UPDATE associated_attrs
SET product_id = 5,
	ui_info = jsonb_set(ui_info, '{general}', '"Use this if you have data about listing searches that this contact has performed; this should be the minimum bedrooms used in the listing search criteria."')
WHERE attr_id = 182; -- search_min_beds

UPDATE associated_attrs
SET product_id = 5,
	ui_info = jsonb_set(ui_info, '{general}', '"Use this if you have data about listing searches that this contact has performed; this should be the minimum price used in the listing search criteria."')
WHERE attr_id = 183; -- search_min_price

UPDATE associated_attrs
SET product_id = 5,
	ui_info = jsonb_set(ui_info, '{general}', '"Use this if you have data about listing searches that this contact has performed; this should be the maximum price used in the listing search criteria."')
WHERE attr_id = 184; -- search_max_price

UPDATE associated_attrs
SET product_id = 5,
	ui_info = jsonb_set(ui_info, '{general}', '"Use this if you have data about listing searches that this contact has performed; this should be the minimum square feet of the total living area used in the listing search criteria."')
WHERE attr_id = 185; -- search_min_sq_ft

UPDATE associated_attrs
SET product_id = 5,
	ui_info = jsonb_set(ui_info, '{general}', '"Use this if you have data about listing searches that this contact has performed; this should be the maximum square feet of the total living area used in the listing search criteria."')
WHERE attr_id = 186; -- search_max_sq_ft

UPDATE associated_attrs
SET product_id = 5,
	ui_info = jsonb_set(ui_info, '{general}', '"Use this if you have data about listing searches that this contact has performed; this should be the minimum lot size used in the listing search criteria."')
WHERE attr_id = 187; -- search_min_lot_size

UPDATE associated_attrs
SET product_id = 5,
	ui_info = jsonb_set(ui_info, '{general}', '"Use this if you have data about listing searches that this contact has performed; this should be the maximum lot size used in the listing search criteria."')
WHERE attr_id = 188; -- search_max_lot_size

UPDATE associated_attrs
SET product_id = 5,
	ui_info = jsonb_set(ui_info, '{general}', '"Use this if you have data about listing searches that this contact has performed; this should be the minimum allowable year built used in the listing search criteria."')
WHERE attr_id = 189; -- search_min_year_built

UPDATE associated_attrs
SET product_id = 5,
	ui_info = jsonb_set(ui_info, '{general}', '"Use this if you have data about listing searches that this contact has performed; this should be the maximum allowable year built used in the listing search criteria."')
WHERE attr_id = 190; -- search_max_year_built

UPDATE associated_attrs
SET product_id = 5,
	ui_info = jsonb_set(ui_info, '{general}', '"This will be the property types used in the listing search criteria. This can be any arbitrary human readable string, but using recognized property types such as Condo, Single-Family, Townhouse, Land, Multifamily will provide more value to the agent. This value will be null if no data is available for this attribute."')
WHERE attr_id = 191; -- search_property_types

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"This is a string which reflects the partner created notes. Agent created notes are not reflected in this attribute. Any Notes added here will be displayed to the agent in an Activity Log record. Any HTML formatting included will be stripped from the note attribute’s data. This value will be null if no data is available for this attribute. This text field is limited to 3k."')
WHERE attr_id = 192; -- note

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"Websites should be submitted as a json array of objects. Each object should include website prioritized ‘rank’ and ‘value’. The number of website fields available for update for a given Contact record depends on the agent email client type."')
WHERE attr_id = 193; -- websites

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"A unix timestamps representing the birthday for the Contact record."')
WHERE attr_id = 194; -- birthday

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"A comma separated list of unix timestamps representing the house-iversary dates for the Contact record."')
WHERE attr_id = 195; -- home_purchase_anniversaries

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"The name of the company to be associated with the Contact record."')
WHERE attr_id = 196; -- company

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"The spouse or partner name to be associated with the Contact record."')
WHERE attr_id = 197; -- spouse_or_partner

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"A comma separated string of the agent’s mail server categories / groups into which the Contact will be placed. If a supplied group / category name doesn’t already exist for the Agent record, a new category / group will be created and the contact will be added to it."')
WHERE attr_id = 198; -- category_names

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"A comma separated string of the agent’s mail server categories / groups into which the Contact will be placed. If a supplied group / category name doesn’t already exist for the Agent record, a new category / group will be created and the contact will be added to it."')
WHERE attr_id = 199; -- is_deleted

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the middle name of the contact associated with this Contact record. This value will be null if no data is available for this attribute."')
WHERE attr_id = 200; -- middle_name

--49-60 updated

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the generational suffix of the name of the contact associated with this Contact record. This value will be null if no data is available for this attribute. Supported suffixes are II III IV JR JR.. SR SR."')
WHERE attr_id = 201; -- suffix

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"These phone numbers correspond to agent created Contact entities. Only phone fields present in this Contact record will be returned."')
WHERE attr_id = 202; -- phone_numbers

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"Whether the contact was recently added to the Agent’s database."')
WHERE attr_id = 203; -- is_new_contact

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"Wedding anniversary of the contact represented as a Unix Timestamp."')
WHERE attr_id = 204; -- anniversary

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"Anniversary of the contact’s home purchase represented as a Unix Timestamp."')
WHERE attr_id = 205; -- home_purchase_anniversary

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"Array representing all associated social media profiles."')
WHERE attr_id = 206; -- social_media_profiles

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"An array of the agent’s mail server groups / categories to which this contact belongs."')
WHERE attr_id = 207; -- groups

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"This is used to keep track of the original lead source for this Contact record. This field will not be displayed in MoxiEngage, and is for the parter’s own tracking purposes. This key will be associated with valid moxi_works_lead_source_id. Send a LeadSource index request for a full list of applicable lead sources and their ids."')
WHERE attr_id = 208; -- moxi_works_origin_lead_source_id

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"An email address associated with the endpoint."')
WHERE attr_id = 209; -- email_address

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"Array of phone numbers correspond to agent created Contact entities. Only phone fields present in this record will be returned."')
WHERE attr_id = 210; -- phone_numbers

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"Whether to only include Contact records for contacts that are neither considered personal contacts nor work collaborators in the payload response."')
WHERE attr_id = 211; -- only_business_contacts

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"If there is more than one page of Contact objects to return, total_pages will denote how many pages of Contact objects there are to be returned fo the current query. Subsequent pages can be returned by including the page_number parameter in your API request."')
WHERE attr_id = 212; -- total_pages

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"This array contains the payload from the request query. Any found Contact objects matching the query will be returned as Contact objects in the response."')
WHERE attr_id = 213; -- contacts

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the result of the delete action – whether the Contact object was actually deleted."')
WHERE attr_id = 214; -- result

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"A string representing the type of EmailSubscription is associated with the Contact for the supplied partner_contact_id. This is a unique, internally defined string per EmailSubscription type. Documentation of available subscription_type responses is outside the scope of this documentation. If you need help determining available types, please email partners@moxiworks.com."')
WHERE attr_id = 215; -- subscription_type

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"Unix timestamp representing when the EmailSubscription that is associated with the Contact for the supplied partner_contact_id was initiated."')
WHERE attr_id = 216; -- subscribed_at

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"This is a string representing the actor responsible for the subscription initiation."')
WHERE attr_id = 217; -- created_by

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"A string representing a geographic area that the EmailSubscription regards."')
WHERE attr_id = 218; -- area

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"This is a Unix timestamp representing the point in time that the last EmailSubscription message was sent."')
WHERE attr_id = 219; -- last_sent

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"This is a Unix timestamp representing the point in time that the next EmailSubscription message will be sent."')
WHERE attr_id = 220; -- next_scheduled

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"Unix timestamp representing when the EmailSubscription was created."')
WHERE attr_id = 221; -- created_at

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"Unix timestamp representing when the EmailSubscription that is associated with the Contact for the supplied partner_contact_id was unsubscribed."')
WHERE attr_id = 222; -- unsubscribed_at

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"Who unsubcribed the EmailSubscription."')
WHERE attr_id = 223; -- unsubscribed_by

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"boolean representing whether email subscription is a listing announcement for listed homes"')
WHERE attr_id = 224; -- listed 

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"boolean representing whether email subscription is a listing announcement for sold homes"')
WHERE attr_id = 225; -- sold 

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"Zipcode"')
WHERE attr_id = 226; -- zipcode 

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"Type of neighborhood email subscription. This can either be “quick” or “custom”"')
WHERE attr_id = 227; -- nn_subscription_type

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"For “custom” neighborhood email subscription , search filter with min price"')
WHERE attr_id = 228; -- nn_min_price

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"For “custom” neighborhood email subscription , search filter with max price"')
WHERE attr_id = 229; -- nn_max_price

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"For “custom” neighborhood email subscription , search filter with min number of bedrooms."')
WHERE attr_id = 230; -- nn_min_beds

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"For “custom” neighborhood email subscription , search filter with max number of bedrooms."')
WHERE attr_id = 231; -- nn_max_beds

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"For “custom” neighborhood email subscription , search filter with min number of bathrooms."')
WHERE attr_id = 232; -- nn_min_baths

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"For “custom” neighborhood email subscription , search filter with min square feet"')
WHERE attr_id = 233; -- nn_min_sqft

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"For “custom” neighborhood email subscription , search filter with max square feet"')
WHERE attr_id = 234; -- nn_max_sqft

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"For “custom” neighborhood email subscription, property_tye selected in the search filter. This value can be either Residential, Condominium, Manufactured Homes, Multi-family, Townhouse"')
WHERE attr_id = 235; -- nn_property_type

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the unique identifer you use in your system that has been associated with the Event that you are creating. This data is required and must be a unique key."')
WHERE attr_id = 236; -- partner_event_id

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"This is a short, descriptive, human readable phrase to be displayed to the agent which lets them know what this Event regards."')
WHERE attr_id = 237; -- event_subject

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"This is a human readable locatition reference regarding where the event is located that will be meaningful to the agent."')
WHERE attr_id = 238; -- event_location

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"Whether to send a reminder about the event to attendees before the event starts."')
WHERE attr_id = 239; -- send_reminder

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"If send_reminder is true, this is how many minutes before the start of the event to send the reminder. Default is 15 minutes before."')
WHERE attr_id = 240; -- remind_minutes_before

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the Unix timestamp representing the start time of the Event that you are creating. This data is required and must be a valid Unix timestamp."')
WHERE attr_id = 241; -- event_start

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the Unix timestamp representing the end time of the Event that you are creating. This data is required and must be a valid Unix timestamp."')
WHERE attr_id = 242; -- event_end

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"Whether the event is an all day event."')
WHERE attr_id = 243; -- all_day

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"This is a comma separated list of contacts that have already been added through the MoxiWorks Platform API who will be present at the referenced event. (Use IDs from your system – i.e. partner_contact_id from Contact Create)."')
WHERE attr_id = 244; -- attendees

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the earliest time that you are searching for an Event to be in. This data is required and must be a Unix timestamp before date_end."')
WHERE attr_id = 245; -- date_start

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the latest time that you are searching for an Event to be in. This data is required and must be a Unix timestamp after date_start."')
WHERE attr_id = 246; -- date_end

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"This is a string representing a date in MM/DD/YYYY format. Any event Event whose duration spans or falls within this day will be included in the results for this day."')
WHERE attr_id = 247; -- date

UPDATE associated_attrs
SET product_id = 4,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the payload of Event objects that fall on this day. If no Event objects span this duration, then the events array will be emtpy."')
WHERE attr_id = 248; -- events

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The MLS number for the listing."')
WHERE attr_id = 249; -- ListingID

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The name of the MLS which this listing is listed with."')
WHERE attr_id = 250; -- ListOfficeAOR

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Any images in the gallery, this is an object."')
WHERE attr_id = 251; -- ListingImages

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the unique identifer you use in your system that will be associated with the Group that you are creating. This data is required and must be a unique ID for your Group Create request to be accepted."')
WHERE attr_id = 252; -- partner_group_id 

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"This is a human readable string meaningful to the agent about what kind of Contact objects are in this Group."')
WHERE attr_id = 253; -- moxi_works_group_name

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the unique identifier for this Group."')
WHERE attr_id = 254; -- moxi_works_group_id

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Whether the group ID exists beyond name change."')
WHERE attr_id = 255; -- transient

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"How to determine if contacts were removed or added in this request (always false for create requests)."')
WHERE attr_id = 256; -- is_contact_removal

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"This is a list of contact id hashes representing Contact objects that were successfully added to the Group during creation. The contact hash will be composed of the partner_contact_id and moxi_works_contact_id associated with the contact."')
WHERE attr_id = 257; -- updated_contacts

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"This is a list of contact id hashes representing Contact objects that were successfully added to the Group during creation. The contact hash will be composed of the partner_contact_id and moxi_works_contact_id associated with the contact."')
WHERE attr_id = 258; -- is_partner_alias

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"This is a list of contact id hashes representing Contact objects that were successfully added to the Group during creation. The contact hash will be composed of the partner_contact_id and moxi_works_contact_id associated with the contact."')
WHERE attr_id = 259; -- is_partner_default

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the MoxiWorks Platform ID of the Listing which you are requesting to Update. This data is required and must reference a valid MoxiWorks Listing ID for your Update request to be accepted."')
WHERE attr_id = 260; -- moxi_works_listing_id

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"When this attribute is passed as true, the json keys of the response will be underscored. The default json key format for listing responses is camel casing."')
WHERE attr_id = 261; -- underscore_response 

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the property size of the listing land in acres. If no data is available for this attribute, it will be null."')
WHERE attr_id = 262; -- LotSizeAcres

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the number of full bathrooms in the property. If no data is available for this attribute, it will be null."')
WHERE attr_id = 263; -- BathroomsFull

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the number of half bathrooms in the property. If no data is available for this attribute, it will be null."')
WHERE attr_id = 264; -- BathroomsHalf

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the number of quarter-sized bathrooms in the property. If no data is available for this attribute, it will be null."')
WHERE attr_id = 265; -- BathroomsOneQuarter

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the number of partial bathrooms in the property. If no data is available for this attribute, it will be null."')
WHERE attr_id = 266; -- BathroomsPartial

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the number of three-quarter bathrooms in the property. If no data is available for this attribute, it will be null."')
WHERE attr_id = 267; -- BathroomsThreeQuarter

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the number of rooms that are bathrooms in the property. This is not a summary count of bathrooms by size. If no data is available for this attribute, it will be null."')
WHERE attr_id = 268; -- BathroomsTotalInteger

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the summary count of bathrooms in the property. This will be the number of quarter-bathrooms plus half-bathrooms plus three-quarter bathrooms plus full bathrooms. If no data is available for this attribute, it will be null."')
WHERE attr_id = 269; -- BathroomsTotal

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the number of bedrooms in the property. If no data is available for this attribute, it will be null."')
WHERE attr_id = 270; -- BedroomsTotal

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The human-readable title for the listing generated by the property agent. If no data is available for this attribute, it will be null."')
WHERE attr_id = 271; -- PublicTitle

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"These are human-readable notes about the property generated by the property agent. If no data is available for this attribute, it will be null."')
WHERE attr_id = 272; -- PublicRemarks

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"This is a string representing a date on which the listing data was last updated in ISO 8601 format. If no data is available for this attribute, it will be null."')
WHERE attr_id = 273; -- ModificationTimestamp

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Date the listing status changed to its current value."')
WHERE attr_id = 274; -- StatusChangeDate

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"This denotes whether the property should be displayed on a public facing website. If no data is available for this attribute, it will be null."')
WHERE attr_id = 275; -- InternetAddressDisplayYN

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The number of days the listing has been on market."')
WHERE attr_id = 276; -- DaysOnMarket

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"This is a string representing a date on which the listing contract was initiated. The string format is MM/DD/YYYY."')
WHERE attr_id = 277; -- ListingContractDate
UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"This is a string representing a date on which the Listing object was created. The string format is MM/DD/YYYY."')
WHERE attr_id = 278; -- CreatedDate

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The elementary school for the property."')
WHERE attr_id = 279; -- ElementarySchool

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The number of garage spaces that are available at the property."')
WHERE attr_id = 280; -- GarageSpaces

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Whether the property is waterfront."')
WHERE attr_id = 281; -- WaterfrontYN

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The high school for the property."')
WHERE attr_id = 282; -- HighSchool

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The home owner’s association fee for the property."')
WHERE attr_id = 283; -- AssociationFee

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The name of the listing office."')
WHERE attr_id = 284; -- ListOfficeName

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The listed price for the listing."')
WHERE attr_id = 285; -- ListPrice

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The name of the listing agent."')
WHERE attr_id = 286; -- ListAgentFullName

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"A unique identifier for the listing agent. This will correspond to the uuid field of an Agent."')
WHERE attr_id = 287; -- ListAgentUUID

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"A unique identifier for the listing agent’s office. This will correspond to the office_id field of an Office."')
WHERE attr_id = 288; -- ListAgentOfficeID

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"A unique identifier for the listing agent’s office. This will correspond to the moxi_works_office_id field of an Office."')
WHERE attr_id = 289; -- ListAgentMoxiWorksOfficeID

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"If there is a second listing agent, the name of the second listing agent."')
WHERE attr_id = 290; -- SecondaryListAgentFullName 

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"If there is a second listing agent, the unique identifier for the second listing agent. This will correspond to the uuid field of an Agent."')
WHERE attr_id = 291; -- SecondaryListAgentUUID 

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The school district the listing property is in."')
WHERE attr_id = 292; -- SchoolDistrict

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The street address of the property."')
WHERE attr_id = 293; -- Address

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Additional street address information, for example, suite number."')
WHERE attr_id = 294; -- Address2

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"City or township the property is located in."')
WHERE attr_id = 295; -- City

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"County or Parish the property is located in."')
WHERE attr_id = 296; -- CountyOrParish

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The latitude of the property."')
WHERE attr_id = 297; -- Latitude

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The longitude of the property."')
WHERE attr_id = 298; -- Longitude

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The State or Province the property is located in."')
WHERE attr_id = 299; -- StateOrProvince

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The Postal Code of the property."')
WHERE attr_id = 300; -- PostalCode

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The community the property is located in."')
WHERE attr_id = 301; -- Community

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Total area of the lot."')
WHERE attr_id = 302; -- LotSizeSquareFeet

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Whether to display information about this listing publicly. If this is false, then the information about this listing should not be visible to the Internet."')
WHERE attr_id = 303; -- InternetEntireListingDisplayYN 

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The middle school for the property."')
WHERE attr_id = 304; -- MiddleOrJuniorSchool

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The MLS Area which this listing is in."')
WHERE attr_id = 305; -- ListOfficeAORArea

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Whether the property has a pool."')
WHERE attr_id = 306; -- PoolYN 

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The type of property being listed. This can be one of Residential, Condo-Coop, Townhouse, Land, Multifamily "')
WHERE attr_id = 307; -- PropertyType

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The total annual property tax."')
WHERE attr_id = 308; -- TaxAnnualAmount

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The tax year that the property tax in TaxAnnualAmount was assessed."')
WHERE attr_id = 309; -- TaxYear

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Whether the building has one story or is multi-story."')
WHERE attr_id = 310; -- SingleStory

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Total square footage of the building(s) on the property."')
WHERE attr_id = 311; -- LivingArea

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Whether the property has a view."')
WHERE attr_id = 312; -- ViewYN

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The year the living building(s) on the property were built."')
WHERE attr_id = 313; -- YearBuilt

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Whether the listing is currently on-market."')
WHERE attr_id = 314; -- OnMarket

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Detailed status of the listing; whether it’s active pending contingent coming soon short sale"')
WHERE attr_id = 315; -- Status

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The unique Identifier for the listing in The MoxiWorks Platform."')
WHERE attr_id = 316; -- MoxiWorksListingId

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Whether the agent created this listing."')
WHERE attr_id = 317; -- AgentCreatedListing

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Virtual tour URL for this listing."')
WHERE attr_id = 318; -- VirtualTourURL

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"A hash containing data shared between MoxiWorks affiliates."')
WHERE attr_id = 319; -- SharedPartnerData

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The Tax ID / Parcel ID for the property. If no data is available for this attribute, it will be null."')
WHERE attr_id = 320; -- TaxParcelId

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Details URL for this listing."')
WHERE attr_id = 321; -- ListingURL

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Any defined features about the property."')
WHERE attr_id = 322; -- PropertyFeatures

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Company specific attributes associated with the listing. These will be defined by the company & should not be expected to be uniform across companies."')
WHERE attr_id = 323; -- CompanyListingAttributes

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Open house data."')
WHERE attr_id = 324; -- OpenHouse

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The date when the images of the property were last modified, or null if the property has no images."')
WHERE attr_id = 325; -- ImagesLastModified

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"The type of buyer broker compensation value set for the listing. The two types of broker compensation values are percent or flat_rate."')
WHERE attr_id = 326; -- BuyerCommissionType

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"Buyer broker compensation value for the listing."')
WHERE attr_id = 327; -- BuyerCommissionValue

UPDATE associated_attrs
SET product_id = 3,
	ui_info = jsonb_set(ui_info, '{general}', '"If fetching a multi-page response, this should be the MoxiWorksListingId found in the last SoldListing object of the previously fetched page."')
WHERE attr_id = 328; -- last_moxi_works_listing_id

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"Include additional listings using this unix timestamp representing the date since partner data has been updated. This attribute should be used in conjuncion with the updated_since attribute."')
WHERE attr_id = 329; -- shared_partner_data_updated_since

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"When filtering by market_status use one of the following options: on-market, off-market, or all."')
WHERE attr_id = 330; -- market_status

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"When filtering by property_types pass a comma separated string of integers associated with various property types. When property_types is not inlcuded, all property types will be included in the response. Use the legend within the API documentation to determine which integer values to include in property_types."')
WHERE attr_id = 331; -- property_types

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"When this filter parameter is passed as true, the response will be restricted to listings created by agents (non-mls listings)."')
WHERE attr_id = 332; -- only_agent_created

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"When this attribute is passed as true only listings with status “ComingSoon” will be returned."')
WHERE attr_id = 333; -- coming_soon 

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"If there is another page of Listing objects available, this will be false. If you are receiving the final page of Listing objects for the query, FinalPage will be true."')
WHERE attr_id = 334; -- FinalPage

UPDATE associated_attrs
SET product_id = 11,
	ui_info = jsonb_set(ui_info, '{general}', '"This is the payload object for the query. Any Listing object that matches the request query will be returned here."')
WHERE attr_id = 335; -- Listings