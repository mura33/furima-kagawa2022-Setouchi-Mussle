class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_many_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :sales_status
  belongs_to :scheduled_delivery
  belongs_to :shipping_fee_status

  validates :images, :name, :info, presence: true
  validates :images, length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }


  validates :category_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :prefecture_id, numericality: { other_than: 0, message: "を選択してください" }
  validates :sales_status_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :scheduled_delivery_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :shipping_fee_status_id, numericality: { other_than: 1, message: "を選択してください" }

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      presence: { message: "を入力してください" }
  end
end
