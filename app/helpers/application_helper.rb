module ApplicationHelper
    def display_name_for_ui_info_key(key)
      {
        "ActionLog" => "ActionLog products",
        "ActionLogText" => "ActionLog info",
        "APIText" => "API info",
        "RosterText" => "Roster info"
      }[key] || key
    end

    def render_product_association(endpoint, product_name)
        render partial: 'product_association', locals: {
          endpoint: endpoint,
          product_name: product_name
        }
      end
  end
  