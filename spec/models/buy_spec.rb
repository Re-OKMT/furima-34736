require 'rails_helper'

RSpec.describe Buy, type: :model do
  before do
    @buy = FactoryBot.build(:buy)
  end

  context '内容に問題ない場合' do
    it 'moneyとtokenがあれば保存ができること' do
      expect(@money).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'moneyが空では保存ができないこと' do
      @buy.money = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Money can't be blank")
    end

    it 'tokenが空では登録できないこと' do
      @money.token = nil
      @money.valid?
      expect(@money.errors.full_messages).to include("Token can't be blank")
    end
  end
end
