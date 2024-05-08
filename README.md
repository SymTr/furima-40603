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
| bd_year            | integer| null: false |
| bd_month           | integer| null: false |
| bd_day             | integer| null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| image      | string     | null: false                                  |
| item_name  | string     | null: false                    |
| item_detail| text       | null: false                    |
| item_name  | string     | null: false                    |
| category   | string     | null: false                    |
| condition  | string     | null: false                    |
| freight    | string     | null: false                    |
| origin     | string     | null: false                    |
| delivery_date  | integer     | null: false                    |
| price      | integer    | null: false                    |
| sales_fee  | string     | null: false                    |
| profit     | string     | null: false                    |
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
| post_code | integer    | null: false                                  |
| prefecture| string     | null: false                    |
| city      | string     | null: false                    |
| area_no.  | integer    | null: false                    |
| building  | string     |                                |
| phone     | integer    | null: false                    |
| purchase_id | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase

