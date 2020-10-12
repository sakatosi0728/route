アプリケーション名
Daretoku

概要
ルームを作成し日常生活などで役立つ知識を共有することができる

URL
https://daretoku.herokuapp.com/

テスト用アカウント1
email:opener@opener.com
パスワード:opener

テスト用アカウント2
email:talker@talker.com
パスワード:talker

利用方法
テスト用アカウントでログイン後、作成ボタンからルームを作成し詳細画面に入りメッセージを送ることができる。
また作成者のみルームの削除も可能。

目指した課題解決
大学生や新社会人など初めて一人暮らしをする人に役立つ情報や知識を共有することができ、困っていることもルームを開くことで相談し解決に役立てるようにする


# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association
- has_many :rooms
- has_many :messages

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| text   | string | null: false | 
| image  | text   | null: false | 
| user   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :messages

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | string     |
| user_id | references | null: false, foreign_key: true |
| room_id | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user