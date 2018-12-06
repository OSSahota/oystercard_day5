class Oystercard

  attr_reader :balance, :entry_station, :exit_station, :journeys

  MAX_LIMIT = 90
  MIN_LIMIT = 1


  def initialize
    @balance = 0
    @status = false
    @entry_station = nil
    @exit_station = nil
    @journeys = []
  end

  def topup(money)
    raise "Sorry, limit exceeded!" if @balance + money > MAX_LIMIT
    @balance += money
  end

  def touch_in(entry_station)
    raise "YOU SHALL NOT PASSSSSSS" if @balance < MIN_LIMIT
    
    @status = true
    @exit_station = nil
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct
    @status = false
    
    @journeys << {start: entry_station, end: exit_station}
    
    @entry_station = nil
    @exit_station = exit_station
  end

  def in_journey?
    if @entry_station != nil
      @status == true 
    else 
      @exit_station == nil
    end
  end

private
    def deduct
      @balance -= MIN_LIMIT
    end

end
