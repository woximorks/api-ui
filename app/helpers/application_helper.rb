module ApplicationHelper
  def display_name_for_ui_info_key(key, context)
    ui_info_labels = {
      "ActionLog" => "ActionLog Products",
      "ActionLogText" => "ActionLog Info",
      "Agent" => "Agent Products",
      "APIText" => "API Info",
      "Brand" => "Brand Products",
      "BuyerTransaction" => "BuyerTransaction Products",
      "Company" => "Company Products",
      "EngageText" => "Engage Info",
      "Products" => "All Product Associations",
      "PresentText" => "Present Info",
      "RosterText" => "Roster Info",
      "WebsitesText" => "Websites Info"
    }
    
    request_type_labels = {
      "ActionLog" => "Request Type - ActionLog",
      "Agent" => "Request Type - Agent",
      "Brand" => "Request Type - Brand",
      "BuyerTransaction" => "Request Type - BuyerTransaction",
      "Company" => "Request Type - Company",
      "Contact" => "Request Type - Contact",
      "EmailCampaign" => "Request Type - EmailCampaign",
      "Event" => "Request Type - Event",
      "Gallery" => "Request Type - Gallery",
      "Group" => "Request Type - Group",
      "LeadSource" => "Request Type - LeadSource",
      "Listing" => "Request Type - Listing",
      "Office" => "Request Type - Office",
      "PresentationLog" => "Request Type - PresentationLog",
      "SoldListing" => "Request Type - SoldListing",
      "Task" => "Request Type - Task",
      "Team" => "Request Type - Team",
      "WebUser" => "Request Type - WebUser"
    }
    
    if context == :ui_info
      ui_info_labels[key] || key
    elsif context == :request_type
      request_type_labels[key] || key
    else
      key
    end
  end

    def render_product_association(endpoint, product_name)
        render partial: 'product_association', locals: {
          endpoint: endpoint,
          product_name: product_name
        }
      end
  end