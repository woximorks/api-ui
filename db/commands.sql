-- ************************************ Adding UI Information

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'Agent UUID, found on profile page, seen as an RFC 4122 compliant UUID. This will be seen within Roster/Client Manager and is the user account level UUID'
WHERE attr_id = 1; -- agent_uuid

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'Roster upload, user external key field. Intended for use cases where integration is managed by end-user interaction.'
WHERE attr_id = 2; -- moxi_works_agent_id

UPDATE associated_attrs
SET product_id = 11,
	ui_info = 'DEPRECATED field related to Roster Feed'
WHERE attr_id = 3; -- source_agent_id

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'Human readable string which would be presented to the Agent as the content of the ActionLog entry'
WHERE attr_id = 4; -- body

UPDATE associated_attrs
SET product_id = 11,
	ui_info = 'API related data, the Platform ID the action is associated with'
WHERE attr_id = 5; -- moxi_works_contact_id

UPDATE associated_attrs
SET product_id = 11,
	ui_info = 'ID partner passed when creating a contact through the API, the unique identifer in the system utilized by the user that has been associated with the entry'
WHERE attr_id = 6; -- partner_contact_id

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'Human readable string which would be presented to the Agent as the title of the ActionLog entry'
WHERE attr_id = 7; -- title

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'Seen within Roster/Client Manager as the associated Company level UUID. A valid MoxiWorks Company ID. Use Company Endpoint to determine what moxi_works_company_id you can use.'
WHERE attr_id = 8; -- moxi_works_company_id

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'Seen within Roster/Client Manager as the associated Parent Company level UUID. This is the numeric_id or moxi_works_company_id of a company that is considered to be a parent company in the MoxiWorks Platform.'
WHERE attr_id = 9; -- parent_company_id

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'Activity Stream content, this is the human readable plain-text string which will be presented to the Agent as the heading of the ActionLog entry. This can be any short, descriptive sentence which would be practical for the agent to see in the history of events associated with a Contact.'
WHERE attr_id = 10; -- agent_action

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'Location related to activity stream content, the agent_action location component (inperson / other etc) uses this field to denote the street address of the agent_action.'
WHERE attr_id = 11; -- agent_action_address

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'Location related to activity stream content, the agent_action location component (inperson / other etc) uses this field to denote the additonal street address info of the agent_action.'
WHERE attr_id = 12; -- agent_action_address2

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'Location related to activity stream content, the agent_action location component (inperson / other etc) uses this field to denote the city or locale of the agent_action.'
WHERE attr_id = 13; -- agent_action_city

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'Location related to activity stream content, the agent_action location component (inperson / other etc) uses this field to denote the state or province of the agent_action..'
WHERE attr_id = 14; -- agent_action_state

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'Location related to activity stream content, the agent_action location component (inperson / other etc) uses this field to denote the postal code of the agent_action.'
WHERE attr_id = 15; -- agent_action_zip

UPDATE associated_attrs
SET product_id = 11,
	ui_info = 'API and database related information, this is the Unix timestamp for the creation time of the ActionLog entry.'
WHERE attr_id = 16; -- timestamp

UPDATE associated_attrs
SET product_id = 11,
	ui_info = 'API and database related information, this is the MoxiWorks Platform ID of the ActionLog entry to be deleted. This will be an RFC 4122 compliant UUID.'
WHERE attr_id = 17; -- moxi_works_action_log_id

UPDATE associated_attrs
SET product_id = 11,
	ui_info = 'API related information referencing the call submitted, which will indicate what the status of the request is.'
WHERE attr_id = 18; -- status

UPDATE associated_attrs
SET product_id = 11,
	ui_info = 'API related information referencing the call submitted, which will indicate whether the delete request was successful or not.'
WHERE attr_id = 19; -- deleted

UPDATE associated_attrs
SET product_id = 11,
	ui_info = 'API related information referencing the call submitted, an object (array of strings). Any messages associated with the delete request status will be contained in this array.'
WHERE attr_id = 20; -- messages

UPDATE associated_attrs
SET product_id = 11,
	ui_info = 'API related information referencing the call submitted, only records created later than this Unix timestamp will be included in the query. The upper bound of the time slice will be the 90 days higher than date_min value or the value of the the date_max; whichever is lower. If no timestamps are provided, records from the last 90 days will be retrieved.'
WHERE attr_id = 21; -- date_min

UPDATE associated_attrs
SET product_id = 11,
	ui_info = 'API related information referencing the call submitted, only records created before this Unix timestamp will be included in the query. The upper bound of the time slice will be the 90 days higher than date_min value or the value of the the date_max; whichever is lower. If no timestamps are provided, records from the last 90 days will be retrieved.'
WHERE attr_id = 22; -- date_max

UPDATE associated_attrs
SET product_id = 11,
	ui_info = 'The actions array contains Dictionary objects representing endpoint entries. These include moxi_works_action_log_id - the unique identifier for the MoxiWorks Platform ActionLog entry. type - a string from an enumerated set representing the type of ActionLog entry it is, formatted in lowercase with an underscore between each word. Individual ActionLog types are outside the scope of this document. timestamp - the Unix timestamp for the creation time of the ActionLog entry. And finally log_data - The actual payload data of the ActionLog entry, structure depending on type selected.'
WHERE attr_id = 23; -- actions

UPDATE associated_attrs
SET product_id = 11,
	ui_info = 'To include access level information for the agent in the response, pass true.'
WHERE attr_id = 24; -- include_access_level

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'Related to the agent’s GCI goal set within Engage, Pass true to include the agent’s GCI goals and commissions data in the response.'
WHERE attr_id = 25; -- include_gci_goals

UPDATE associated_attrs
SET product_id = 11,
	ui_info = 'To include affiliate data associated with the agent in the response, pass true. Likely not used at all?'
WHERE attr_id = 26; -- include_partners

UPDATE associated_attrs
SET product_id = 11,
	ui_info = 'These will populate into Roster, and include reviews from Zillow and Testimonial Tree. To include these ratings and reviews associated with the agent in the response, pass true.'
WHERE attr_id = 27; -- include_reviews

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'This is an external ID for the Agent in question. This ID will be utilized by the agent’s company or brokerage externally.'
WHERE attr_id = 28; -- client_agent_id

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'Found within Roster under the Manage MLS Associations section of an agent account, This is the MLS ID of the Agent as utilized and provided by the MLS.'
WHERE attr_id = 29; -- mls_agent_id

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'This is the number of the license granted to the agent.'
WHERE attr_id = 30; -- license

UPDATE associated_attrs
SET ui_info = 'As seen within listings under the MLS field as an example?, this is the name of the primary MLS for the agent.'
WHERE attr_id = 31; -- mls_name

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'This is the standard abbreviation of the primary MLS utilized by the agent.'
WHERE attr_id = 32; -- mls_abbreviation

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'This is the UUID (agent_uuid) of the user in question. This will be an integer. Displays within Roster under personal info > UUID.'
WHERE attr_id = 33; -- agent_id

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'Within Roster associated with the Public Key field, this is the MoxiWorks Platform ID of the Office for this Agent. This will be an RFC 4122 compliant UUID.'
WHERE attr_id = 34; -- moxi_works_office_id

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'Within Roster associated with the ID field, this is the ID of the Office for this Agent. This will be an integer.'
WHERE attr_id = 35; -- office_id

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'Within Roster associated with the Internal Office ID field, this is the ID of the Office for this Agent as utilized by their company.'
WHERE attr_id = 36; -- client_office_id

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'Within Roster associated with the Company UUID field, this is the ID of the Company for this Agent. This will be an integer.'
WHERE attr_id = 37; -- company_id

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'Within Roster associated with the Company ID field, this is the ID of the Company utilized by the brokerage.'
WHERE attr_id = 38; -- client_company_id

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'The street address of the agent’s office. This can be null if there is no data for this attribute. Displays within Roster under the office address section.'
WHERE attr_id = 39; -- office_address_street

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'The suite or office number of the agent’s office. This can be null if there is no data for this attribute. Displays within Roster under the office address section.'
WHERE attr_id = 40; -- office_address_street2

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'The city the agent’s office is in. This can be null if there is no data for this attribute. Displays within Roster under the office address section.'
WHERE attr_id = 41; -- office_address_city

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'The state or provice the agent’s office is in. This can be null if there is no data for this attribute. Displays within Roster under the office address section.'
WHERE attr_id = 42; -- office_address_state

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'The postal code the agent’s office is in. This can be null if there is no data for this attribute. Displays within Roster under the office address section.'
WHERE attr_id = 43; -- office_address_zip

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'The street address of the agent’s office’s mailing address. This can be null if there is no data for this attribute. Displays within Roster under the office address section.'
WHERE attr_id = 44; -- office_mailing_address_street

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'The suite or office number of the agent’s office’s mailing address. This can be null if there is no data for this attribute. Displays within Roster under the office address section.'
WHERE attr_id = 45; -- office_mailing_address_street2

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'The city the agent’s office’s mailing address is in. This can be null if there is no data for this attribute. Displays within Roster under the office address section.'
WHERE attr_id = 46; -- office_mailing_address_city

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'The state or provice the agent’s office’s mailing address is in. This can be null if there is no data for this attribute. Displays within Roster under the office address section.'
WHERE attr_id = 47; -- office_mailing_address_state

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'The postal code the agent’s office’s mailing address is in. This can be null if there is no data for this attribute. Displays within Roster under the office address section.'
WHERE attr_id = 48; -- office_mailing_address_zip

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'The full name of the agent. This can be null if there is no data for this attribute.'
WHERE attr_id = 49; -- name

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'The first name of the agent. This can be null if there is no data for this attribute. Displays within Roster under the personal info > first name field.'
WHERE attr_id = 50; -- first_name

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'The last name of the agent. This can be null if there is no data for this attribute. Displays within Roster under the personal info > last name field.'
WHERE attr_id = 51; -- last_name

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'The nickname of the agent. This can be null if there is no data for this attribute.'
WHERE attr_id =52; -- nickname

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'This is the agent’s main phone number. This number should be considered the number the agent would like to be contacted by. This can be null if there is no data for this attribute. Displays within Roster under the contact info > direct phone.'
WHERE attr_id = 53; -- main_phone_number

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'Mobile phone number of the agent. main_phone_number should be considered higher priority, if not the same. This can be null if there is no data for this attribute. Displays within Roster under the contact info > mobile phone.'
WHERE attr_id = 54; -- mobile_phone_number

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'Alternate phone number for the agent. This should be considered second in priority to main_phone_number. This can be null if there is no data for this attribute. Displays within Roster under the contact info > alternate phone.'
WHERE attr_id = 55; -- alt_phone_number

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'This is the agent’s fax phone number. This can be null if there is no data for this attribute. Displays within Roster under the contact info > fax.'
WHERE attr_id = 56; -- fax_phone_number

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'This is the agent’s office phone number. This can be null if there is no data for this attribute.'
WHERE attr_id = 57; -- office_phone_number

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'This is the agent’s main email address. This email address should be considered the email address the agent would prefer to be contacted by. This can be null if there is no data for this attribute. Displays within Roster under the contact info > primary email.'
WHERE attr_id = 58; -- primary_email_address

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'This is the agent’s alternate email address. This email address should be considered the email address the agent would want to be contacted by only if the address in primary_email_address is not functional. This can be null if there is no data for this attribute.'
WHERE attr_id = 59; -- secondary_email_address

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'The email_addresses Hash is a Dictionary object holding the email addresses associated with the Agent record.'
WHERE attr_id = 60; -- email_addresses

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'This is the agent’s lead routing email address. This can be null if there is no data for this attribute.'
WHERE attr_id = 61; -- lead_routing_email_address

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'This is the bio of the agent. Array of key/value pairs. Each has a body and header, both strings, which can be null or blank. Displays within Roster under the web info > About Me'
WHERE attr_id =62; -- bio

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'This is a string that contains the agent’s designation(s), if any. This can be null if there is no data for this attribute.'
WHERE attr_id = 63; -- designations

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'This is an RFC 4122 compliant UUID associated with the agent. This UUID can be used as a unique identifier in determining associations between Agent objects and Listing objects. Displays within Roster under personal info > UUID.'
WHERE attr_id = 64; -- uuid

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'Indicates whether the agent has access to MoxiWorks Products. Displays within Roster under Products & Permissions'
WHERE attr_id = 65; -- has_product_access

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'Indicates whether the agent has access to MoxiWorks Engage.'
WHERE attr_id = 66; -- has_engage_access

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'The access level of the agent. If include_access_level was passed as true, this can return one of the possible access levels: company-admin, manager, office-admin, office-owner, region-admin, user. Displays within Roster under Products & Permissions > Permission Levels.'
WHERE attr_id = 67; -- access_level

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'The view level of the agent. This will return one of the possible view levels: COMPANY_ADMIN, OFFICE_ADMIN, USER.'
WHERE attr_id = 68; -- view_level

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'The teams array contains Dictionary objects representing Team entries. These include name - The human readable name identifying the team entry, uuid - the MoxiWorks Platform ID of the Team, and member_category - The role of the agent in the team.} Within the UI, team info can be found under Management Tools > Agent Teams.'
WHERE attr_id = 69; -- teams

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'The base url of the agent’s MoxiWorks agent website. Displays within Roster under Web Info.'
WHERE attr_id = 70; -- website_base_url

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'Agent’s Twitter URL. This can be null if there is no data available for this attribute. Displays within Roster under Web Info > Social Media'
WHERE attr_id = 71; -- twitter

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'DEPRICATED. Displays within Roster under Web Info > Social Media.'
WHERE attr_id =72; -- google_plus

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'Agent’s Facebook page url. This can be null if there is no data for this attribute. Displays within Roster under Web Info > Social Media.'
WHERE attr_id = 73; -- facebook

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'Agent’s website domain. This will be returned without the HTTP(S) prefix. You’ll need to prefix the domain with protocol if using this attribute for an href. This can be null if there is no data for this attribute. Displays within Roster under Web Info'
WHERE attr_id = 74; -- home_page

UPDATE associated_attrs 
SET product_id = 3,
	ui_info = 'This is a valid URL for a larger size image for the agent. If no agent image has been uploaded for this agent a default image url will be provided. Displays within Roster under agent info page.'
WHERE attr_id = 75; -- profile_image_url

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'This is a valid URL for a thumbnail size image for the agent. If no agent image has been uploaded for this agent a default image url will be provided. Displays within Roster under agent info page.'
WHERE attr_id = 76; -- profile_thumb_url

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'The region the agent’s office is in. This can be null if there is no data for this attribute.'
WHERE attr_id = 77; -- region

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'The agent’s stated gross commission income goal. Displays within Engage in various places as the Gross Commission Income (GCI) Goal.'
WHERE attr_id = 78; -- gci_goal

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'Percentage commission rate for the agent when acting as a buyer’s agent. Displays within Roster under listing Manager. Also displays on websites.'
WHERE attr_id = 79; -- buyer_commission_rate

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'Percentage commission rate for the agent when acting as a seller’s agent. Displays within Roster under listing Manager. Also displays on websites.'
WHERE attr_id = 80; -- seller_commission_rate

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'A list of the lead service area zip codes covered by the agent.'
WHERE attr_id = 81; -- service_area_zip_codes

UPDATE associated_attrs
SET product_id = 5,
	ui_info = 'This is an Array that includes the base_url and bio_page_slug of the agent MoxiWorks website.'
WHERE attr_id = 82; -- agent_website

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'The alternate_offices array contains Dictionary objects representing AlternateOffice entries.'
WHERE attr_id = 83; -- alternate_offices

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'The available_mls Array contains Dictionary objects representing MLS entries.'
WHERE attr_id = 84; -- available_mls

UPDATE associated_attrs
SET product_id = 11,
	ui_info = 'Existence of objects in the partners data structure is dependent upon external relationships existing between the agent represented by this Agent and the affiliate. Documented entities in the `partners` data structure may or may not be returned based on agent relationship. Your logic should be engineered to handle cases where the entity you are interested in is returned and where an empty data structure is returned.'
WHERE attr_id = 85; -- partners

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'A list of the company specific program names in which the agent participates or is a member.'
WHERE attr_id = 86; -- company_programs

UPDATE associated_attrs
SET product_id = 11,
	ui_info = 'A list of the source-specific user identifiers.'
WHERE attr_id = 87; -- source_metadata

UPDATE associated_attrs
SET product_id = 11,
	ui_info = 'This is the Unix timestamp representing the date that this Agent was created in the MoxiWorks system.'
WHERE attr_id = 88; -- created_timestamp

UPDATE associated_attrs
SET product_id = 11,
	ui_info = 'This is the Unix timestamp representing the date that this Agent was deactivated in the MoxiWorks system. This will be returned null if the agent is still active.'
WHERE attr_id = 89; -- deactivated_timestamp

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'Indicates the “Profile Visible Online” value in Roster for this Agent. True corresponds to Yes (visible online); false corresponds to No (not visible online).'
WHERE attr_id = 90; -- profile_visible_online

UPDATE associated_attrs
SET product_id = 11,
	ui_info = 'Existence of objects in the user_reviews data structure is dependent upon external sources, i.e. Zillow, Testimonial Tree.'
WHERE attr_id = 91; -- user_reviews

UPDATE associated_attrs
SET	product_id = 11,
	ui_info = 'any Agent objects updated after this Unix timestamp will be returned in the response. If no updated_since parameter is included in the request, only Agent objects updated in the last seven days will be returned.'
WHERE attr_id = 92; -- updated_since

UPDATE associated_attrs
SET product_id = 11,
	ui_info = 'For queries with multi-page responses, use the page_number parameter to return data for specific pages. Data for page 1 is returned if this parameter is not included. Use this parameter if total_pages indicates that there is more than one page of data available.'
WHERE attr_id = 93; -- page_number

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'To find Agent accounts deactivated within the specified timeframe, pass true for this boolean parameter.'
WHERE attr_id = 94; -- deactivated

UPDATE associated_attrs 
SET product_id = 3,
	ui_info = 'any Agent objects deactivated after this Unix timestamp will be returned in the response. If no deactivated_since parameter is included in the request, only Agent objects deactivated in the last seven days will be returned.'
WHERE attr_id = 95; -- deactivated_since

UPDATE associated_attrs
SET product_id = 11,
	ui_info = 'To include company specific programs associated with the agent in the response, pass true.'
WHERE attr_id = 96; -- include_company_programs

UPDATE associated_attrs
SET product_id = 5,
	ui_info = 'To include the base url (website_base_url) of the agent’s MoxiWorks website pass true.'
WHERE attr_id = 97; -- include_website

UPDATE associated_attrs
SET product_id = 11,
	ui_info = 'To include only Agent objects associated with company specific programs pass true.'
WHERE attr_id = 98; -- has_company_programs

UPDATE associated_attrs
SET product_id = 11,
	ui_info = 'If supplied then the results will exclude all data except primary identifiers and a unix timestamp (last_updated) & iso8601 timestamp (modification_timestamp) of the last time this record was updated.'
WHERE attr_id = 99; -- timestamps_only

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'To include bio associated with the agent in the response, pass true.'
WHERE attr_id = 100; -- include_bio

UPDATE associated_attrs
SET product_id = 3,
	ui_info = 'Company Logo'
WHERE attr_id = 101; -- image_logo

UPDATE associated_attrs
SET product_id = 7,
	ui_info = 'Presentation accent color'
WHERE attr_id = 102; -- cma_authoring_color

UPDATE associated_attrs
SET product_id = 7,
	ui_info = 'background color'
WHERE attr_id = 103; -- background_color

UPDATE associated_attrs
SET product_id = 7,
	ui_info = 'font color intended to overlay background_color'
WHERE attr_id = 104; -- background_font_color_primary

UPDATE associated_attrs 
SET product_id = 7,
	ui_info = 'background color of buttons'
WHERE attr_id = 105; -- button_background_color

UPDATE associated_attrs
SET product_id = 7,
	ui_info = 'font color intended to overlay button_background_color'
WHERE attr_id = 106; -- button_font_color

UPDATE associated_attrs
SET product_id = 7,
	ui_info = 'copyright notice – this may contain embedded HTML'
WHERE attr_id = 107; -- copyright

UPDATE associated_attrs
SET product_id = 7,
	ui_info = 'name of company as displayed to consumer'
WHERE attr_id = 108; -- display_name

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'background color of email elements outside body'
WHERE attr_id = 109; -- email_element_background_color

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'font color intended to overlay email_background_font_color'
WHERE attr_id = 110; -- email_background_font_color

UPDATE associated_attrs
SET product_id = 7,
	ui_info = 'company logo shown in pdf version of presentations'
WHERE attr_id = 111; -- image_cma_pdf_logo_header

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'company logo as shown in email header'
WHERE attr_id = 112; -- image_email_logo_alt

UPDATE associated_attrs
SET product_id = 5,
	ui_info = 'favicon of company'
WHERE attr_id = 113; -- image_favicon

UPDATE associated_attrs
SET product_id = 7,
	ui_info = 'company logo shown in the online version of presentations'
WHERE attr_id = 114; -- image_pres_cover_logo

UPDATE associated_attrs
SET product_id = 7,
	ui_info = 'block element background color shown in online version of presentations'
WHERE attr_id = 115; -- pres_block_background_color

UPDATE associated_attrs
SET product_id = 7,
	ui_info = 'font color intended to overlay pres_block_background_color'
WHERE attr_id = 116; -- pres_block_text_color

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'A brief, human readable title that will be shown to the agent as the subject of the BuyerTransaction that you are creating.'
WHERE attr_id = 117; -- transaction_name

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'Brief, human readable content that will be shown to the agent as notes about the BuyerTransaction that you are creating.'
WHERE attr_id = 118; -- notes

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'The street address of the property being purchased. This should be populated if this BuyerTransaction - is_mls_transaction attribute is false.'
WHERE attr_id = 119; -- address

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'The city or township of the property being purchased. This should be populated if this BuyerTransaction - is_mls_transaction attribute is false.'
WHERE attr_id = 120; -- city

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'The state or province of the property being purchased. This should be populated if this BuyerTransaction - is_mls_transaction attribute is false.'
WHERE attr_id = 121; -- state

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'The postal code of the property being purchased. This should be populated if this BuyerTransaction - is_mls_transaction attribute is false.'
WHERE attr_id = 122; -- zip_code

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'The minimum desired living area for prospective properties.'
WHERE attr_id = 123; -- min_sqft

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'The maximum desired living area for prospective properties.'
WHERE attr_id = 124; -- max_sqft

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'The minimum number of bedrooms for prospective properties.'
WHERE attr_id = 125; -- min_beds

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'The maximum number of bedrooms for prospective properties.'
WHERE attr_id = 126; -- max_beds

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'The minimum number of bathrooms for prospective properties.'
WHERE attr_id = 127; -- min_baths

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'The maximum number of bathrooms for prospective properties.'
WHERE attr_id = 128; -- max_baths

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'The name of a locality representing an area of interest for prospective properties.'
WHERE attr_id = 129; -- area_of_interest

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'Whether the property being purchased is being listed on an MLS. This should be false for paperwork-only, for sale by owner, off-market, or pocket listing type transactions or any transactions that will not be tracked through an MLS.'
WHERE attr_id = 130; -- is_mls_transaction

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'The MLS number of the the property being purchased. mls_number should be populated only if is_mls_transaction is true.'
WHERE attr_id = 131; -- mls_number

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'This is the Unix timestamp representing the date that the agent initiated transaction discussions with the client.'
WHERE attr_id = 132; -- start_timestamp

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'Commission for the transaction. If the commission for the transaction is based on a percentage of the purchase amount, use this attribute. Use either this or commission_flat_fee depending on how the transaction is structured, both attributes cannot be populated. If no commission (either commission_percentage or commission_flat_fee) is supplied during creation, commission_percentage is set to the default commission_percentage for the associated Agent.'
WHERE attr_id = 133; -- commission_percentage

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'Commission for the transaction. If the commission for the transaction is based on a flat dollar amount, use this attribute. Use either this or commission_percentage, both cannot be populated.'
WHERE attr_id = 134; -- commission_flat_fee

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'If the payment for the transaction is based on percentage of sales volume, use this attribute. Use either this or sales_volume_flat_fee depending on how the transaction is structured, both attributes cannot be populated.'
WHERE attr_id = 135; -- sales_volume_percentage

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'If payment for the transaction is based on a flat fee derived from sales volume, use this attribute. Use either this or sales_volume_percentage depending on how the transaction is structured, both attributes cannot be populated.'
WHERE attr_id = 136; -- sales_volume_flat_fee

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'The desired purchase price for a property if using target rather than range.'
WHERE attr_id = 137; -- target_price

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'The minimum price range for a property if using a price range rather than target price.'
WHERE attr_id = 138; -- min_price

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'The maximum price range for a property if using a price range rather than target price.'
WHERE attr_id = 139; -- max_price

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'The stage that the BuyerTransaction should be placed into (see section header).'
WHERE attr_id = 140; -- stage

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'This is the MoxiWorks Platform ID of the BuyerTransaction which you have created. This will be an RFC 4122 compliant UUID. This ID should be recorded on response as it is the key ID for updating the BuyerTransaction.'
WHERE attr_id = 141; -- moxi_works_transaction_id

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'This attribute displays a human readable stage name that is associated with the current stage attribute. When created through the MoxiWorks Platform BuyerTransaction objects will automatically be configured as active transactions. For more information about BuyerTransaction stages, see BuyerTransaction Stages.'
WHERE attr_id = 142; -- stage_name

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'This is the closing price for the transaction . This should be null if the BuyerTransaction is not yet in complete state.'
WHERE attr_id = 143; -- closing_price

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'A Unix timestamp representing the point in time when the transaction for this BuyerTransaction object was completed. This should be null if the BuyerTransaction is not yet in complete state.'
WHERE attr_id = 144; -- closing_timestamp

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'A Unix timestamp representing the point in time when the transaction for this BuyerTransaction object entered into its current state.'
WHERE attr_id = 145; -- state_changed_at

UPDATE associated_attrs
SET product_id = 4,
	ui_info = 'If this is set to true then The MoxiWorks Platform will promote this transaction to the next stage.'
WHERE attr_id = 146; -- promote_transaction