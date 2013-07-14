class Projection < ActiveRecord::Base
  attr_accessible :amount, :period, :sub_account_id, :success
  
  belongs_to :sub_account
  
end
