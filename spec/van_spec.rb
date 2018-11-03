require 'van'
require 'docking_station'
require 'bike'
describe Van do
  let(:van) {van = Van.new}
  let(:bike) {bike = Bike.new}

  it "returns false if full and attempted dock" do
    20.times {van.dock_bike(bike)}
    expect(van.dock_bike(bike)).to eq false
  end

  it "has a default capacity of 20" do
    expect(van.capacity).to eq Van::DEFAULT_CAPACITY
  end
  it 'has the capacity of the supplied capacity argument' do
    van_1 = Van.new(10)
    expect(van_1.capacity).to eq(10)
  end
  it "releases broken bikes if any" do
    bike.condition = "bad"
    van.dock_bike(bike)
    expect(van.release_broken_bike).to eq bike
  end
  it "doesn't releases broken bikes if none" do
    expect(van.release_broken_bike).to eq false
  end
  it "releases working bikes if any" do
    van.dock_bike(bike)
    expect(van.release_working_bike).to eq bike
  end
  it "doesn't release working bike if none" do
    expect(van.release_working_bike).to eq false
  end
end
