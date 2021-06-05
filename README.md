# README

### user テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| nickname     | string  | null: false |
| email        | string  | null: false |
| password     | string  | null: false |
| familyname   | string  | null: false |
| firstname    | string  | null: false |
| birthday     | date    | null: false |

### Association
- has_many :itemno



### Listing list テーブル

| Column     | Type             | Options     |
| ---------- | ---------------- | ----------- |
| itemno     | string           | null: false |
| itemname   | string           | null: false |
| category   | string           | null: false |
| brand      | string           | null: false |
| money      | string           | null: false |
| selleremail| references       | null: false |
| familyname | references       |             |
| firstname  | references       |             |
| image      | ActiveStorage    |             |

### Association

- has_many :brand
- has_many :category



### Buy list テーブル

| Column            | Type             | Options                         |
| ------------------| ---------------- | --------------------------------|
| itemno            | string           | null: false                     |
| itemname          | string           | null: false                     |
| money             | string           | null: false                     |
| selleremail       | references       | null: false, foreign_key: true  |
| seller_familyname | references       |                                 |
| seller_firstname  | references       |                                 |
| buyeremail        | references       | null: false, foreign_key: true  |
| buyer_familyname  | references       |                                 |
| buyer_firstname   | references       |                                 |
| buyday            | date             | currnt_day                      |

### Association
- has one :selleremail 
- has one :itemno

### Delivery list テーブル

| Column            | Type             | Options                         |
| ------------------| ---------------- | --------------------------------|
| b_itemno          | references       | null: false                     |
| adress            | string           | null: false                     |

### Association
- has one :user
- has one :b_itemno