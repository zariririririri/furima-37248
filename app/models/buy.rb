class Buy < ApplicationRecord
  has_one :receiver
  belongs_to :product
end