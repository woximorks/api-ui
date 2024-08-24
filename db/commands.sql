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
WHERE attr_id in (28, 29, 30, 31, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 48, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 69, 70, 71, 73, 74, 76, 77, 79, 80, 81, 88, 89, 90);

-- Update to API product
UPDATE associated_attrs
SET product_id = 11
WHERE attr_id in (26, 27, 85, 91);

-- Update to Websites product
UPDATE associated_attrs
SET product_id = 5
WHERE attr_id = 82;

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