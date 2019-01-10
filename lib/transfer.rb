require 'pry'
class Transfer
  # your code here

  attr_reader :sender, :receiver
  attr_accessor :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    (self.sender.valid? && self.receiver.valid?) ? true : false
  end

  def execute_transaction
    if (self.valid? && self.amount <= self.sender.balance && self.status == "pending")
      self.receiver.deposit(self.amount)
      self.sender.balance -= self.amount
      self.status = "complete"
      # binding.pry
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.deposit(self.amount)
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end

end
