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
WHERE attr_title = 'button_font_color';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info,
          '{PresentText}',
          to_jsonb((COALESCE(ui_info->>'PresentText', '') || 'This attribute may contain embedded HTML.'))
          ),
        '{PresentText}',
          to_jsonb((COALESCE(ui_info->>'PresentText', '') || 'Within a presentation, this will be the copyright notice information.'))
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

WHERE attr_title = 'display_name';
WHERE attr_title = 'email_element_background_color';
WHERE attr_title = 'email_background_font_color';
WHERE attr_title = 'image_cma_pdf_logo_header';
WHERE attr_title = 'image_email_logo_alt';
WHERE attr_title = 'image_favicon';
WHERE attr_title = 'image_pres_cover_logo';
WHERE attr_title = 'pres_block_background_color';
WHERE attr_title = 'pres_block_text_color';

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
