# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nick_name          | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| family_name        | string | null: false |   
| first_name         | string | null: false | 
| family_name_kana   | string | null: false | 
| first_name_kana    | string | null: false | 
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item_name  | string     | null: false                    |
| item_detail| text       | null: false                    |
| price      | integer    | null: false                    |
| user_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments, through: :purchases


## purchases テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| comment   | text       |                                |
| item_id   | references | null: false, foreign_key: true |
| user_id   | references | null: false, foreign_key: true |
| destination_id   | references | null: false, foreign_key: true |


### Association

- has_one :destination
- belongs_to :user



## destinations テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| post_code | string     | null: false                    |
| origin    | string     | null: false                    |
| city      | string     | null: false                    |
| area_no   | string     | null: false                    |
| building  | string     |                                |
| phone     | string     | null: false                    |
| purchase  | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase

