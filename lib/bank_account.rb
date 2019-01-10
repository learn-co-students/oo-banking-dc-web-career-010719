class BankAccount
  attr_reader :name
  attr_accessor :status, :balance

  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
  end

  def deposit(money_deposit)
    @balance += money_deposit
  end

  def display_balance
    return "Your balance is $#{@balance}."
  end

  def open?
    @status == 'open'
  end 

  def valid?
    self.open? && self.has_amount(1)
  end

  def has_amount(amount)
    @balance >= amount
  end

  def close_account
    @status = "closed"
  end

end
