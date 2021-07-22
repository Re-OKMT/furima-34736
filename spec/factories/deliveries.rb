FactoryBot.define do
  factory :delivery do
    buy { 1 }
    postal_code  { '111-1111' }
    area_id      { 1 }
    municipality { '見本市' }
    address      { '見本町' }
    building_name { '見本ビルディング' }
    tel { '11111111111' }
  end
end
