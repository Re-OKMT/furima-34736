FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association     :user
    name            { Faker::Games::Zelda.item }
    description     { 'サンプル商品説明' }
    category_id     { 1 }
    status_id       { 1 }
    area_id         { 1 }
    pay_shipping_id { 1 }
    money           { Faker::Number.number(digits: 7) }
    shipping_day_id { 1 }
  end
end
