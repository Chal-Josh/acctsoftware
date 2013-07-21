class AddMonthToProjections < ActiveRecord::Migration
  def change
	remove_column :projections, :period
    add_column :projections, :month, :integer
    add_column :projections, :year, :integer
  end
end
