class Transaction < ActiveRecord::Base
  attr_accessible :date, :memo, :transaction_items_attributes
  
  validates_presence_of :memo, :date
  
  has_many :transaction_items
  
  accepts_nested_attributes_for :transaction_items, allow_destroy: true
  
  def transaction_balance_check(transaction)
      transaction.transaction_items.where(:debit => true).sum("amount") \
      - transaction.transaction_items.where(:debit => false).sum("amount")
  end
  
  def transaction_balance(transaction)
      transaction.transaction_items.where(:debit => true).sum("amount")
  end
  
  def self.period_transactions(month, year)
      # calculate the number of days in the month to set the back end of the range
      days_in_month = Time.days_in_month(month.to_f, year.to_f)
      # create the date range to period transaction selection
      where("date >= ? and date <= ?", "#{year}-#{month}-01", "#{year}-#{month}-#{days_in_month}")
  end    
  
  
end
