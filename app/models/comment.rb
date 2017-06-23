class Comment < ApplicationRecord
  belongs_to :photo
  belongs_to :user

  validates_length_of :content, minimum: 2, maximum: 140, allow_blank: true

end
