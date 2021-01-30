require 'faker'

Payment.destroy_all
print "Payments have been reset." if Payment.count == 0

50.times do 
    Payment.create!(
        account_id: Faker::Number.between(from: Account.first.id, to: Account.last.id),
        date: Faker::Date.forward(days: 23),
        amount: Faker::Commerce.price
    )
end

print "#{Payment.count} have been created."
# create_table "payments", force: :cascade do |t|
#     t.bigint "account_id", null: false
#     t.datetime "date"
#     t.date "due_date"
#     t.boolean "status"
#     t.float "amount"
#     t.text "description"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.index ["account_id"], name: "index_payments_on_account_id"
#   end