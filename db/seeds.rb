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

#Products
products = [
    "test"
=begin
    "ActivePipe",
    "Roster",
    "Engage",
    "Websites",
    "Promote",
    "Present",
    "Impress",
    "Balance",
    "Stellar",
    "API",
    "Email",
    "Syndication"
=end
    ]

products.each do |product_title|
    Product.find_or_create_by!(product_title: product_title)
end

Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |seed|
    load seed
end

user = User.where(email: "test@test.com").first_or_initialize
user.update!(
    password: "password",
    password_confirmation: "password"
)

