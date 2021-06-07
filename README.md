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
| category_id           | integer          | null: false, Activehash| 
| brand_id              | integer          | null: false, Activehash|
| status_id             | integer          | null: false, Activehash|
| pay shipping _id      | integer          | null: false ,Activehash|
| shipping area_id      | integer          | null: false ,Activehash|
| shipping days_id      | integer          | null: false ,Activehash|
| money                 | integer          | null: false            |


### Association

- has_many :users


### Buy lists テーブル

| Column            | Type             | Options                         |
| ------------------| ---------------- | --------------------------------|
| user              | references       | null: false, foreign_key: true  |
| listing list      | references       | null: false, foreign_key: true  |


### Association 
- has one :user
- has one :Listing lists

### Delivery lists テーブル

| Column            | Type             | Options                         |
| ------------------| ---------------- | --------------------------------|
| user              | references       | null: false, foreign_key: true  |
| postal code       | integer          | null: false                     |
| prefectures_id    | integer          | null: false                     |
| municipalities    | string           | null: false                     |
| address           | string           | null: false                     |
| building name     | integer          |                                 |
| tel               | integer          | null: false                     |


### Association
- has one :user
- has one :Buy lists
- has pne :Listing lists