class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions
  has_many :payments

  validates :name, uniqueness: {message: "Nickname must be unique"}
  validates :account_number, uniqueness: true, length: { is: 9, wrong_length: "Please enter a 9 digit number"}
  validates :credit_limit, presence: {message: "Please enter your credit limit"}
end
