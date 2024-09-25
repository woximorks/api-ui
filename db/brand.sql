DO $$
BEGIN

UPDATE associated_attrs
SET
  ui_info = jsonb_set(
    ui_info,
    '{Brand}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Brand', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  )
WHERE attr_title IN ( -- setting the following associated_attrs to have API and Roster associations within the Brand Array of ui_info
  'moxi_works_company_id',
  'parent_company_id'
);

UPDATE associated_attrs
SET
  associated_endpoints = jsonb_set( -- setting the following associated_endpoints to have Brand associations within the Endpoints Array
    associated_endpoints,
    '{Endpoints}',
    (COALESCE(associated_endpoints->'Endpoints', '[]'::jsonb) || '["Brand"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN (
    'moxi_works_company_id',
    'parent_company_id'
);
UPDATE associated_attrs
SET
  request_type = jsonb_set(
    request_type,
    '{Brand}',
    (COALESCE(request_type->'Brand', '[]'::jsonb) || '["Show Request"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN ( -- setting the following associated_attrs -> request_type to contain "Show Request"
    'moxi_works_company_id',
    'parent_company_id'
);

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
        '{PresentText}',
          to_jsonb((COALESCE(ui_info->>'PresentText', '') || 'This is the logo associated with the Brokerage or Company.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Present"]'::jsonb
        )
      )
    ),
    '{Brand}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Brand', '[]'::jsonb) || '["Present"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Brand"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'image_logo';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'Accent color.'))
      ), 
        '{PresentText}',
          to_jsonb((COALESCE(ui_info->>'PresentText', '') || 'Within a Presentation, this will be the accent color.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Present"]'::jsonb
        )
      )
    ),
    '{Brand}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Brand', '[]'::jsonb) || '["API", "Present"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Brand"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'cma_authoring_color';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
        '{PresentText}',
          to_jsonb((COALESCE(ui_info->>'PresentText', '') || 'Within a Presentation, this will be the background color of a page.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Present"]'::jsonb
        )
      )
    ),
    '{Brand}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Brand', '[]'::jsonb) || '["Present"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Brand"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'background_color';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
        '{PresentText}',
          to_jsonb((COALESCE(ui_info->>'PresentText', '') || 'Within a Presentation, this is the font color intended to overlay the background_color attribute.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Present"]'::jsonb
        )
      )
    ),
    '{Brand}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Brand', '[]'::jsonb) || '["Present"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Brand"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'background_font_color_primary';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
        '{PresentText}',
          to_jsonb((COALESCE(ui_info->>'PresentText', '') || 'Within a Presentation, this is the background color of associated buttons.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Present"]'::jsonb
        )
      )
    ),
    '{Brand}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Brand', '[]'::jsonb) || '["Present"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Brand"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'button_background_color';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
        '{PresentText}',
          to_jsonb((COALESCE(ui_info->>'PresentText', '') || 'Within a Presentation, this is the font color intended to overlay the button_background_color attribute.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Present"]'::jsonb
        )
      )
    ),
    '{Brand}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Brand', '[]'::jsonb) || '["Present"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Brand"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'button_font_color';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info,
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This attribute may contain embedded HTML.'))
          ),
        '{PresentText}',
          to_jsonb((COALESCE(ui_info->>'PresentText', '') || 'Within a Presentation, this will be the copyright notice information.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Present"]'::jsonb
        )
      )
    ),
    '{Brand}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Brand', '[]'::jsonb) || '["API", "Present"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Brand"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'copyright';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info,
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'Relates to the Brokerage or Company name.'))
          ),
        '{PresentText}',
          to_jsonb((COALESCE(ui_info->>'PresentText', '') || 'Within a Presentation, this is the name of the Brokerage or Company as displayed to the consumer.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Present"]'::jsonb
        )
      )
    ),
    '{Brand}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Brand', '[]'::jsonb) || '["API", "Present"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Brand"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'display_name';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info,
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'This is specific to the background color that displays when sending an email from Present.'))
          ),
        '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'Background color of sent email elements outside of the email body.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Engage", "API"]'::jsonb
        )
      )
    ),
    '{Brand}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Brand', '[]'::jsonb) || '["Engage", "API"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Brand"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'email_element_background_color';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info,
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'Font color intended to overlay email_element_background_color?'))
          ),
        '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'The font color for font that overlays email_element_background_color?'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Engage", "API"]'::jsonb
        )
      )
    ),
    '{Brand}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Brand', '[]'::jsonb) || '["Engage", "API"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Brand"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'email_background_font_color';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info,
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'Brokerage or Company logo shown in Print (PDF) Presentations.'))
          ),
        '{PresentText}',
          to_jsonb((COALESCE(ui_info->>'PresentText', '') || 'Within a Presentation - specifically Print (PDF) format, this will be the Brokerage or Company logo that displays.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Present", "API"]'::jsonb
        )
      )
    ),
    '{Brand}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Brand', '[]'::jsonb) || '["Present", "API"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Brand"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'image_cma_pdf_logo_header';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info,
        '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'Related to sent emails, this will be the Brokerage or Company logo as shown in email header.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Engage"]'::jsonb
        )
      )
    ),
    '{Brand}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Brand', '[]'::jsonb) || '["Engage"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Brand"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'image_email_logo_alt';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info,
          '{PresentText}',
          to_jsonb((COALESCE(ui_info->>'PresentText', '') || 'Within a presentation, this will be the favicon that displays related to the Brokerage or Company.'))
          ),
        '{WebsitesText}',
          to_jsonb((COALESCE(ui_info->>'WebsitesText', '') || 'Favicon of Brokerage or Company.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Present", "Websites"]'::jsonb
        )
      )
    ),
    '{Brand}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Brand', '[]'::jsonb) || '["Present", "Websites"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Brand"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'image_favicon';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info,
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'Brokerage or Company logo for web view presentations.'))
          ),
        '{PresentText}',
          to_jsonb((COALESCE(ui_info->>'PresentText', '') || 'Within a Presentation - specifically web view, this will be the Brokerage or Company logo.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Present"]'::jsonb
        )
      )
    ),
    '{Brand}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Brand', '[]'::jsonb) || '["API", "Present"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Brand"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'image_pres_cover_logo';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info,
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'Block element background color for web view presentations.'))
          ),
        '{PresentText}',
          to_jsonb((COALESCE(ui_info->>'PresentText', '') || 'Within a Presentation - specifically web view, this is the background color that displays.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Present"]'::jsonb
        )
      )
    ),
    '{Brand}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Brand', '[]'::jsonb) || '["API", "Present"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Brand"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'pres_block_background_color';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info,
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'Font color intended to overlay pres_block_background_color attribute.'))
          ),
        '{PresentText}',
          to_jsonb((COALESCE(ui_info->>'PresentText', '') || 'Within a Presentation - specifically web view, this is the font color for related text.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Present"]'::jsonb
        )
      )
    ),
    '{Brand}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Brand', '[]'::jsonb) || '["API", "Present"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Brand"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'pres_block_text_color';

UPDATE associated_attrs
SET
  request_type = jsonb_set(
    request_type,
    '{Brand}',
    (COALESCE(request_type->'Brand', '[]'::jsonb) || '["Show Response"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN ( -- setting the following associated_attrs -> request_type to contain "Show Repsonse"
    'image_logo',
    'cma_authoring_color',
    'background_color',
    'background_font_color_primary',
    'button_background_color',
    'button_font_color',
    'copyright',
    'display_name',
    'email_element_background_color',
    'email_background_font_color',
    'image_cma_pdf_logo_header',
    'image_email_logo_alt',
    'image_favicon',
    'image_pres_cover_logo',
    'pres_block_background_color',
    'pres_block_text_color'
);

UPDATE associated_attrs
SET
  ui_info = jsonb_set(
    ui_info,
    '{Brand}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Brand', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  )
WHERE attr_title IN ( -- setting the following associated_attrs to have API and Roster associations within the Brand Array of ui_info
  'moxi_works_company_id',
  'agent_uuid',
  'moxi_works_agent_id',
  'source_agent_id',
  'moxi_works_office_id',
  'office_id',
  'parent_company_id'
);

UPDATE associated_attrs
SET
  associated_endpoints = jsonb_set( -- setting the following associated_endpoints to have Brand associations within the Endpoints Array
    associated_endpoints,
    '{Endpoints}',
    (COALESCE(associated_endpoints->'Endpoints', '[]'::jsonb) || '["Brand"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN (
  'moxi_works_company_id',
  'agent_uuid',
  'moxi_works_agent_id',
  'source_agent_id',
  'moxi_works_office_id',
  'office_id',
  'parent_company_id'
);
UPDATE associated_attrs
SET
  request_type = jsonb_set(
    request_type,
    '{Brand}',
    (COALESCE(request_type->'Brand', '[]'::jsonb) || '["Index Request"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN (
  'moxi_works_company_id',
  'agent_uuid',
  'moxi_works_agent_id',
  'source_agent_id',
  'moxi_works_office_id',
  'office_id',
  'parent_company_id'
);

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info,
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'Human readable string identifying the brand.'))
          ),
        '{PresentText}',
          to_jsonb((COALESCE(ui_info->>'PresentText', '') || 'This will be the name that displays related to the associated Brand.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Present"]'::jsonb
        )
      )
    ),
    '{Brand}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Brand', '[]'::jsonb) || '["API", "Present"]'::jsonb
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["Brand"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'name';

UPDATE associated_attrs
SET
  request_type = jsonb_set(
    request_type,
    '{Brand}',
    (COALESCE(request_type->'Brand', '[]'::jsonb) || '["Index Response"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
  WHERE attr_title IN (
    'name', -- !!!
    'image_logo',
    'cma_authoring_color',
    'background_color',
    'background_font_color_primary',
    'button_background_color',
    'button_font_color',
    'copyright',
    'display_name',
    'email_element_background_color',
    'email_background_font_color',
    'image_cma_pdf_logo_header',
    'image_email_logo_alt',
    'image_favicon',
    'image_pres_cover_logo',
    'pres_block_background_color',
    'pres_block_text_color'
  );
END $$;