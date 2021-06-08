# README

### users テーブル

| Column              | Type    | Options                  |
| ------------------- | ------- | ------------------------ |
| nickname            | string  | null: false              |
| email               | string  | null: false, unique: true|
| encrypted_password  | string  | null: false              |
| familyname          | string  | null: false              |
| firstname           | string  | null: false              |
| kana-familyname     | string  | null: false              |
| kana-firstname      | string  | null: false              |
| birthday            | date    | null: false              |


### Association
- has_many :Listing lists
- has_many :Buy lists 


### Listing lists テーブル

| Column                | Type             | Options                |
| ----------------------| ---------------- | ---------------------- |
| itemname              | string           | null: false            | 
| description           | string           | null: false            | 
| category_id           | integer          | null: false, Activehash| 
| status_id             | integer          | null: false, Activehash|
| pay shipping _id      | integer          | null: false ,Activehash|
| shipping area_id      | integer          | null: false ,Activehash|
| shipping days_id      | integer          | null: false ,Activehash|
| money                 | integer          | null: false            |


### Association

- belongs_to :users
- belongs_to :Buy lists
- belongs_to :Delivery  lists


### Buy lists テーブル

| Column            | Type             | Options                         |
| ------------------| ---------------- | --------------------------------|
| user              | references       | null: false, foreign_key: true  |
| listing list      | references       | null: false, foreign_key: true  |


### Association 
- belongs_to :user
- belongs_to :Listing lists
- has one :Delivery lists

### Delivery lists テーブル

| Column            | Type             | Options                         |
| ------------------| ---------------- | --------------------------------|
| user              | references       | null: false, foreign_key: true  |
| postal code       | string           | null: false                     |
| prefectures_id    | integer          | null: false                     |
| municipalities    | string           | null: false                     |
| address           | string           | null: false                     |
| building name     | integer          |                                 |
| tel               | string           | null: false                     |


### Association
- has one :Buy lists
