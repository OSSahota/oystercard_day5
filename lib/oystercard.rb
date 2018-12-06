require_relative "./journey"

class Oystercard

  attr_reader :balance

  MAX_LIMIT = 90

  def initialize
    @balance = 0

  end

  def topup(money)
    raise "Sorry, limit exceeded!" if @balance + money > MAX_LIMIT
    @balance += money
  end



end
