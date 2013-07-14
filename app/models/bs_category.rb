class BsCategory < ActiveRecord::Base
  attr_accessible :credit_impact, :debit_impact, :name
  
  has_many :accounts
  has_many :sub_accounts, :through => :accounts
  has_many :transaction_items, :through => :sub_accounts
  
  def bs_category_balance(bs_category)
      (bs_category.transaction_items.where(:debit => true).sum("amount") * bs_category.debit_impact) + (bs_category.transaction_items.where(:debit => false).sum("amount") * bs_category.credit_impact)
  end
  
end
