require 'bike'
class DockingStation
  attr_accessor :bikes

  def initialize
    @bikes = []
  end
  def release_bike
    available? ? get_bike : (raise Exception.new("No bikes"))
  end
  def dock_bike(bike)
    @bikes << bike
  end

  def available?
    @bikes.empty? ? false : true
  end

  private
  def get_bike
    @bikes.pop
  end

end
