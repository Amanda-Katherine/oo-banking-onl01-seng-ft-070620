class Transfer
  attr_accessor :sender, :receiver, :status, :amount, :valid


  def initialize(sender, receiver, transfer)
    @sender = sender
    @receiver = receiver
    @transfer = transfer
    @status = 'pending'
    @amount = 50
  end

  def valid?
    @sender.valid? && @receiver.valid? 
  end

  def execute_transaction
    if self.sender.balance > self.amount && self.status == 'pending'
      self.sender.balance -= self.amount
      self.receiver.deposit(self.amount)
      self.status = 'complete'
    else
      "Transaction rejected. Please check your account balance."
      self.status = 'rejected'
    end
  end

end
