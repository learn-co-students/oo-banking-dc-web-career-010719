require 'pry'
class Transfer

  attr_accessor :amount, :sender, :receiver, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid? == true
      return true
    else
      return false
    end

  end

  def execute_transaction
    if @sender.valid? == true && @status == "pending" && @sender.balance >= @amount
      # binding.pry
        @sender.balance -= @amount
        @receiver.deposit(@amount)
        @status = "complete"
    else
        @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

 def reverse_transfer
   if @receiver.valid? == true && @status == "complete" && @receiver.balance >= @amount
     # binding.pry
       @receiver.balance -= @amount
       @sender.deposit(@amount)
       @status = "reversed"
   end
 end 


end
