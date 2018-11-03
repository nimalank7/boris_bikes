require 'docking_station'
require 'bike'
describe DockingStation do
let(:bike) { double(:bike) }
let(:docking_station) {docking_station = DockingStation.new}
  it "releases bike" do
    allow(bike).to receive(:is_working?).and_return(true)
    docking_station.dock_bike(bike)
    expect(docking_station.release_working_bike).to eq(bike)
  end

  it "can be queried to see if a bike is available" do
      expect(docking_station.available?).to eq false
      allow(bike).to receive(:is_working?).and_return(true)
      docking_station.dock_bike(bike)
      expect(docking_station.available?).to eq true
  end

  it 'does not return a bike if there are none available' do
    expect{ docking_station.release_working_bike }.to raise_exception
  end
  it 'does not dock a bike if there are no spaces available' do
    DockingStation::DEFAULT_CAPACITY.times do
      docking_station.dock_bike(bike)
    end
    expect{ docking_station.dock_bike(bike) }.to raise_exception
  end

  it 'has a capacity of DEFAULT_CAPACITY if no argument is supplied' do
    expect(docking_station.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
  end

  it 'has the capacity of the supplied capacity argument' do
    docking_station_1 = DockingStation.new(10)
    expect(docking_station_1.capacity).to eq(10)
  end
  it 'can report a bike broken' do
    allow(bike).to receive(:condition=).and_return("bad")
    allow(bike).to receive(:report_broken).and_return("bad")
    allow(bike).to receive(:is_working?).and_return(false)
    docking_station.report_broken(bike)
    expect(bike.is_working?).to eq(false)
  end
  it "doesn't release broken bikes" do
    allow(bike).to receive(:available?).and_return(false)
    allow(bike).to receive(:is_working?).and_return(false)
    allow(bike).to receive(:condition=).and_return("bad")
    docking_station.dock_bike(bike)
    expect{ docking_station.release_working_bike }.to raise_exception
  end
  it "releases broken bikes if broken bike in station" do
    allow(bike).to receive(:broken?).and_return(true)
    allow(bike).to receive(:condition=).and_return("bad")
    allow(bike).to receive(:is_working?).and_return(false)
    docking_station.dock_bike(bike)
    expect(docking_station.release_broken_bike).to eq bike
  end
end
