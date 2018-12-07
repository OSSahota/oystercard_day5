require "journey"
require "oystercard"

describe Journey do

  it "should set the entry station" do
    expect(subject.start_journey(:entry_station)).to eq (:entry_station)
  end

  it "should set the exit station name" do
    expect(subject.end_journey(:exit_station)).to eq (:exit_station)
  end

end
