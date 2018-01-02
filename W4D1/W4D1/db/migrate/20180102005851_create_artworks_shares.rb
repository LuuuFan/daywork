class CreateArtworksShares < ActiveRecord::Migration[5.1]
  def change
    create_table :artworks_shares do |t|
      t.integer :artwork_id, null: false
      t.integer :viewer_id, null: false
      t.timestamps
    end

    add_index :artworks_shares, :artwork_id
    add_index :artworks_shares, :viewer_id
  end
end
