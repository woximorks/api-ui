company_attrs = [
#Show
    #--Request
    "moxi_works_company_id", #*
    #--Response
    "moxi_works_company_id", #"String"
    "name", #"String"
    "numeric_id", #"String"
    "client_company_id", #"String"
    "partners", #"Array"
    "public_partner_attrs", #"Hash or null"

#Index
    #--Request (no content)
    #--Response
    "moxi_works_company_id", #"String"
    "name", #"String"
    "numeric_id", #"String"
    "client_company_id", #"String"
    "public_partner_attrs", #"Hash or null"

#Search
    #--Request
    "per_page", #"Integer"
    "page_number", #"Integer"
    "parent_company_id", #"String"
    "show_paging_totals", #"Boolean"
    #--Response
    "name", #"String"
    "numeric_id", #"String"
    "client_company_id", #"String"
    "public_partner_attrs" #"Hash or null"
]

company_attrs.each do |attr_title|
    Attr.find_or_create_by!(attr_title: attr_title)
end

company_attrs.each do |attr_title|
    attr = Attr.find_by(attr_title: attr_title)
    endpoint = Endpoint.find_by(endpoint_title: "Company")
    associated_attr = AssociatedAttr.find_or_create_by!(attr_id: attr.id, endpoint_id: endpoint.id, product_id: 1)
end