require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "全ての情報が存在する場合、登録できること" do
      expect(@user).to be_valid
    end

    it "ニックネームが空の場合、登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "メールアドレスが空の場合、登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "重複したメールアドレスが存在する場合、登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "メールアドレスに@がない場合、登録できないこと" do
      @user.email = "test"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "パスワードが空の場合、登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "パスワードが6文字以上でない場合、登録できないこと" do
      @user.password = "test1"
      @user.password_confirmation = "test1"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "パスワードが半角英数字混合でない場合、登録できないこと" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password include both letters and numbers")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "名字が空の場合、登録できないこと" do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end

    it "名前が空の場合、登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "名字が全角文字でない場合、登録できないこと" do
      @user.family_name = "test"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name Full-width characters")
    end

    it "名前が全角文字でない場合、登録できないこと" do
      @user.first_name = "test"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name Full-width characters")
    end

    it "名字のフリガナが空の場合、登録できないこと" do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end

    it "名前のフリガナが空の場合、登録できないこと" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "名字のフリガナが全角カタカナでない場合、登録できないこと" do
      @user.family_name_kana = "てすと"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana Full-width katakana characters")
    end

    it "名前のフリガナが全角カタカナでない場合、登録できないこと" do
      @user.first_name_kana = "てすと"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
    end

    it "生年月日が空の場合、登録できないこと" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

  end
end
