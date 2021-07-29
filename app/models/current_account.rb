class CurrentAccount < ApplicationRecord
  belongs_to :user_account


  validate :overlapping
  validates :description, :presence => true

  paginates_per 3  

  def saldex
    user_account.bal
  end

  def inde
    #@current_accounts = CurrentAccount.all
    @current_accounts = CurrentAccount.all.order('debit ASC')
  end

  def calcularSaldo
    (credit - debit)
  end


  def overlapping
    UserAccount.all.each do |user_account|
      if (DateTime.now > user_account.end) && (self.user_account.id == user_account.id)
        errors.add(:end, "no se puede porque la cuenta está vencida")
        break
      end
    end
    puts "*** movimiento realizado con exito ***"  
  end
  

end
