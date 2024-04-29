class EndpointAssociatedAttr < ApplicationRecord
  belongs_to :endpoint
  belongs_to :attr
end
