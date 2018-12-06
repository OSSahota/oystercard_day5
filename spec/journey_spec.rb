require "journey"
require "oystercard"

describe Journey do

  let (:entry_station) {double :entry_station}
  let (:exit_station) {double :exit_station}

  it "checks that we have an empty list of journeys as default" do
    expect(subject.journeys).to be_empty
  end

  context "#touch_in" do

    it "should raise an error if balance is less than £1 on touch in" do
      expect{ subject.touch_in(:entry_station) }.to raise_error "YOU SHALL NOT PASSSSSSS"
    end

    it "should set the entry station name on touch in" do
      subject.topup(2)
      expect(subject.touch_in(:entry_station)).to eq (:entry_station)
    end
  end

  context "#touch_out" do

    it "should deduct the correct fare on touch out" do
      expect {subject.touch_out(:exit_station)}.to change{subject.balance}.by -Oystercard::MIN_LIMIT
    end

    it "should remember the exit station name on touch out" do
      expect(subject.touch_out(:exit_station)).to eq (:exit_station)
    end
  end

  it "should return true if we are in journey" do
    subject.topup(2)
    subject.touch_in(:entry_station)
    expect(subject.in_journey?).to eq true
  end

  it "should add a completed journey to the journey hash" do
    subject.topup(2)
    subject.touch_in(:entry_station)
    subject.touch_out(:exit_station)
    expect(subject.journeys).to include(start: :entry_station, end: :exit_station)
  end

end
