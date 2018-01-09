class ChangeAssociationToPolymorphicForComment < ActiveRecord::Migration[5.1]
  def change
    remove_reference :comments, :user, index: true, foreign_key: true
    remove_reference :comments, :goal, index: true, foreign_key: true
    add_reference :comments, :commentable, polymorphic: true, index: true
    # add_column :commentable_type

    # add_index :comments, [:commentable_id, :commentable_type]
  end
end
