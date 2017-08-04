# create_table "photos", force: :cascade do |t|
#   t.string "title"
#   t.string "description"
#   t.string "picture", null: false
#   t.bigint "album_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["album_id"], name: "index_photos_on_album_id"
# end

require 'rails_helper'

RSpec.describe Photo, type: :model do
	context 'attribute validators' do
		subject { build(:photo) }
		it { should validate_presence_of(:title) }
		it { should validate_presence_of(:picture) }
		it { should_not validate_presence_of(:description) }
	end
end
