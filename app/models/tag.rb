class Tag < ApplicationRecord
  has_many :taggings
  has_many :albums, through: :taggings, source: :taggable, source_type: 'Album'
  has_many :photos, through: :taggings, source: :taggable, source_type: 'Photo'
  validates_length_of :name, minimum: 2, maximum: 20, message: "Tag name is too long"
  validates :name, format: { with: /#\w+/, message: "Tag must begin with #" }
end


