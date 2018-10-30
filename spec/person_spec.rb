require 'person'
describe Person do
  it "can be instantiated" do
    person = Person.new
    expect(person.instance_of? Person).to eq true
  end
  it "use bike" do
    person = Person.new
    expect(person.use_bike).to eq "Yes you can use this bike."
  end
end
