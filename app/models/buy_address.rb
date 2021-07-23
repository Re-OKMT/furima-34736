class BuyAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :area_id, :municipality, :address, :building_name, :tel, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :area_id, numericality:{ other_than: 0 }
    validates :municipality
    validates :address
    validates :tel, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Delivery.create(buy_id: buy.id, postal_code: postal_code, area_id: area_id, municipality: municipality, address: address,
                    tel: tel, building_name: building_name)
  end
end
