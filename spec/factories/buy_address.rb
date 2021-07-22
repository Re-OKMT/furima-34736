FactoryBot.define do
  factory :buy_address do
    user_id         { 1 }
    item_id         { 1 }
    postal_code     { '111-1111' }
    area_id         { 1 }
    municipality    { '見本市' }
    address         { '見本町' }
    building_name   {'見本ビルディング'}
    tel             { 11_111_111_111 }
    token           { 'tok_abcdefghijk00000000000000000' }
  end
end
