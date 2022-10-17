FactoryBot.define do
  factory :order_address do
    prefecture_id { '1' }
    postal_code { '123-4567' }
    city { '東京都' }
    addresses { '1-1' }
    building { '東京ハイツ' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
