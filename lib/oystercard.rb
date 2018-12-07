require_relative "./journey"

class Oystercard

  attr_reader :balance, :journey, :history
  MIN_LIMIT = 1
  MAX_LIMIT = 90

  def initialize(journey = Journey.new)
    @balance = 0
    @journey = journey
    @history = []
  end

  def topup(money)
    raise "Sorry, limit exceeded!" if @balance + money > MAX_LIMIT
    @balance += money
  end

  def touch_in(entry_station)
    raise "YOU SHALL NOT PASSSSSSS" if @balance < MIN_LIMIT
    journey.start_journey(entry_station)
  end

  def touch_out(exit_station)
    deduct
    journey.end_journey(exit_station)
  end

  private
      def deduct
        @balance -= MIN_LIMIT
      end

      def add_history
        @history << journey.trip
      end

end
