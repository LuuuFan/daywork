class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :votable_id, null: false
      t.string :votable_type, null: false
      t.integer :value, null: false
      t.integer :voter_id, null: false
      t.timestamps
    end

    add_index :votes, [:votable_type, :votable_id]
    add_index :votes, [:votable_type, :votable_id, :voter_id], unique: true
  end
end
