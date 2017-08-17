class AddPhotosCountToAlbums < ActiveRecord::Migration[5.1]
  def change
    add_column :albums, :photos_count, :decimal
  end
end
