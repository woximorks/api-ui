# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

    [
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
        "WebUser"].each do |endpoint_title|
            Endpoint.find_or_create_by!(endpoint_title: endpoint_title)
    end
