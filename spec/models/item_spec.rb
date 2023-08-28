require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
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
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では投稿できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it '商品説明が空では掲載できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'カテゴリーが---では掲載できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が---では掲載できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担が---では掲載できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it '発送元の地域が---では掲載できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数が---では掲載できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it '販売価格が空では掲載できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格に半角数字以外が含まれる場合は掲載できない' do
        @item.price = '１1000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
      it '販売価格が300円未満では掲載できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it '販売価格が1千万円以上では掲載できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it '商品名が41文字以上では掲載できない' do
        @item.title = '1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn'
        @item.valid?
        expect(@item.errors.full_messages).to include("Title is too long (maximum is 40 characters)")
      end
      it '商品の説明が1001文字以上では掲載できない' do
        @item.text = '1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn1234567890-qwertyuiop@asdfghjkl;:zxcvbnm,./123456qwertyuasdfghzxcvbn'
        @item.valid?
        expect(@item.errors.full_messages).to include("Text is too long (maximum is 1000 characters)")
      end
    end
  end
end
