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

|Column  |Type      |Options                       |
|--------|----------|------------------------------|
|agenda  |string    |null: false                   |
|stance_a|references|null: false, foreign_key: true|

### Association

- has_many :user
- has_one :stance
- has_many :posts

## stances テーブル
|Column |Type      |Options                       |
|-------|----------|------------------------------|
|stanceA|string    |null: false                   |
|stanceB|string    |null: false                   |
|room   |references|null: false, foreign_key: true|

### Association

- belongs_to :room

## user_rooms テーブル
|Column|Type      |Options                       |
|------|----------|------------------------------|
|user  |references|null: false, foreign_key: true|
|room  |references|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :room

## goods テーブル
|Column|Type      |Options                       |
|------|----------|------------------------------|
|user  |references|null: false, foreign_key: true|
|post  |references|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :post

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