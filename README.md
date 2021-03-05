# BreakPoint

BreakPointは「気軽にディベートを楽しむ」がコンセプトの、LINEのオープンチャットに似たディベートアプリです。<br>
ユーザーは自由にチャットルームを作り、または参加して気軽にディベートを楽しむことができます。

# アプリケーション URL
breakPoint [https://breakpoint-84539.herokuapp.com/]

## basic認証ID/PASSWORD
name : admin<br>
password : hfud8365

## テスト用アカウント
email : test@example<br>
password : test123

## BreakPointの使い方

BreakPointではユーザー登録をすることでチャットルームの作成とチャットルームにコメントを投稿する事ができます。<br>
チャットルームには一つのアジェンダとそれに対する2つのスタンスを設定します。
チャットルームではそれぞれのスタンスに分かれてコメントを投稿できます。

# BreakPointのコンセプトについて

ディベートと聞くと「意見を戦わせる」、のような争いのイメージが少なからずあると思います。<br>
しかし、自分とは異なる価値観に触れることは自分自身の考えや人間性を深める上で大きな効果をもたらします。<br>
BreakPointはそんなイメージを文字通りBreakしたいという思いから制作しました。

# 要件定義

*ルーム作成機能
  *コメントや画像を閲覧できるルームの作成
  *ルームにはアジェンダとスタンスを設定する
  *・トップページからルーム作成ボタンを押すことでルーム作成画面に遷移する<br>・ルーム作成画面では、ルームの議題とスタンスを作成する

# 実装した機能のイメージ

# 実装予定の機能

## users テーブル

|Column            |Type   |Options                  |
|------------------|-------|-------------------------|
|email             |string |null: false, unique: true|
|encrypted_password|string |null: false              |
|name              |string |null: false              |
|birthday          |date   |null: false              |
|gender_id         |integer|null: false              |
|prefecture_id     |integer|null: false              |
|job_id            |integer|null: false              |

### Association

- has_many :rooms
- has_many :posts
- belongs_to_active_hash :gender
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :job

## rooms　テーブル

|Column |Type      |Options                       |
|-------|----------|------------------------------|
|agenda |string    |null: false                   |
|stanceA|string    |null: false                   |
|stanceB|string    |null: false                   |
|user  |references|null: false, foreign_key: true|

### Association

- belongs_to :user
- has_many :posts

## posts テーブル

|Column |Type      |Options                       |
|-------|----------|------------------------------|
|text   |text      |null: false                   |
|user   |references|null: false, foreign_key: true|
|room   |references|null: false, foreign_key: true|
|stance |references|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :room

# ローカルでの動作方法