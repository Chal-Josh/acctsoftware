class CreateSubAccounts < ActiveRecord::Migration
  def change
    create_table :sub_accounts do |t|
      t.string :name
      t.integer :account_id

      t.timestamps
    end
  end
end
