require 'rails_helper'

# RSpec.describe Item, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it 'name,info,price,category_id,sales_status_id,shipping_fee_status_id,prefecture_id,scheduled_delivery_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'infoが空では登録できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it 'category_idが１では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it 'sales_status_idが１では登録できない' do
        @item.sales_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end
      it 'shipping_fee_status_idが１では登録できない' do
        @item.shipping_fee_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end
      it 'prefecture_idが0では登録できない' do
        @item.prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
      end
      it 'scheduled_delivery_idが1では登録できない' do
        @item.scheduled_delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end
      it 'priceが300円以下では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
      end
      it 'priceが9,999,999円以上では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は9999999以下の値にしてください')
      end
      it '値段が半角数字以外では登録できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end
      it '商品画像が空では出品出来ない' do
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
