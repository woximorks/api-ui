actionlog_attrs = [
#Create
    #--Request
    "agent_uuid", #"String"
    "moxi_works_agent_id", #"String"
    "source_agent_id", #"String"
    "body", #"String"
    "moxi_works_contact_id", #"String"
    "partner_contact_id", #"String"
    "title", #"String"
    "moxi_works_company_id", #"String"
    "parent_company_id", #"String"
    "agent_action", #"String"
    "agent_action_address", #"String"
    "agent_action_address2", #"String"
    "agent_action_city", #"String"
    "agent_action_state", #"String"
    "agent_action_zip", #"String"
    #--Response--
    "agent_uuid", #"String"
    "moxi_works_agent_id",* #"String"
    "body", #"String"
    "moxi_works_contact_id", #"String"
    "partner_contact_id", #"String"
    "timestamp", #"Integer"
    "title", #"String"
    "agent_action", #"String"
    "agent_action_address", #"String"
    "agent_action_address2", #"String"
    "agent_action_city", #"String"
    "agent_action_state", #"String"
    "agent_action_zip", #"String"

#Delete
    #--Request
    "moxi_works_action_log_id", #"String"
    "agent_uuid", #"String"
    "moxi_works_agent_id", #"String"
    "source_agent_id", #"String"
    "moxi_works_company_id", #"String"
    "parent_company_id", #"String"
    #--Response--
    "status", #"String"
    "deleted", #"String"
    "messages", #"Array"

#Index
    #--Request
    "agent_uuid", #"String"
    "moxi_works_agent_id", #"String"
    "source_agent_id", #"String"
    "moxi_works_contact_id", #"String"
    "partner_contact_id", #"String"
    "moxi_works_company_id", #"String"
    "parent_company_id", #"String"
    "date_min", #"Integer"
    "date_max", #"Integer"
    #--Response
    "agent_uuid", #"String"
    "moxi_works_agent_id", #"String"
    "moxi_works_contact_id", #"String"
    "partner_contact_id", #"String"
    "actions", #"Array"
]

actionlog_attrs.each do |attr_title|
    Attr.find_or_create_by!(attr_title: attr_title)
end

actionlog_attrs.each do |attr_title|
    attr = Attr.find_by(attr_title: attr_title)
    endpoint = Endpoint.find_by(endpoint_title: "ActionLog")
    product = Product.find_by(product_title: "Unassociated")
    associated_attr = AssociatedAttr.find_or_create_by!(attr_id: attr.id, endpoint_id: endpoint.id, product_id: product.id)
end