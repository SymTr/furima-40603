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

| Column          | Type       | Options                        |
| -------------   | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| item_detail     | text       | null: false                    |
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| freight_id      | integer    | null: false                    |
| origin_id       | integer    | null: false                    |
| delivery_date_id| integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |



### Association

- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| comment   | text       |                                |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |


### Association

- has_one :destination
- belongs_to :user
- belongs_to :item


## destinations テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| post_code   | string     | null: false                    |
| origin_id   | integer    | null: false                    |
| city        | string     | null: false                    |
| area_number | string     | null: false                    |
| building    | string     |                                |
| phone       | string     | null: false                    |
| purchase    | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase

