class AssociatedAttr < ApplicationRecord
  belongs_to :endpoint
  belongs_to :attr
  belongs_to :product
end
