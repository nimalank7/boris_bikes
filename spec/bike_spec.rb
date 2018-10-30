require 'bike'
describe Bike do
  it "can be instantiated" do
    bike = Bike.new
    expect(bike.instance_of? Bike).to eq true
  end
  it "a condition can be set to bike" do
    bike = Bike.new
    bike.condition = "good"
    expect(bike.condition). to eq "good"
  end

  it "you can check that bike is working" do
    bike = Bike.new
    bike.condition = "good"
    expect(bike.is_working?).to be(true)

    bike.condition = "bad"
    expect(bike.is_working?).to be(false)
  end
end
