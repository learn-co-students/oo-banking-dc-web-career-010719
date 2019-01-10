class Transfer

attr_reader :sender, :receiver, :amount
attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end# your code here

   def valid?
     self.sender.valid? == true && self.receiver.valid? == true
   end

   def execute_transaction

    if self.status == "pending" && self.valid? && self.sender.balance >= self.amount

    self.sender.balance -= self.amount
    self.receiver.balance += self.amount
    self.status = "complete"
    else
       self.status="rejected"
       "Transaction rejected. Please check your account balance."
    end
   end

   def reverse_transfer
     if self.status == "complete" && self.valid? && self.receiver.balance >= self.amount

     self.sender.balance += self.amount
     self.receiver.balance -= self.amount
     self.status = "reversed"
     else
        self.status="rejected"
        "Transaction rejected. Please check your account balance."
     end
   end

end
