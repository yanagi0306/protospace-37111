# テーブル設計

## users　テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null:false  |
| encrypted_password | string | null:false  |
| name               | string | null:false  |
| profile            | text   | null:false  |
| occupation         | text   | null:false  |
| position           | text   | null:false  |

### Association

- has_many : comments
- has_many : prototypes

## comments　テーブル

| Colum              | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| context            | string     | null:false                    |
| prototype          | references | null:false,foreign_key: true  |
| user               | references | null:false,foreign_key: true  |

### Association

- belong_to :prototype
- belong_to :user

## prototypes　テーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     |                                |
| catch_copy         | text       | null:false                     |
| concept            | text       | null:false                     |
| user               | references | null:false,foreign_key:true    |

### Association

- has_many :comments
- belong_to :user
