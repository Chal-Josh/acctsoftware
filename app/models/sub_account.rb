class SubAccount < ActiveRecord::Base
  attr_accessible :account_id, :name
  
  belongs_to :account
  has_many :projections
  has_many :transaction_items
  has_many :categories
  
  def sub_account_balance(sub_account)
      sub_account.transaction_items.where(:debit => true).sum("amount") - sub_account.transaction_items.where(:debit => false).sum("amount")
  end
  
end
