class Account < ActiveRecord::Base
  attr_accessible :bs_category_id, :current, :name
  
  belongs_to :bs_category
  has_many :sub_accounts
  has_many :transaction_items, :through => :sub_accounts
  
  
  def account_balance(account)
      account.transaction_items.where(:debit => true).sum("amount") - account.transaction_items.where(:debit => false).sum("amount")
  end
  
end
