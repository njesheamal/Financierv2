class Payment < ApplicationRecord
  belongs_to :account
  has_many :transactions_payment
  has_many :purchases, through: :transactions_payment
end
