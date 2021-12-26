# README

##  Users テーブル


| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| birthday           | date   | null: false               |
| encrypted_password | string | null: false               |
| full_width         | string | null: false               |
| half_width         | string | null: false               |


### Association

- has_many :products
- has_many :purchases



##  Products テーブル


| Column                | Type           | Options                        |     
|---------------------- | -------------- | ------------------------------ | 
| product_name          | string         | null: false                    |
| explanation           | text           | null: false                    |
| price                 | string         | null: false                    |
| buyer                 | references     | null: false, foreign_key: true |     
| product_id            | string         | null: false                    |
| user                  | references     | null: false, foreign_key: true |
| comment               | text           |                                |
| favorite              | string         |                                |
| prefectures_id        | integer        | null: false                    |  


### Association 

- has_one    :product
- belongs_to :user
- belongs_to :prefectures


##  Purchases テーブル


| Column                | Type       | Options                         |
| --------------------- | ---------- | ------------------------------- |
| product               | references | null: false, foreign_key: true  |
| user                  | references | null: false, foreign_key: true  |


### Association

- belongs_to :user
- belongs_to :product
- has_one    :shopping_source



## Shopping_sources テーブル


| Column                | Type       | Options                           |
| --------------------- | ---------- | --------------------------------- |
| address               | string     | null: false                       |
| post_code             | string     | null: false                       |
| prefectures_id        | integer    | null: false                       |  
| municipalities        | string     | null: false                       |
| house_ number         | string     |                                   |
| telephone_number      | string     | null: false                       |
| user                  | references | null: false, foreign_key: true    |


### Association

- belongs_to :purchase
- belongs_to :prefectures


