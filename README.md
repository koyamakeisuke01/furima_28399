# テーブル設計

## users テーブル

| Column            | Type   | Options                   |
| ----------------- | ------ | ------------------------- |
| nickname          | string | null: false               |
| email             | string | null: false, unique: true |
| password          | string | null: false               |
| family_name       | string | null: false               |
| first_name        | string | null: false               |
| family_name_kana  | string | null: false               |
| first_name_kana   | string | null: false               |
| birthday          | date   | null: false               |

### Association

- has_many :items
- has many :comments
- has many :orders
- has_one :destination

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| image       | string     | null: false                    |
| price       | integer    | null: false                    |
| description | text       | null: false                    |
| seller_id   | references | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :user
- has_one :order

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## orders テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item_id     | references | null: false, foreign_key: true |
| seller_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :destination

## destinations テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false, unique: true      |
| buyer_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :order