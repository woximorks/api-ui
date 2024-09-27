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