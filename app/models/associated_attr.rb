class AssociatedAttr < ApplicationRecord
  belongs_to :endpoint
  belongs_to :attr
  belongs_to :product
  include PgSearch::Model
  pg_search_scope :search, against: :ui_info
end
