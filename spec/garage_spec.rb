require 'garage'
require 'van'
require 'bike'

describe Garage do
  let(:bike) {bike = Bike.new}
  let(:garage) {garage = Garage.new}
  let(:van) {van = Van.new}
  it "capacity of garage is set to empty array" do
    expect(garage.bikes).to eq([])
  end
  it "has a default capacity of 20" do
    expect(garage.capacity).to eq Garage::DEFAULT_CAPACITY
  end
  it 'has the capacity of the supplied capacity argument' do
    garage_1 = Garage.new(10)
    expect(garage_1.capacity).to eq(10)
  end
  it "returns false if garage is full and dock attempted" do
    20.times{garage.dock_bike(bike)}
    expect(garage.dock_bike(bike)).to eq false
  end

  it "releases working bikes unless empty" do
    garage.dock_bike(bike)
    expect(garage.releases_working_bike).to eq bike
  end
  it "returns false if no bikes and attempted release" do
    expect(garage.releases_working_bike).to eq false
  end
  it "fixes bikes" do
    bike.condition = "bad"
    garage.fix_bike(bike)
    expect(bike.condition).to eq "good"
  end
end
