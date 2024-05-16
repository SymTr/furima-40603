FactoryBot.define do
  factory :purchase_destination do
    post_code { '123-4567' }
    origin_id { 2 }
    city { 'Yokohama' }
    area_number { 'Minato Mirai 1-1-1' }
    building { 'Yokohama Landmark Tower' }
    phone { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
