class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.belongs_to :account, null: false, foreign_key: true
      t.belongs_to :category, null: false, foreign_key: true
      # t.integer :account_id
      t.float :amount
      t.text :description
      t.datetime :date

      t.timestamps
    end
  end
end
