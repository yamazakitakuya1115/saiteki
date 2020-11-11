class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|

      t.timestamps
      t.text   :profile
      t.string :hitokoto
      t.references :user, null: false, foreign_key: true
    end
  end
end
