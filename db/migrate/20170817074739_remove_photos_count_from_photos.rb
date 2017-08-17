class RemovePhotosCountFromPhotos < ActiveRecord::Migration[5.1]
  def change
    remove_column :photos, :photos_count, :decimal
  end
end
