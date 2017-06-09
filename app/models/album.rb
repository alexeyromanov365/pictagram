class Album < ApplicationRecord

  has_many :taggings
  has_many :tags, through: :taggings
  accepts_nested_attributes_for :tags, :allow_destroy => true

  belongs_to :user, optional: true
  has_many :photos, dependent: :destroy

  validates :title, uniqueness: true, presence: true
  validates_length_of :description, :minimum => 5, :maximum => 25, :allow_blank => true


  def all_tags=(names)
    self.tags_attributes = names.split(",").map do |name|
        #Tag.where(name: name.strip).first_or_create
        { name: name }
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

end
