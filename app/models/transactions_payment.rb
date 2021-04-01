class TransactionsPayment < ApplicationRecord
  belongs_to :purchase, class_name: "Transaction", foreign_key: "transaction_id"
  belongs_to :payment
end