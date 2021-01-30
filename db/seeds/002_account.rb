require 'faker'

Account.destroy_all
print "Accounts have been reset." if Account.count == 0

5.times do
    Account.create!(
        user_id: Faker::Number.between(from: User.first.id, to: User.last.id),
        name: Faker::DcComics.hero,
        description: Faker::Business.credit_card_type,
        credit_limit: Faker::Number.number(digits: 5),
        account_number: Faker::Bank.account_number(digits: 9)  
    )
end

print "#{Account.count} have been created."

# create_table "accounts", force: :cascade do |t|
#     t.bigint "user_id"
#     t.string "name"
#     t.text "description"
#     t.integer "credit_limit"
#     t.float "balance"
#     t.float "account_number"
#     t.boolean "status"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.index ["user_id"], name: "index_accounts_on_user_id"
#   end
