#! How do we associate one payment to one transaction?
#? Do we NEED a join table?

#! How do we make sure the outgoing payment, is the same amount as the incoming transaction?
#* I think you will prob need a method in the transaction model, that creates a payment?
#* Add attribute / column to payments table t.boolean: paid

#! How do schedule payment in the future? Thanks for being a fucking grammer nazi on your free trail subcription
#* Whenever gem https://dev.to/risafj/cron-jobs-in-rails-a-simple-guide-to-actually-using-the-whenever-gem-now-with-tasks-2omi

# 1. Remove transactionpayments migration and model
# 2. Change assocaiton in Transaction model to has_one payment
# 3. Change assocation to belongs_to transaction
# 3a. also add new migration for transaction_id to Payments table
# 4. In Transaction model, make it so when a new transaction is created, it creates payment with the same amount as the transaction
  4a. ORRRR for time saving, you can handle this in the Transaction controller
  (in the create action)
  @transaction = Transaction.new(transaction_params)
  if @transaction.save
    Payment.create!(transaction_id: @transaction.id)
    redirect_to
  else
    render :new
  end
# 5. Use the whenever gem to change a payment's status to true once 30 days have elapsed

#= simple_form_for @account do |f|
    = f.input :title, :label => 'Account Title'
    = f.input :description, :label => 'Item/Service Description'
        = f.simple_fields_for :transaction do |new_transaction|
        = new_transaction.input :amount, :label => 'Transaction Amount'
        = new_transaction.input :description, :label => 'Item/Service Description'
    = f.button :submit

    # You want to create a new transaction
    # But you want to associate it with an account

    # Option 1
    # In the transaction form, give the user a drop down menu for an account choice (I think its called = options_from_collection_for_select collection, value_method, text_method, {})

    # Option 2
    # From the account show page, make a link to "create new transaction"
    # That would be a nested route that looks something like 