# テーブル設計

## memos テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| text        | text       | null: false                    |
| user        | references   | null: false, foreign_key: true  |


### Association

- belongs_to :user
- has_many :tags,through: :memo_tags
- has_many :comments
- has_many :favorites

---

## users テーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| email              | string | null: false, unique: true  |
| encrypted_password | string | null: false                |
| name               | string | null: false, unique: true  |

### Association

- has_many :memos
- has_many :comments
- has_many :favorites
- has_many :follows

---
## tags テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| tag              | string     | null: false, unique: true|



### Association

- has_many :memos,through: :memo_tags

---
## memo_tags テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| memo          | references     | null: false, foreign_key: true  |
| tag           | references     | null: false, foreign_key: true  |


### Association

- belongs_to :memo
- belongs_to :tag

---

## comments テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| text              | text     | null: false                     |
| memo           | references | null: false, foreign_key: true   |
| user           | references | null: false, foreign_key: true   |

### Association

- belongs_to :memo
- belongs_to :user


---

## favorites テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| memo       | references | null: false, foreign_key: true   |
| user       | references | null: false, foreign_key: true   |


### Association

- belongs_to :memo

---

## follows テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| follower_id     | string  | null: false                  |
| followed_id     | string  | null: false                  |


### Association

- belongs_to :user

---
