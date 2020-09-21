require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it 'nicknameとemail、passwordとpassword_confirmation、first_name、last_name、first_name_kana、last_name_kana、birth_dayが存在すれば登録できること' do
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it 'nicknameが空では登録できないこと' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it 'emailが空では登録できないこと' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it '重複したemailが存在する場合登録できないこと' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end

        it 'emailに＠が含まれないと保存ができない' do
          @user.email = 'abccom'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end

        it 'passwordが空では登録できないこと' do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'passwordが6文字以上であれば登録できること' do
          @user.password = 'a12345'
          @user.password_confirmation = 'a12345'
          expect(@user).to be_valid
        end

        it 'passwordが半角英数でないと保存できない' do
          @user.password = 'abcdef'
          @user.password_confirmation = 'abcdef'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
        end

        it 'passwordは半角数字のみでは保存できない' do
          @user.password = '111111'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password には英字と数字の両方を含めて設定してください")
        end

        it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'first_nameが空では登録できないこと' do
          @user.first_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank", 'First name 全角文字を使用してください')
        end

        it 'Last_nameが空では登録できないこと' do
          @user.last_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name 全角文字を使用してください')
        end

        it 'first_nameが全角(漢字・ひらがな・カタカナ)であること' do
          @user.first_name = 'furima'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
        end

        it 'Last_nameが全角(漢字・ひらがな・カタカナ)であること' do
          @user.last_name = 'furima'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
        end

        it 'first_name_kanaが空では登録できないこと' do
          @user.first_name_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank", 'First name kana 全角文字を使用してください')
        end

        it 'Last_name_kanaが空では登録できないこと' do
          @user.last_name_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank", 'Last name kana 全角文字を使用してください')
        end

        it 'first_name_kanaがカタカナでなければ登録できないこと' do
          @user.first_name_kana = 'aaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name kana 全角文字を使用してください')
        end

        it 'Last_name_kanaがカタカナでなければ登録できないこと' do
          @user.last_name_kana = 'aaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name kana 全角文字を使用してください')
        end

        it 'birth_dayが空では登録できないこと' do
          @user.birth_day = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth day can't be blank")
        end
      end
    end
  end
end
