# テーブル設計

## users テーブル

| Column   | Type    | Options     |
| -------- | ------  | ----------- |
| name     | string  | null: false |
| email    | string  | null: false |
| password | string  | null: false |
| birthday | date    | null: false |
| user_id  | integer | null: false |

### Association

- has_many :items
- has_many :transaction

## items テーブル

| Column   | Type        | Options                       |
| -------- | ----------- | ----------------------------- |
| name     | string      | null: false                   |
| price    | string      | null: false                   |
| user_id  | references  | null: false,foreign_key: true |

### Association

- belongs_to :user
- has_one :transaction

## transaction テーブル

| Column   | Type        | Options                       |
| -------- | ----------- | ----------------------------- |
| name     | string      | null: false                   |
| email    | string      | null: false                   |
| password | string      | null: false                   |
| user_id  | references  | null: false,foreign_key: true |

### Association

- belongs_to :user
- has_one :items
- has_one :adress

## address テーブル

| Column      | Type   | Options     |
| ----------- | -------| ----------- |
| name        | string | null: false |
| phonenumber | string | null: false |
| email       | string | null: false |
| address     | string | null: false |

### Association

- has_one :transaction

