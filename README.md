# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| first_name       | string  | null: false |
| last_name        | string  | null: false |
| first_name_kana  | string  | null: false |
| last_name_kana   | string  | null: false |
| birth_day        | date    | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column                             | Type        | Options                        |
| ---------------------------------- | ----------- | ------------------------------ |
| name                               | string      | null: false                    |
| genre_id (acitve_hash)             | integer     | null: false                    |
| text                               | text        | null: false                    |
| condition_id (acitve_hash)         | integer     | null: false                    |
| price                              | integer     | null: false                    |
| payment_id (acitve_hash)           | integer     | null: false                    |
| shipping_location_id (acitve_hash) | integer     | null: false                    |
| shipping_day_id (acitve_hash)      | integer     | null: false                    |
| user                               | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase
- belongs_to_active_hash :genre
- belongs_to_active_hash :condition
- belongs_to_active_hash :payment
- belongs_to_active_hash :shipping_location
- belongs_to_active_hash :shipping_day

## purchases テーブル

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| user    | references | null: false,foreign_key: true |
| item    | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column                             | Type    | Options                        |
| ---------------------------------- | ------- | ------------------------------ |
| postal_code                        | string  | null: false                    |
| shipping_location_id (acitve_hash) | integer | null: false                    |
| city                               | string  | null: false                    |
| address                            | string  | null: false                    |
| building_name                      | string  |                                |
| phonenumber                        | string  | null: false                    |
| item_purchase_id                   | integer | null: false, foreign_key: true |

### Association

- belongs_to :purchase
- belongs_to_active_hash :pshipping_location
