class Account < ActiveRecord::Base
  attr_accessible :bs_category_id, :current, :name
  
  belongs_to :bs_category
  has_many :sub_accounts
  has_many :transaction_items, :through => :sub_accounts
  has_many :transactions, :through => :transaction_items
  has_many :projections, :through => :sub_accounts
  
  
  def account_balance(account)
      (account.transaction_items.where(:debit => true).sum("amount")  * account.bs_category.debit_impact) \
      + (account.transaction_items.where(:debit => false).sum("amount")  * account.bs_category.credit_impact)
  end
  
  def account_period_balance(account, month, year)  
      transactions = account.transactions.period_transactions(month, year)
      (account.transaction_items.where(:debit => true, :transaction_id => transactions).sum("amount") * account.bs_category.debit_impact) \
      + (account.transaction_items.where(:debit => false, :transaction_id => transactions).sum("amount") * account.bs_category.credit_impact)
  end
  
  def account_current_month_projection(account, month, year)
      account.projections.where(:month => month, :year => year).sum("amount")
  end  
  
end
