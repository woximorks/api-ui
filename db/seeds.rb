# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

########################################################################################
actionlog_attrs = [
#Create
    #--Request
    "agent_uuid", #"String"
    "moxi_works_agent_id", #"String"
    #--Response--
    "agent_uuid", #"String"
    "moxi_works_agent_id",* #"String"

#Delete
    #--Request
    "moxi_works_action_log_id", #"String"
    "agent_uuid", #"String"
    #--Response--
    "status", #"String"
    "deleted", #"String"

#Index
    #--Request
    "agent_uuid", #"String"
    "moxi_works_agent_id", #"String"
    #--Response
    "agent_uuid", #"String"
    "moxi_works_agent_id" #"String"
]

actionlog_attrs.each do |attr_title|
    Attr.find_or_create_by!(attr_title: attr_title)
end

########################################################################################
agent_attrs = [
#Show
    #--Request
    "agent_uuid", #"String"
    "moxi_works_agent_id", #"String"
    #--Response
    "moxi_works_agent_id", #"String"
    "client_agent_id", #"String"

#Index
    #--Request
    "moxi_works_company_id", #"String"
    "parent_company_id", #"String"
    #--Response
    "moxi_works_agent_id", #"String"
    "client_agent_id" #"String"
]

agent_attrs.each do |attr_title|
    Attr.find_or_create_by!(attr_title: attr_title)
end

########################################################################################
endpoints = [
    "ActionLog",
    "Agent",
    "Brand",
    "BuyerTransaction",
    "Company",
    "Contact",
    "EmailCampaign",
    "Event",
    "Gallery",
    "Group",
    "LeadSource",
    "Listing",
    "Office",
    "PresentationLog",
    "SellerTransaction",
    "SoldListing",
    "Task",
    "Team",
    "WebUser"
]

endpoints.each do |endpoint_title|
    Endpoint.find_or_create_by!(endpoint_title: endpoint_title)
end

########################################################################################
products = [
    "Roster",
    "Engage"
]

products.each do |product_title|
    Product.find_or_create_by!(product_title: product_title)
end