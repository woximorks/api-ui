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

UPDATE associated_attrs -- The name of the database table
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
WHERE attr_title = 'name'; -- Attribute name, ie agent_uuid, email_addresses, etc

END $$;

