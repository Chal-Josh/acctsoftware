class ManagementController < ApplicationController
    
    
    def budget
        @bs_category = BsCategory.where(:name => 'Equity').first
        @accounts = Account.where(:bs_category_id => 3)
        if params[:date]
            if params[:date][:month].length == 2
                @month = params[:date][:month]
            else 
                @month = "0" + params[:date][:month]
            end
            @year = params[:date][:year]
        else
            time = Time.now
            @month = time.strftime("%m")
            @year = time.strftime("%Y")
        end
    end
end
