class UserAccount < ApplicationRecord
  belongs_to :account
  has_many :current_accounts


  def accountName
    account.name
  end 

 
 



end
