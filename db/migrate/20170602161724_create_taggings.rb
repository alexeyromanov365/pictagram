class CreateTaggings < ActiveRecord::Migration[5.1]
  def change
    create_table :taggings do |t|
      t.references :taggable, polymorphic: true
      t.references :tag
    end
  end
end
