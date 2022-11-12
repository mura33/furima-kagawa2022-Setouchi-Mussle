class Order < ApplicationRecord
  has_one :address
  belongs_to :user
  belongs_to :item
  belongs_to :card
end
