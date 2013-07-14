class ManagementController < ApplicationController
    
    
    def budget
        @bs_category = BsCategory.where(:name => 'Equity').first
        @accounts = Account.where(:bs_category_id => 3)
    end
end
