class Transaction < ApplicationRecord
    belongs_to :category
    belongs_to :account
    has_many :transactions_payment
    has_many :payments, through: :transactions_payment

    validates :amount, presence: {message: "Must have an amount"}

    def biggest_spend
        Transaction.joins(:category).merge(Category.order(priority: :desc))
    end
end
