class Transaction < ApplicationRecord
    belongs_to :category
    belongs_to :account
    has_many :transactions_payment
    has_many :payments, through: :transactions_payment

    scope :biggest_purchase, -> {where(amount: self.maximum(:amount))}
    # scope :check_payment, -> (amount) { joins(:payment).merge(Payment.paid) => amount}
    # scope :transaction_categories, -> { joins(:category).merge(Category.order(priority: :desc))}
    validates :amount, presence: {message: "Must have an amount"}
end