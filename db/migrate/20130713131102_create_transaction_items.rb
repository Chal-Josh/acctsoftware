class CreateTransactionItems < ActiveRecord::Migration
  def change
    create_table :transaction_items do |t|
      t.decimal :amount
      t.boolean :debit
      t.integer :sub_account_id
      t.integer :transaction_id
      t.integer :category_id

      t.timestamps
    end
  end
end
