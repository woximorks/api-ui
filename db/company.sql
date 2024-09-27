DO $$
BEGIN

UPDATE associated_attrs
SET
  ui_info = jsonb_set(
    ui_info,
    '{Company}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Company', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  )
WHERE attr_title = 'moxi_works_company_id';

UPDATE associated_attrs
SET
  associated_endpoints = jsonb_set( -- setting the following associated_endpoints to have Brand associations within the Endpoints Array
    associated_endpoints,
    '{Endpoints}',
    (COALESCE(associated_endpoints->'Endpoints', '[]'::jsonb) || '["Company"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'moxi_works_company_id';

UPDATE associated_attrs
SET
  request_type = jsonb_set(
    request_type,
    '{Company}',
    (COALESCE(request_type->'Company', '[]'::jsonb) || '["Show Request"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'moxi_works_company_id';

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{RosterText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'This is a human readable name of the company which this Company object represents.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Roster"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{Company}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Company', '[]'::jsonb) || '["Roster"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Company"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'name';


UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This is the numeric company id that is interchangeable with the moxi_works_agent_id in all request scenarios.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{Company}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Company', '[]'::jsonb) || '["API"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Company"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'numeric_id';

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This is a client-specified identifier of the company which this Company object represents, or null if absent.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{Company}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Company', '[]'::jsonb) || '["API"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Company"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'client_company_id';

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{RosterText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'Integrated partner data associated with this company.')) -- When I start adding actual product level association text this can be moved to ui_info->Company array. This is the first good example of needing to scale even further and I'm going to ignore it for now because I want to finish this project before 2085
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Roster"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{Company}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Company', '[]'::jsonb) || '["Roster"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Company"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'partners';

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'Exposed company attributes.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{Company}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Company', '[]'::jsonb) || '["API"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Company"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'public_partner_attrs';

UPDATE associated_attrs
SET
  request_type = jsonb_set(
    request_type,
    '{Company}',
    (COALESCE(request_type->'Company', '[]'::jsonb) || '["Show Response"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title in (
    'moxi_works_company_id',
    'name',
    'numeric_id',
    'client_company_id',
    'partners',
    'public_partner_attrs'
);

UPDATE associated_attrs
SET
  request_type = jsonb_set(
    request_type,
    '{Company}',
    (COALESCE(request_type->'Company', '[]'::jsonb) || '["Index Response"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title in (
    'moxi_works_company_id',
    'name',
    'numeric_id',
    'client_company_id',
    'public_partner_attrs'
);

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'Number of companies records to return per page.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{Company}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Company', '[]'::jsonb) || '["API"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Company"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'per_page';

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'Page of companies records to return.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{Company}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Company', '[]'::jsonb) || '["API"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Company"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'page_number';

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'Page of companies records to return.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{Company}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Company', '[]'::jsonb) || '["API"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Company"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'show_paging_totals';

-- Establish Request Type relationship
UPDATE associated_attrs
SET
  request_type = jsonb_set(
    request_type,
    '{Company}',
    (COALESCE(request_type->'Company', '[]'::jsonb) || '["Search Request"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN ( -- setting the following associated_attrs -> request_type to contain "#Request Type"
    'per_page',
    'page_number',
    'parent_company_id',
    'show_paging_totals'
);

UPDATE associated_attrs
SET
  request_type = jsonb_set(
    request_type,
    '{Company}',
    (COALESCE(request_type->'Company', '[]'::jsonb) || '["Search Response"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN ( -- setting the following associated_attrs -> request_type to contain "#Request Type"
    'name',
    'numeric_id',
    'client_company_id',
    'public_partner_attrs'
);

UPDATE associated_attrs
SET
  associated_endpoints = jsonb_set( -- setting the following associated_endpoints to have Brand associations within the Endpoints Array
    associated_endpoints,
    '{Endpoints}',
    (COALESCE(associated_endpoints->'Endpoints', '[]'::jsonb) || '["Company"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'parent_company_id';

UPDATE associated_attrs
SET
  ui_info = jsonb_set(
    ui_info,
    '{Company}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Company', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  )
WHERE attr_title = 'parent_company_id';

END $$;