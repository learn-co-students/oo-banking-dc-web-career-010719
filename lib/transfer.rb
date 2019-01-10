class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    if !@sender.valid? || !@receiver.valid?
      return false
    elsif !@sender.has_amount(@amount)
      return false
    else
      return true
    end
  end

  def pending?
    @status == 'pending'
  end

  def completed?
    @status == 'complete'
  end


  def execute_transaction
    # binding.pry
    if !self.valid?
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif self.pending?
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    end
  end

  def reverse_transfer
    if self.completed? && @receiver.has_amount(@amount)
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    end
  end
end
