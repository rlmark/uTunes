class FixProductName < ActiveRecord::Migration
  def change
    rename_column :products, :name, :album_name
  end
end
