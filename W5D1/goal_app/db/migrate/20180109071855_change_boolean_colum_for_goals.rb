class ChangeBooleanColumForGoals < ActiveRecord::Migration[5.1]
  def change
    change_column :goals, :private, :string
    change_column :goals, :completed, :string
  end
end
