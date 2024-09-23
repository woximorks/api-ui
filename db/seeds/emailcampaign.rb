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
    AssociatedAttr.find_or_create_by(attr_title: attr_title) do |attr|
      # Set other attributes if necessary, for example:
      attr.request_type = {}
      attr.associated_endpoint = {}
    end
  end