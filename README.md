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
| last-name              | string | null: false |
| first-name             | string | null: false |
| last-name-kana         | string | null: false |
| first-name-kana        | string | null: false |
| birth-date             | string | null: false |

### Association
- has_many :items
- has_many :addresses
 


 ## itemsテーブル

| Column                 | Type          | Options                       |
| -----------------------| --------------| ------------------------------|
| name                   | string        | null: false                   |
| info                   | text          | null: false                   |
| price                  | integer       | null: false                   |
| category               | string        | null: false                   |  
| sales-status           | string        | null: false                   |  
| shipping-fee-status    | string        | null: false                   | 
| prefecture             | string        | null: false                   | 
| scheduled-delivery     | string        | null: false                   |
| user                   | references    | null: false, foreign_key: true|


### Association
- has_one :sold-out
- belong_to :user

<!-- イメージはアクティブイメージで作成 -->


## addressesテーブル

| Column          | Type       | Options                         |
| ----------------| -----------| --------------------------------|
| postal-code     | integer    | null: false                     |
| prefecture      | text       | null: false                     |
| city            | string     | null: false                     |
| addresses       | string     | null: false                     |
| building        | string     | null: false                     | 
| phone-number    | integer    | null: false                     |
| user            | references | null: false, foreign_key: true  |



### Association
- belong_to :user

## sold-outsテーブル


| Column                 | Type          | Options                       |
| -----------------------| --------------| ------------------------------|
| name                   | string        | null: false                   |
| info                   | text          | null: false                   |
| price                  | integer       | null: false                   |
| category               | string        | null: false                   |  
| sales-status           | string        | null: false                   |  
| shipping-fee-status    | string        | null: false                   | 
| prefecture             | string        | null: false                   | 
| scheduled-delivery     | string        | null: false                   |
| user                   | references    | null: false, foreign_key: true|


### Association
- belong_to :item
