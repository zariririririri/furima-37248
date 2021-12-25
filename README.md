# README

##  Users テーブル


| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| birthday              | string | null: false               |
| encrypted_password    | string | null: false               |

### Association

- has_many :product
- has_many :purchase


##  Product テーブル


| Column                | Type       | Options                       | 
| --------------------- | ---------- | ----------------------------- |
| product_name          | string     | null: false                   |
| explanation           | string     | null: false                   |
| category              | string     | null: false                   |
| situation             | string     | null: false                   |
| delivery_charge       | references | null: false,foreign_key: true |
| shipping_area         | references | null: false,foreign_key: true |
| days_to_ship          | references | null: false,foreign_key: true |
| price                 | string     | null: false                   |
| seller                | string     | null: false                   |
| image                 | string     | null; false                   |

### Association 

- has_one :product
- belongs_to :users


##  Purchase テーブル


| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| purchased_item        | references | null: false, foreign_key: true |
| buyer                 | references | null; false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :product
- has_many :shopping_source



## Shopping_source テーブル


| Column                | Type   | Options         |
| --------------------- | ------ | --------------- |
| address               | string | null: false     |
| post_code             | string | null: false     |
| telephone_number      | string | null: false     |
| prefectures           | string | null: false     |
| municipalities        | string | null: false     |
| house_ number         | string |                 |

### Association

- belongs_to :purchase
