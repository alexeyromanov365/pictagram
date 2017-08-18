class Tag < ApplicationRecord
  has_many :taggings
  has_many :albums, through: :taggings, source: :taggable, source_type: 'Album', dependent: :destroy
  has_many :photos, through: :taggings, source: :taggable, source_type: 'Photo', dependent: :destroy
  validates :name, format: /\A#[\w\d]{1,20}\z/

  def self.search(term)
    where("name iLIKE :term", term: "%#{term}%")
  end
end
