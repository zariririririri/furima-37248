# README


##  Users テーブル


| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| birthday           | date   | null: false               |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |


### Association

- has_many :products
- has_many :purchases



##  Products テーブル


| Column                | Type           | Options                        |     
|---------------------- | -------------- | ------------------------------ | 
| product_name          | string         | null: false                    |
| explanation           | text           | null: false                    |
| price                 | integer        | null: false                    |
| user                  | references     | null: false, foreign_key: true |
| prefectures_id        | integer        | null: false                    | 
| category_id           | integer        | null: false                    |
| state_id              | integer        | null: false                    |
| delivery_id           | integer        | null: false                    |
| delivery_time_id      | integer        | null: false                    | 



### Association 

- has_one    :purchase
- belongs_to :user



##  Purchases テーブル


| Column                | Type       | Options                         |
| --------------------- | ---------- | ------------------------------- |
| product               | references | null: false, foreign_key: true  |
| user                  | references | null: false, foreign_key; true  |


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



