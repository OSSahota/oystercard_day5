require 'station.rb'

describe Station do

    let (:name) {double :name}
    let (:zone) {double :zone}

    it "checks that the station name variable responds to the station class" do
        expect(subject).to respond_to(:name)
    end 

    it "checks that the station zone variable responds to the station class" do
        expect(subject).to respond_to(:zone)
    end 

end