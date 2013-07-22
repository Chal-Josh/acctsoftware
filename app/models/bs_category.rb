class BsCategory < ActiveRecord::Base
  attr_accessible :credit_impact, :debit_impact, :name
  
  has_many :accounts
  has_many :sub_accounts, :through => :accounts
  has_many :transaction_items, :through => :sub_accounts
  has_many :projections, :through => :sub_accounts  
  has_many :transactions, :through => :transaction_items  

  
  def bs_category_balance(bs_category)
      (bs_category.transaction_items.where(:debit => true).sum("amount") * bs_category.debit_impact) \
      + (bs_category.transaction_items.where(:debit => false).sum("amount") * bs_category.credit_impact)
  end
  
  def bs_category_period_balance(bs_category, month, year)  
      transactions = bs_category.transactions.period_transactions(month, year)
      (bs_category.transaction_items.where(:debit => true, :transaction_id => transactions).sum("amount") * bs_category.debit_impact) \
      + (bs_category.transaction_items.where(:debit => false, :transaction_id => transactions).sum("amount") * bs_category.credit_impact)
  end  
  
  def bs_category_current_month_projection(bs_category, month, year)
      bs_category.projections.where(:month => month, :year => year).sum("amount")
  end  
  
  
end
