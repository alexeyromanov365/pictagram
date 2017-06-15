class Photo < ApplicationRecord

  has_many :taggings
  has_many :tags, through: :taggings
  has_many :comments, dependent: :destroy
  belongs_to :album

  validates :picture, presence: true
  validates :title, presence: true

  mount_uploader :picture, PhotoUploader

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
        Tag.where(name: name.strip).first_or_create
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

end