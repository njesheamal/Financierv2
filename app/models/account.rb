class Account < ApplicationRecord
  belongs_to :user
  has_many :statements
  has_many :transactions
  has_many :payments
  has_many :categories, -> {distinct}, through: :transactions

  # scope :spend_category, -> { joins(:transactions).merge(Transaction.transaction_categories.first)}
  # scope :biggest_purchase, -> { joins(:transactions).merge(Transaction.most_expensive_transaction)}

  scope :active, -> { where(:status => true)}
  scope :most_frequent_category, -> { joins(:transactions).merge(Transaction.most_category)}

  validates :name, presence: true, uniqueness: {message: "Nickname must be unique"}
  validates :account_number, uniqueness: {message: "Account number must be unique"}
  validates :credit_limit, presence: {message: "Please enter your credit limit"}
  validates_length_of :account_number, within: 9..16, on: :create, message: "Must be between 9-16 digits"
end
