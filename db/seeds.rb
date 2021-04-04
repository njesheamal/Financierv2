require 'faker'

Transaction.destroy_all
puts "Transactions have been reset." if Transaction.count == 0

Payment.destroy_all
puts "Payments have been reset." if Payment.count == 0

Category.destroy_all
puts "Categories have been reset." if Category.count == 0

Account.destroy_all
puts "Accounts have been reset." if Account.count == 0

User.destroy_all
puts "Users have been reset." if User.count == 0

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

puts "#{User.count} Users have been created."




5.times do
    Account.create!(
        user_id: Faker::Number.between(from: User.first.id, to: User.last.id),
        name: Faker::DcComics.hero,
        description: Faker::Business.credit_card_type,
        credit_limit: Faker::Number.number(digits: 5),
        account_number: Faker::Bank.account_number(digits: 13)  
    )
end

puts "#{Account.count} Accounts have been created."

12.times do
    Statement.create!(
        account_id: Faker::Number.between(from: Account.first.id, to: Account.last.id),
        balance: Faker::Number.between(from: Account.first.credit_limit, to: Account.last.credit_limit),
        description: Faker::Hipster.sentences(number: 1),
        min_payment: Faker::Commerce.price,
        fees: "0",
        payment_duedate: Faker::Date.forward(days: 30)
    )
end

puts "#{Statement.count} Statements have been created!"

12.times do 
    Category.create!(
        title: Faker::Commerce.department(max: 1, fixed_amount: true)
    )
end
puts "#{Category.count} Categories have been created."


10.times do
    Transaction.create!(
        account_id: Faker::Number.between(from: Account.first.id, to: Account.last.id),
        category_id: Faker::Number.between(from: Category.first.id, to: Category.last.id),
        amount: Faker::Commerce.price,
        description: Faker::Commerce.product_name,
        date: Faker::Date.backward(days: 23)   #! why?

    )
end

puts "#{Transaction.count} Transactions have been created."

10.times do 
    Payment.create!(
        account_id: Faker::Number.between(from: Account.first.id, to: Account.last.id),
        date: Faker::Date.forward(days: 23),
        amount: Faker::Commerce.price
    )
end

puts "#{Payment.count} Payments have been created."

