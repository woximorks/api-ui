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
    'parent_company_id'
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
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This attribute can be utilized if you have data about a property that this contact has shown interest in (property of interest).'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'This is the street address of the property of interest, including number and suite/apartment number information.'))
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

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This attribute can be utilized if you have data about a property that this contact has shown interest in (property of interest).'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'This is the city in which the property of interest exists.'))
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
WHERE attr_title = 'property_city'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This attribute can be utilized if you have data about a property that this contact has shown interest in (property of interest).'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'This is the state or province in which the property of interest exists.'))
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
WHERE attr_title = 'property_state'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This attribute can be utilized if you have data about a property that this contact has shown interest in (property of interest).'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'This is the postal code in which the property of interest exists.'))
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
WHERE attr_title = 'property_zip'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This attribute can be utilized if you have data about a property that this contact has shown interest in (property of interest).'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'This is the number of bedrooms in the property of interest.'))
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
WHERE attr_title = 'property_beds'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This attribute can be utilized if you have data about a property that this contact has shown interest in (property of interest).'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'This is the number of bathrooms in the property of interest.'))
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
WHERE attr_title = 'property_baths'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This attribute can be utilized if you have data about a property that this contact has shown interest in (property of interest).'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'This is the list price of the property of interest.'))
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
WHERE attr_title = 'property_list_price'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This attribute can be utilized if you have data about a property that this contact has shown interest in (property of interest). This can be any arbitrary string, but for best results, this should be a state like Active, Pending, Sold, Cancelled or any other human readable state that would be useful when presented to the agent.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'This is the listing status of the property of interest.'))
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
WHERE attr_title = 'property_listing_status'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This attribute can be utilized if you have data about a property that this contact has shown interest in (property of interest). This must be a valid URL to an image'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'This is the URL to an image displaying the property of interest.'))
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
WHERE attr_title = 'property_photo_url'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This attribute can be utilized if you have data about listing searches that this contact has performed.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'The city / locale used in the listing search criteria.'))
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
WHERE attr_title = 'search_city'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This attribute can be utilized if you have data about listing searches that this contact has performed.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'The state / region used in the listing search criteria.'))
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
WHERE attr_title = 'search_state'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This attribute can be utilized if you have data about listing searches that this contact has performed.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'The zip / postal code used in the listing search criteria.'))
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
WHERE attr_title = 'search_zip'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This attribute can be utilized if you have data about listing searches that this contact has performed.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'The minimum bathrooms used in the listing search criteria.'))
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
WHERE attr_title = 'search_min_baths'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This attribute can be utilized if you have data about listing searches that this contact has performed.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'The minimum bedrooms used in the listing search criteria.'))
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
WHERE attr_title = 'search_min_beds'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This attribute can be utilized if you have data about listing searches that this contact has performed.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'The minimum price used in the listing search criteria.'))
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
WHERE attr_title = 'search_min_price'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This attribute can be utilized if you have data about listing searches that this contact has performed.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'The maximum price used in the listing search criteria.'))
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
WHERE attr_title = 'search_max_price'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This attribute can be utilized if you have data about listing searches that this contact has performed.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'The minimum square feet of the total living area used in the listing search criteria.'))
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
WHERE attr_title = 'search_min_sq_ft'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This attribute can be utilized if you have data about listing searches that this contact has performed.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'The maximum square feet of the total living area used in the listing search criteria.'))
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
WHERE attr_title = 'search_max_sq_ft'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This attribute can be utilized if you have data about listing searches that this contact has performed.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'The minimum lot size used in the listing search criteria.'))
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
WHERE attr_title = 'search_min_lot_size'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This attribute can be utilized if you have data about listing searches that this contact has performed.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'The maximum lot size used in the listing search criteria.'))
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
WHERE attr_title = 'search_max_lot_size'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This attribute can be utilized if you have data about listing searches that this contact has performed.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'The minimum allowable year built used in the listing search criteria.'))
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
WHERE attr_title = 'search_min_year_built'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This attribute can be utilized if you have data about listing searches that this contact has performed.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'The maximum allowable year built used in the listing search criteria.'))
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
WHERE attr_title = 'search_max_year_built'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This attribute can be utilized if you have data about listing searches that this contact has performed. This can be any arbitrary human readable string, but using recognized property types such as Condo, Single-Family, Townhouse, Land, Multifamily will provide more value to the agent.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'The property types used in the listing search criteria.'))
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
WHERE attr_title = 'search_property_types'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'Agent created notes are not reflected in this attribute. This is a string which reflects the partner created notes. Any Notes added here will be displayed to the agent in an Activity Log record. Any HTML formatting included will be stripped from the note attribute’s data. This value will be null if no data is available for this attribute. This text field is limited to 3k.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'Partner created notes that display within the Activity Log.'))
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
WHERE attr_title = 'note'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'Websites should be submitted as a json array of objects. Each object should include website prioritized ‘rank’ and ‘value’. The number of website fields available for update for a given Contact record depends on the agent email client type.'))
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
WHERE attr_title = 'websites'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'UNIX Timestamp.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'This represents the Special Date - birthday for the associated contact.'))
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
WHERE attr_title = 'birthday'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'Comma separated list, UNIX Timestamps.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'This represents the Special Date(s) - house-iversary for the associated contact.'))
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
WHERE attr_title = 'home_purchase_anniversaries'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'This represents the spouse or partner associated with the contact record.'))
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
WHERE attr_title = 'spouse_or_partner'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
        '{APIText}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'A comma separated string of the agent’s mail server categories / groups in which the Contact exists or will be placed.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'Related to groups in Engage, and will also correspond to the synced email account’s groups or categories.'))
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
WHERE attr_title = 'category_names'; -- Attribute name, ie agent_uuid, email_addresses, etc

UPDATE associated_attrs -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
        jsonb_set(
          ui_info, -- The corresponding column name of the field to be updated
      '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'The name of the company associated with the Contact record.'))
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
WHERE attr_title = 'company'; -- Attribute name, ie agent_uuid, email_addresses, etc

END $$;


