FactoryBot.define do
  factory :purchase_address do
      postcode              {Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4)}
      prefecture_id         {Faker::Number.between(from: 2, to: 48)}
      city                  {Faker::Address.city}
      street                {Faker::Address.street_address}
      building              {Faker::Company.name}
      tellnumber            {Faker::Number.leading_zero_number(digits: 11)}
      token                 {"tok_abcdefghijk00000000000000000"}
  end
end
