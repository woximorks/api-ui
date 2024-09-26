DO $$
BEGIN

UPDATE associated_attrs
SET
  ui_info = jsonb_set(
    ui_info,
    '{BuyerTransaction}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  )
WHERE attr_title IN (
    'agent_uuid',
    'moxi_works_agent_id',
    'moxi_works_company_id',
    'parent_company_id'
);

UPDATE associated_attrs
SET
  associated_endpoints = jsonb_set( -- setting the following associated_endpoints to have BuyerTransaction associations within the Endpoints Array
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

UPDATE associated_attrs
SET
  request_type = jsonb_set(
    request_type,
    '{BuyerTransaction}',
    (COALESCE(request_type->'BuyerTransaction', '[]'::jsonb) || '["Create Request"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN ( -- setting the following associated_attrs -> request_type to contain "#Request Type"
    'agent_uuid',
    'moxi_works_agent_id',
    'source_agent_id',
    'moxi_works_contact_id',
    'partner_contact_id',
    'moxi_works_company_id',
    'parent_company_id',
    'notes',
    'address',
    'city',
    'state',
    'zip_code',
    'min_sqft',
    'max_sqft',
    'min_beds',
    'max_beds',
    'min_baths',
    'max_baths',
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
    'stage'
);

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
        '{APIText}', 
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'A brief, human readable title that will be shown to the agent as the subject of the BuyerTransaction that you are creating.'))
      ), 
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'For Buyer Transactions, this will be the name or title of the transaction in question.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb 
        )
      )
    ),
    '{BuyerTransaction}', 
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["API", "Engage"]'::jsonb 
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' 
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'transaction_name';

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
        '{APIText}', 
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'Brief, human readable content that will be shown to the agent as notes about the BuyerTransaction that you are creating.'))
      ), 
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'For Buyer Transactions, these will be the related notes.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb 
        )
      )
    ),
    '{BuyerTransaction}', 
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["API", "Engage"]'::jsonb 
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' 
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'notes';
    
UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
        '{APIText}', 
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This should be populated if this BuyerTransaction is_mls_transaction is false.'))
      ), 
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'In relation to a Buyer Transaction, this is the street address of the property being purchased.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb 
        )
      )
    ),
    '{BuyerTransaction}', 
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["API", "Engage"]'::jsonb 
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' 
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'address';

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
        '{APIText}', 
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This should be populated if this BuyerTransaction is_mls_transaction is false.'))
      ), 
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'In relation to a Buyer Transaction, this will be the city or township of the property being purchased.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb 
        )
      )
    ),
    '{BuyerTransaction}', 
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["API", "Engage"]'::jsonb 
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' 
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'city';
    
UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
        '{APIText}', 
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This should be populated if this BuyerTransaction is_mls_transaction is false.'))
      ), 
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'In relation to a Buyer Transaction, this will be the state or province of the property being purchased.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb 
        )
      )
    ),
    '{BuyerTransaction}', 
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["API", "Engage"]'::jsonb 
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' 
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'state';

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
        '{APIText}', 
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This should be populated if this BuyerTransaction is_mls_transaction is false.'))
      ), 
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'In relation to a Buyer Transaction, this will be the postal code of the property being purchased.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb 
        )
      )
    ),
    '{BuyerTransaction}', 
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["API", "Engage"]'::jsonb 
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' 
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'zip_code';

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
          ui_info,  
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'In relation to a Buyer Transaction, the minimum desired living area for prospective properties.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Engage"]'::jsonb 
        )
      )
    ),
    '{BuyerTransaction}', 
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["Engage"]'::jsonb 
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' 
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'min_sqft';

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
          ui_info,  
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'In relation to a Buyer Transaction, the maximum desired living area for prospective properties.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Engage"]'::jsonb 
        )
      )
    ),
    '{BuyerTransaction}', 
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["Engage"]'::jsonb 
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' 
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'max_sqft';

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
          ui_info,  
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'In relation to a Buyer Transaction, the minimum number of bedrooms for prospective properties.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Engage"]'::jsonb 
        )
      )
    ),
    '{BuyerTransaction}', 
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["Engage"]'::jsonb 
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' 
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'min_beds';

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
          ui_info,  
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'In relation to a Buyer Transaction, the maximum number of bedrooms for prospective properties.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Engage"]'::jsonb 
        )
      )
    ),
    '{BuyerTransaction}', 
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["Engage"]'::jsonb 
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' 
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'max_beds';

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
          ui_info,  
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'In relation to a Buyer Transaction, the minimum number of bathrooms for prospective properties.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Engage"]'::jsonb 
        )
      )
    ),
    '{BuyerTransaction}', 
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["Engage"]'::jsonb 
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' 
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'min_baths';

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
          ui_info,  
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'In relation to a Buyer Transaction, the maximum number of bathrooms for prospective properties.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Engage"]'::jsonb 
        )
      )
    ),
    '{BuyerTransaction}', 
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["Engage"]'::jsonb 
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' 
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'max_baths';

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
          ui_info,  
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'In relation to a Buyer Transaction, the name of a locality representing an area of interest for prospective properties.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Engage"]'::jsonb 
        )
      )
    ),
    '{BuyerTransaction}', 
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["Engage"]'::jsonb 
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' 
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'area_of_interest';

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
        '{APIText}', 
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This should be false for paperwork-only, for sale by owner, off-market, or pocket listing type transactions or any transactions that will not be tracked through an MLS.'))
      ), 
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'In relation to a Buyer Transaction, this attribute indictates whether the property being purchased is listed on an MLS.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb 
        )
      )
    ),
    '{BuyerTransaction}', 
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["API", "Engage"]'::jsonb 
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' 
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'is_mls_transaction';

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
        '{APIText}', 
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'mls_number should be populated only if is_mls_transaction is true. If no commission (either commission_percentage or commission_flat_fee) is supplied during creation, commission_percentage is set to the default commission_percentage for the associated Agent.'))
      ), 
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'In relation to a Buyer Transaction, the MLS number of the the property being purchased.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb 
        )
      )
    ),
    '{BuyerTransaction}', 
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["API", "Engage"]'::jsonb 
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' 
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'mls_number';

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
        '{APIText}', 
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This is the Unix timestamp representing the date that the agent initiated transaction discussions with the client.'))
      ), 
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'In relation to a Buyer Transaction, this would be considered the date and time when the Agent first initiated transaction discussions with the client.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb 
        )
      )
    ),
    '{BuyerTransaction}', 
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["API", "Engage"]'::jsonb 
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' 
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'start_timestamp';

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
        '{APIText}', 
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'If the commission for the transaction is based on a flat dollar amount, use this attribute.'))
      ), 
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'In relation to a Buyer Transaction, this is the dollar amount of the total commission for the transaction.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb 
        )
      )
    ),
    '{BuyerTransaction}', 
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["API", "Engage"]'::jsonb 
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' 
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'commission_flat_fee';

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
        '{APIText}', 
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'If the commission for the transaction is based on a percentage of the purchase amount, use this attribute. If no commission (either commission_percentage or commission_flat_fee) is supplied during creation, commission_percentage is set to the default commission_percentage for the associated Agent.'))
      ), 
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'In relation to a Buyer Transaction, the total commission for the transaction based on this percentage of the purchase price.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb 
        )
      )
    ),
    '{BuyerTransaction}', 
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["API", "Engage"]'::jsonb 
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' 
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'commission_percentage';

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
        '{APIText}', 
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'If payment for the transaction is based on a flat fee derived from sales volume, use this attribute.'))
      ), 
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'In relation to a Buyer Transaction, the total commission for the transaction based on percentage of purchase price.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb 
        )
      )
    ),
    '{BuyerTransaction}', 
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["API", "Engage"]'::jsonb 
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' 
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'sales_volume_flat_fee';

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
        '{APIText}', 
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'If the payment for the transaction is based on percentage of sales volume, use this attribute.'))
      ), 
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'In relation to a Buyer Transaction, the total commission for the transaction based on sales volume percentage.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb 
        )
      )
    ),
    '{BuyerTransaction}', 
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["API", "Engage"]'::jsonb 
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' 
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'sales_volume_percentage';

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
          ui_info,  
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'The desired purchase price for a property if using target rather than range.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Engage"]'::jsonb 
        )
      )
    ),
    '{BuyerTransaction}', 
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["Engage"]'::jsonb 
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' 
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'target_price';

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
          ui_info,  
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'The minimum price range for a property if using a price range rather than target price.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Engage"]'::jsonb 
        )
      )
    ),
    '{BuyerTransaction}', 
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["Engage"]'::jsonb 
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' 
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'min_price';

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
          ui_info,  
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'The maximum price range for a property if using a price range rather than target price.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Engage"]'::jsonb 
        )
      )
    ),
    '{BuyerTransaction}', 
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["Engage"]'::jsonb 
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' 
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'max_price';

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
          ui_info,  
      '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'The stage that the BuyerTransaction should be placed into.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API"]'::jsonb 
        )
      )
    ),
    '{BuyerTransaction}', 
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["API"]'::jsonb 
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' 
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'stage';

UPDATE associated_attrs
SET
  request_type = jsonb_set(
    request_type,
    '{BuyerTransaction}',
    (COALESCE(request_type->'BuyerTransaction', '[]'::jsonb) || '["Create Response"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN ( -- setting the following associated_attrs -> request_type to contain "#Request Type"
    'agent_uuid',
    'moxi_works_agent_id',
    'moxi_works_contact_id',
    'partner_contact_id',
    'transaction_name',
    'notes',
    'stage',
    'address',
    'city',
    'state',
    'zip_code',
    'min_sqft',
    'max_sqft',
    'min_beds',
    'max_beds',
    'min_baths',
    'max_baths',
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
    'moxi_works_transaction_id',
    'stage_name',
    'closing_price',
    'closing_timestamp',
    'state_changed_at'
);

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
          ui_info,  
      '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This is the MoxiWorks Platform ID of the BuyerTransaction which you have created. This will be an RFC 4122 compliant UUID. This ID should be recorded on response as it is the key ID for updating the BuyerTransaction.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API"]'::jsonb 
        )
      )
    ),
    '{BuyerTransaction}', 
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["API"]'::jsonb 
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' 
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'moxi_works_transaction_id';

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
        '{APIText}', 
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'When created through the MoxiWorks Platform, BuyerTransaction objects will automatically be configured as active transactions. For more information about BuyerTransaction stages, see the MoxiCloud documentation, specific to BuyerTransaction Stages.'))
      ), 
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'For Buyer Transactions, this attribute displays the name or title that is associated with the current stage of the transaction.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb 
        )
      )
    ),
    '{BuyerTransaction}', 
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["API", "Engage"]'::jsonb 
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' 
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'stage_name';

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
        '{APIText}', 
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This should be null if the BuyerTransaction is not yet in complete state.'))
      ), 
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'This is the closing price for the transaction.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb 
        )
      )
    ),
    '{BuyerTransaction}', 
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["API", "Engage"]'::jsonb 
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' 
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'closing_price';

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
        '{APIText}', 
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'A Unix timestamp. This should be null if the BuyerTransaction is not yet in complete state.'))
      ), 
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'For a Buyer Transaction, this represents the point in time when the transaction was completed.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb 
        )
      )
    ),
    '{BuyerTransaction}', 
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["API", "Engage"]'::jsonb 
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' 
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'closing_timestamp';

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
          ui_info,  
      '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'The stage that the BuyerTransaction should be placed into.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API"]'::jsonb 
        )
      )
    ),
    '{BuyerTransaction}', 
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["API"]'::jsonb 
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' 
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'state_changed_at';

UPDATE associated_attrs 
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
          ui_info,  
      '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'If this is set to true then The MoxiWorks Platform will promote this transaction to the next stage.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API"]'::jsonb 
        )
      )
    ),
    '{BuyerTransaction}', 
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'BuyerTransaction', '[]'::jsonb) || '["API"]'::jsonb 
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["BuyerTransaction"]' 
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'promote_transaction';

UPDATE associated_attrs
SET
  request_type = jsonb_set(
    request_type,
    '{BuyerTransaction}',
    (COALESCE(request_type->'BuyerTransaction', '[]'::jsonb) || '["Update Request"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN ( -- setting the following associated_attrs -> request_type to contain "#Request Type"
  'agent_uuid',
  'moxi_works_agent_id',
  'source_agent_id',
  'moxi_works_transaction_id',
  'transaction_name',
  'moxi_works_company_id',
  'parent_company_id',
  'notes',
  'address',
  'city',
  'state',
  'zip_code',
  'min_sqft',
  'max_sqft',
  'min_beds',
  'max_beds',
  'min_baths',
  'max_baths',
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
  'closing_price',
  'closing_timestamp',
  'promote_transaction'
);

UPDATE associated_attrs
SET
  request_type = jsonb_set(
    request_type,
    '{BuyerTransaction}',
    (COALESCE(request_type->'BuyerTransaction', '[]'::jsonb) || '["Update Response"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN (
  'agent_uuid',
  'moxi_works_agent_id',
  'moxi_works_transaction_id',
  'moxi_works_contact_id',
  'partner_contact_id',
  'transaction_name',
  'notes',
  'stage',
  'stage_name',
  'address',
  'city',
  'state',
  'zip_code',
  'min_sqft',
  'max_sqft',
  'min_beds',
  'max_beds',
  'min_baths',
  'max_baths',
  'area_of_interest',
  'is_mls_transaction',
  'mls_number',
  'start_timestamp',
  'commission_percentage',
  'commission_flat_fee',
  'sales_volume_percentage'
  'sales_volume_flat_fee'
  'target_price',
  'min_price',
  'max_price',
  'closing_price',
  'closing_timestamp',
  'state_changed_at'
);

UPDATE associated_attrs
SET
  request_type = jsonb_set(
    request_type,
    '{BuyerTransaction}',
    (COALESCE(request_type->'BuyerTransaction', '[]'::jsonb) || '["Show Request"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN (
  'agent_uuid',
  'moxi_works_agent_id',
  'source_agent_id',
  'moxi_works_transaction_id',
  'moxi_works_company_id',
  'parent_company_id'
);

UPDATE associated_attrs
SET
  request_type = jsonb_set(
    request_type,
    '{BuyerTransaction}',
    (COALESCE(request_type->'BuyerTransaction', '[]'::jsonb) || '["Show Response"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN (
  'agent_uuid',
  'moxi_works_agent_id',
  'moxi_works_transaction_id',
  'moxi_works_contact_id',
  'partner_contact_id',
  'transaction_name',
  'notes',
  'stage',
  'stage_name',
  'address',
  'city',
  'state',
  'zip_code',
  'min_sqft',
  'max_sqft',
  'min_beds',
  'max_beds',
  'min_baths',
  'max_baths',
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
  'closing_price',
  'closing_timestamp',
  'state_changed_at'
);

UPDATE associated_attrs
SET
  request_type = jsonb_set(
    request_type,
    '{BuyerTransaction}',
    (COALESCE(request_type->'BuyerTransaction', '[]'::jsonb) || '["Index Request"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN (
  'agent_uuid',
  'moxi_works_agent_id',
  'source_agent_id',
  'moxi_works_company_id',
  'parent_company_id',
  'moxi_works_contact_id',
  'partner_contact_id',
  'page_number',
  'timestamps_only'
);

UPDATE associated_attrs
SET
  request_type = jsonb_set(
    request_type,
    '{BuyerTransaction}',
    (COALESCE(request_type->'BuyerTransaction', '[]'::jsonb) || '["Index Response"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN (
    'agent_uuid',
    'moxi_works_agent_id',
    'moxi_works_transaction_id',
    'moxi_works_contact_id',
    'partner_contact_id',
    'transaction_name',
    'notes',
    'stage',
    'stage_name',
    'address',
    'city',
    'state',
    'zip_code',
    'min_sqft',
    'max_sqft',
    'min_beds',
    'max_beds',
    'min_baths',
    'max_baths',
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
    'closing_price',
    'closing_timestamp',
    'state_changed_at'
);

END $$;