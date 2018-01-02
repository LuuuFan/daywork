class RemoveEmailColumnFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :email
  end
    remove_index :users, :email
end
