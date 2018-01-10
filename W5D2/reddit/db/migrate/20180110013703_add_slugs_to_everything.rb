class AddSlugsToEverything < ActiveRecord::Migration[5.1]
  def change
    add_column :subs, :slug, :string
    add_column :posts, :slug, :string
  end
end
