require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
    @user = FactoryBot.build(:user)
  end

  describe 'チャットルーム新規作成' do
    context 'チャットルーム作成できるとき' do
      it '全ての情報が正しく入力されていれば作成できる' do
        @user
        expect(@room).to be_valid
      end
      it 'アジェンダが50文字以下であれば作成できる' do
        @room.agenda = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
        expect(@room).to be_valid
      end
      it 'スタンスAが20文字以下であれば作成できる' do
        @room.stanceA = 'aaaaaaaaaaaaaaaaaaaa'
        expect(@room).to be_valid
      end
      it 'スタンスBが20文字以下であれば作成できる' do
        @room.stanceB = 'aaaaaaaaaaaaaaaaaaaa'
        expect(@room).to be_valid
      end
    end
    context 'チャットルーム作成できないとき' do
      it 'アジェンダが空では作成できない' do
        @room.agenda = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Agenda can't be blank")
      end
      it 'アジェンダが50文字以上では作成できない' do
        @room.agenda = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
        @room.valid?
        expect(@room.errors.full_messages).to include("Agenda is too long (maximum is 50 characters)")
      end
      it 'スタンスAが空では作成できない' do
        @room.stanceA = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Stancea can't be blank")
      end
      it 'スタンスAが20文字以上では作成できない' do
        @room.stanceA = 'aaaaaaaaaaaaaaaaaaaaa'
        @room.valid?
        expect(@room.errors.full_messages).to include("Stancea is too long (maximum is 20 characters)")
      end
      it 'スタンスBが空では登録できない' do
        @room.stanceB = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Stanceb can't be blank")
      end
      it 'スタンスBが20文字以上であれば作成できない' do
        @room.stanceB = 'aaaaaaaaaaaaaaaaaaaaa'
        @room.valid?
        expect(@room.errors.full_messages).to include("Stanceb is too long (maximum is 20 characters)")
      end
      it 'ユーザーIDが空では作成できない' do
        @room.user_id = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
