require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての情報が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end
      it 'パスワードが6文字以上、半角英数混合であれば登録できる' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end
      it 'ユーザー名が10文字以下であれば登録できる' do
        @user.name = 'aaaaaaaaaa'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したメールアドレスが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
         another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken", "Email has already been taken")
      end
      it 'メールアドレスに@が含まれていなければ登録できない' do
        @user.email = 'test/example'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスアードが存在してもパスワード再入力が存在しなければ登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードが英字だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'パスワードが数字だけでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'パスワードが5文字以下であれば登録できない' do
        @user.password = 'aaa11'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'ユーザー名が11文字以上でなければ登録できない' do
        @user.name = 'aaaaaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name is too long (maximum is 10 characters)")
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '性別が選択されていなければ登録できない' do
        @user.gender_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Gender must be other than 1")
        end
      it '住所が選択されていなければ登録できない' do
        @user.prefecture_id= 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '職業が選択されていなければ登録できない' do
        @user.job_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Job must be other than 1")
      end
    end
  end
end
