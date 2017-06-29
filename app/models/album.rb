class Album < ApplicationRecord

  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings

  has_many :photos, dependent: :destroy
  belongs_to :user

  validates :title, uniqueness: true, presence: true

  def all_tags
    self.tags.map(&:name).join(', ')
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

end