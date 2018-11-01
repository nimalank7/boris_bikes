class Bike
  attr_accessor :condition
  def initialize
    @condition = "good"
  end

  def is_working?
    @condition == "good" ? true : false
  end
end
