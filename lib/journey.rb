require_relative "./oystercard"

class Journey

  attr_reader :entry_station, :exit_station, :trip

  def start_journey(entry_station)
     @entry_station = entry_station
  end

  def end_journey(exit_station)
    @exit_station = exit_station
  end

  def trip
    {start: :entry_station, end: :exit_station}
  end

  def in_journey?
    return true if @entry_station != nil
  end

end
