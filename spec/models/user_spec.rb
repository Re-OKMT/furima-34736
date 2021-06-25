require 'rails_helper'

RSpec.describe User, type: :model do
  before do   # それぞれのテストコードを実行する前に、セットアップを行うことができる(まとめる)
    @user = FactoryBot.build(:user) # 変数userが、@userに置き換わっている(インスタンス生成)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        expect(@user.valid?).to eq true
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = '' # emailの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに@が含まれていない場合登録できない' do
        @user.email = 'hogehuga.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = '' # passwordの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      
      it 'passwordが半角数字のみの場合は登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      
      it 'passwordが半角英字のみの場合は登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordが全角の場合は登録できない' do
        @user.password = "ああああああ"
        @user.password_confirmation = "ああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "family_nameが空だと登録できない" do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank", "Family name is invalid")
      end

      it "first_nameが空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
      end

      it "kana_family_name が空だと登録できない" do
        @user.kana_family_name  = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana family name can't be blank", "Kana family name is invalid")
      end

      it "kana_first_nameが空だと登録できない" do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank", "Kana first name is invalid")
      end

      it "family_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.family_name = "zenkaku"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end

      it "first_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.first_name = "zenkaku"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it "kana_family_nameは全角（カタカナ）でなければ登録できない" do
        @user.kana_family_name = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana family name is invalid")
      end
      
      it "kana_first_nameは全角（カタカナ）でなければ登録できない" do
        @user.kana_first_name = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name is invalid")
      end

      it '生年月日が空だと登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
