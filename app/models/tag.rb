class Tag < ApplicationRecord

  has_many :taggings
  has_many :albums, through: :taggings
  has_many :photos, through: :taggings
  validates_length_of :name, :minimum => 2, :maximum => 20, :allow_blank => true
  validates :name, format: { with: /#\w+/, message: "start tag with #" }

end
