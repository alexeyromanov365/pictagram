class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|

      t.string :title, unique: true
      t.references :user

      t.timestamps

    end
  end
end
