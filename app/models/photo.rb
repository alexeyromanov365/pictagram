class Photo < ApplicationRecord
  belongs_to :album
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings
  has_many :comments, dependent: :destroy
  
  mount_uploader :picture, PhotoUploader
  validates :picture, :title, presence: true
end