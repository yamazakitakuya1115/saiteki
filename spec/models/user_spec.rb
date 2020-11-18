require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do

    it '全ての項目を正しく入力していれば登録ができる' do
      expect(@user).to be_valid
    end

    it 'アイコン画像は無くても登録ができる' do
      @user.image = nil
      expect(@user).to be_valid
    end

    it 'アカウント名が空欄だと登録できない' do
      @user.account = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("アカウント名を入力してください")
    end

    it 'アカウント名が2文字以下だと登録できない' do
      @user.account = "aa"
      @user.valid?
      expect(@user.errors.full_messages).to include("アカウント名は3文字以上で入力してください")
    end

    it 'アカウント名が21文字以上だと登録できない' do
      @user.account = "a"*21
      @user.valid?
      expect(@user.errors.full_messages).to include("アカウント名は20文字以内で入力してください")
    end

    it 'アカウント名に半角英数字以外が使われていると登録できない' do
      @user.account = "abcdefあいうえお"
      @user.valid?
      expect(@user.errors.full_messages).to include("アカウント名が登録できません")
    end

    it '登録済みのアカウントだと登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.account = @user.account
      another_user.valid?
      expect(another_user.errors.full_messages).to include("アカウント名はすでに存在します")
    end

    it '登録済みのアカウントだと大文字小文字が違っても登録できない' do
      @user.account = "taro123"
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.account = "TARO123"
      another_user.valid?
      expect(another_user.errors.full_messages).to include("アカウント名はすでに存在します")
    end

    it 'ユーザー名が空欄だと登録できない' do
      @user.name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("ユーザー名を入力してください")
    end

    it 'ユーザー名が21文字以上だと登録できない' do
      @user.name = "あ"*21
      @user.valid?
      expect(@user.errors.full_messages).to include("ユーザー名は20文字以内で入力してください")
    end

    it 'メールアドレスが空欄だと登録できない' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
    end

    it 'メールアドレスに@が含まれていないと登録できない' do
      @user.email = "tarotest.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("メールアドレスは不正な値です")
    end

    it '登録済みのメールアドレスだと登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("メールアドレスはすでに存在します")
    end

    it '都道府県を選択していないと登録できない' do
      @user.prefecture_id = 0
      @user.valid?
      expect(@user.errors.full_messages).to include("都道府県を選択してください")
    end

    it 'パスワードを入力していないと登録できない' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

    it 'パスワード（確認）を入力していないと登録できない' do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認）とパスワードの入力が一致しません")
    end

    it 'パスワードが5文字以下だと登録できない' do
      @user.password = "12abc"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end

    it 'パスワードは英数混合でないと登録できない' do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
    end

    it 'パスワードとパスワード（確認）が一致していないと登録できない' do
      @user.password = "123abc"
      @user.password_confirmation = "abc123"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認）とパスワードの入力が一致しません")
    end

  end
end