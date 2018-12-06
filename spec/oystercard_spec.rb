require "oystercard"

describe Oystercard do

  let (:entry_station) {double :entry_station}
  let (:exit_station) {double :exit_station}

  it { is_expected.to respond_to(:balance) }

  it "checks that initialized balance is 0" do
    expect(subject.balance).to eq(0)
  end


  it  { is_expected.to respond_to(:topup).with(1).argument }

    it "tops up the current balance of the card with whatever value is passed as an argument" do
      expect{ subject.topup(1) }.to change{ subject.balance }.by(1)
    end

    it "throws an error if the limit is exceeded" do
      money = Oystercard::MAX_LIMIT
      subject.topup(money)
      expect{ subject.topup(10) }.to raise_error "Sorry, limit exceeded!"
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

end
