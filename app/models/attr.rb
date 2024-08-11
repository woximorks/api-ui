class Attr < ApplicationRecord
    has_many :associated_attrs
    has_many :endpoints, through: :associated_attrs
end
