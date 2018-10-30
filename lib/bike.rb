class Bike
  attr_accessor :condition
  def initialize
  end

  def is_working?
    condition == 'good' ? true : false 
  end
end
