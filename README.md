# テーブル設計

## users テーブル
| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| name          | string  | null: false |
| email         | string  | null: false |
| prefecture_id | integer | null: false |
| who_id        | integer | null: false |

### Association
- has_many :articles
- has_many :comments

## articles テーブル
| Column     | Type       |                  Options |
| ---------- | ---------- | ------------------------ |
| genre_id   | integer    | null: false              |
| subject_id | integer    | null: false              |
| title      | string     | null: false              |
| content    | text       | null: false              |
| user       | references | null: false, foreign_key |

### Association
- belongs_to :user
- has_many :comments

## comments テーブル
| Column  | Type       | Options                  |
| ------- | ---------- | ------------------------ |
| message | text       | null: false              |
| user    | references | null: false, foreign_key |
| article | references | null: false, foreign_key |

### Association
- belongs_to :user
- belongs_to :article