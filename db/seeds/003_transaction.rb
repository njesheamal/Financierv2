require 'faker'

Transaction.destroy_all
print "Transactions have been reset." if Transaction.count == 0

50.times do
    Transaction.create!(
        account_id: Faker::Number.between(from: Account.first.id, to: Account.last.id),
        category_id: Faker::Number.between(from: Category.first.id, to: Category.last.id),
        amount: Faker::Commerce.price,
        category: Faker::Commerce.department,
        description: Faker::Commerce.product_name,
        date: Faker::Date.backward(days: 23)   #! why?

    )
end


print "#{Transaction.count} have been created."
# create_table "transactions", force: :cascade do |t|
#     t.bigint "account_id", null: false
#     t.bigint "category_id", null: false
#     t.float "amount"
#     t.text "description"
#     t.datetime "date"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.index ["account_id"], name: "index_transactions_on_account_id"
#     t.index ["category_id"], name: "index_transactions_on_category_id"
#   end
