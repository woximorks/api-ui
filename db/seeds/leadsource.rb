lead_source_attrs = [
#Index
    #--Request (no data)
    #--Response
    "moxi_works_lead_source_id", #"String"
    "name", #"String"
    "is_partner_alias", #"Boolean"
    "is_partner_default" #"Boolean"
]

lead_source_attrs.each do |attr_title|
    Attr.find_or_create_by!(attr_title: attr_title)
end