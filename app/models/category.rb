class Category < ApplicationRecord
    has_many :transactions
    has_many :accounts, -> {distinct}, through: :transactions
    
    # scope :most_categories, -> { joins(:transaction.category_id).where(category_id => )}

    scope :category_title, -> (title) { where(:title => title)}
    


    def transactions_sum(account)
        # Transaction.transactions_category(self.id)
        self.transactions.by_account(account.id).sum(:amount)
    end
end 