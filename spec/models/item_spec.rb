require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)    
      @item.image = fixture_file_upload("spec/factories/files/test_image.jpg")
    end


    describe '商品出品機能' do
      context '出品がうまくいくとき' do
        it 'image、name、text、genre_id、condition_id、payment_id、shipping_location_id、shipping_day_id、priceが存在すれば商品出品ができること' do
          expect(@item).to be_valid
        end
      end

      context '出品がうまくいかないとき' do
        it 'imageが空では登録できないこと' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it 'nameが空では登録できないこと' do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it 'textが空では登録できないこと' do
          @item.text = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Text can't be blank")
        end

        it 'genre_idが1では登録できないこと' do
          @item.genre_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Genre must be other than 1")
        end

        it 'condition_idが1では登録できないこと' do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition must be other than 1")
        end

        it 'payment_idが1では登録できないこと' do
          @item.payment_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Payment must be other than 1")
        end

        it 'shipping_location_idが1では登録できないこと' do
          @item.shipping_location_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping location must be other than 1")
        end

        it 'shipping_day_idが1では登録できないこと' do
          @item.shipping_day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
        end

        it 'priceが空では登録できないこと' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end


        it 'priceの値が300円以下では登録できないこと' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price out of setting range")
        end

        it 'priceの値が9,999,999円以上では登録できないこと' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price out of setting range")
        end
      end
    end
  end
end
