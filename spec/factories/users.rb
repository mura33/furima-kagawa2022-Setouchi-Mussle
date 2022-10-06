FactoryBot.define do
  factory :user do
    nickname{Faker::Name.initials(number: 2)}
    email{Faker::Internet.free_email}
    password{"aaa111"}
    password_confirmation{password}
    last_name{"やまだ"}
    first_name{"たろう"}
    last_name_kana{"ヤマダ"}
    first_name_kana{"タロウ"}
    birth_date{"1930-01-01"}
  end
end
