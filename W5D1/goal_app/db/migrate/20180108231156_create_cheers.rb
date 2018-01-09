class CreateCheers < ActiveRecord::Migration[5.1]
  def change
    create_table :cheers do |t|
      t.references :user, foreign_key: true
      t.references :goal, foreign_key: true

      t.timestamps
    end
  end
end
