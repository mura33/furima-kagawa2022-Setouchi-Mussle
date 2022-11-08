require 'rails_helper'

# RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'すべての値が正常に登録されていれば保存できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailは＠を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが５文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは128文字以内で入力してください')
      end
      it '英字のみのpasswordでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it '数字のみのpasswordでは登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it '全角文字を含むpasswordでは登録できない' do
        @user.password = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'お名前（姓）が全角以外では登録できない' do
        @user.last_name = 'a1-'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（性）全角文字で入力してください')
      end

      it 'お名前（姓）全角が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（性）を入力してください")
      end
      it 'お名前（名）全角が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（名）を入力してください")
      end

      it 'お名前カナ（姓）全角が空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前カナ（性）を入力してください")
      end
      it 'お名前カナ（名）全角が空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前カナ（名）を入力してください")
      end

      it 'お名前（名）が全角以外では登録できない' do
        @user.first_name = 'a1-'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（名）全角文字で入力してください')
      end
      it 'お名前カナ（姓）が全角以外では登録できない' do
        @user.last_name_kana = 'a1-'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前カナ（性）全角カナ文字で入力してください')
      end
      it 'お名前カナ（名）が全角以外では登録できない' do
        @user.first_name_kana = 'a1-'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前カナ（名）全角カナ文字で入力してください')
      end
      it '生年月日が空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
  #  pending "add some examples to (or delete) #{__FILE__}"
end
