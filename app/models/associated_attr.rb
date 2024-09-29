class AssociatedAttr < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_title, against: [:attr_title, :ui_info, :associated_endpoints]
end