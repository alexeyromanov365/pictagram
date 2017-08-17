namespace :search_suggestions do
  desc "Generate search suggestions"
  task index: :environment do
  	SearchSuggestion.destroy_all
    SearchSuggestion.index_products
  end
end
