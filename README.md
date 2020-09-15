# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| first_name       | string  | null: false |
| family_name      | string  | null: false |
| first_name_kana  | string  | null: false |
| family_name_kana | string  | null: false |
| birth_day        | date    | null: false |

### Association

- has_many :items
- has_many :item_purchases

## items テーブル

| Column                             | Type        | Options                        |
| ---------------------------------- | ----------- | ------------------------------ |
| name                               | string      | null: false                    |
| text                               | text        | null: false                    |
| condition_id (acitve_hash)         | integer     | null: false                    |
| price_id (acitve_hash)             | integer     | null: false                    |
| payment_id (acitve_hash)           | integer     | null: false                    |
| shipping_location_id (acitve_hash) | integer     | null: false                    |
| shipping_day_id (acitve_hash)      | integer     | null: false                    |
| user                               | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item_purchase
- belongs_to :condition
- belongs_to :price
- belongs_to :payment
- belongs_to :shipping_location
- belongs_to :shipping_day

## item_purchases テーブル

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| user    | references | null: false,foreign_key: true |
| item    | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| name          | string  | null: false |
| postal_code   | integer | null: false |
| prefectures   | string  | null: false |
| city          | string  | null: false |
| address       | string  | null: false |
| building_name | string  | null: false |
| phonenumber   | string  | null: false |
| email         | string  | null: false |


### Association

- belongs_to :item_purchase

