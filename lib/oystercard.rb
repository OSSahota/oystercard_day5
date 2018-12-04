class Oystercard

  attr_reader :balance

  LIMIT = 90

  def initialize(balance = 0)
    @balance = balance
  end

  def topup(money)
    raise "Sorry, limit exceeded!" if @balance + money > LIMIT
    @balance += money
  end

  def deduct(fare)
    @balance -= fare
  end

end
