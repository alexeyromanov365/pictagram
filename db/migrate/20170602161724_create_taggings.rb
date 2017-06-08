class CreateTaggings < ActiveRecord::Migration[5.1]
  def change
    create_table :taggings do |t|

      t.references :album
      t.references :photo
      t.references :tag

      t.timestamps

    end
  end
end
