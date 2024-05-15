FactoryBot.define do
  factory :purchase do
    association :user
    association :item
    # any other attribute of purchase model goes here...
  end
end