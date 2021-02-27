class TransactionsPayment < ApplicationRecord
  belongs_to :transaktion, class_name: "Transaction"
  belongs_to :payment
end

# @payment = @transaction.payments.build

# TransactionPayment.new(transaction_id: 1, payment_id)