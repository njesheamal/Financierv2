class Transaction < ApplicationRecord
    belongs_to :category
    belongs_to :account
    has_many :transactions_payment
    has_many :payments, through: :transactions_payment
    # has_many :objects, through: :join_association, source: :join_association_table_foreign_key_to_objects_table
    #! Aliasing?

    validates :amount, presence: true {message: "Must have an amount"}
end
