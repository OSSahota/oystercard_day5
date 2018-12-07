require_relative "./journey"

class Oystercard

  attr_reader :balance, :entry_station, :exit_station, :journeys, :journey
  MIN_LIMIT = 1
  MAX_LIMIT = 90

  def initialize(journey = Journey.new)
    @balance = 0
    @status = false
    @entry_station = nil
    @exit_station = nil
    @journeys = []
    @journey = journey
  end

  def topup(money)
    raise "Sorry, limit exceeded!" if @balance + money > MAX_LIMIT
    @balance += money
  end

  def touch_in(entry_station)
    raise "YOU SHALL NOT PASSSSSSS" if @balance < MIN_LIMIT

    @status = true
    # @exit_station = nil

    journey.start_journey(entry_station)
  end

  def touch_out(exit_station)
    deduct
    @status = false
    @journeys << {start: entry_station, end: exit_station}
    # @entry_station = nil
    journey.end_journey(exit_station)
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
