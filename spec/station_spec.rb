require 'station.rb'

describe Station do

    let (:name) {double :name}
    let (:zone) {double :zone}
    let (:station) {Station.new(name, zone)}

    it "checks that the station name variable responds to the station class" do
        expect(station.name).to eq(name)
    end

    it "checks that the station zone variable responds to the station class" do
        expect(station.zone).to eq(zone)
    end

end
