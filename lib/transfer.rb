require 'pry'

class Transfer
  # your code here
attr_reader :sender, :receiver,  :amount
attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if self.sender.valid? && self.receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    # until self.status == "complete"
        if self.valid? == true && self.status =="pending" && self.sender.balance >= self.amount
          self.receiver.deposit(self.amount)
          self.sender.balance -= self.amount
          self.status = "complete"
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

# binding.pry
