class OrderAddress
  include ActiveModel::Model
  attr_accessor :prefecture_id, :postal_code, :city, :addresses, :phone_number, :building,
                :user_id, :item_id, :token

  with_options presence: { message: "を入力してください" } do
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :addresses
    validates :token
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/,
                                      message: 'はハイフンを入力してください' }
    validates :phone_number, format: { with: /\A\d{10}$|^\d{11}\z/}
    validates :item_id
    validates :user_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building,
                   phone_number: phone_number, order_id: order.id)
  end
end
