class User < ApplicationRecord
    has_many :accounts
    has_many :transactions, through: :accounts
    has_many :payments, through: :accounts

    has_secure_password
    # validates :first_name, :last_name, :email, presence: true
    # validates :email, :unique =>  true
end
