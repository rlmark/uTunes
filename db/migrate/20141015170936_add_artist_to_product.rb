class AddArtistToProduct < ActiveRecord::Migration
  def change
    add_column :products, :artist, :string
  end
end
