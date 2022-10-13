class OrderAddress

  include ActiveModel::Model
  attr_accessor :prefecture_id,:postal_code,:city,:addresses,:phone_number,:building,
                :order_id,:user_id,:item_id,:token

  with_options presence:{  message: "can't be blank" } do
      validates :prefecture_id, numericality: { other_than: 0}
      validates :city    
      validates :addresses
      validates :token, presence: true
  end    

  validates :order_id, presence: true
  validates :user_id, presence: true
  validates :postal_code,format: { with:/\A\d{3}[-]\d{4}\z/, 
                                  message:"No hyphens are included."}
  validates :phone_number,format: { with: /\A\d{10}$|^\d{11}\z/, 
                                  message:"No hyphens are included"}                      

  def save
    order = Order.create(user_id: user_id,item_id: item_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, address: address, building: building, phone_number: phone_number, order_id: order_id)
  end

end