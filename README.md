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

* ルーム作成機能
    * 目的<br>コメントや画像を閲覧できるルームの作成
    * 詳細<br>ルームにはアジェンダとスタンスを設定する
    * ユースケース<br>・トップページからルーム作成ボタンを押すことでルーム作成画面に遷移する<br>・ルーム作成画面では、ルームの議題とスタンスを作成する

* ルーム一覧機能
    * 目的<br>トップページにルームの一覧を表示
    * 詳細<br>・トップページにルーム一覧を表示<br>・作成日時の新しいものから降順で表示
    * ユースケース<br>・ルームのコメント投稿フォームからコメントを作成し投稿できる

* コメント投稿機能
    * 目的<br>ルーム内でコメントを投稿できる
    * 詳細<br>・ルーム下部の投稿フォームからコメント投稿
    * ユースケース<br>・ルームのコメント投稿フォームからコメントを作成し投稿できる

* コメント表示機能
    * 目的<br>ルーム内にコメントを表示できる
    * 詳細<br>・表示されるコメントはスタンスごとに分かれる<br>・ユーザーの情報が表示される
    * ユースケース<br>・コメントはスタンスごとに分けて表示される

* ユーザー管理機能
    * 目的<br>ユーザー新規登録・ログイン・ログアウトが出来る
    * 詳細<br>・deviseのユーザー管理機能導入<br>・登録・ログインには「メールアドレス、パスワード、生年月日、性別、都道府県、職業」が必要<br>・生年月日、性別、都道府県、職業はプルダウンリスト形式
    * ユースケース<br>・トップページに新規登録、ログインボタンを表示、ボタンを押す事で、ページ遷移。<br>・ログイン状態ではログアウトボタンが表示される


# 実装した機能の詳細

<img width="300" alt="image" src="https://i.gyazo.com/cbedcfd6b6eb378d7c4f26a1cdfa3dcd.png">

* トップページ
    * トップページにはチャットルームの一覧が表示されており、ログイン状態であればチャットルームに入室できます。
    * チャットルームを作成ボタンからチャットルーム作成ページへ遷移します



# 実装予定の機能

* 画像投稿機能
    * ルーム内に画像を投稿できる機能
    * S3の実装

* マイページ機能
    * 作成したルームや投稿したコメントの一覧等を表示
    * ユーザー情報の編集を行う機能

* good機能
    * 投稿されているコメントにgoodボタンを表示、押すとカウントが増え、コメントに表示される
    * マイページにgoodした、された総数を表示

* ルーム検索機能
    * チャットルームの検索機能の追加
    * 検索結果が0件の場合はメッセージを表示

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