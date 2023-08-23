# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | string | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column    | Type    | Options                        |
| --------- | ------- | ------------------------------ |
| title     | string  | null: false                    |
| price     | integer | null: false                    |
| text      | text    | null: false                    |
| category  | integer | null: false                    |
| condition | integer | null: false                    |
| situation | integer | null: false                    |
| user_id   | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase

## purchase テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## address テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| post_code      | string  | null: false |
| prefectures    | string  | null: false |
| cities         | string  | null: false |
| street_number  | string  | null: false |
| building_name  | string  |             |
| phone_number   | string  | null: false |

### Association

- belongs_to :purchase