class AddGoalIdToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :goal, foreign_key: true
  end
endmi
