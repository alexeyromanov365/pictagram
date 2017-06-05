class Tag < ApplicationRecord

  has_many :taggings
  has_many :albums, through: :taggings
  has_many :photos, through: :taggings

end
