class AddPhotosCountToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :photos_count, :decimal
  end
end
