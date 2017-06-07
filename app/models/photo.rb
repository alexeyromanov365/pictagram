class Photo < ApplicationRecord

  has_many :taggings
  has_many :tags, through: :taggings

  mount_uploader :picture, PhotoUploader

  belongs_to :album

end