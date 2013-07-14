class Transaction < ActiveRecord::Base
  attr_accessible :date, :memo, :transaction_items_attributes
  
  has_many :transaction_items
  
  accepts_nested_attributes_for :transaction_items
  
end
