require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '出品機能' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    it "全ての情報が存在する場合、登録できること" do
      expect(@item).to be_valid
    end

    it "画像が空の場合、登録できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "商品名が空の場合、登録できないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "商品の説明が空の場合、登録できないこと" do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it "カテゴリーの情報が空の場合、登録できないこと" do
      @item.category = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Select")
    end

    it "商品の状態情報が空の場合、登録できないこと" do
      @item.status = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status Select")
    end

    it "配送料の負担情報が空の場合、登録できないこと" do
      @item.shipping_charge = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge Select")
    end

    it "発送元の地域情報が空の場合、登録できないこと" do
      @item.shipping_address = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping address Select")
    end

    it "発送までの日数情報が空の場合、登録できないこと" do
      @item.shipping_date = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping date Select")
    end

    it "価格が空の場合、登録できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "価格の範囲が¥300~¥9,999,999でない場合、登録できないこと" do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end

  end
end
