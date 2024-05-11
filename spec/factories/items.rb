FactoryBot.define do
  factory :item do
    item_name {Faker::Commerce.product_name}
    item_detail {Faker::Lorem.sentence}
    price {Faker::Number.between(from: 300, to: 9_999_999)}
    category_id {Category.ids.sample}
    condition_id {Condition.ids.sample}
    delivery_date_id {DeliveryDate.ids.sample}
    freight_id {Freight.ids.sample}
    origin_id {Origin.ids.sample}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end