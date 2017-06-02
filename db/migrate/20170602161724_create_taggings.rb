class CreateTaggings < ActiveRecord::Migration[5.1]
  def change
    create_table :taggings, {:primary_key => :tagging_id} do |t|
      t.index :tagging_id, unique: true

      t.timestamps
    end
  end
end
