require 'docking_station'
require 'bike'
describe DockingStation do
  it "can be instantiated" do
    docking_station = DockingStation.new
    expect(docking_station.instance_of? DockingStation).to eq true
  end
  it "release bike" do
    docking_station = DockingStation.new
    expect(docking_station.release_bike.instance_of?(Bike)).to be(true)
  end
  it "bikes" do
    docking_station = DockingStation.new
    bike = Bike.new
    docking_station.dock_bike(bike)
    expect(docking_station.bikes). to eq [bike]
  end
  it "dock bike" do
    docking_station = DockingStation.new
    bike = Bike.new
    docking_station.dock_bike(bike)
    expect(docking_station.bikes.include? bike).to eq true
  end

  it "can be queryied to see if a bike is available" do
      docking_station = DockingStation.new
      bike = Bike.new
      expect(docking_station.available?).to eq false
      docking_station.dock_bike(bike)
      expect(docking_station.available?).to eq true
  end
end
