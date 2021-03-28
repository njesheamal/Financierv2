module AccountsHelper

  def calculate_balance(account)
    if account.transactions != nil
      account.balance -= account.credit_limit - account.transaction.amount
    else 
      account.balance = account.credit_limit
    end
  end
  
end
