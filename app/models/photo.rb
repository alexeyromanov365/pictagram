class Photo < ApplicationRecord
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings
  has_many :comments, dependent: :destroy
  belongs_to :album

  validates :picture, presence: true
  validates :title, presence: true

  accepts_nested_attributes_for :tags, :allow_destroy => true
  mount_uploader :picture, PhotoUploader

  def all_tags=(names)
    self.tags_attributes = names.split(",").map do |name|
      { name: name }.first_or_create
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end
end