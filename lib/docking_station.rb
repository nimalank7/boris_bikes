require 'bike'
class DockingStation
  attr_accessor :bikes

  def initialize
    @bikes = []
  end
  def release_bike
    Bike.new
  end
  def dock_bike(bike)
    @bikes << bike
  end

  def available?
    @bikes.empty? ? false : true
  end

end
