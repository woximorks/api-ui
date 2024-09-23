UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
        jsonb_set(
            ui_info, 
            '{APIText}', -- This displays whenever the 'API' association is called within the agent_uuid instance of associated_attr
            '"This will be an RFC 4122 compliant UUID. If data is being pulled from The MoxiWorks Platform and integrating with your own system in a managed or automated fashion, then using agent_uuid request attribute is preferable. It is guaranteed to be unique and to never change for the lifetime of the account."'
        ), 
        '{RosterText}', -- This displays whenver the 'Roster' association is called within the agent_uuid instance of associated_attr
        '"Agent UUID, found on profile page within Roster/Client Manager and is the user account level UUID."'
        ), 
        '{Products}', -- These are all of the products 'agent_uuid' will be associated with
        '["API", "Roster"]'
    ),
    '{ActionLog}', -- agent_uuid > ui_info that is associated with the ActionLog endpoint
    '["API", "Roster"]'
    ),
  associated_endpoint = jsonb_set(
    associated_endpoint,
    '{Endpoints}', -- all agent_uuid associated endpoints
    '["ActionLog"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'agent_uuid';


UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
        jsonb_set(
            ui_info, 
            '{APIText}', 
            '"If you have already existing agent data, agent accounts and your own user interface that agents can use to integrate your account with their MoxiWorks Platform account then you should use the moxi_works_agent_id request attribute. It is intended for use cases where integration is managed by end-user interaction."'
        ), 
        '{RosterText}', 
        '"This identifier is guaranteed to be unique, but may be either an alphanumeric string or an email address."'
        ), 
        '{Products}', 
        '["API", "Roster"]'
    ),
    '{ActionLog}', 
    '["API", "Roster"]'
    ),
  associated_endpoint = jsonb_set(
    associated_endpoint,
    '{Endpoints}',
    '["ActionLog"]'
  ),
  
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'moxi_works_agent_id';


UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
        jsonb_set(
            jsonb_set(
              ui_info, 
              '{APIText}', 
              '"If you have access to agent data from the same company source that MoxiWorks uses as an upstream data source then you should use the source_agent_id request attribute. This identifier will be unique only within the scope of a given company or parent_company, and must be used in conjunction with the moxi_works_company_id or parent_company_id request attributes. Please email partners@moxiworks.com for clarification about this request attribute."'
            ), 
          '{Products}', 
          '["API"]'
        ),
        '{ActionLog}', 
        '["API"]'
      ),
  associated_endpoint = jsonb_set(
    associated_endpoint,
    '{Endpoints}',
    '["ActionLog"]'
  ),
  
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'source_agent_id';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
        jsonb_set(
            ui_info, 
            '{APIText}', 
            '"This can be any arbitrary plain-text string which would be practical for the agent to see in the history of events associated with a Contact. It must be greater than 0 and must be less than 5000 characters (including white space)."'
        ), 
        '{ActionLogText}',
        '"This is a human readable string which would be presented to the Agent as the content of the ActionLog entry."'
        ), 
        '{Products}', 
        '["API", "ActionLog", "Engage"]'
    ),
    '{ActionLog}', 
    '["API", "ActionLog"]'
    ),
  associated_endpoint = jsonb_set(
    associated_endpoint,
    '{Endpoints}',
    '["ActionLog"]'
  ),
  
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'body';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
            jsonb_set(
                ui_info, 
                '{ActionLogText}', 
                '"This is the MoxiWorks Platform ID of a Contact an ActionLog object is to be associated with. This data is required and must reference a valid MoxiWorks Contact ID for your ActionLog Create request to be accepted."'
                ),
                '{APIText}',
                '"This will be an RFC 4122 compliant UUID, and is the same as the moxi_works_contact_id attribute of the Contact response."'
            ),
          '{Products}', 
          '["ActionLog", "API", "Engage"]'
        ),
        '{ActionLog}', 
        '["ActionLog", "API"]'
      ),
  associated_endpoint = jsonb_set(
    associated_endpoint,
    '{Endpoints}',
    '["ActionLog"]'
  ),
  
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'moxi_works_contact_id';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
            jsonb_set(
                ui_info, 
                '{ActionLogText}', 
                '"This UUID will have already been associated with the Contact the ActionLog entry is created about. The Contact record on the MoxiWorks Platform can be created as necessary using Contact Create before attempting to use this contact ID to create an ActionLog entry. Failure to do so will result in the request being rejected."'
                ),
                '{APIText}',
                '"This is the unique identifer used in the system that will be connecting to the MoxiWorks platform."'
            ),
          '{Products}', 
          '["ActionLog", "API", "Engage"]'
        ),
        '{ActionLog}', 
        '["ActionLog", "API"]'
      ),
  associated_endpoint = jsonb_set(
    associated_endpoint,
    '{Endpoints}',
    '["ActionLog"]'
  ),
  
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'partner_contact_id';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
            ui_info, 
            '{ActionLogText}', 
            '"This is the human readable plain-text string which will be presented to the Agent as the heading of the ActionLog entry. This can be any short, descriptive sentence which would be practical for the agent to see in the history of events associated with a Contact."'
            ),
        '{Products}', 
        '["ActionLog", "Engage"]'
        ),
        '{ActionLog}', 
        '["ActionLog"]'
    ),
  associated_endpoint = jsonb_set(
    associated_endpoint,
    '{Endpoints}',
    '["ActionLog"]'
  ),
  
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'title';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
        jsonb_set(
            ui_info, 
            '{APIText}',
            '"MoxiWorks Plaform Company entities are your entry-point for determining the established relationships for your organization to companies on the MoxiWorks Platform and for accessing data about those companies. Many requests require a moxi_works_company_id, which can be derived from the Company Index endpoint."'
        ), 
        '{RosterText}',
        '""'
        ), 
        '{Products}',
        '["API", "Roster"]'
    ),
    '{ActionLog}',
    '["API", "Roster"]'
    ),
  associated_endpoint = jsonb_set(
    associated_endpoint,
    '{Endpoints}',
    '["ActionLog"]'
  ),
  
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'moxi_works_company_id';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
        jsonb_set(
            ui_info, 
            '{APIText}',
            '"It provides for a broad scope by which partners may be afforded permissions to perform MoxiWorks Platform actions, in scenarios where a partner does business with a parent company in the MoxiWorks System. It also provides broad scope under which agents may be looked up using the source_agent_id request attribute in many scenarios across different MoxiWorks Platform endpoints and actions."'
        ), 
        '{RosterText}',
        '"This is the numeric_id or moxi_works_company_id of a company that is considered to be a parent company in the MoxiWorks Platform."'
        ), 
        '{Products}',
        '["API", "Roster"]'
    ),
    '{ActionLog}',
    '["API", "Roster"]'
    ),
  associated_endpoint = jsonb_set(
    associated_endpoint,
    '{Endpoints}',
    '["ActionLog"]'
  ),
  
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'parent_company_id';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
            ui_info, 
            '{ActionLogText}', 
            '"This is the human readable plain-text string which will be presented to the Agent as the heading of the ActionLog entry. This can be any short, descriptive sentence which would be practical for the agent to see in the history of events associated with a Contact."'
            ),
        '{Products}', 
        '["ActionLog", "Engage"]'
        ),
        '{ActionLog}', 
        '["ActionLog"]'
    ),
  associated_endpoint = jsonb_set(
    associated_endpoint,
    '{Endpoints}',
    '["ActionLog"]'
  ),
  
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'agent_action';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
            ui_info, 
            '{ActionLogText}', 
            '"If creating an agent_action that has a location component (‘inperson’ ‘other’) use this field to denote the street address of the agent_action."'
            ),
        '{Products}', 
        '["ActionLog", "Engage"]'
        ),
        '{ActionLog}', 
        '["ActionLog"]'
    ),
  associated_endpoint = jsonb_set(
    associated_endpoint,
    '{Endpoints}',
    '["ActionLog"]'
  ),
  
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'agent_action_address';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
            ui_info, 
            '{ActionLogText}', 
            '"If creating an agent_action that has a location component (‘inperson’ ‘other’) use this field to denote the additonal street address info of the agent_action."'
            ),
        '{Products}', 
        '["ActionLog", "Engage"]'
        ),
        '{ActionLog}', 
        '["ActionLog"]'
    ),
  associated_endpoint = jsonb_set(
    associated_endpoint,
    '{Endpoints}',
    '["ActionLog"]'
  ),
  
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'agent_action_address2';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
            ui_info, 
            '{ActionLogText}', 
            '"If creating an agent_action that has a location component (‘inperson’ ‘other’) use this field to denote the city or locale of the agent_action."'
            ),
        '{Products}', 
        '["ActionLog", "Engage"]'
        ),
        '{ActionLog}', 
        '["ActionLog"]'
    ),
  associated_endpoint = jsonb_set(
    associated_endpoint,
    '{Endpoints}',
    '["ActionLog"]'
  ),
  
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'agent_action_city';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
            ui_info, 
            '{ActionLogText}', 
            '"If creating an agent_action that has a location component (‘inperson’ ‘other’) use this field to denote the state or province related info of the agent_action."'
            ),
        '{Products}', 
        '["ActionLog", "Engage"]'
        ),
        '{ActionLog}', 
        '["ActionLog"]'
    ),
  associated_endpoint = jsonb_set(
    associated_endpoint,
    '{Endpoints}',
    '["ActionLog"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'agent_action_state';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
            ui_info, 
            '{ActionLogText}', 
            '"If creating an agent_action that has a location component (‘inperson’ ‘other’) use this field to denote the postal code of the agent_action."'
            ),
        '{Products}', 
        '["ActionLog", "Engage"]'
        ),
        '{ActionLog}', 
        '["ActionLog"]'
    ),
  associated_endpoint = jsonb_set(
    associated_endpoint,
    '{Endpoints}',
    '["ActionLog"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'agent_action_zip';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
            ui_info, 
            '{APIText}', 
            '"This is the Unix timestamp for the creation time of the ActionLog entry."'
            ),
        '{Products}', 
        '["API", "Engage"]'
        ),
        '{ActionLog}', 
        '["API"]'
    ),
  associated_endpoint = jsonb_set(
    associated_endpoint,
    '{Endpoints}',
    '["ActionLog"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'timestamp';

UPDATE associated_attrs
SET
  request_type = jsonb_set(
    request_type,
    '{ActionLog}',  -- Specify the path within the JSONB object
    (COALESCE(request_type->'ActionLog', '[]'::jsonb) || '["Create Request"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN (
    'agent_uuid',
    'moxi_works_agent_id',
    'source_agent_id',
    'body',
    'moxi_works_contact_id',
    'partner_contact_id',
    'title',
    'moxi_works_company_id',
    'parent_company_id',
    'agent_action',
    'agent_action_address',
    'agent_action_address2',
    'agent_action_city',
    'agent_action_state',
    'agent_action_zip'
);

UPDATE associated_attrs
SET
  request_type = jsonb_set(
    request_type,
    '{ActionLog}',  -- Specify the path within the JSONB object
    (COALESCE(request_type->'ActionLog', '[]'::jsonb) || '["Create Response"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN (
  'agent_uuid',
  'moxi_works_agent_id',
  'body',
  'moxi_works_contact_id',
  'partner_contact_id',
  'timestamp',
  'title',
  'agent_action',
  'agent_action_address',
  'agent_action_address2',
  'agent_action_city',
  'agent_action_state',
  'agent_action_zip'
);

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
            ui_info, 
            '{APIText}', 
            '"This is the MoxiWorks Platform ID of the ActionLog entry to be deleted. This will be an RFC 4122 compliant UUID."'
            ),
        '{Products}', 
        '["API"]'
        ),
        '{ActionLog}', 
        '["API"]'
    ),
  associated_endpoint = jsonb_set(
    associated_endpoint,
    '{Endpoints}',
    '["ActionLog"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'moxi_works_action_log_id';

UPDATE associated_attrs
SET
  request_type = jsonb_set(
    request_type,
    '{ActionLog}',  -- Specify the path within the JSONB object
    (COALESCE(request_type->'ActionLog', '[]'::jsonb) || '["Delete Request"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN (
   'moxi_works_action_log_id',
   'agent_uuid',
   'moxi_works_agent_id',
   'source_agent_id',
   'moxi_works_company_id',
   'parent_company_id'
);

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
            ui_info, 
            '{APIText}', 
            '"This will indicate what the status of the request is."'
            ),
        '{Products}', 
        '["API"]'
        ),
        '{ActionLog}', 
        '["API"]'
    ),
  associated_endpoint = jsonb_set(
    associated_endpoint,
    '{Endpoints}',
    '["ActionLog"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'status';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
            ui_info, 
            '{APIText}', 
            '"This will indicate whether the delete request was successful or not."'
            ),
        '{Products}', 
        '["API"]'
        ),
        '{ActionLog}', 
        '["API"]'
    ),
  associated_endpoint = jsonb_set(
    associated_endpoint,
    '{Endpoints}',
    '["ActionLog"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'deleted';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
            ui_info, 
            '{APIText}', 
            '"This is an arrray of strings. Any messages associated with the delete request status will be contained in this array."'
            ),
        '{Products}', 
        '["API"]'
        ),
        '{ActionLog}', 
        '["API"]'
    ),
  associated_endpoint = jsonb_set(
    associated_endpoint,
    '{Endpoints}',
    '["ActionLog"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'messages';

UPDATE associated_attrs
SET
  request_type = jsonb_set(
    request_type,
    '{ActionLog}',  -- Specify the path within the JSONB object
    (COALESCE(request_type->'ActionLog', '[]'::jsonb) || '["Delete Response"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN (
   'status',
   'deleted',
   'messages'
);