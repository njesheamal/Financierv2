require 'faker'

User.destroy_all
print "Users have been reset." if User.count == 0

User.create!(
    first_name: "Amal",
    last_name: "Abdu",
    email: "amal@email.com",
    password: '12345678'
)

5.times do 
    User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.unique.last_name,
        email: Faker::Internet.unique.free_email,
        password: '12345678'
    )
end

print "#{User.count} have been created."

# create_table "users", force: :cascade do |t|
#     t.string "first_name", default: "", null: false
#     t.string "last_name", default: "", null: false
#     t.string "email", default: "", null: false
#     t.string "password_digest", default: "", null: false
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.string "provider", limit: 50, default: "", null: false
#     t.string "uid", limit: 500, default: "", null: false
#     t.index ["email"], name: "index_users_on_email", unique: true
#   end