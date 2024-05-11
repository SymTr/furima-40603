FactoryBot.define do
  factory :item do
    item_name {Faker::Commerce.product_name}
    item_detail {Faker::Lorem.sentence}
    price {Faker::Number.between(from: 300, to: 9_999_999)}
  end
end