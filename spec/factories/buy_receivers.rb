FactoryBot.define do
  factory :buy_receiver do
    post_code         { '123-4567' }
    prefecture_id     { 5 }
    city              { '東京都' }
    house_number      { '1-1' }
    building_name     { '東京ハイツ' }
    telephone_number  { '09012345678' }
  end
end
