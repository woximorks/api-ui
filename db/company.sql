DO $$
BEGIN

UPDATE #database_table
SET
  #database_column_name = jsonb_set(
    #database_column_name,
    '{Company}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(#database_column_name->'Company', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  )
WHERE #database_column_name = "moxi_works_company_id";

UPDATE #database_table
SET
  #database_column_name = jsonb_set( -- setting the following associated_endpoints to have Company associations within the Endpoints Array
    #database_column_name,
    '{Endpoints}',
    (COALESCE(#database_column_name->'Endpoints', '[]'::jsonb) || '["Company"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE #database_column_name = 'moxi_works_company_id';

UPDATE #database_column_name
SET
  #database_column_name = jsonb_set(
    #database_column_name,
    '{Company}',
    (COALESCE(#database_column_name->'Company', '[]'::jsonb) || '["Show Request"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN ( -- setting the following associated_attrs -> request_type to contain "Show Request"
    'moxi_works_company_id'
);

UPDATE #database_table -- The name of the database table
SET 
  #database_column_name = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          #database_column_name, -- The corresponding column name of the field to be updated
        '{#Product1Text}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(#database_column_name->>'#Product1Text', '') || '#Some string with information about the association to product1.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{#Product2Text}',
          to_jsonb((COALESCE(#database_column_name->>'Product2Text', '') || '#Some string with information about the association to product2.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(#database_column_name->'Products', '[]'::jsonb) || '["#Product1", "#Product2"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{Company}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(#database_column_name->'Company', '[]'::jsonb) || '["#Product1", "#Product2"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  #database_column_name = jsonb_set(
    #database_column_name,
    '{Endpoints}',
    '["Company"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE #database_column_name = 'name'; -- Attribute name, ie agent_uuid, email_addresses, etc


UPDATE #database_column_name
SET
  #database_column_name = jsonb_set(
    #database_column_name,
    '{Company}',
    (COALESCE(#database_column_name->'Company', '[]'::jsonb) || '["Show Response"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN ( -- setting the following associated_attrs -> request_type to contain "Show Response"
    'moxi_works_company_id',
    'name',
    'numeric_id',
    'client_company_id',
    'partners',
    'public_partner_attrs'
);

END $$;