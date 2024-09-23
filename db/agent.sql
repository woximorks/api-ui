-- Request
 -- Create Agent array within request_type
 -- Include Show Request within request_type -> Agent array created

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
    -- Ensure new agents are added without duplicating existing ones
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


-- Update to include "Agent" in Endpoints Array 
-- Include the Agent -> ['API', 'Roster'] Array within ui_info
WHERE attr_title = 'moxi_works_agent_id';

WHERE attr_title = 'source_agent_id';
WHERE attr_title = 'moxi_works_company_id';
WHERE attr_title = 'parent_company_id';
WHERE attr_title = 'include_access_level';
WHERE attr_title = 'include_gci_goals';
WHERE attr_title = 'include_partners';
WHERE attr_title = 'include_reviews';

-- Response
WHERE attr_title = 'moxi_works_agent_id';
WHERE attr_title = 'client_agent_id';
WHERE attr_title = 'mls_agent_id';
WHERE attr_title = 'license';
WHERE attr_title = 'mls_name';
WHERE attr_title = 'mls_abbreviation';
WHERE attr_title = 'agent_id';
WHERE attr_title = 'moxi_works_office_id';
WHERE attr_title = 'office_id';
WHERE attr_title = 'client_office_id';
WHERE attr_title = 'company_id';
WHERE attr_title = 'client_company_id';
WHERE attr_title = 'office_address_street';
WHERE attr_title = 'office_address_street2';
WHERE attr_title = 'office_address_city';
WHERE attr_title = 'office_address_state';
WHERE attr_title = 'office_address_zip';
WHERE attr_title = 'office_mailing_address_street';
WHERE attr_title = 'office_mailing_address_street2';
WHERE attr_title = 'office_mailing_address_city';
WHERE attr_title = 'office_mailing_address_state';
WHERE attr_title = 'office_mailing_address_zip';
WHERE attr_title = 'name';
WHERE attr_title = 'first_name';
WHERE attr_title = 'last_name';
WHERE attr_title = 'nickname';
WHERE attr_title = 'main_phone_number';
WHERE attr_title = 'mobile_phone_number';
WHERE attr_title = 'alt_phone_number';
WHERE attr_title = 'office_phone_number';
WHERE attr_title = 'primary_email_address';
WHERE attr_title = 'secondary_email_address';
WHERE attr_title = 'email_addresses';
WHERE attr_title = 'lead_routing_email_address';
WHERE attr_title = 'title';
WHERE attr_title = 'bio';
WHERE attr_title = 'designations';
WHERE attr_title = 'uuid';
WHERE attr_title = 'has_product_access';
WHERE attr_title = 'has_engage_access';
WHERE attr_title = 'access_level';
WHERE attr_title = 'view_level';
WHERE attr_title = 'teams';
WHERE attr_title = 'website_base_url';
WHERE attr_title = 'twitter';
WHERE attr_title = 'google_plus';
WHERE attr_title = 'facebook';
WHERE attr_title = 'home_page';
WHERE attr_title = 'profile_image_url';
WHERE attr_title = 'profile_thumb_url';
WHERE attr_title = 'region';
WHERE attr_title = 'gci_goal';
WHERE attr_title = 'buyer_commission_rate';
WHERE attr_title = 'seller_commission_rate';
WHERE attr_title = 'service_area_zip_codes';
WHERE attr_title = 'agent_website';
WHERE attr_title = 'alternate_offices';
WHERE attr_title = 'available_mls';
WHERE attr_title = 'partners';
WHERE attr_title = 'company_programs';
WHERE attr_title = 'source_metadata';
WHERE attr_title = 'created_timestamp';
WHERE attr_title = 'deactivated_timestamp';
WHERE attr_title = 'profile_visible_online';
WHERE attr_title = 'user_reviews';