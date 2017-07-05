class Album < ApplicationRecord
  belongs_to :user
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings
  has_many :photos, dependent: :destroy
  validates :title, uniqueness: true, presence: true

  def self.search(search)
    where("title iLIKE ?", "%#{search}%")
  end
end