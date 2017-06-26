class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :title
      t.string :description
      t.string :picture, null: false
      t.references :user
      t.references :album, foreign_key: true
      t.timestamps
    end
  end
end