class Category < ApplicationRecord
    has_many :transactions
    has_many :accounts, through: :transactions
    
    # scope :most_categories, -> { joins(:transaction.category_id).where(category_id => )}

    scope :category_title, -> (digit) { where(:category_id => digit)}
end 