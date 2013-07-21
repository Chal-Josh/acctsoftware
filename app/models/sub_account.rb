class SubAccount < ActiveRecord::Base
  attr_accessible :account_id, :name
  
  belongs_to :account
  has_many :projections
  has_many :transaction_items
  has_many :transactions, :through => :transaction_items
  has_many :categories
  
  def sub_account_balance(sub_account)
      (sub_account.transaction_items.where(:debit => true).sum("amount") * sub_account.account.bs_category.debit_impact) \
      + (sub_account.transaction_items.where(:debit => false).sum("amount") * sub_account.account.bs_category.credit_impact)
  end
  
  def sub_account_period_balance(sub_account, month, year)  
      transactions = sub_account.transactions.period_transactions(month, year)
      transaction_items = transactions.map{|transaction| [transaction.transaction_items]}
     
      (transaction_items.where(:debit => true).sum("amount") * sub_account.account.bs_category.debit_impact) \
      + (transaction_items.where(:debit => false).sum("amount") * sub_account.account.bs_category.credit_impact)
  end
  
  
  def sub_account_current_month_projection(sub_account, month, year)
      sub_account.projections.where(:month => month, :year => year).sum("amount")
  end
  
  
end
