class DropSearchSuggestions < ActiveRecord::Migration[5.1]
  def change
  	drop_table :search_suggestions
  end
end
