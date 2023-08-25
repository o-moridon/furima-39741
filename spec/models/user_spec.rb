require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context '新規登録できるとき' do
    it '全ての項目を入力すると登録できる' do
      expect(@user).to be_valid
    end
  end
  context '新規登録できないとき' do
    it "nicknameが空では登録ができない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "passwordが空では登録ができない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "family_nameが空では登録ができない" do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it "first_nameが空では登録ができない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "family_name_kanaが空では登録ができない" do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it "first_name_kanaが空では登録ができない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "birthdayが空では登録ができない" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it "重複したemailの場合は登録ができない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "passwordが5文字以下では登録ができない" do
      @user.password = '00000'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "英字のみのpasswordでは登録ができない" do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "数字のみのpasswordでは登録ができない" do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "family_nameに半角が含まれていると登録ができない" do
      @user.family_name = 'a田中'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be half-width characters")
    end
    it "first_nameに半角が含まれていると登録ができない" do
      @user.first_name = '1太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be half-width characters")
    end
    it "family_nameにカナ以外が含まれていると登録ができない" do
      @user.family_name_kana = '田ナカ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be full-width characters")
    end
    it "first_nameにカナ以外が含まれていると登録ができない" do
      @user.first_name_kana = 'タろう'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be full-width characters")
    end
    it "emailに@が含まれない場合は登録ができない" do
      @user.email = 'testtest1234test.jp'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが確認用と一致しない場合は登録ができない" do
      @user.password = 'pa1ss2wo3rd4'
      @user.password_confirmation = 'pass12word34'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end
