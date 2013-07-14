class CreateBsCategories < ActiveRecord::Migration
  def change
    create_table :bs_categories do |t|
      t.string :name
      t.integer :debit_impact
      t.integer :credit_impact

      t.timestamps
    end
  end
end
