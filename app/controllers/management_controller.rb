class ManagementController < ApplicationController
    
    
    def budget
        @bs_category = BsCategory.where(:name => 'Equity').first
        @accounts = Account.where(:bs_category_id => 3)
        if params[:date]
            @month = params[:date][:month]
            @year = params[:date][:year]
        end
    end
end
