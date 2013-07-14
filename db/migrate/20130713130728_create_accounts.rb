class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.boolean :current
      t.integer :bs_category_id

      t.timestamps
    end
  end
end
