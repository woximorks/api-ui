email_campaign_attrs = [
#Index
    #--Request
    "agent_uuid", #"String"
    "moxi_works_agent_id", #"String"
    "source_agent_id", #"String"
    "moxi_works_contact_id", #"String"
    "partner_contact_id", #"String"
    "moxi_works_company_id", #"String"
    "parent_company_id", #"String"
    #--Response
    "agent_uuid", #"String"
    "moxi_works_agent_id", #"String"
    "subscription_type", #"String"
    "email_address", #"String"
    "subscribed_at", #"Integer"
    "created_by", #"String"
    "area", #"String"
    "last_sent", #"Integer"
    "next_scheduled", #"Integer"
    "created_at", #"String"
    "unsubscribed_at", #"String"
    "unsubscribed_by", #"String"
    "listed", #"Boolean"
    "sold", #"Boolean"
    "zipcode", #"String"
    "nn_subscription_type", #"String"
    "nn_min_price", #"Integer"
    "nn_max_price", #"Integer"
    "nn_min_beds", #"Integer"
    "nn_max_beds", #"Integer"
    "nn_min_baths", #"Integer"
    "nn_min_sqft", #"Integer"
    "nn_max_sqft", #"Integer"
    "nn_property_type" #"String"
]

email_campaign_attrs.each do |attr_title|
    Attr.find_or_create_by!(attr_title: attr_title)
end

email_campaign_attrs.each do |attr_title|
    attr = Attr.find_by(attr_title: attr_title)
    endpoint = Endpoint.find_by(endpoint_title: "EmailCampaign")
    associated_attr = AssociatedAttr.find_or_create_by!(attr_id: attr.id, endpoint_id: endpoint.id, product_id: 1)
end