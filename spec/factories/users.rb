FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { '佐藤' }
    first_name            { '加藤' }
    last_name_kana        { 'サトコ' }
    first_name_kana       { 'カトヨ' }
    birthday              { '1931-02-01' }
  end
end
