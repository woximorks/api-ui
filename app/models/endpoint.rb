class Endpoint < ApplicationRecord
    has_many :associated_attrs
    has_many :attrs, through: :associated_attrs
end
