require 'rails_helper'

RSpec.describe "Posts", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @room = FactoryBot.create(:room)
    @post = FactoryBot.build(:post)
    sleep 0.1
  end
  it '正しい情報を入力すればコメント投稿できる' do
    # ログインする
    visit new_user_session_path
    fill_in 'メールアドレス', with: @user.email
    fill_in 'パスワード', with: @user.password
    find('input[name="commit"]').click
    expect(current_path).to eq(root_path)
    # チャットルームページに遷移する
    visit room_path(@room)
    # スタンスを選択する
    find('label[for=tab_a]', visible: false).click
    # コメント投稿フォームに情報を入力する
    fill_in 'post_post_a', with: @post
    # コメントを送信するとpostモデルのカウントが1上がることを確認する
    expect{
      find('input[name="commit"]').click
    }.to change { Post.count }.by(1)
    # チャットルームにリダイレクトされる
    expect(current_path).to eq(room_path(@room))
    # チャットルームページに投稿したコメントが表示されることを確認する
    expect(page).to have_content @post
  end
end
