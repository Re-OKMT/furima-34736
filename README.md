# README

### users テーブル

| Column              | Type    | Options                  |
| ------------------- | ------- | ------------------------ |
| nickname            | string  | null: false              |
| email               | string  | null: false, unique: true|
| encrypted_password  | string  | null: false              |
| family_name         | string  | null: false              |
| first_name          | string  | null: false              |
| kana_family_name     | string  | null: false              |
| kana_first_name      | string  | null: false              |
| birthday            | date    | null: false              |


### Association
- has_many :items
- has_many :buys


### items テーブル

| Column                | Type             | Options                        |
| ----------------------| ---------------- | ------------------------------ |
| user                  | references       | null: false, foreign_key: true |
| name                  | string           | null: false                    | 
| description           | text             | null: false                    | 
| category_id           | integer          | null: false                    | 
| status_id             | integer          | null: false                    |
| pay_shipping_id       | integer          | null: false                    |
| area_id               | integer          | null: false                    |
| shipping_day_id       | integer          | null: false                    |
| money                 | integer          | null: false                    |


### Association

- belongs_to :user
- has_one    :buy



### buys テーブル

| Column            | Type             | Options                         |
| ------------------| ---------------- | --------------------------------|
| user              | references       | null: false, foreign_key: true  |
| item              | references       | null: false, foreign_key: true  |


### Association 
- belongs_to :user
- belongs_to :item
- has_one    :delivery

### deliveries テーブル

| Column            | Type             | Options                         |
| ------------------| ---------------- | --------------------------------|
| buy               | references       | null: false, foreign_key: true  |
| postal_code       | string           | null: false                     |
| area_id           | integer          | null: false                     |
| municipalities    | string           | null: false                     |
| address           | string           | null: false                     |
| building_name     | string           |                                 |
| tel               | string           | null: false                     |


### Association
- belongs_to :buy
