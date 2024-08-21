office_attrs = [
#Show
    #--Request
    "moxi_works_office_id", #"String"
    "moxi_works_company_id", #"String"
    "parent_company_id", #"String"

#Index
    #--Request
    "moxi_works_company_id", #"String"
    "parent_company_id", #"String"
    "deactivated", #"Boolean"
    "page_number", #"Integer"
    "deactivated_since", #"Integer"
    "timestamps_only", #"Boolean"
    #--Response
    "page_number", #"Integer"
    "total_pages", #"Integer"
    "offices" #"Array"
]

office_attrs.each do |attr_title|
    Attr.find_or_create_by!(attr_title: attr_title)
end

office_attrs.each do |attr_title|
    attr = Attr.find_by(attr_title: attr_title)
    endpoint = Endpoint.find_by(endpoint_title: "Office")
    associated_attr = AssociatedAttr.find_or_create_by!(attr_id: attr.id, endpoint_id: endpoint.id, product_id: 1)
end