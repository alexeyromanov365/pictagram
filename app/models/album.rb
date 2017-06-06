class Album < ApplicationRecord

  has_many :taggings
  has_many :tags, through: :taggings

  belongs_to :user
  has_many :photos

  validates :title, uniqueness: true
  validates_length_of :description, :minimum => 5, :maximum => 25, :allow_blank => true
end
