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
      it '建物名が空でも購入で着る' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end
    context '商品が購入できない場合' do
      it 'クレジット情報が空白だと購入できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it '郵便番号が空白だと購入できない' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '郵便番号にハイフンが含まれないと購入できない' do
        @purchase_address.post_code = '7000001'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("郵便番号が無効です ハイフンを含めてください")
      end
      it '都道府県が空では投稿できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("都道府県を選択してください")
      end
      it '市区町村が空白だと購入できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it '番地が空白だと購入できない' do
        @purchase_address.street_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("番地を入力してください")
      end
      it '電話番号が空では購入できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it '電話番号に半角数字以外が入力されると購入できない' do
        @purchase_address.phone_number = 'あ09012345678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it '電話番号が9桁以下では購入できない' do
        @purchase_address.phone_number = '012345678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it '電話番号が12桁以上では購入できない' do
        @purchase_address.phone_number = '0901234567811'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'userが紐づいていなければ購入できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'itemが紐づいいていなければ購入できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end
