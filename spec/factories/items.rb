FactoryBot.define do
  factory :item do
    name { Faker::Name.initials(number: 2) }
    info { 'せつめい'}
    price { '550' }
    category_id { '2' }
    sales_status_id { '2' }
    shipping_fee_status_id { '2' }
    prefecture_id { '2' }
    scheduled_delivery_id { '2' }
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end