require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end

  describe 'クレジット情報、住所の記入' do
    context '内容に問題がない場合' do
      it 'すべての値が正常に登録されていれば保存できる' do
        expect(@order_address).to be_valid
      end

      it 'buildingはからでも登録できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'podtal_codeが空では登録できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号を入力してください")
      end

      it 'podtal_codeにハイフンがなければ登録できない' do
        @order_address.postal_code = '1111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号ハイフンは入れないでください')
      end

      it 'prefecture_idが0では登録できない' do
        @order_address.prefecture_id = '0'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('都道府県は0以外の値にしてください')
      end

      it 'cityが空では登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("市区町村を入力してください")
      end

      it 'addressesが空では登録できない' do
        @order_address.addresses = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("番地を入力してください")
      end

      it 'phone_numberが空では登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を入力してください")
      end

      it 'phone_numberにハイフンがあれば登録できない' do
        @order_address.phone_number = '090-1111-1111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は不正な値です')
      end

      it 'phone_numberが9桁以下では登録できない' do
        @order_address.phone_number = '09011111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は不正な値です')
      end

      it 'phone_numberが12桁以上では登録できない' do
        @order_address.phone_number = '090111111111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は不正な値です')
      end

      it 'phone_numberに半角数字以外が含まれている場合は登録できない' do
        @order_address.phone_number = '090-1111-111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は不正な値です')
      end

      it 'tokenが空では登録できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("カード情報を入力してください")
      end

      it 'user_idが空では登録できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Userを入力してください")
      end

      it 'item_idが空では登録できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end
