class CreateStatements < ActiveRecord::Migration[6.1]
  def change
    create_table :statements do |t|
      t.float :balance
      t.float :fees
      t.float :min_payment
      t.date :payment_duedate
      t.text :description
      t.integer :account_id

      t.timestamps
    end
  end
end
