require 'rails_helper'

RSpec.describe Item, type: :model do
  before do   # それぞれのテストコードを実行する前に、セットアップを行うことができる(まとめる)
    @item = FactoryBot.build(:item) # 変数itemが、@item置き換わっている(インスタンス生成)
  end

  describe '出品登録' do
    context '新規登録できるとき' do
      it '商品のデータが全て入力されていれば、登録できること' do
        expect(@item.valid?).to eq true
        # expect(@item).to be_valid
      end
    end
    context '新規登録できないとき' do
      it '商品画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品説明が空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態が空だと登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it '配送料の負担が空だと登録できない' do
        @item.pay_shipping_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Pay shipping can't be blank")
      end

      it '発送元地域が空だと登録できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end

      it '発送までの日数が空だと登録できない' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it '販売価格が空だと登録できない' do
        @item.money = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Money can't be blank")
      end

      it '販売価格は¥10,000,000以上であれば登録できない' do
        @item.money = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Money is not included in the list')
      end

      it '販売価格は¥299以下であれば登録できない' do
        @item.money = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Money is not included in the list')
      end

      it '販売価格は半角文字でなければ登録できない' do
        @item.money = '000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Money is not included in the list')
      end
    end
  end
end
