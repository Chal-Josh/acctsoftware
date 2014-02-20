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
    
    def income_statement
        @bs_category = BsCategory.where(:name => 'Equity').first
        @accounts = Account.where(:bs_category_id => 3)
        if params[:start]
            # set date for starting range
            if params[:start][:month].length == 2
                @month_start = params[:start][:month]
            else 
                @month_start = "0" + params[:start][:month]
            end
            # set date for ending range
            if params[:end][:month].length == 2
                @month_end = params[:end][:month]
            else 
                @month_end = "0" + params[:end][:month]
            end
            @year_start = params[:start][:year]
            @year_end = params[:end][:year]
            @period_count = (1 + (@month_end.to_i - @month_start.to_i) + ((@year_end.to_i - @year_start.to_i) * 12))            
        else
            time = Time.now
            @month_start = time.strftime("%m")
            @year_start = time.strftime("%Y")
            @month_end = time.strftime("%m")
            @year_end = time.strftime("%Y")
        end
    end
    
end
