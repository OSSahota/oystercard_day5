class Oystercard

  attr_reader :balance

  LIMIT = 90

  def initialize(balance = 0, status = false)
    @balance = balance
    @status = status
  end

  def topup(money)
    raise "Sorry, limit exceeded!" if @balance + money > LIMIT
    @balance += money
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    if @status == false
      @status = true
    end
    return "in use"
  end

  def touch_out
    if @status == true
      @status = false
    end
    return "fare completed"
  end

  def in_journey?
    @status == true
  end

  
end
