class Album < ApplicationRecord
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings
  has_many :photos, dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :tags, :allow_destroy => true

  validates :title, uniqueness: true, presence: true

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end
end