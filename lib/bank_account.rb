class BankAccount

  attr_accessor :status, :balance
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(money)
    self.balance += money
  end

  def display_balance
    return "Your balance is $#{self.balance}."
  end

  def valid?
    if self.balance > 0 && self.status == "open"
      return true
    else
      return false
    end
  end

  def close_account
    self.status = "closed"
  end



end
