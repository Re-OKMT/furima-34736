# README

### users テーブル

| Column              | Type    | Options                  |
| ------------------- | ------- | ------------------------ |
| nickname            | string  | null: false              |
| email               | string  | null: false, unique: true|
| encrypted_password  | string  | null: false              |
| familyname          | string  | null: false              |
| firstname           | string  | null: false              |
| kana_familyname     | string  | null: false              |
| kana_firstname      | string  | null: false              |
| birthday            | date    | null: false              |


### Association
- has_many :item
- has_many :buy 


### items テーブル

| Column                | Type             | Options                |
| ----------------------| ---------------- | ---------------------- |
| itemname              | string           | null: false            | 
| description           | text             | null: false            | 
| category_id           | integer          | null: false, Activehash| 
| status_id             | integer          | null: false, Activehash|
| pay shipping_id       | integer          | null: false ,Activehash|
| shipping area_id      | integer          | null: false ,Activehash|
| shipping day_id       | integer          | null: false ,Activehash|
| money                 | integer          | null: false            |


### Association

- belongs_to :user
- has_one    :buy



### buys テーブル

| Column            | Type             | Options                         |
| ------------------| ---------------- | --------------------------------|
| user_id           | references       | null: false, foreign_key: true  |
| item_id           | references       | null: false, foreign_key: true  |


### Association 
- belongs_to :user
- belongs_to :item
- has_one    :delivery

### delivery's テーブル

| Column            | Type             | Options                         |
| ------------------| ---------------- | --------------------------------|
| buy_id            | references       | null: false, foreign_key: true  |
| postal_code       | string           | null: false                     |
| prefectures_id    | integer          | null: false                     |
| municipalities    | string           | null: false                     |
| address           | string           | null: false                     |
| building_name     | integer          |                                 |
| tel               | string           | null: false                     |


### Association
- belongs_to :buy
