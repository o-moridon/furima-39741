require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id)
  end

  describe '商品の掲載' do
    context '商品が掲載できる場合' do
      it '商品を掲載できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が掲載できない場合' do
      it '画像が選択されていないと掲載できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it '商品名が空では投稿できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品説明が空では掲載できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品説明文を入力してください")
      end
      it 'カテゴリーが---では掲載できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it '商品の状態が---では掲載できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end
      it '配送料の負担が---では掲載できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end
      it '発送元の地域が---では掲載できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
      end
      it '発送までの日数が---では掲載できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送日の目安を選択してください")
      end
      it '販売価格が空では掲載できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("金額を入力してください")
      end
      it '販売価格に半角数字以外が含まれる場合は掲載できない' do
        @item.price = '１1000'
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は半額数字で入力してください")
      end
      it '販売価格が300円未満では掲載できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("金額が設定範囲外です")
      end
      it '販売価格が1千万円以上では掲載できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("金額が設定範囲外です")
      end
      it '商品名が41文字以上では掲載できない' do
        @item.title = '1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名は40文字以内で入力してください")
      end
      it '商品の説明が1001文字以上では掲載できない' do
        @item.text = '1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品説明文は1000文字以内で入力してください")
      end
      it 'ユーザーが紐づいていない場合は掲載できない' do
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
