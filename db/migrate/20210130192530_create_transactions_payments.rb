class CreateTransactionsPayments < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions_payments do |t|
      t.belongs_to :transaction, null: false, foreign_key: true
      t.belongs_to :payment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
