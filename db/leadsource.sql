DO $$
BEGIN

UPDATE associated_attrs
SET
  ui_info = jsonb_set(
    ui_info,
    '{LeadSoource}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'LeadSource', '[]'::jsonb) || '["API", "Engage"]'::jsonb
      )
    )
  )
WHERE attr_title IN (
  'moxi_works_lead_source_id',
  'moxi_works_agent_id'
);


UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'Is true if this LeadSource may be used as a lead source alias for the requesting partner.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{LeadSource}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'LeadSource', '[]'::jsonb) || '["API"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["LeadSource"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'is_partner_alias'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'Is true for the LeadSource entity used as a default for this partner. This should always be true for exactly one of each partner’s available lead sources in the Index Response Payload.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{LeadSource}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'LeadSource', '[]'::jsonb) || '["API"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["LeadSource"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'is_partner_default'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs
SET
  request_type = jsonb_set(
    request_type,
    '{LeadSource}',
    (COALESCE(request_type->'LeadSource', '[]'::jsonb) || '["Index Response"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN ( -- setting the following associated_attrs -> request_type to contain "#Request Type"
    'moxi_works_lead_source_id',
    'is_partner_alias',
    'is_partner_default'
);

END $$;