brand_attrs = [
#Show
    #--Request
    "moxi_works_company_id", #"String"
    "parent_company_id", #String
    #--Response
    "image_logo", #"String"
    "cma_authoring_color", #"String"
    "background_color", #"String"
    "background_font_color_primary", #"String"
    "button_background_color", #"String"
    "button_font_color", #"String"
    "copyright", #"String"
    "display_name", #"String"
    "email_element_background_color", #"String"
    "email_background_font_color", #"String"
    "image_cma_pdf_logo_header", #"String"
    "image_email_logo_alt", #"String"
    "image_favicon", #"String"
    "image_pres_cover_logo", #"String"
    "pres_block_background_color", #"String"
    "pres_block_text_color", #"String"

#Index
    #--Request
    "moxi_works_company_id", #"String"
    "agent_uuid", #"String"
    "moxi_works_agent_id", #"String"
    "source_agent_id", #"String"
    "moxi_works_office_id", #"String"
    "office_id", #"String"
    "parent_company_id", #"String"
    #--Response
    "name", #"String"
    "image_logo", #"String"
    "cma_authoring_color", #"String"
    "background_color", #"String"
    "background_font_color_primary", #"String"
    "button_background_color", #"String"
    "button_font_color", #"String"
    "copyright", #"String"
    "display_name", #"String"
    "email_element_background_color", #"String"
    "email_background_font_color", #"String"
    "image_cma_pdf_logo_header", #"String"
    "image_email_logo_alt", #"String"
    "image_favicon", #"String"
    "image_pres_cover_logo", #"String"
    "pres_block_background_color", #"String"
    "pres_block_text_color" #"String"
]

brand_attrs.each do |attr_title|
    Attr.find_or_create_by!(attr_title: attr_title)
end

brand_attrs.each do |attr_title|
    attr = Attr.find_by(attr_title: attr_title)
    endpoint = Endpoint.find_by(endpoint_title: "Brand")
    associated_attr = AssociatedAttr.find_or_create_by!(attr_id: attr.id, endpoint_id: endpoint.id, product_id: 1)
end