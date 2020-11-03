class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.integer    :grade_id,   null: false
      t.integer    :genre_id,   null: false
      t.integer    :subject_id, null: false
      t.string     :title,      null: false
      t.text       :content,    null: false
      t.boolean    :release,    null: false, default: false
      t.references :user,       null: false, foreign_key: true
      t.timestamps
    end
  end
end