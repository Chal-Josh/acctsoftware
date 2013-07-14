class CreateProjections < ActiveRecord::Migration
  def change
    create_table :projections do |t|
      t.decimal :amount
      t.datetime :period
      t.boolean :success
      t.integer :sub_account_id

      t.timestamps
    end
  end
end
