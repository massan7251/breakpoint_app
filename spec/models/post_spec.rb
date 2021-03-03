require 'rails_helper'

RSpec.describe Post, type: :model do
  
  describe '新規投稿できるとき' do
    before do
      @post = FactoryBot.build(:post)
    end
    context 'コメント投稿できるとき' do
      it 'コメントが200文字以下であれば登録できる' do
        @post.post_a = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
        @post.post_b = nil
        expect(@post).to be_valid
      end
      it 'post_aが空かつpost_bにコメントがあれば登録できる' do
        @post.post_a = nil
        expect(@post).to be_valid
      end
      it 'post_bが空かつpost_aにコメントがあれば登録できる' do
        @post.post_b = nil
        expect(@post).to be_valid
      end
    end
    context 'コメント投稿できないとき' do
      it 'コメントが201文字以上であれば登録されない' do
        @post.post_a = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
        @post.post_b = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Post a is too long (maximum is 200 characters)")
      end
      it 'コメントが空では登録されない' do
        @post.post_a = nil
        @post.post_b = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Post a can't be blank", "Post b can't be blank")
      end
      it 'roomが紐づいていないと登録できない' do
        @post.room = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Room must exist")
      end
      it 'userが紐づいていないと登録できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("User must exist")
      end
    end
  end
end
