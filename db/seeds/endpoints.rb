#Endpoints
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