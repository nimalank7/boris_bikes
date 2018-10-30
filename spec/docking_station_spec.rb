require 'docking_station'
describe DockingStation do
  it "can be instantiated" do
    docking_station = DockingStation.new
    expect(docking_station.instance_of? DockingStation).to eq true
  end
  it "release bike" do
    docking_station = DockingStation.new
    expect(docking_station.release_bike.instance_of?(Bike)).to be(true)
  end
end
