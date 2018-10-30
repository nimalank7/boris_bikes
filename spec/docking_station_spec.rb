require 'docking_station'
describe "Docking_station" do
  it "can be instantiated" do
    docking_station = Docking_station.new
    expect(docking_station.instance_of? Docking_station).to eq true
  end
  it "release bike" do
    docking_station = Docking_station.new
    expect(docking_station.release_bike).to eq "Bike released."
  end
end
