module ApplicationHelper
  def display_name_for_ui_info_key(key, context)
    ui_info_labels = {
      "ActionLog" => "ActionLog Products",
      "ActionLogText" => "ActionLog Product Info",
      "Agent" => "Agent Products",
      "APIText" => "API Product Info",
      "Brand" => "Brand Products",
      "BuyerTransaction" => "BuyerTransaction Products",
      "Company" => "Company Products",
      "EngageText" => "Engage Product Info",
      "Products" => "All Product Associations",
      "PresentText" => "Present Product Info",
      "RosterText" => "Roster Product Info",
      "WebsitesText" => "Websites Product Info"
    }
    
    request_type_labels = {
      "ActionLog" => "ActionLog",
      "Agent" => "Agent",
      "Brand" => "Brand",
      "BuyerTransaction" => "BuyerTransaction",
      "Company" => "Company",
      "Contact" => "Contact",
      "EmailCampaign" => "EmailCampaign",
      "Event" => "Event",
      "Gallery" => "Gallery",
      "Group" => "Group",
      "LeadSource" => "LeadSource",
      "Listing" => "Listing",
      "Office" => "Office",
      "PresentationLog" => "PresentationLog",
      "SoldListing" => "SoldListing",
      "Task" => "Task",
      "Team" => "Team",
      "WebUser" => "WebUser"
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