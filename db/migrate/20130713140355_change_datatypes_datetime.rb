class ChangeDatatypesDatetime < ActiveRecord::Migration
	def up
		change_column :transactions, :date, :date
		change_column :projections, :period, :date		
	end
	def down
		change_column :transactions, :date, :datetime
		change_column :projections, :period, :datetime
	end
end
