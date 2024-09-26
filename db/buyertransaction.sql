DO $$
BEGIN

UPDATE associated_attrs
SET
  ui_info = jsonb_set(
    ui_info,
    '{BuyerTransacction}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["API", "#Roster"]'::jsonb
      )
    )
  )
WHERE attr_title IN (
    'agent_uuid',
    'moxi_works_agent_id',
    'source_agent_id',
    'moxi_works_contact_id',
    'partner_contact_id',
    'moxi_works_company_id',
    'parent_company_id'
);

UPDATE associated_attrs
SET
  associated_endpoints = jsonb_set( -- setting the following associated_endpoints to have Brand associations within the Endpoints Array
    associated_endpoints,
    '{Endpoints}',
    (COALESCE(associated_endpoints->'Endpoints', '[]'::jsonb) || '["BuyerTransaction"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN (
    'agent_uuid',
    'moxi_works_agent_id',
    'source_agent_id',
    'moxi_works_contact_id',
    'partner_contact_id',
    'moxi_works_company_id',
    'parent_company_id'
);

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'A brief, human readable title that will be shown to the agent as the subject of the BuyerTransaction that you are creating.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'For Buyer Transactions, this will be the name or title of the transaction in question.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{BuyerTransaction}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'transaction_name';

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'Brief, human readable content that will be shown to the agent as notes about the BuyerTransaction that you are creating.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'For Buyer Transactions, these will be the related notes.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{BuyerTransaction}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'notes';
    
UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This should be populated if this BuyerTransaction is_mls_transaction is false.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'In relation to a Buyer Transaction, this is the street address of the property being purchased.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{BuyerTransaction}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'address';

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This should be populated if this BuyerTransaction is_mls_transaction is false.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'In relation to a Buyer Transaction, this will be the city or township of the property being purchased.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{BuyerTransaction}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'city';
    
UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This should be populated if this BuyerTransaction is_mls_transaction is false.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'In relation to a Buyer Transaction, this will be the state or province of the property being purchased.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{BuyerTransaction}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'state';

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This should be populated if this BuyerTransaction is_mls_transaction is false.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'In relation to a Buyer Transaction, this will be the postal code of the property being purchased.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{BuyerTransaction}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'zip_code';

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated 
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'In relation to a Buyer Transaction, the minimum desired living area for prospective properties.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Engage"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{BuyerTransaction}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["Engage"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'min_sqft';

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated 
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'In relation to a Buyer Transaction, the maximum desired living area for prospective properties.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Engage"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{BuyerTransaction}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["Engage"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'max_sqft';

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated 
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'In relation to a Buyer Transaction, the minimum number of bedrooms for prospective properties.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Engage"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{BuyerTransaction}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["Engage"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'min_beds';

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated 
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'In relation to a Buyer Transaction, the maximum number of bedrooms for prospective properties.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Engage"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{BuyerTransaction}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["Engage"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'max_beds';

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated 
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'In relation to a Buyer Transaction, the minimum number of bathrooms for prospective properties.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Engage"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{BuyerTransaction}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["Engage"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'min_baths';

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated 
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'In relation to a Buyer Transaction, the maximum number of bathrooms for prospective properties.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Engage"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{BuyerTransaction}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["Engage"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'max_baths';

END $$;



    'area_of_interest',
    'is_mls_transaction',
    'mls_number',
    'start_timestamp',
    'commission_percentage',
    'commission_flat_fee',
    'sales_volume_percentage',
    'sales_volume_flat_fee',
    'target_price',
    'min_price',
    'max_price',
    'stage',