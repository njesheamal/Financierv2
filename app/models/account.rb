class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions
  has_many :payments

  validates :name, uniqueness: {message: "Nickname must be unique"}
  validates :account_number, uniqueness: {message: "Account number must be unique"}
  validates :credit_limit, presence: {message: "Please enter your credit limit"}
  validates_length_of :account_number, within: 9..16, on: :create, message: "Must be at least 9 digits"
end
