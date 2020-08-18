require 'rails_helper'

RSpec.describe ItemTransaction, type: :model do
  describe '購入情報の保存' do
    before do
      @item_transaction = FactoryBot.build(:item_transaction)
    end

    it "すべての値が正しく入力されていれば、保存できること" do
      expect(@item_transaction).to be_valid
    end
    it "建物名が空の場合でも、保存できること" do
      @item_transaction.building_name = nil
      expect(@item_transaction).to be_valid
    end

    it "郵便番号が空の場合、保存できないこと" do
      @item_transaction.zip_code = nil
      @item_transaction.valid?
      expect(@item_transaction.errors.full_messages).to include("Zip code can't be blank")
    end
    it "郵便番号にハイフンが含まれていない場合、保存できないこと" do
      @item_transaction.zip_code = "1234567"
      @item_transaction.valid?
      expect(@item_transaction.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
    end
    it "都道府県情報が未選択の場合、保存できないこと" do
      @item_transaction.shipping_address_id = 1
      @item_transaction.valid?
      expect(@item_transaction.errors.full_messages).to include("Shipping address Select")
    end
    it "市区町村が空の場合、保存できないこと" do
      @item_transaction.city = nil
      @item_transaction.valid?
      expect(@item_transaction.errors.full_messages).to include("City can't be blank")
    end
    it "番地が空の場合、保存できないこと" do
      @item_transaction.address = nil
      @item_transaction.valid?
      expect(@item_transaction.errors.full_messages).to include("Address can't be blank")
    end
    it "電話番号が空の場合、保存できないこと" do
      @item_transaction.phone_number = nil
      @item_transaction.valid?
      expect(@item_transaction.errors.full_messages).to include("Phone number can't be blank")
    end
    it "電話番号が12桁以上の場合、保存できないこと" do
      @item_transaction.phone_number = "090-9999-1111"
      @item_transaction.valid?
      expect(@item_transaction.errors.full_messages).to include("Phone number is invalid")
    end
    
    
  end
end
