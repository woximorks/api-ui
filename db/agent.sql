UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'To include access level information for the agent in the response, pass true'))
        ), 
        '{RosterText}',
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'The access level of the agent. This can return one of the possible access levels, as seen within the products and permissions page.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster"]'::jsonb
      )
    )
  ),
  associated_endpoint = jsonb_set(
    associated_endpoint,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'include_access_level';

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}',
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'Whether to include agent’s GCI goals and commissions data in the response data.'))
        ), 
        '{EngageText}',
          to_jsonb((COALESCE(ui_info->>'EngageText', '') || 'The Gross Commission Income goal, as seen throughout the Engage UI.'))
      ), 
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Engage"]'::jsonb
        )
      )
    ),
    '{Agent}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Engage"]'::jsonb
      )
    )
  ),
  associated_endpoint = jsonb_set(
    associated_endpoint,
    '{Endpoints}',
    '["Agent"]'
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'include_gci_goals';

UPDATE associated_attrs
SET
  request_type = jsonb_set(
    request_type,
    '{Agent}',
    (COALESCE(request_type->'Agent', '[]'::jsonb) || '["Create Request"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN (
  'agent_uuid',
  'moxi_works_agent_id',
  'source_agent_id',
  'moxi_works_company_id',
  'parent_company_id',
  'include_access_level',
  'include_gci_goals',
  'include_partners',
  'include_reviews'
);