class Photo < ApplicationRecord

  has_many :taggings
  has_many :tags, through: :taggings

  mount_uploader :picture, PhotoUploader
  validates :picture, presence: true
  validates :title, presence: true

  belongs_to :album, optional: true

  has_many :comments

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
        Tag.where(name: name.strip).first_or_create
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

end