FactoryBot.define do
  factory :product do
    name              { '宇佐田 うさ子' }
    explanation       { 'ああああいううううう' }
    category_id       { 2 }
    state_id          { 2 }
    delivery_id       { 2 }
    prefecture_id     { 2 }
    delivery_time_id  { 2 }
    price             { '9999' }
    association :user
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
