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

| Column            | Type        | Options                        |
| ----------------- | ----------- | ------------------------------ |
| name              | string      | null: false                    |
| image             | string      | null: false                    |
| text              | text        | null: false                    |
| condition         | integer     | null: false                    |
| price             | integer     | null: false                    |
| payment           | integer     | null: false                    |
| shipping_location | integer     | null: false                    |
| shipping_day      | integer     | null: false                    |
| user              | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item_purchase

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

| Column      | Type   | Options     |
| ----------- | -------| ----------- |
| name        | string | null: false |
| phonenumber | string | null: false |
| email       | string | null: false |
| address     | string | null: false |

### Association

- belongs_to :item_purchase

