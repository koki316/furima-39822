## usersテーブル

| Column               | Type     | Option                   |
| -------------------- | -------- |------------------------- |
| nickname             | string   | null:false, length:      |
| email                | string   | null:false, unique: true |
| encrypted_password   | string   | null:false               |
| firstname            | string   | null:false               |
| lastname             | string   | null:false               |
| firstname_kana       | string   | null:false               |
| lastname_kana        | string   | null:false               |
| birthday             | date     | null:false               |

### Association

- has_many :items
- has_many :records

## itemsテーブル

| Column               | Type        | Option                         |
| -------------------- | ----------- |------------------------------- |
| items_name           | string      | null:false                     |
| description          | text        | null:false                     |
| category_id          | integer     | null:false                     |
| condition_id         | integer     | null:false                     |
| pay_for_id           | integer     | null:false                     |
| prefecture_id        | integer     | null:false                     |
| ship_day_id          | integer     | null:false                     |
| price                | integer     | null:false                     |
| user                 | references  | null:false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :record

## recordsテーブル

| Column               | Type        | Option                         |
| -------------------- | ----------- |------------------------------- |
| user                 | references  | null:false, foreign_key: true  |
| item                 | references  | null:false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping

## shippingsテーブル

| Column               | Type         | Option                        |
| -------------------- | ------------ |------------------------------ |
| postcode             | string       | null:false                    |
| prefecture_id        | integer      | null:false                    |
| city                 | string       | null:false                    |
| street               | string       | null:false                    |
| building             | string       |                               |
| tellnumber           | string       | null:false                    |
| record               | references   | null:false, foreign_key: true |

### Association

- belongs_to :record