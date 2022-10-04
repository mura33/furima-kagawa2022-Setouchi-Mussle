# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...




## usersテーブル

| Column                 | Type   | Options     |
| -----------------------| ------ | ------------|
| nickname               | string | null: false |
| email                  | string | null: false |
| password               | string | null: false |
| password_confirmation  | string | null: false |
| last_name              | string | null: false |
| first_name             | string | null: false |
| last_name_kana         | string | null: false |
| first_name_kana        | string | null: false |
| birth_date             | string | null: false |

### Association
- has_many :items
- has_many :orders
 


 ## itemsテーブル

| Column                 | Type           | Options                       |
| -----------------------| -------------- | ------------------------------|
| name                   | string         | null: false                   |
| info                   | text           | null: false                   |
| price                  | integer        | null: false                   |
| category_id            | integer        | null: false                   |  
| sales_status_id        | integer        | null: false                   |  
| shipping_fee_status_id | integer        | null: false                   | 
| prefecture_id          | integer        | null: false                   | 
| scheduled_delivery_id  | integer        | null: false                   |
| user                   | references    | null: false, foreign_key: true|


### Association
- has_many :orders
- belong_to :user

<!-- イメージはアクティブイメージで作成 -->


## addressesテーブル

| Column          | Type       | Options                         |
| ----------------| -----------| --------------------------------|
| postal_code     | string     | null: false                     |
| prefecture      | text       | null: false                     |
| city            | string     | null: false                     |
| addresses       | string     | null: false                     |
| building        | string     | null: false                     | 
| phone_number    | string     | null: false                     |
| order           | references | null: false, foreign_key: true  |



### Association
- belong_to :order

## ordersテーブル


| Column                 | Type          | Options                       |
| -----------------------| --------------| ------------------------------|
| user                   | references    | null: false, foreign_key: true|
| item                   | references    | null: false, foreign_key: true|


### Association
- has_one :address
- belong_to :user
- belong_to :item

