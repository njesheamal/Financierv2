class TransactionsPayments < ApplicationRecord
  belongs_to :transaction
  belongs_to :payment
end
