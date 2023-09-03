require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, item_id: item.id, user_id: user.id)
    sleep(0.1)
  end
  describe '商品の購入' do
    context '商品が購入できる場合' do
      it '商品を購入できる' do
        expect(@purchase_address).to be_valid
      end
    end
    context '商品が購入できない場合' do
      it 'クレジット情報が空白だと購入できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空白だと購入できない' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号にハイフンが含まれないと購入できない' do
        @purchase_address.post_code = '7000001'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '都道府県が空では投稿できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空白だと購入できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空白だと購入できない' do
        @purchase_address.street_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Street number can't be blank")
      end
      it '電話番号が空では購入できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号に半角数字以外が入力されると購入できない' do
        @purchase_address.phone_number = 'あ09012345678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end

    end
  end
end
