require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    @buy_address = FactoryBot.build(:buy_address)
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it '購入情報のデータが全て入力されていれば、購入できること' do
        expect(@buy_address).to be_valid
      end
    end

    context '商品購入できないとき' do
      it '郵便番号が空だと登録できない' do
        @buy_address.postal_code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号にハイフンがないと購入できない' do
        @buy_address.postal_code = '1234567'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Postal code is invalid')
      end

      it '都道府県が空だと登録できない' do
        @buy_address.area_id = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Area can't be blank")
      end

      it '市区町村が空だと登録できない' do
        @buy_address.municipality = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it '番地が空だと登録できない' do
        @buy_address.address = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空だと登録できない' do
        @buy_address.tel = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Tel can't be blank")
      end

      it '電話番号が11桁以内でないと登録できない' do
        @buy_address.tel = 0o0000000000
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Tel is invalid')
      end

      it 'tokenが空では登録できないこと' do
        @buy_address.token = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
