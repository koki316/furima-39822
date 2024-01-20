require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:user)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
  end

describe '配送先情報' do
  context '商品の購入ができない場合' do
    it "郵便番号が空では購入できない" do
      @purchase_address.postcode = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Postcode can't be blank"
    end

    it "郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと" do
      @purchase_address.postcode = "1234567"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Postcode is invalid. Include hyphen(-)"
    end

    it "都道府県が初期値では購入できない" do
      @purchase_address.prefecture_id = "1"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Prefecture can't be blank"
    end

    it "市区町村が空では購入できない" do
      @purchase_address.city = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "City can't be blank"
    end

    it "番地が空では購入できない" do
      @purchase_address.street = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Street can't be blank"
    end
   
    it "電話番号が空では購入できない" do
      @purchase_address.tellnumber = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Tellnumber can't be blank"
    end

    it "電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと" do
      @purchase_address.tellnumber = "123456789１０"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Tellnumber is invalid"
    end

    it 'userが紐付いていないと保存できないこと' do
      @purchase_address.user_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("User can't be blank")
    end

    it 'itemが紐付いていないと保存できないこと' do
      @purchase_address.item_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
    end
  end

  context '商品の購入ができる場合' do
    it 'すべての情報存在すれば登録できる' do
      expect(@purchase_address).to be_valid
    end

    it "建物名は任意であること" do
      @purchase_address.building = ""
      expect(@purchase_address).to be_valid
    end

  end
end
end
