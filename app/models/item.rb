class Item < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :sales_status
  belongs_to :scheduled_delivery
  belongs_to :shipping_fee_status


  validates :image, :name, :info, presence: true

  validates :category_id, :prefecture_id, :sales_status_id, :scheduled_delivery_id, :shipping_fee_status_id, numericality: { other_than: 1 , message: "can't be blank" }

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to:300, less_than_or_equaal_to: 9_999_999},
                    presence: { message: "can't be blank"}
  end
end
