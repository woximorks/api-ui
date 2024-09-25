DO $$
BEGIN

UPDATE associated_attrs
SET
  ui_info = jsonb_set(
    ui_info,
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  )
WHERE attr_title IN ( -- setting the following associated_attrs to have API and Roster associations within the Agent Array of ui_info
  'agent_uuid',
  'moxi_works_agent_id',
  'moxi_works_company_id',
  'parent_company_id'
);

UPDATE associated_attrs
SET
  ui_info = jsonb_set(
    ui_info,
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API"]'::jsonb
      )
    )
  )
WHERE attr_title = 'source_agent_id';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'To include access level information for the agent in the response, pass true.'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'The access level of the agent. This can return one of the possible access levels, as seen within the products and permissions page.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'include_access_level';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'Whether to include agent’s GCI goals and commissions data in the response data.'))
        ), 
        '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'This represents the Gross Commission Income goal, as seen throughout the Engage UI.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Engage"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'include_gci_goals';

UPDATE associated_attrs
SET
  request_type = jsonb_set(
    request_type,
    '{Agent}',
    (COALESCE(request_type->'Agent', '[]'::jsonb) || '["Create Request"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN ( -- setting the following associated_attrs -> request_type to contain "Create Request"
  'agent_uuid',
  'moxi_works_agent_id',
  'source_agent_id',
  'moxi_works_company_id',
  'parent_company_id',
  'include_access_level',
  'include_gci_goals',
  'include_partners',
  'include_reviews'
);

UPDATE associated_attrs
SET
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    (COALESCE(request_type->'Endpoints', '[]'::jsonb) || '["Agent"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN (  -- setting the following associated_attrs -> associated_endpoints to contain "Agent"
  'agent_uuid',
  'moxi_works_agent_id',
  'source_agent_id',
  'moxi_works_company_id',
  'parent_company_id',
  'include_access_level',
  'include_gci_goals',
  'include_partners',
  'include_reviews'
);

UPDATE associated_attrs
SET
  request_type = jsonb_set(
    request_type,
    '{Agent}',
    (COALESCE(request_type->'Agent', '[]'::jsonb) || '["Create Response"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN ( -- setting the following associated_attrs -> request_type to contain "Create Response"
    'moxi_works_agent_id',
    'client_agent_id',
    'mls_agent_id',
    'license',
    'mls_name',
    'mls_abbreviation',
    'agent_id',
    'moxi_works_office_id',
    'office_id',
    'client_office_id',
    'company_id',
    'client_company_id',
    'office_address_street',
    'office_address_street2',
    'office_address_city',
    'office_address_state',
    'office_address_zip',
    'office_mailing_address_street',
    'office_mailing_address_street2',
    'office_mailing_address_city',
    'office_mailing_address_state',
    'office_mailing_address_zip',
    'name',
    'first_name',
    'last_name',
    'nickname',
    'main_phone_number',
    'mobile_phone_number',
    'alt_phone_number',
    'fax_phone_number',
    'office_phone_number',
    'primary_email_address',
    'secondary_email_address',
    'email_addresses',
    'lead_routing_email_address',
    'title',
    'bio',
    'designations',
    'uuid',
    'has_product_access',
    'has_engage_access',
    'access_level',
    'view_level',
    'teams',
    'website_base_url',
    'twitter',
    'google_plus',
    'facebook',
    'home_page',
    'profile_image_url',
    'profile_thumb_url',
    'region',
    'gci_goal',
    'buyer_commission_rate',
    'seller_commission_rate',
    'service_area_zip_codes',
    'agent_website',
    'alternate_offices',
    'available_mls',
    'partners',
    'company_programs',
    'source_metadata',
    'created_timestamp',
    'deactivated_timestamp'
    'profile_visible_online',
    'user_reviews'
);

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This is the ID of the Agent, as utilized by their brokerage or company.'))
        ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'client_agent_id';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This is the ID of the Agent utilized by their primary MLS. This ID allows listings to associate with the User Account.'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'This ID can be found on the Manage MLS Associations page of the Agent or other User Account.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'mls_agent_id';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This is the number of the license granted to the agent. Please see mls_agent_id for the Agent MLS ID value.'))
        ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'license';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This is the name of the primary MLS for the agent.'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'This name can be found on the Manage MLS Associations page of the Agent or other User Account.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'mls_name';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This is the standard abbreviation of the primary MLS utilized by the agent.'))
        ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'mls_abbreviation';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This is the ID of this Agent. This will be an integer.'))
        ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'agent_id';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This will be an RFC 4122 compliant UUID.'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'This is the MoxiWorks Platform ID of the office for this Agent.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'moxi_works_office_id';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This is the ID of the office for this Agent. This will be an integer.'))
        ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'office_id';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This is the ID of the office for this Agent. This will be an integer.'))
        ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'client_office_id';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This is the ID of the company for this Agent. This will be an integer.'))
        ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'company_id';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This is the ID of the Company utilized by their brokerage or company.'))
        ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'client_company_id';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This is the main associated physical street address where the office is located. It can be null if there is no data for this attribute.'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'Displays under the associated office page.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'office_address_street';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This is the main associated secondary physical street address field, often populated with a suite or office number. This can be null if there is no data for this attribute.'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'Displays under the associated office page.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'office_address_street2';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'The city where the office is located, as associated with the physical address. This can be null if there is no data for this attribute.'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'Displays under the associated office page.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'office_address_city';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'The state where the office is located, as associated with the physical address. This can be null if there is no data for this attribute.'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'Displays under the associated office page.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'office_address_state';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'The postal code associated with the office physical address. This can be null if there is no data for this attribute.'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'Displays under the associated office page.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'office_address_zip';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This is the associated mailing address where the office is located. It can be null if there is no data for this attribute.'))
        ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'office_mailing_address_street';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This is the associated secondary mailing street address field, often populated with a suite or office number. This can be null if there is no data for this attribute.'))
        ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'office_mailing_address_street2';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'The city where the office receives mail, as associated with the mailing address. This can be null if there is no data for this attribute.'))
        ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'office_mailing_address_city';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'The state where the office receives mail, as associated with the mailing address. This can be null if there is no data for this attribute.'))
        ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'office_mailing_address_state';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'The postal code associated with the office mailing address. This can be null if there is no data for this attribute.'))
        ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'office_mailing_address_zip';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This can be null if there is no data for this attribute.'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'The full name of the agent.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'name';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This can be null if there is no data for this attribute.'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'The first name of the agent.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'first_name';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This can be null if there is no data for this attribute.'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'The last name of the agent.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'last_name';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This can be null if there is no data for this attribute.'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'The nickname of the agent.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'nickname';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This can be null if there is no data for this attribute.'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'This is the agent’s main phone number. This number should be considered the number the agent would like to be contacted by.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'main_phone_number';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This can be null if there is no data for this attribute.'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'Mobile phone number of the agent. main_phone_number should be considered higher priority, if not the same.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'mobile_phone_number';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This can be null if there is no data for this attribute.'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'Alternate phone number for the agent. This should be considered second in priority to main_phone_number.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'alt_phone_number';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This can be null if there is no data for this attribute.'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'This is the agent’s fax phone number.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'fax_phone_number';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This can be null if there is no data for this attribute.'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'This is the agent’s office phone number.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'office_phone_number';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This can be null if there is no data for this attribute.'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'This is the agent’s main email address. This email address should be considered the email address the agent would prefer to be contacted by.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'primary_email_address';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This can be null if there is no data for this attribute.'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'This is the agent’s alternate email address. This email address should be considered the email address the agent would want to be contacted by only if the address in primary_email_address is not functional.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'secondary_email_address';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This can be null if there is no data for this attribute.'))
        ), 
        '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'This is the agent’s lead routing email address. This can be null if there is no data for this attribute.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Engage"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'lead_routing_email_address';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This can be null if there is no data for this attribute.'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'This is the business title of the agent.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
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
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'Array of key/value pairs. Each has a body and header, both strings, which can be null or blank.'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'This is the bio of the agent, as seen on the about me > web info page.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'bio';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This is a string that contains the agent’s designation(s), if any. This can be null if there is no data for this attribute.'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || ''))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'designations';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This is an RFC 4122 compliant UUID. This UUID can be used as a unique identifier in determining associations between Agent objects and Listing objects.'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'Displays within the about me section.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'uuid';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'Indicates whether the agent has access to MoxiWorks Products.'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'Referring to each individual Moxi product offered, such as Engage, Present, Impress etc.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'has_product_access';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'Indicates whether the agent has access to MoxiWorks Engage Product.'))
        ), 
        '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'Referencing the agent’s ability to access Engage as a product.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Engage"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'has_engage_access';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'If include_access_level was passed as true, this can return one of the possible access levels.'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'Related to the products and permissions page, specific to user account permissions section.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'access_level';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This will return one of the possible view levels.'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'The view level of the agent.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'view_level';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'The teams array contains Dictionary objects representing Team entries. These include [name, uuid, member_category].'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'Related to Agent Teams, within My Account section.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'teams';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{WebsitesText}',
          to_jsonb((COALESCE(ui_info->>'WebsitesText', '') || 'The base url of the agent’s MoxiWorks agent website.'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'Seen within About Me > Web Info.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Websites", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["Websites", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'website_base_url';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This can be null if there is no data available for this attribute.'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'Agent’s Twitter URL. Seen within About Me > Web Info.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'twitter';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This will be null. Deprecated.'))
        ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'google_plus';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This can be null if there is no data available for this attribute.'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'Agent’s Facebook page url. Seen within About Me > Web Info.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'facebook';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'You’ll need to prefix the domain with protocol if using this attribute for an href. This can be null if there is no data available for this attribute.'))
        ), 
        '{WebsitesText}',
          to_jsonb((COALESCE(ui_info->>'WebsitesText', '') || 'Agent’s website domain. This will be returned without the HTTP(S) prefix.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Websites"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Websites"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'home_page';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This is a valid URL for a larger size image for the agent. If no agent image has been uploaded for this agent a default image url will be provided.'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'Agent’s associated profile image within About Me section.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'profile_image_url';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This is a valid URL for a thumbnail size image for the agent. If no agent image has been uploaded for this agent a default image url will be provided.'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'Agent’s associated profile image within About Me section, thumbnail.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'profile_thumb_url';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This can be null if there is no data for this attribute.'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'The region the agent’s office is in.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'region';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
        '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'This is the agent’s Gross Commission Income goal, as seen throughout the Engage UI.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Engage"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["Engage"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'gci_goal';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'Percentage commission rate for the agent when acting as a buyer’s agent.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'buyer_commission_rate';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'Percentage commission rate for the agent when acting as a seller’s agent.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'seller_commission_rate';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
        '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'A list of the lead service area zip codes covered by the agent.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Engage"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["Engage"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'service_area_zip_codes';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info,
        '{WebsitesText}',
          to_jsonb((COALESCE(ui_info->>'WebsitesText', '') || 'This includes the base_url and bio_page_slug of the agent MoxiWorks website.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Websites"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["Websites"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'agent_website';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'The alternate_offices array contains Dictionary objects representing AlternateOffice entries. These include [moxi_works_office_id, office_id, office_address_street, office_address_street2, office_address_city, office_address_state, office_address_zip, office_phone_number].'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'Agent’s alternate offices, as seen within the additional offices page.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'alternate_offices';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'The available_mls Array contains Dictionary objects representing MLS entries. These include [name, display_name, mls_abbreviation, agent_id].'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'Agent’s alternate offices, as seen within the additional offices page.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'available_mls';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'Existence of objects in the partners data structure is dependent upon external relationships existing between the agent represented by this Agent and the affiliate. Documented entities in the `partners` data structure may or may not be returned based on agent relationship. Your logic should be engineered to handle cases where the entity you are interested in is returned and where an empty data structure is returned.'))
        ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'partners';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'A list of the company specific program names in which the agent participates or is a member.'))
        ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'company_programs';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'A list of the source-specific user identifiers.'))
        ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'source_metadata';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This is the Unix timestamp representing the date that this Agent was created in the MoxiWorks system.'))
        ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'created_timestamp';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This is the Unix timestamp representing the date that this Agent was deactivated in the MoxiWorks system. This will be returned null if the agent is still active.'))
        ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'deactivated_timestamp';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'True corresponds to Yes (visible online); false corresponds to No (not visible online).'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'Indicates the “Profile Visible Online” value for this Agent.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'profile_visible_online';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'Existence of objects in the user_reviews data structure is dependent upon external sources, i.e. Zillow, Testimonial Tree. Documented entities in the `user_reviews` data structure may or may not be returned when `include_reviews=true` is passed. Your logic should be engineered to handle cases where the entity you are interested in is returned and where an empty data structure is returned. Included in this - [source_name, agg_rating, reviews_count]'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'External agent reviews from platforms such as Zillow and Testimonial Tree.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'user_reviews';

END $$;

