class Transaction < ApplicationRecord
    belongs_to :category
    belongs_to :account
    has_many :transactions_payment
    has_many :payments, through: :transactions_payment

    scope :most_expensive_transaction, -> {where(amount: self.maximum(:amount))}
    # scope :transaction_categories, -> { joins(:category).merge(Category.order(priority: :desc))}
    validates :amount, presence: {message: "Must have an amount"}

    # def big_spend
    #     Transaction.joins(:category).merge(Category.order(priority: :desc))
    # end
end
