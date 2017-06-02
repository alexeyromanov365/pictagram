class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums, {:primary_key => :album_id} do |t|
      t.string :album_title
      t.index :album_id, unique: true

      t.timestamps
    end
  end
end
