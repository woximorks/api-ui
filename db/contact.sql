DO $$
BEGIN

-- Set Product associations to the attribute on a local (endpoint specific) level
-- This is useful when the attribute already has associated info that applies to a new endpoint
    -- #Endpoint
    -- ["#Product1", "#Product2", "#Product3"]
    -- ("Attribute1", "Attribute2", "Attribute3", "Attribute4")

-- Existing Contact Create attrs
UPDATE associated_attrs
SET
  ui_info = jsonb_set(
    ui_info,
    '{Contact}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Contact', '["API", "Roster"]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  )
WHERE attr_title IN ( -- primary and secondary_email_address are not added to 'roster' due to the contents necessary within the 'agent' description
    'agent_uuid',
    'moxi_works_agent_id',
    'moxi_works_company_id',
    'parent_company_id',
    'company'
);

UPDATE associated_attrs
SET
  ui_info = jsonb_set(
    ui_info,
    '{Contact}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Contact', '["API"]'::jsonb) || '["API"]'::jsonb
      )
    )
  )
WHERE attr_title IN (
    'source_agent_id',
    'partner_contact_id',
    'primary_email_address',
    'secondary_email_address'
);



UPDATE associated_attrs
SET
  associated_endpoints = jsonb_set( -- setting the following associated_endpoints to have Brand associations within the Endpoints Array
    associated_endpoints,
    '{Endpoints}',
    (COALESCE(associated_endpoints->'Endpoints', '[]'::jsonb) || '["Contact"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN (
    'agent_uuid',
    'moxi_works_agent_id',
    'source_agent_id',
    'partner_contact_id',
    'primary_email_address',
    'secondary_email_address',
    'moxi_works_company_id',
    'parent_company_id',
    'company'
);



UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This value will be null if no data is available for this attribute. You should format this information as first middle last.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'This is the full name of the contact you are creating a Contact record for.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{Company}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Company', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Company"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'contact_name'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This should be a 10 digit phone number.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'This is the phone number that should be used first as a phone contact method, and displays as the primary phone number.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{Company}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Company', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Company"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'primary_phone_number';

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This should be a 10 digit phone number.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'This is the phone number that should be used as an alternate phone contact method, and displays as the alternate phone number.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{Company}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Company', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Company"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'secondary_phone_number';

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This is the unique MoxiWorks Platform ID of the LeadSource that generated this Contact.'))
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
WHERE attr_title = 'moxi_works_lead_source_id';

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This is used to keep track of the original lead source for this Contact record, if different than the lead source associated with the moxi_works_lead_source_id.'))
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
WHERE attr_title = 'original_lead_source';

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This can be male, female, m or f. No matter what is provided in the request, the response payload will return m or f. This value will be null if no data is available for this attribute.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'The gender of the contact.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{Contact}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Contact', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Contact"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'gender'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This value will be null if no data is available for this attribute.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'This is the name used to address the contact when creating mailing labels for the contact associated with this Contact record.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{Contact}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Contact', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Contact"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'label_name'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This value will be null if no data is available for this attribute.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'The contact’s home address street, including number and any suite / apartment number information.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{Contact}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Contact', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Contact"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'home_street_address'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This value will be null if no data is available for this attribute.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'The city of the contact’s home address.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{Contact}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Contact', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Contact"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'home_city'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This value will be null if no data is available for this attribute.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'The state of the contact’s home address.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{Contact}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Contact', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Contact"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'home_state'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This value will be null if no data is available for this attribute.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'The zip code of the contact’s home address.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{Contact}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Contact', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Contact"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'home_zip'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This value will be null if no data is available for this attribute.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'The country of the contact’s home address.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{Contact}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Contact', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Contact"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'home_country'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'If the created Contact record is not for a lead set this to true. By default this is false.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{Contact}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Contact', '[]'::jsonb) || '["API"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Contact"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'is_not_lead'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'If the created Contact record should be treated as a lead but it is not desired that the agent should receive an email or text that they have received a lead.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{Contact}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Contact', '[]'::jsonb) || '["API"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Contact"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'skip_agent_notification'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'The contact’s professional job title.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Engage"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{Contact}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Contact', '[]'::jsonb) || '["Engage"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Contact"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'job_title'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'The contact’s profession.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Engage"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{Contact}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Contact', '[]'::jsonb) || '["Engage"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Contact"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'occupation'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This should be a valid URL for a property of interest within the system that is connecting to the MoxiCloud platform.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'A related property of interest for a contact that can be viewed by the agent.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{Contact}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Contact', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Contact"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'property_url'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This is the MLS ID of the property of interest.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'This is data about a property that the contact has shown interest in (property of interest).'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{Contact}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Contact', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Contact"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'property_mls_id'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This is the MLS ID of the property of interest.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'This is data about a property that the contact has shown interest in (property of interest).'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{Contact}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Contact', '[]'::jsonb) || '["API", "Engage"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Contact"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'property_street_address'; -- Attribute name, ie agent_uuid, email_addresses, etc

END $$;

/*

-- Create
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
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
*/


