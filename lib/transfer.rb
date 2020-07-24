require 'pry'

class Transfer

  attr_accessor :amount, :status
  attr_reader :sender, :receiver


def initialize(sender, receiver, amount)
@sender = sender
@receiver = receiver
@amount = amount
@status = "pending"
end

def valid?
  if sender.valid? && receiver.valid?
    return true
  else
    return false
  end
end

def execute_transaction
  if sender.valid? && self.status != "complete" && self.amount < sender.balance
  self.status = "complete" 
  sender.balance -= self.amount
  receiver.balance += self.amount
  else  
  self.status = "rejected"
  return "Transaction rejected. Please check your account balance."
end
end

def reverse_transfer
  if self.status == "complete"
  Transfer.new(receiver, sender, self.amount).execute_transaction
  self.status = "reversed"
end

end

end
