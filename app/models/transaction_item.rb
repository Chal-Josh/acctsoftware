class TransactionItem < ActiveRecord::Base
  attr_accessible :amount, :category_id, :debit, :sub_account_id, :transaction_id
  

  
  belongs_to :sub_account
  belongs_to :account
  belongs_to :bs_category
  belongs_to :category
  belongs_to :transaction
  
end