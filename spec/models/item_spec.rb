require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
   @item = FactoryBot.build(:item)
  end

  describe '商品登録情報' do
    context '商品の出品ができない場合' do
     it "商品名が空では登録できない" do
       @item.items_name = ""
       @item.valid?
       expect(@item.errors.full_messages).to include "Items name can't be blank"
      end

      it "商品の説明文が空では登録できない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end

      it "カテゴリーが空では登録できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it "商品の状態が空では登録できない" do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end

      it "配送料の負担が空では登録できない" do
        @item.pay_for_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Pay for can't be blank"
      end

      it "発送元の地域が空では登録できない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end

      it "発送までの日数が空では登録できない" do
        @item.ship_day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Ship day can't be blank"
      end

      it "販売価格が空では登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it "販売価格は半角数値でないと登録できない" do
        @item.price = "お金"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end

      it "販売価格は300円以上でないと登録できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be in 300..9999999"
      end

      it "販売価格は9999999円以下でないと登録できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be in 300..9999999"
      end

      it "userが紐付いていないと保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

    end

    context '商品の出品ができる場合' do
      it 'item_name,description,category_id,condition_id,pay_for_id,prefecture_id,priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
  end
end
