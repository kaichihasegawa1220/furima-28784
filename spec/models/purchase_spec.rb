require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end

describe '商品購入情報の保存' do
    context '購入情報が登録できるとき' do
      it 'building_name以外の全ての項目が入力されていれば保存できること' do
        expect(@user_order).to be_valid
      end
    end

   context '購入情報が登録できないとき' do
      it 'tokenがなければ登録できないこと' do
        @user_order.token = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空では登録できないこと' do
        @user_order.postal_code = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeはハイフン( - )を含むこと' do
        @user_order.postal_code = '1110000'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code is invalid")
      end

      it 'post_codeは半角英数7文字以内で入力すること' do
        @user_order.postal_code = 'あいう-１２３４'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code is invalid")
      end

      it 'shipping_locationが空では登録できないこと' do
        @user_order.shipping_location_id = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Shipping location can't be blank")
      end

      it 'shipping_locationが{ id: 0, name: -- }では登録できないこと' do
        @user_order.shipping_location_id = 0
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Shipping location is reserved")
      end

      it 'cityが空では登録できないこと' do
        @user_order.city = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空では登録できないこと' do
        @user_order.address = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Address can't be blank")
      end

      it 'phonenumberが空では登録できないこと' do
        @user_order.phonenumber = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phonenumber can't be blank")
      end

      it 'phonenumberは11桁以上では登録できないこと' do
        @user_order.phonenumber = '090111122223'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phonenumber is invalid")
      end

      it 'phonenumberは半角数文字で入力すること' do
        @user_order.phonenumber = '０９０１１１１ああああ'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phonenumber is invalid")
      end
    end
  end
end