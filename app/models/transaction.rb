class Transaction < ApplicationRecord
    belongs_to :category
    belongs_to :account
    has_many :transactions_payments
    has_many :payments, through: :transactions_payments
    # has_many :objects, through: :join_association, source: :join_association_table_foreign_key_to_objects_table
    #! Aliasing?
end
