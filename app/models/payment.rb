class Payment < ApplicationRecord
  belongs_to :account
  has_many :transactions_payments
  has_many :transactions, through: :transaction_payments
end
