class RemoveTweetFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :tweet, :string
  end
end
