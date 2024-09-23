/*
UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}', 
          -- Append new text to the existing 'APIText' or create it if it doesn't exist
          to_jsonb((COALESCE(ui_info->>'APIText', '') || ' Some additional text to append.'))
        ), 
        '{RosterText}', 
          -- Append new text to the existing 'RosterText2' or create it if it doesn't exist
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || ' Other additional text to append.'))
      ), 
      '{Products}', 
      -- Ensure new products are added without duplicating existing ones
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["API", "Roster", "Engage"]'::jsonb
        )
      )
    ),
    '{Agent}', 
    -- Ensure new UI associations are added without duplicating existing ones
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["API", "Roster", "Engage"]'::jsonb
      )
    )
  ),
  associated_endpoint = jsonb_set(
    associated_endpoint,
    '{Endpoints}', 
    -- Add 'Agent' to the existing 'Endpoints' array, skipping duplicates
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(associated_endpoint->'Endpoints', '[]'::jsonb) || '["Agent"]'::jsonb
      )
    )
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = 'agent_uuid';

*/

UPDATE associated_attrs
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          ui_info, 
          '{APIText}', 
          -- Append new text to the existing 'APIText' or create it if it doesn't exist
          to_jsonb((COALESCE(ui_info->>'APIText', '') || 'To include access level information for the agent in the response, pass true.'))
        ), 
        '{EngageText}', 
          -- Append new text to the existing 'RosterText2' or create it if it doesn't exist
          to_jsonb((COALESCE(ui_info->>'RosterText', '') || 'The Gross Commission Income goal, as seen throughout the Engage UI.'))
      ), 
      '{Products}', 
      -- Ensure new products are added without duplicating existing ones
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["Engage"]'::jsonb
        )
      )
    ),
    '{Agent}', 
    -- Ensure new UI associations are added without duplicating existing ones
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'Agent', '[]'::jsonb) || '["Engage"]'::jsonb
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
    '{Agent}',  -- Specify the path within the JSONB object
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
