team_attrs = [
#Show
    #--Request
    "moxi_works_team_id", #"String"
    "moxi_works_company_id", #"String"
    "parent_company_id", #"String"
    #--Response
    "uuid", #"String"
    "name", #"String or null"
    "email", #"String or null"
    "address1", #"String or null"
    "address2", #"String or null"
    "city", #"String or null"
    "zipcode", #"String or null"
    "state", #"String or null"
    "phone", #"String or null"
    "fax", #"String or null"
    "logo_url", #"String or null"
    "photo_url", #"String or null"
    "description", #"String or null"
    "alt_phone", #"String or null"
    "alt_email", #"String or null"
    "website_url", #"String or null"
    "active", #"Boolean"

#Index
    #--Request
    "moxi_works_company_id", #"String"
    "parent_company_id", #"String"
    #--Response
    "uuid", #"String"
    "name", #"String or null"
    "email", #"String or null"
    "address1", #"String or null"
    "address2", #"String or null"
    "city", #"String or null"
    "zipcode", #"String or null"
    "state", #"String or null"
    "phone", #"String or null"
    "fax", #"String or null"
    "logo_url", #"String or null"
    "photo_url", #"String or null"
    "description", #"String or null"
    "alt_phone", #"String or null"
    "alt_email", #"String or null"
    "website_url", #"String or null"
    "active" #"Boolean"
]

team_attrs.each do |attr_title|
    Attr.find_or_create_by!(attr_title: attr_title)
end

team_attrs.each do |attr_title|
    attr = Attr.find_by(attr_title: attr_title)
    endpoint = Endpoint.find_by(endpoint_title: "Team")
    associated_attr = AssociatedAttr.find_or_create_by!(attr_id: attr.id, endpoint_id: endpoint.id, product_id: 1)
end