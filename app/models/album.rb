class Album < ApplicationRecord

  has_many :taggings
  has_many :tags, through: :taggings

  belongs_to :user
  has_many :photos, dependent: :destroy

  validates :title, uniqueness: true, presence: true
  validates_length_of :description, :minimum => 5, :maximum => 25, :allow_blank => true


  def all_tags=(names)
    self.tags = names.split(",").map do |name|
        Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    binding.pry
    self.tags.map(&:name).join(", ")
  end

end
