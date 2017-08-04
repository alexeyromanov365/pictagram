class Album < ApplicationRecord
  belongs_to :user
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings
  has_many :photos, dependent: :destroy

  validates :title, uniqueness: { scope: [:user_id], case_sensitive: false }, presence: true
  validates :photos, length: { maximum: 50 }

  def self.search(term)
    where("title iLIKE :term", term: "%#{term}%")
  end
end