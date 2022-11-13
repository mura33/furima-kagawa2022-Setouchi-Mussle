require 'rails_helper'

RSpec.describe Card, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @card = FactoryBot.create(:card)
  end

  describe 'カード登録の記入' do
    context '内容に問題がない場合' do
      it 'すべての値が正常に登録されていれば保存できる' do
        expect(@card).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'card_tokenが空では登録できない' do
        @card.card_token = ''
        @card.valid?
        expect(@card.errors.full_messages).to include("Card tokenを入力してください")
      end

      it 'user_idが空では登録できない' do
        @card.user_id = ''
        @card.valid?
        expect(@card.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
