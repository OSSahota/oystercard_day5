class Oystercard

  attr_reader :balance, :entry_station

  MAX_LIMIT = 90
  MIN_LIMIT = 1


  def initialize(balance = 0, status = false)
    @balance = balance
    @status = status
    @entry_station = nil
  end

  def topup(money)
    raise "Sorry, limit exceeded!" if @balance + money > MAX_LIMIT
    @balance += money
  end

  def touch_in(entry_station)
    raise "YOU SHALL NOT PASSSSSSS" if @balance < MIN_LIMIT
    # if @status == false
      @status = true
    
    @entry_station = entry_station
  end

  def touch_out
    deduct
    # if @status == true
      status = false
    return "fare completed"
    @entry_station = nil
  end

  def in_journey?
    @status == true if @entry_station != nil
  end

private
    def deduct
      @balance -= MIN_LIMIT
    end

end
