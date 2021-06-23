require 'rails_helper'

RSpec.describe User, type: :model do
  before do   # それぞれのテストコードを実行する前に、セットアップを行うことができる(まとめる)
    @user = FactoryBot.build(:user) # 変数userが、@userに置き換わっている(インスタンス生成)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
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
        # binding.pry
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
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

      # it 'passwordが半角英数字混同でなければ登録できない' do
      #  @user.password = "aaaaaa"
      #  @user.valid?
      #  expect(@user.errors.full_messages).to include("Password include both letters and numbers")
      # end

      # it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      #  @user.password_confirmation = ''
      #  @user.valid?
      #  expect(@user.errors.full_messages).to include ("Password_confirmation can't be blank")
      # end

      # it  'passwordとpassword_confirmation不一致ならば登録できない' do
      #  @user.password = "123456"
      #  @user.password_confirmation = "1234567"
      #  @user.valid?
      #  expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
      # end

      it '生年月日が空だと登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
