# テーブル設計

## users テーブル
| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| name          | string  | null: false |
| email         | string  | null: false |
| prefecture_id | integer | null: false |

### Association
- has_many :articles
- has_many :comments
- has_one :tweet

## articles テーブル
| Column     | Type       | Options                           |
| ---------- | ---------- | --------------------------------- |
| grade_id   | integer    | null: false                       |
| genre_id   | integer    | null: false                       |
| subject_id | integer    | null: false                       |
| title      | string     | null: false                       |
| content    | text       | null: false                       |
| release    | boolean    | null: false, default: false       |
| user       | references | null: false, foreign_key: true    |

### Association
- belongs_to :user
- has_many :comments

## comments テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| message | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| article | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :article

## Tweets テーブル
 | Column   | Type       | Options                        |
 | -------- | ---------- | ------------------------------ |
 | profile  | text       |                                |
 | hitokoto | string     |                                |
 | user     | references | null: false, foreign_key: true |

 ### Association
 - belings_to user