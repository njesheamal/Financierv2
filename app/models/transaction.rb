class Transaction < ApplicationRecord
    belongs_to :category
    belongs_to :account
    has_many :transactions_payment
    has_many :payments, through: :transactions_payment

    scope :biggest_purchase, -> {where(amount: self.maximum(:amount))}
    scope :by_account, -> (number) {where(account_id: number)}



    # scope :most_categories, -> {where(category: self.maximum(:category_id))}
    # scope :most_category, -> {where(category_id: self.minimum(:category_id))}

    
    validates :amount, presence: {message: "Must have an amount"}
end