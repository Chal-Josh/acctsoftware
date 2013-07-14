class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.text :memo
      t.datetime :date

      t.timestamps
    end
  end
end
