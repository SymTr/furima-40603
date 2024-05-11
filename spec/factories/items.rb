FactoryBot.define do
  factory :item do
    item_name { Faker::Commerce.product_name }
    item_detail { Faker::Lorem.sentence }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id { 2 }
    condition_id { 2 }
    delivery_date_id { 2 }
    freight_id { 2 }
    origin_id { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
