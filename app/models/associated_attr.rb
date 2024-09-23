class AssociatedAttr < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search, 
  against: :ui_info,
  associated_against: {
    endpoint: :endpoint_title,
    attr: :attr_title,
    product: :product_title
  }
end
