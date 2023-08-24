require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  it "nicknameが空では登録ができない" do
    user = FactoryBot.build(:user)
    user.nickname = ''
    user.valid?
    expect(user.errors.full_messages).to include "Nickname can't be blank"
  end
  it "passwordが空では登録ができない" do
    user = FactoryBot.build(:user)
    user.password = ''
    user.valid?
    expect(user.errors.full_messages).to include "Password can't be blank"
  end
  it "password_confirmationが空では登録ができない" do
    user = FactoryBot.build(:user)
    user.password_confirmation = ''
    user.valid?
    expect(user.errors.full_messages).to include "Password confirmation can't be blank"
  end
  it "family_nameが空では登録ができない" do
    user = FactoryBot.build(:user)
    user.family_name = ''
    user.valid?
    expect(user.errors.full_messages).to include "Family name can't be blank"
  end
  it "first_nameが空では登録ができない" do
    user = FactoryBot.build(:user)
    user.first_name = ''
    user.valid?
    expect(user.errors.full_messages).to include "First name can't be blank"
  end
  it "family_name_kanaが空では登録ができない" do
    user = FactoryBot.build(:user)
    user.family_name_kana = ''
    user.valid?
    expect(user.errors.full_messages).to include "Family name kana can't be blank"
  end
  it "first_name_kanaが空では登録ができない" do
    user = FactoryBot.build(:user)
    user.first_name_kana = ''
    user.valid?
    expect(user.errors.full_messages).to include "First name kana can't be blank"
  end
  it "birthdayが空では登録ができない" do
    user = FactoryBot.build(:user)
    user.birthday = ''
    user.valid?
    expect(user.errors.full_messages).to include "Birthday can't be blank"
  end
end
