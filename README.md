## usersテーブル

| Column               | Type     | Option                   |
| -------------------- | -------- |------------------------- |
| nickname             | string   | null:false               |
| email                | string   | null:false, unique: true |
| encrypted_password   | string   | null:false               |
| firstname            | string   | null:false               |
| lastname             | string   | null:false               |
| firstname_kana       | string   | null:false               |
| lastname_kana        | string   | null:false               |

### Association

- has_many :items
- has_many :records

## itemsテーブル

| Column               | Type        | Option                         |
| -------------------- | ----------- |------------------------------- |
| items_name           | string      | null:false                     |
| description          | text        | null:false                     |
| category             | string      | null:false                     |
| condition            | string      | null:false                     |
| pay_for              | string      | null:false                     |
| ship_from            | string      | null:false                     |
| ship_days            | string      | null:false                     |
| price                | string      | null:false                     |
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
- has_one :item
- has_one :shipping

## shippingsテーブル

| Column               | Type     | Option     |
| -------------------- | -------- |----------- |
| postcode             | string   | null:false |
| prefecture           | string   | null:false |
| city                 | string   | null:false |
| street               | string   | null:false |
| building             | string   |            |
| tellnumber           | string   | null:false |

### Association

- has_one :record