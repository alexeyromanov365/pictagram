class Photo < ApplicationRecord

  has_many :taggings
  has_many :tags, through: :taggings

  belongs_to :album

end