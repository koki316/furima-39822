FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 5)}
    email                 {Faker::Internet.email}
    password              {Faker::Alphanumeric.alphanumeric(number: 6)}
    password_confirmation {password}
    firstname             {'山田'}
    lastname              {'太郎'}
    firstname_kana        {'ヤマダ'}
    lastname_kana         {'タロウ'}
    birthday              {'2023-12-25'}
  end
end