require "journey"
require "oystercard"

describe Journey do

  it "should set the entry station" do
    expect(subject.start_journey(:entry_station)).to eq (:entry_station)
  end

  it "should set the exit station name" do
    expect(subject.end_journey(:exit_station)).to eq (:exit_station)
  end

  it "should add a completed journey to the journey hash" do
    # subject.topup(2)
    subject.start_journey(:entry_station)
    subject.end_journey(:exit_station)
    expect(subject.trip).to include(start: :entry_station, end: :exit_station)
  end

end
