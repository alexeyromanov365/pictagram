class SearchSuggestion < ApplicationRecord

  def self.terms_for(prefix)
    suggestions = where("term LIKE ?", "#{prefix}%")
    suggestions.order("popularity desc").limit(10).pluck(:term)
  end

  def self.index_products
    Album.find_each do |album|
      index_term(album.title)
      album.title.split.each { |t| index_term(t) }
    end
    Tag.find_each do |tag|
      index_term(tag.name)
      tag.name.split.each { |t| index_term(t) }
    end
  end

  def self.index_term(term)
    where(term: term.downcase).first_or_initialize.tap do |suggestion|
      suggestion.increment :popularity
      suggestion.save
    end
  end
end