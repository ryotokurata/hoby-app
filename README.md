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
# Hoby-app DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|name|string|null: false, index: true|

### Association
- has_many :groups
- has_many :massages
- has_many :chats
## groupテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- belongs_to :user
- has_many :massages

## messageテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- bilongs_to :user
- bilongs_to :group
- has_many :chats

## chatテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|user_id|references|null: false, foreign_key: true|
|group_id|references|null: false, foreign_key: true|
|message_id|references|null: false, foreign_key: true|
### Association
- belongs_to :message
- belongs_to :user

