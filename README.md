# README

##  Users テーブル


| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| birthday              | date   | null: false               |
| encrypted_password    | string | null: false               |

### Association

- has_many :products
- has_many :purchases


##  Products テーブル


| Column                | Type       | Options                       |       
|---------------------- | ---------- | ----------------------------- | 
| product_name          | string     | null: false                   |
| explanation           | text       | null: false                   |
| category              | string     | null: false                   |
| situation             | string     | null: false                   |
| delivery_charge       | references | null: false,foreign_key: true |
| shipping_area         | references | null: false,foreign_key: true |
| days_to_ship          | references | null: false,foreign_key: true |
| price                 | string     | null: false                   |
| seller                | string     | null: false                   |
| image                 | string     | null; false                   |


### Association 

- has_one    :product
- belongs_to :user


##  Purchases テーブル


| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| purchased_item        | references | null: false, foreign_key: true |
| buyer                 | references | null; false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one    :shopping_sources



## Shopping_sources テーブル


| Column                | Type   | Options                           |
| --------------------- | ------ | --------------------------------- |
| address               | string | null: false                       |
| post_code             | string | null: false,foreign_key: true     |
| telephone_number      | string | null: false,foreign_key: true     |
| municipalities        | string | null: false,foreign_key: true     |
| house_ number         | string | foreign_key: true                 |

### Association

- belongs_to :purchase

