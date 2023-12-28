require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー情報登録' do
    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが129文字以上では登録できない' do
       @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
       @user.password_confirmation= @user.password
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end

      it 'お名前(全角)は、firstnameがないと登録できない' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end

      it 'お名前(全角)は、firstnameとlastnameがないと登録できない' do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end

      it 'firstnameは全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.firstname = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname is invalid")
      end

      it 'lastnameは全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.lastname = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname is invalid")
      end

      it 'お名前カナ(全角)は、firstname_kanaがないと登録できない' do
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
      end

      it 'お名前カナ(全角)は、lastname_kanaがないと登録できない' do
        @user.lastname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
      end

      it 'firstname_kanaはカタカナでないと登録できない' do
        @user.firstname_kana = 'ひらがな'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana is invalid")
      end

      it 'lastname_kanaはカタカナでないと登録できない' do
        @user.lastname_kana = 'ひらがな'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana is invalid")
      end 

      it 'birtdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

    end

    context '新規登録できる場合' do
      it 'nickname、email、passwordとpassword_confirmation、firstname、lastname、firstname_kana、lastname_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

  end
end
