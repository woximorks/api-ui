task_attrs = [
#Create
    #--Request
    "agent_uuid", #"String"
    "moxi_works_agent_id", #"String"
    "source_agent_id", #"String"
    "partner_task_id", #"String"
    "partner_contact_id", #"String"
    "name", #"String"
    "due_at", #"Integer"
    "moxi_works_company_id", #"String"
    "parent_company_id", #"String"
    "duration", #"Integer"
    "description", #"String"
    #--Response
    "agent_uuid", #"String"
    "moxi_works_agent_id", #"String"
    "partner_contact_id", #"String"
    "name", #"String or null"
    "description", #"String or null"
    "due_at", #"Integer"
    "duration", #"Integer or null"
    "status", #"String or null"
    "created_at", #"Integer"
    "completed_at", #"Integer or null"

#Update
    #--Request
    "agent_uuid", #"String"
    "moxi_works_agent_id", #"String"
    "source_agent_id", #"String"
    "partner_task_id", #"String"
    "partner_contact_id", #"String"
    "name", #"String"
    "due_at", #"Integer"
    "moxi_works_company_id", #"String"
    "parent_company_id", #"String"
    "duration", #"Integer"
    "description", #"String"
    #--Response
    "agent_uuid", #"String"
    "moxi_works_agent_id", #"String"
    "partner_contact_id", #"String"
    "name", #"String or null"
    "description", #"String or null"
    "due_at", #"Integer"
    "duration", #"Integer or null"
    "status", #"String or null"
    "created_at", #"Integer"
    "completed_at", #"Integer or null"

#Show
    #--Request
    "agent_uuid", #"String"
    "moxi_works_agent_id", #"String"
    "source_agent_id", #"String"
    "partner_task_id", #"String"
    "partner_contact_id", #"String"
    "moxi_works_company_id", #"String"
    "parent_company_id", #"String"
    #--Response
    "agent_uuid", #"String"
    "moxi_works_agent_id", #"String"
    "partner_contact_id", #"String"
    "partner_task_id", #"String"
    "name", #"String or null"
    "description", #"String or null"
    "due_at", #"Integer"
    "duration", #"Integer or null"
    "status", #"String or null"
    "created_at", #"Integer"
    "completed_at", #"Integer or null"

#Index
    #--Request
    "agent_uuid", #"String"
    "moxi_works_agent_id", #"String"
    "source_agent_id", #"String"
    "moxi_works_company_id", #"String"
    "parent_company_id", #"String"
    "due_date_start", #"Integer"
    "due_date_end", #"Integer"
    "partner_contact_id", #"String"
    "page_number", #"Integer"
    #--Response
    "page_number", #"Integer"
    "total_pages", #"Integer"
    "tasks" #"Array"
]

task_attrs.each do |attr_title|
    Attr.find_or_create_by!(attr_title: attr_title)
end

task_attrs.each do |attr_title|
    attr = Attr.find_by(attr_title: attr_title)
    endpoint = Endpoint.find_by(endpoint_title: "Task")
    associated_attr = AssociatedAttr.find_or_create_by!(attr_id: attr.id, endpoint_id: endpoint.id, product_id: 1)
end