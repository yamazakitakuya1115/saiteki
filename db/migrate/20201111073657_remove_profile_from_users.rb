class RemoveProfileFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :profile, :text
  end
end
