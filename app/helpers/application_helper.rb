module ApplicationHelper
    def display_name_for_ui_info_key(key)
      {
        "ActionLog" => "ActionLog Products",
        "ActionLogText" => "ActionLog Info",
        "Agent" => "Agent Products",
        "APIText" => "API Info",
        "RosterText" => "Roster Info",
        "WebsitesText" => "Websites Info"
      }[key] || key
    end

    def render_product_association(endpoint, product_name)
        render partial: 'product_association', locals: {
          endpoint: endpoint,
          product_name: product_name
        }
      end
  end
  