# create_table "users", force: :cascade do |t|
#   t.string "email", default: "", null: false
#   t.string "encrypted_password", default: "", null: false
#   t.string "reset_password_token"
#   t.datetime "reset_password_sent_at"
#   t.datetime "remember_created_at"
#   t.integer "sign_in_count", default: 0, null: false
#   t.datetime "current_sign_in_at"
#   t.datetime "last_sign_in_at"
#   t.string "current_sign_in_ip"
#   t.string "last_sign_in_ip"
#   t.string "first_name"
#   t.string "last_name"
#   t.string "gender"
#   t.string "about_me"
#   t.string "adress"
#   t.string "avatar"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.string "role"
#   t.string "confirmation_token"
#   t.datetime "confirmed_at"
#   t.datetime "confirmation_sent_at"
#   t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
#   t.index ["email"], name: "index_users_on_email", unique: true
#   t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
# end

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { Faker::Internet.password }
    gender { Faker::Omniauth.google[:extra][:raw_info][:gender].first.capitalize }
    about_me { Faker::Simpsons.quote  }
    adress { Faker::HarryPotter.location }
    avatar { Faker::Avatar.image("my-own-slug") }
    role 'user'
  end
end
