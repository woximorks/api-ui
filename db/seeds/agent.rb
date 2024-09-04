agent_attrs = [
#Show
    #--Request
    "agent_uuid", #"String"
    "moxi_works_agent_id", #"String"
    "source_agent_id", #"String"
    "moxi_works_company_id", #"String"
    "parent_company_id", #"String"
    "include_access_level", #"Boolean"
    "include_gci_goals", #"Boolean"
    "include_partners", #"Boolean"
    "include_reviews", #"Boolean"
    #--Response
    "moxi_works_agent_id", #"String"
    "client_agent_id", #"String"
    "mls_agent_id", #"String or null"
    "license", #"String or null"
    "mls_name", #"String or null"
    "mls_abbreviation", #"String or null"
    "agent_id", #"String"
    "moxi_works_office_id", #"String"
    "office_id", #"String"
    "client_office_id", #"String"
    "company_id", #"String"
    "client_company_id", #"String"
    "office_address_street", #"String or null"
    "office_address_street2", #"String or null"
    "office_address_city", #"String or null"
    "office_address_state", #"String or null"
    "office_address_zip", #"String or null"
    "office_mailing_address_street", #"String or null"
    "office_mailing_address_street2", #"String or null"
    "office_mailing_address_city", #"String or null"
    "office_mailing_address_state", #"String or null"
    "office_mailing_address_zip", #"String or null"
    "name", #"String or null"
    "first_name", #"String or null"
    "last_name", #"String or null"
    "nickname", #"String or null"
    "main_phone_number", #"String or null"
    "mobile_phone_number", #"String or null"
    "alt_phone_number", #"String or null"
    "fax_phone_number", #"String or null"
    "office_phone_number", #"String or null"
    "primary_email_address", #"String or null"
    "secondary_email_address", #"String or null"
    "email_addresses", #"Hash" {primary, display, alternate, moxi_sync, lead_routing, zillow}
    "lead_routing_email_address", #"String or null"
    "title", #"String or null"
    "bio", #"Array"
    "designations", #"String or null"
    "uuid", #"String"
    "has_product_access", #"Boolean"
    "has_engage_access", #"Boolean"
    "access_level", #"String"
    "view_level", #"String"
    "teams", #"Array" {name, uuid, member_category}
    "website_base_url", #"String or null"
    "twitter", #"String or null"
    "google_plus", #"String or null"
    "facebook", #"String or null"
    "home_page", #"String or null"
    "profile_image_url", #"String"
    "profile_thumb_url", #"String"
    "region", #"String or null"
    "gci_goal", #"Integer"
    "buyer_commission_rate", #"Float"
    "seller_commission_rate", #"Float"
    "service_area_zip_codes", #"Array"
    "agent_website", #"Array"
    "alternate_offices", #"Array" {moxi_works_office_id, office_id, office_address_street, office_address_street2, office_address_city, office_address_state, office_address_zip, office_phone_number}
    "available_mls", #"Array" {name, display_name, mls_abbreviation, agent_id}
    "partners", #"Array"
    "company_programs", #"Array"
    "source_metadata", #"Array"
    "created_timestamp", #"Integer"
    "deactivated_timestamp", #"Integer or null"
    "profile_visible_online", #"Boolean"
    "user_reviews", #"Array" {source_name, agg_rating, reviews_count}

#Index
    #--Request
    "moxi_works_company_id", #"String"
    "parent_company_id", #"String"
    "moxi_works_office_id", #"String"
    "updated_since", #"Integer"
    "page_number", #"Integer"
    "include_access_level", #"Boolean"
    "deactivated", #"Boolean"
    "deactivated_since", #"Integer"
    "include_partners", #"Boolean"
    "include_company_programs", #"Boolean"
    "include_website", #"Boolean"
    "has_company_programs", #"Boolean"
    "include_reviews", #"Boolean"
    "timestamps_only", #"Boolean"
    "include_bio", #"Boolean"
    #--Response
    "moxi_works_agent_id", #"String"
    "client_agent_id", #"String"
    "mls_agent_id", #"String or null"
    "license", #"String or null"
    "mls_name", #"String or null"
    "mls_abbreviation", #"String or null"
    "agent_id", #"String"
    "moxi_works_office_id", #"String"
    "office_id", #"String"
    "client_office_id", #"String"
    "company_id", #"String"
    "client_company_id", #"String"
    "office_address_street", #"String or null"
    "office_address_street2", #"String or null"
    "office_address_city", #"String or null"
    "office_address_state", #"String or null"
    "office_address_zip", #"String or null"
    "office_mailing_address_street", #"String or null"
    "office_mailing_address_street2", #"String or null"
    "office_mailing_address_city", #"String or null"
    "office_mailing_address_state", #"String or null"
    "office_mailing_address_zip", #"String or null"
    "name", #"String or null"
    "first_name", #"String or null"
    "last_name", #"String or null"
    "nickname", #"String or null"
    "main_phone_number", #"String or null"
    "mobile_phone_number", #"String or null"
    "alt_phone_number", #"String or null"
    "fax_phone_number", #"String or null"
    "office_phone_number", #"String or null"
    "primary_email_address", #"String or null"
    "secondary_email_address", #"String or null"
    "email_addresses", #"Hash" {primary, display, alternate, moxi_sync, lead_routing, zillow}
    "lead_routing_email_address", #"String or null"
    "title", #"String or null"
    "bio", #"Array"
    "designations", #"String or null"
    "uuid", #"String"
    "has_product_access", #"Boolean"
    "has_engage_access", #"Boolean"
    "access_level", #"String"
    "view_level", #"String"
    "teams", #"Array" {name, uuid, member_category}
    "website_base_url", #"String or null"
    "twitter", #"String or null"
    "google_plus", #"String or null"
    "facebook", #"String or null"
    "home_page", #"String or null"
    "profile_image_url", #"String"
    "profile_thumb_url", #"String"
    "region", #"String or null"
    "service_area_zip_codes", #"Array"
    "agent_website", #"Array"
    "alternate_offices", #"Array" {moxi_works_office_id, office_id, office_address_street, office_address_street2, office_address_city, office_address_state, office_address_zip, office_phone_number}
    "available_mls", #"Array" {name, display_name, mls_abbreviation, agent_id}
    "partners", #"Array"
    "company_programs", #"Array"
    "source_metadata", #"Array"
    "created_timestamp", #"Integer"
    "deactivated_timestamp", #"Integer or null"
    "profile_visible_online", #"Boolean"
    "user_reviews", #"Array" {source_name, agg_rating, reviews_count}
]

agent_attrs.each do |attr_title|
    Attr.find_or_create_by!(attr_title: attr_title)
end

agent_attrs.each do |attr_title|
    attr = Attr.find_by(attr_title: attr_title)
    endpoint = Endpoint.find_by(endpoint_title: "Agent")
    associated_attr = AssociatedAttr.find_or_create_by!(attr_id: attr.id, endpoint_id: endpoint.id, product_id: 1)
end