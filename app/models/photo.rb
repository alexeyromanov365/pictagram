class Photo < ApplicationRecord
	NUMBER_OF_PERMITTED_PHOTOS = 50

  belongs_to :album, counter_cache: true
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings
  has_many :comments, dependent: :destroy
  validate :album_photos_limit, on: :create

  mount_uploader :picture, PhotoUploader
  validates :picture, :title, presence: true
	
  private

	def album_photos_limit
		if album.photos.size > NUMBER_OF_PERMITTED_PHOTOS
			errors.add(:base, "Exceeded photos limit in album. Max number is #{NUMBER_OF_PERMITTED_PHOTOS} photos.") 
		end	
	end
end