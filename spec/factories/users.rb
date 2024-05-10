# FactoryBot.define do
#   factory :user do
#     nick_name { Faker::Name.initials(number: 2) }
#     email                 { Faker::Internet.email }
#     password              { Faker::Internet.password(min_length: 6) }
#     password_confirmation { password }
#   end
# end
FactoryBot.define do
  factory :user do
    nick_name           { Faker::Name.initials(number: 2) }
    email               { Faker::Internet.email }
    password            { 'Abc123' }
    password_confirmation { 'Abc123' }
    first_name          { '太郎' }
    family_name         { '山田' }
    first_name_kana     { 'タロウ' }
    family_name_kana    { 'ヤマダ' }
    birthday            { '2000-01-01' }
  end
end