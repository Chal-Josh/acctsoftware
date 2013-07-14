class Category < ActiveRecord::Base
  attr_accessible :name, :sub_account_id
  
  belongs_to :sub_account
  has_many :transaction_items
  
end
