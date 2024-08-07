gallery_attrs = [
#Show
    #--Request
    "agent_uuid", #"String"
    "moxi_works_agent_id", #"String"
    "source_agent_id", #"String"
    "moxi_works_company_id", #"String"
    "parent_company_id", #"String"

    #--Response
    "ListingID", #"String"
    "ListOfficeAOR", #"String or null"
    "ListingImages" #"Array"
]

gallery_attrs.each do |attr_title|
    Attr.find_or_create_by!(attr_title: attr_title)
end