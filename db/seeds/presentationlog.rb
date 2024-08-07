presentation_log_attrs = [
#Index
    #--Request
    "moxi_works_company_id", #"String"
    "parent_company_id", #"String"
    "moxi_works_agent_id", #"String"
    "agent_uuid", #"String"
    "source_agent_id", #"String"
    "created_after", #"Integer"
    "created_before", #"Integer"
    "updated_after", #"Integer"
    "updated_before", #"Integer"
    "page_number", #"Integer"
    "include_times", #"Boolean"
    "type", #"String"
    #--Response
    "page_number", #"Integer"
    "total_pages", #"Integer"
    "presentations" #"Array"
]

presentation_log_attrs.each do |attr_title|
    Attr.find_or_create_by!(attr_title: attr_title)
end