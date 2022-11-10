class Card < ApplicationRecord

  belongs_to :user
  attr_accessor :card_token
  validates :card_token, presence: true
end
