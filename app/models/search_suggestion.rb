class SearchSuggestion < ApplicationRecord
  attr_accessor :popularity, :term

  def self.term_for(prefix)
    suggestions = where("term like ?", "#{prefix}_%")
    suggestions.order("popularity desc").limit(10).pluck(:term)
  end

  def self.index_products
    Album.find_each do |album|
      index_term(album.title)
      album.name.split.each { |t| index_term(t) }
    end
  end

  def self.index_term(term)
    where(term: term.downcase).first_or_initialize.tap do |suggestion|
      binding.pry
      suggestion.increment! :popularity
    end
  end
end
