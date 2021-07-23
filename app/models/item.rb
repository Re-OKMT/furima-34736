class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :pay_shipping
  belongs_to :shipping_day
  belongs_to :status
  belongs_to :user
  has_one    :buy
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    with_options numericality: { other_than: 0 } do
      validates :category_id
      validates :status_id
      validates :pay_shipping_id
      validates :area_id
      validates :shipping_day_id
    end
    validates :money, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end
end
