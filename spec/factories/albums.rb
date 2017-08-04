# create_table "albums", force: :cascade do |t|
#   t.string "title"
#   t.string "description"
#   t.bigint "user_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["user_id"], name: "index_albums_on_user_id"
# end

FactoryGirl.define do
	factory :album do
		title { Faker::Name.unique.name }
		description { Faker::Coffee.notes }

		association :user, strategy: :build
	end
end
