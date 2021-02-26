require 'rails_helper'

RSpec.describe "Rooms", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @room = FactoryBot.build(:room)
  end

  context 'チャットルーム新規作成できるとき' do
    it '正しい情報を入力すればチャットルーム新規作成できて、作成したチャットルームに遷移する' do
      # ログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # トップページにチャットルーム作成ページへ遷移するボタンがあることを確認する
      expect(page).to have_content('チャットルームを作成する')
      # チャットルーム作成ページへ遷移する
      visit new_room_path
      # チャットルーム情報を入力する
      fill_in 'ルームのアジェンダを設定', with: @room.agenda
      fill_in 'スタンスA', with: @room.stanceA
      fill_in 'スタンスB', with: @room.stanceB
      # ルーム作成ボタンを押すとルームモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Room.count }.by(1)
      # 入力した情報がチャットルーム内に表示されていることを確認する
      expect(page).to have_content(@room.agenda)
      expect(page).to have_content(@room.stanceA)
      expect(page).to have_content(@room.stanceB)
    end
  end
  context 'チャットルーム新規作成できないとき' do
    it 'ログインしていないとチャットルーム作成ページに遷移できない' do
      # ログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # トップページにチャットルーム作成ページへ遷移するボタンがあることを確認する
      expect(page).to have_content('チャットルームを作成する')
      # チャットルーム作成ページへ遷移する
      visit new_room_path
      # 誤ったチャットルーム情報を入力する
      fill_in 'ルームのアジェンダを設定', with: ''
      fill_in 'スタンスA', with: ''
      fill_in 'スタンスB', with: ''
      # ルーム作成ボタンを押してもルームモデルのカウントは上がらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Room.count }.by(0)
      # チャットルーム作成ページに戻されることを確認する
      expect(current_path).to eq('/rooms')
  end
  end
end
