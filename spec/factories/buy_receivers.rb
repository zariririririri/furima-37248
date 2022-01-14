FactoryBot.define do
  factory :buy_receiver do
    post_code         { '123-4567' }
    prefecture_id     { 5 }
    city              { '港区' }
    house_number      { '1-1' }
    building     { '東京ハイツ' }
    telephone_number  { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
