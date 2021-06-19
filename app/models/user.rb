class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname           , presence: true
  validates :email              , presence: true
  validates :encrypted_password , presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は6文字以上かつ英数字をそれぞれ含めてください" }

  with_options presence: true, format: { with: /\A[ぁ-ゔァ-ヴ\p{Ideographic}ａ-ｚＡ-Ｚ０-９]+\z/, message: 'に全角文字を使用してください' } do
    validates :family_name 
    validates :first_name 
    validates :kana_family_name   , presence: true
    validates :kana_first_name    , presence: true
  end

  validates :birthday           , presence: true
  
  has_many :items
  has_many :buys
  
end
