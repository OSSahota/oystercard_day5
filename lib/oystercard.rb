require_relative "./journey"

class Oystercard

  attr_reader :balance, :journeys, :journey, :history
  MIN_LIMIT = 1
  MAX_LIMIT = 90

  def initialize(journey = Journey.new)
    @balance = 0
    @status = false
    @journey = journey
    @history = []
  end

  def topup(money)
    raise "Sorry, limit exceeded!" if @balance + money > MAX_LIMIT
    @balance += money
  end

  def touch_in(entry_station)
    raise "YOU SHALL NOT PASSSSSSS" if @balance < MIN_LIMIT

    @status = true

    journey.start_journey(entry_station)
  end

  def touch_out(exit_station)
    deduct
    @status = false
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

      def add_history
        @history << journey.trip
      end

end
