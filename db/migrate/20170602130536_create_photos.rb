class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos, {:primary_key => :photo_id} do |t|
      t.string :photo_title
      t.index :photo_id, unique: true

      t.timestamps
    end
  end
end
