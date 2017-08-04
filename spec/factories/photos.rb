# create_table "photos", force: :cascade do |t|
#   t.string "title"
#   t.string "description"
#   t.string "picture", null: false
#   t.bigint "album_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["album_id"], name: "index_photos_on_album_id"
# end

FactoryGirl.define do
  factory :photo do
		title { Faker::Name.unique.name }
		description { Faker::Coffee.notes }
		picture { Faker::Avatar.image("my-own-slug") }
		
		association :album, strategy: :build
  end
end
