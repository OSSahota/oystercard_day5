require "oystercard"

describe Oystercard do

  it { is_expected.to respond_to(:balance) }

  it "checks that initialized balance is 0" do
    expect(subject.balance).to eq(0)
  end


  it  { is_expected.to respond_to(:topup).with(1).argument }

    it "tops up the current balance of the card with whatever value is passed as an argument" do
      expect{ subject.topup(1) }.to change{ subject.balance }.by(1)
    end

    it "throws an error if the limit is exceeded" do
      money = Oystercard::LIMIT
      subject.topup(money)
      expect{ subject.topup(10) }.to raise_error "Sorry, limit exceeded!"
    end

   it "deducts the fare from my card balance" do
     expect{ subject.deduct(2) }.to change{ subject.balance }.by(-2)
   end

   it "should give you a state 'in use' for your oystercard" do
     expect(subject.touch_in). to eq "in use"
   end

   it "should give you a state 'fare completed' for your oystercard" do
     expect(subject.touch_out). to eq "fare completed"
   end

   it "should return true if we are touched in" do
     subject.touch_in
     expect(subject.in_journey?).to eq true
   end

end
