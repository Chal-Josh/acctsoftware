class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :sub_account_id

      t.timestamps
    end
  end
end
