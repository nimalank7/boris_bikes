require 'docking_station'
require 'bike'
describe DockingStation do
  it "can be instantiated" do
    docking_station = DockingStation.new
    expect(docking_station.instance_of? DockingStation).to eq true
  end
  it "release bike" do
    docking_station = DockingStation.new
    docking_station.dock_bike(Bike.new)
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

  it 'does not return a bike if there are none available' do
    docking_station = DockingStation.new
    expect{ docking_station.release_bike }.to raise_exception
  end
  it 'does not dock a bike if there are no spaces available' do
    docking_station = DockingStation.new
    DockingStation::DEFAULT_CAPACITY.times do
      docking_station.dock_bike(Bike.new)
    end
    expect{ docking_station.dock_bike(Bike.new) }.to raise_exception
  end

  it 'has a capacity of DEFAULT_CAPACITY if no argument is supplied' do
    docking_station = DockingStation.new
    expect(docking_station.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
  end

  it 'has the capacity of the supplied capacity argument' do
    docking_station = DockingStation.new(10)
    expect(docking_station.capacity).to eq(10)
  end
end
