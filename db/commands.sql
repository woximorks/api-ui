-- ************************************ ActionLog

-- Update to Engage product
UPDATE associated_attrs
SET product_id = 4
WHERE attr_id in (4, 7, 10, 11, 12, 13, 14, 15);

-- Update to Roster product (change attr_id) -
UPDATE associated_attrs
SET product_id = 3
WHERE attr_id in (1, 2, 8, 9);

-- Update to API product
UPDATE associated_attrs
SET product_id = 11
WHERE attr_id in (2, 3, 5, 6, 16, 17, 18, 19, 20, 21, 22, 23);

-- ************************************ Agent

-- Update to Engage product
UPDATE associated_attrs
SET product_id = 4
WHERE attr_id in (25, 78);

-- Update to Roster product -
UPDATE associated_attrs
SET product_id = 3
WHERE attr_id in (28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 79, 80, 81, 83, 84, 86, 88, 89, 90, 100);

-- Update to API product
UPDATE associated_attrs
SET product_id = 11
WHERE attr_id in (24, 26, 27, 85, 87, 91, 92, 93, 94, 95, 96, 98, 99);

-- Update to Websites product
UPDATE associated_attrs
SET product_id = 5
WHERE attr_id in (82, 97);

-- ************************************ Brand
-- Update to Engage product
UPDATE associated_attrs
SET product_id = 4
WHERE attr_id in (109, 110, 112);

-- Update to Roster product (change attr_id) -
UPDATE associated_attrs
SET product_id = 3
WHERE attr_id in (101, 113);

-- Update to Present product -

UPDATE associated_attrs
SET product_id = 7
WHERE attr_id in (102, 103, 104, 105, 106, 107, 108, 111, 114, 115, 116);

-- ************************************ Adding UI Information

UPDATE associated_attrs
SET ui_info = 'Agent UUID, found on profile page, seen as an RFC 4122 compliant UUID'
WHERE attr_id = 1;

UPDATE associated_attrs
SET ui_info = 'Intended for use cases where integration is managed by end-user interaction'
WHERE attr_id = 2;

UPDATE associated_attrs
SET ui_info = 'DEPRECATED'
WHERE attr_id = 3;

UPDATE associated_attrs
SET ui_info = 'Human readable string which would be presented to the Agent as the content of the ActionLog entry'
WHERE attr_id = 4;

UPDATE associated_attrs
SET ui_info = 'Platform ID the action is associated with'
WHERE attr_id = 5;

UPDATE associated_attrs
SET ui_info = 'The unique identifer in the system utilized by the user, that has been associated with the entry'
WHERE attr_id = 6;

UPDATE associated_attrs
SET ui_info = 'Human readable string which would be presented to the Agent as the title of the ActionLog entry'
WHERE attr_id = 7;

UPDATE associated_attrs
SET ui_info = 'A valid MoxiWorks Company ID. Use Company Endpoint to determine what moxi_works_company_id you can use.'
WHERE attr_id = 8;

UPDATE associated_attrs
SET ui_info = 'This is the numeric_id or moxi_works_company_id of a company that is considered to be a parent company in the MoxiWorks Platform.'
WHERE attr_id = 9;

UPDATE associated_attrs
SET ui_info = 'This is the human readable plain-text string which will be presented to the Agent as the heading of the ActionLog entry. This can be any short, descriptive sentence which would be practical for the agent to see in the history of events associated with a Contact.'
WHERE attr_id = 10;

UPDATE associated_attrs
SET ui_info = 'agent_action location component (inperson / other etc) uses this field to denote the street address of the agent_action.'
WHERE attr_id = 11;

UPDATE associated_attrs
SET ui_info = 'agent_action location component (inperson / other etc) uses this field to denote the additonal street address info of the agent_action.'
WHERE attr_id = 12;

UPDATE associated_attrs
SET ui_info = 'agent_action location component (inperson / other etc) uses this field to denote the city or locale of the agent_action.'
WHERE attr_id = 13;

UPDATE associated_attrs
SET ui_info = 'agent_action location component (inperson / other etc) uses this field to denote the state or province of the agent_action..'
WHERE attr_id = 14;

UPDATE associated_attrs
SET ui_info = 'agent_action location component (inperson / other etc) uses this field to denote the postal code of the agent_action.'
WHERE attr_id = 15;

UPDATE associated_attrs
SET ui_info = 'This is the Unix timestamp for the creation time of the ActionLog entry.'
WHERE attr_id = 16;

UPDATE associated_attrs
SET ui_info = 'This is the MoxiWorks Platform ID of the ActionLog entry to be deleted. This will be an RFC 4122 compliant UUID.'
WHERE attr_id = 17;

UPDATE associated_attrs
SET ui_info = 'This will indicate what the status of the request is.'
WHERE attr_id = 18;

UPDATE associated_attrs
SET ui_info = 'This will indicate whether the delete request was successful or not.'
WHERE attr_id = 19;

UPDATE associated_attrs
SET ui_info = 'This is an arrray of strings. Any messages associated with the delete request status will be contained in this array.'
WHERE attr_id = 20;

UPDATE associated_attrs
SET ui_info = 'Only records created later than this Unix timestamp will be included in the query. The upper bound of the time slice will be the 90 days higher than date_min value or the value of the the date_max; whichever is lower. If no timestamps are provided, records from the last 90 days will be retrieved.'
WHERE attr_id = 21;

UPDATE associated_attrs
SET ui_info = 'Only records created before this Unix timestamp will be included in the query. The upper bound of the time slice will be the 90 days higher than date_min value or the value of the the date_max; whichever is lower. If no timestamps are provided, records from the last 90 days will be retrieved.'
WHERE attr_id = 22;

UPDATE associated_attrs
SET ui_info = 'The actions array contains Dictionary objects representing endpoint entries.'
WHERE attr_id = 23;

UPDATE associated_attrs
SET ui_info = 'To include access level information for the agent in the response'
WHERE attr_id = 24;

UPDATE associated_attrs
SET ui_info = 'Whether to include agent’s GCI goals and commissions data in the response data.'
WHERE attr_id = 25;

UPDATE associated_attrs
SET ui_info = 'To include affiliate data associated with the agent in the response, pass true.'
WHERE attr_id = 26;

UPDATE associated_attrs
SET ui_info = 'To include ratings and reviews associated with the agent in the response, pass true.'
WHERE attr_id = 27;

UPDATE associated_attrs
SET ui_info = 'This is the ID of the Agent utilized by their company.'
WHERE attr_id = 28;

UPDATE associated_attrs
SET ui_info = 'This is the ID of the Agent utilized by their primary MLS.'
WHERE attr_id = 29;

UPDATE associated_attrs
SET ui_info = 'This is the number of the license granted to the agent.'
WHERE attr_id = 30;

UPDATE associated_attrs
SET ui_info = 'This is the name of the primary MLS for the agent.'
WHERE attr_id = 31;

UPDATE associated_attrs
SET ui_info = 'This is the standard abbreviation of the primary MLS utilized by the agent.'
WHERE attr_id = 32;

UPDATE associated_attrs
SET ui_info = 'This is the ID of this Agent. This will be an integer.'
WHERE attr_id = 33;

UPDATE associated_attrs
SET ui_info = 'This is the MoxiWorks Platform ID of the office for this Agent. This will be an RFC 4122 compliant UUID.'
WHERE attr_id = 34;

UPDATE associated_attrs
SET ui_info = 'This is the ID of the office for this Agent. This will be an integer.'
WHERE attr_id = 35;

UPDATE associated_attrs
SET ui_info = 'This is the ID of the office for this Agent utilized by their company.'
WHERE attr_id = 36;

UPDATE associated_attrs
SET ui_info = 'This is the ID of the company for this Agent. This will be an integer.'
WHERE attr_id = 37;

UPDATE associated_attrs
SET ui_info = 'This is the ID of the Company utilized by their company.'
WHERE attr_id = 38;

UPDATE associated_attrs
SET ui_info = 'The street address of the agent’s office. This can be null if there is no data for this attribute.'
WHERE attr_id = 39;

UPDATE associated_attrs
SET ui_info = 'The suite or office number of the agent’s office. This can be null if there is no data for this attribute.'
WHERE attr_id = 40;

UPDATE associated_attrs
SET ui_info = 'The city the agent’s office is in. This can be null if there is no data for this attribute.'
WHERE attr_id = 41;

UPDATE associated_attrs
SET ui_info = 'The state or provice the agent’s office is in. This can be null if there is no data for this attribute.'
WHERE attr_id = 42;

UPDATE associated_attrs
SET ui_info = 'The postal code the agent’s office is in. This can be null if there is no data for this attribute.'
WHERE attr_id = 43;

UPDATE associated_attrs
SET ui_info = 'The street address of the agent’s office’s mailing address. This can be null if there is no data for this attribute.'
WHERE attr_id = 44;

UPDATE associated_attrs
SET ui_info = 'The suite or office number of the agent’s office’s mailing address. This can be null if there is no data for this attribute.'
WHERE attr_id = 45;

UPDATE associated_attrs
SET ui_info = 'The city the agent’s office’s mailing address is in. This can be null if there is no data for this attribute.'
WHERE attr_id = 46;

UPDATE associated_attrs
SET ui_info = 'The state or provice the agent’s office’s mailing address is in. This can be null if there is no data for this attribute.'
WHERE attr_id = 47;

UPDATE associated_attrs
SET ui_info = 'The postal code the agent’s office’s mailing address is in. This can be null if there is no data for this attribute.'
WHERE attr_id = 48;

UPDATE associated_attrs
SET ui_info = 'The full name of the agent. This can be null if there is no data for this attribute.'
WHERE attr_id = 49;

UPDATE associated_attrs
SET ui_info = 'The first name of the agent. This can be null if there is no data for this attribute.'
WHERE attr_id = 50;

UPDATE associated_attrs
SET ui_info = 'The last name of the agent. This can be null if there is no data for this attribute.'
WHERE attr_id = 51;

UPDATE associated_attrs
SET ui_info = 'The nickname of the agent. This can be null if there is no data for this attribute.'
WHERE attr_id =52;

UPDATE associated_attrs
SET ui_info = 'This is the agent’s main phone number. This number should be considered the number the agent would like to be contacted by. This can be null if there is no data for this attribute.'
WHERE attr_id = 53;

UPDATE associated_attrs
SET ui_info = 'Mobile phone number of the agent. main_phone_number should be considered higher priority, if not the same. This can be null if there is no data for this attribute.'
WHERE attr_id = 54;

UPDATE associated_attrs
SET ui_info = 'Alternate phone number for the agent. This should be considered second in priority to main_phone_number. This can be null if there is no data for this attribute.'
WHERE attr_id = 55;

UPDATE associated_attrs
SET ui_info = 'This is the agent’s fax phone number. This can be null if there is no data for this attribute.'
WHERE attr_id = 56;

UPDATE associated_attrs
SET ui_info = 'This is the agent’s office phone number. This can be null if there is no data for this attribute.'
WHERE attr_id = 57;

UPDATE associated_attrs
SET ui_info = 'This is the agent’s main email address. This email address should be considered the email address the agent would prefer to be contacted by. This can be null if there is no data for this attribute.'
WHERE attr_id = 58;

UPDATE associated_attrs
SET ui_info = 'This is the agent’s alternate email address. This email address should be considered the email address the agent would want to be contacted by only if the address in primary_email_address is not functional. This can be null if there is no data for this attribute.'
WHERE attr_id = 59;

UPDATE associated_attrs
SET ui_info = 'The email_addresses Hash is a Dictionary object holding the email addresses associated with the Agent record.'
WHERE attr_id = 60;

UPDATE associated_attrs
SET ui_info = 'This is the agent’s lead routing email address. This can be null if there is no data for this attribute.'
WHERE attr_id = 61;

UPDATE associated_attrs
SET ui_info = 'This is the bio of the agent. Array of key/value pairs. Each has a body and header, both strings, which can be null or blank.'
WHERE attr_id =62;

UPDATE associated_attrs
SET ui_info = 'This is a string that contains the agent’s designation(s), if any. This can be null if there is no data for this attribute.'
WHERE attr_id = 63;

UPDATE associated_attrs
SET ui_info = 'This is an RFC 4122 compliant UUID associated with the agent. This UUID can be used as a unique identifier in determining associations between Agent objects and Listing objects.'
WHERE attr_id = 64;

UPDATE
    associated_attrs
SET
    ui_info = 'Indicates whether the agent has access to MoxiWorks Products.'
WHERE
    attr_id = 65;

UPDATE associated_attrs
SET ui_info = 'Indicates whether the agent has access to MoxiWorks Engage.'
WHERE attr_id = 66;

UPDATE associated_attrs
SET ui_info = 'The access level of the agent. If include_access_level was passed as true, this can return one of the possible access levels: company-admin, manager, office-admin, office-owner, region-admin, user.'
WHERE attr_id = 67;

UPDATE associated_attrs
SET ui_info = 'The view level of the agent. This will return one of the possible view levels: COMPANY_ADMIN, OFFICE_ADMIN, USER.'
WHERE attr_id = 68;

UPDATE associated_attrs
SET ui_info = 'The teams array contains Dictionary objects representing Team entries.'
WHERE attr_id = 69;

UPDATE associated_attrs
SET ui_info = 'The base url of the agent’s MoxiWorks agent website.'
WHERE attr_id = 70;

UPDATE associated_attrs
SET ui_info = 'Agent’s Twitter URL. This can be null if there is no data available for this attribute.'
WHERE attr_id = 71;

UPDATE associated_attrs
SET ui_info = 'DEPRICATED'
WHERE attr_id =72;

UPDATE associated_attrs
SET ui_info = 'Agent’s Facebook page url. This can be null if there is no data for this attribute.'
WHERE attr_id = 73;

UPDATE associated_attrs
SET ui_info = 'Agent’s website domain. This will be returned without the HTTP(S) prefix. You’ll need to prefix the domain with protocol if using this attribute for an href. This can be null if there is no data for this attribute.'
WHERE attr_id = 74;

UPDATE associated_attrs 
SET ui_info = 'This is a valid URL for a larger size image for the agent. If no agent image has been uploaded for this agent a default image url will be provided.'
WHERE attr_id = 75;

UPDATE associated_attrs
SET ui_info = 'This is a valid URL for a thumbnail size image for the agent. If no agent image has been uploaded for this agent a default image url will be provided.'
WHERE attr_id = 76;

UPDATE associated_attrs
SET ui_info = 'The region the agent’s office is in. This can be null if there is no data for this attribute.'
WHERE attr_id = 77;

UPDATE associated_attrs
SET ui_info = 'The agent’s stated gross commission income goal.'
WHERE attr_id = 78;

UPDATE associated_attrs
SET ui_info = 'Percentage commission rate for the agent when acting as a buyer’s agent.'
WHERE attr_id = 79;

UPDATE associated_attrs
SET ui_info = 'Percentage commission rate for the agent when acting as a seller’s agent.'
WHERE attr_id = 80;

UPDATE associated_attrs
SET ui_info = 'A list of the lead service area zip codes covered by the agent.'
WHERE attr_id = 81;

UPDATE associated_attrs
SET ui_info = 'This includes the base_url and bio_page_slug of the agent MoxiWorks website.'
WHERE attr_id = 82;

UPDATE associated_attrs
SET ui_info = 'The alternate_offices array contains Dictionary objects representing AlternateOffice entries.'
WHERE attr_id = 83;

UPDATE associated_attrs
SET ui_info = 'The available_mls Array contains Dictionary objects representing MLS entries.'
WHERE attr_id = 84;

UPDATE associated_attrs
SET ui_info = 'Existence of objects in the partners data structure is dependent upon external relationships existing between the agent represented by this Agent and the affiliate. Documented entities in the `partners` data structure may or may not be returned based on agent relationship. Your logic should be engineered to handle cases where the entity you are interested in is returned and where an empty data structure is returned.'
WHERE attr_id = 85;

UPDATE associated_attrs
SET ui_info = 'A list of the company specific program names in which the agent participates or is a member.'
WHERE attr_id = 86;

UPDATE associated_attrs
SET ui_info = 'A list of the source-specific user identifiers.'
WHERE attr_id = 87;

UPDATE associated_attrs
SET ui_info = 'This is the Unix timestamp representing the date that this Agent was created in the MoxiWorks system.'
WHERE attr_id = 88;

UPDATE associated_attrs
SET ui_info = 'This is the Unix timestamp representing the date that this Agent was deactivated in the MoxiWorks system. This will be returned null if the agent is still active.'
WHERE attr_id = 89;

UPDATE associated_attrs
SET ui_info = 'Indicates the “Profile Visible Online” value in Roster for this Agent. True corresponds to Yes (visible online); false corresponds to No (not visible online).'
WHERE attr_id = 90;

UPDATE associated_attrs
SET ui_info = 'Existence of objects in the user_reviews data structure is dependent upon external sources, i.e. Zillow, Testimonial Tree.'
WHERE attr_id = 91;

UPDATE associated_attrs
SET ui_info = 'any Agent objects updated after this Unix timestamp will be returned in the response. If no updated_since parameter is included in the request, only Agent objects updated in the last seven days will be returned.'
WHERE attr_id = 92;

UPDATE associated_attrs
SET ui_info = 'For queries with multi-page responses, use the page_number parameter to return data for specific pages. Data for page 1 is returned if this parameter is not included. Use this parameter if total_pages indicates that there is more than one page of data available.'
WHERE attr_id = 93;

UPDATE associated_attrs
SET ui_info = 'To find Agent accounts deactivated within the specified timeframe, pass true for this boolean parameter.'
WHERE attr_id = 94;

UPDATE associated_attrs 
SET ui_info = 'any Agent objects deactivated after this Unix timestamp will be returned in the response. If no deactivated_since parameter is included in the request, only Agent objects deactivated in the last seven days will be returned.'
WHERE attr_id = 95;

UPDATE associated_attrs
SET ui_info = 'To include company specific programs associated with the agent in the response, pass true.'
WHERE attr_id = 96;

UPDATE associated_attrs
SET ui_info = 'To include the base url (website_base_url) of the agent’s MoxiWorks website pass true.'
WHERE attr_id = 97;

UPDATE associated_attrs
SET ui_info = 'To include only Agent objects associated with company specific programs pass true.'
WHERE attr_id = 98;

UPDATE associated_attrs
SET ui_info = 'If supplied then the results will exclude all data except primary identifiers and a unix timestamp (last_updated) & iso8601 timestamp (modification_timestamp) of the last time this record was updated.'
WHERE attr_id = 99;

UPDATE associated_attrs
SET ui_info = 'To include bio associated with the agent in the response, pass true.'
WHERE attr_id = 100;

UPDATE associated_attrs
SET ui_info = 'Company Logo'
WHERE attr_id = 101;

UPDATE associated_attrs
SET ui_info = 'Presentation accent color'
WHERE attr_id = 102;

UPDATE associated_attrs
SET ui_info = 'background color'
WHERE attr_id = 103;

UPDATE associated_attrs
SET ui_info = 'font color intended to overlay background_color'
WHERE attr_id = 104;

UPDATE associated_attrs 
SET ui_info = 'background color of buttons'
WHERE attr_id = 105;

UPDATE associated_attrs
SET ui_info = 'font color intended to overlay button_background_color'
WHERE attr_id = 106;

UPDATE associated_attrs
SET ui_info = 'copyright notice – this may contain embedded HTML'
WHERE attr_id = 107;

UPDATE associated_attrs
SET ui_info = 'name of company as displayed to consumer'
WHERE attr_id = 108;

UPDATE associated_attrs
SET ui_info = 'background color of email elements outside body'
WHERE attr_id = 109;

UPDATE associated_attrs
SET ui_info = 'font color intended to overlay email_background_font_color'
WHERE attr_id = 110;

UPDATE associated_attrs
SET ui_info = 'company logo shown in pdf version of presentations'
WHERE attr_id = 111;

UPDATE associated_attrs
SET ui_info = 'company logo as shown in email header'
WHERE attr_id = 112;

UPDATE associated_attrs
SET ui_info = 'favicon of company'
WHERE attr_id = 113;

UPDATE associated_attrs
SET ui_info = 'company logo shown in the online version of presentations'
WHERE attr_id = 114;

UPDATE associated_attrs
SET ui_info = 'block element background color shown in online version of presentations'
WHERE attr_id = 115;

UPDATE associated_attrs
SET ui_info = 'font color intended to overlay pres_block_background_color'
WHERE attr_id = 116;