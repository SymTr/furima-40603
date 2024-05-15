FactoryBot.define do
  factory :destination do
    post_code   { "123-4567" }
    origin_id   { 2 } 
    city        { "Tokyo" }
    area_number { "Chuo-ku" }
    building    { "" }
    phone       { "09012345678" }
    association :purchase
  end
end  