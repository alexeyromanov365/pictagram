class Tagging < ApplicationRecord

  belongs_to :album, optional: true
  belongs_to :photo, optional: true
  belongs_to :tag, optional: true

end
