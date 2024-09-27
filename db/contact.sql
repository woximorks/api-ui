DO $$
BEGIN

-- Set Product associations to the attribute on a local (endpoint specific) level
-- This is useful when the attribute already has associated info that applies to a new endpoint
    -- #Endpoint
    -- ["#Product1", "#Product2", "#Product3"]
    -- ("Attribute1", "Attribute2", "Attribute3", "Attribute4")
UPDATE associated_attrs
SET
  ui_info = jsonb_set(
    ui_info,
    '{#Endpoint}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'#Endpoint', '[]'::jsonb) || '["#Product1", "#Product2", "#Product3"]'::jsonb
      )
    )
  )
WHERE attr_title IN (
    'agent_uuid',
    'moxi_works_agent_id',
    'source_agent_id',
    'partner_contact_id',
    'primary_email_address',
    'secondary_email_address',
    'moxi_works_company_id',
    'parent_company_id',
    'company',
);
-- New Contact Create 
    'contact_name',
    'primary_phone_number',
    'secondary_phone_number',
    'moxi_works_lead_source_id',
    'original_lead_source',
    'gender',
    'label_name',
    'home_street_address',
    'home_city',
    'home_state',
    'home_zip',
    'home_country',
    'is_not_lead',
    'skip_agent_notification',
    'job_title',
    'occupation',
    'property_url',
    'property_mls_id',
    'property_street_address',
    'property_city',
    'property_state',
    'property_zip',
    'property_beds',
    'property_baths',
    'property_list_price',
    'property_listing_status',
    'property_photo_url',
    'search_city',
    'search_state',
    'search_zip',
    'search_min_baths',
    'search_min_beds',
    'search_min_price',
    'search_max_price',
    'search_min_sq_ft',
    'search_max_sq_ft',
    'search_min_lot_size',
    'search_max_lot_size',
    'search_min_year_built',
    'search_max_year_built',
    'search_property_types',
    'note',
    'websites',
    'birthday',
    'home_purchase_anniversaries',
    'spouse_or_partner',
    'category_names'

  -- Set Product associations to the attribute on a global level
  -- This is useful when the attribute already has associated info that applies to a new endpoint
    -- #Endpoint
    -- ("Attribute1", "Attribute2", "Attribute3", "Attribute4")
UPDATE associated_attrs
SET
  associated_endpoints = jsonb_set( -- setting the following associated_endpoints to have Brand associations within the Endpoints Array
    associated_endpoints,
    '{Endpoints}',
    (COALESCE(associated_endpoints->'Endpoints', '[]'::jsonb) || '["#Endpoint"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN (
    '#Attribute1',
    '#Attribute2',
    '#Attribute3'
);

END $$;