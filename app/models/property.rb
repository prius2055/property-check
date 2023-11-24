class Property < ApplicationRecord
    has_many :inspections, dependent: :destroy
end
