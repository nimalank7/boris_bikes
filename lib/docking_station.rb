require_relative './bike.rb'
class DockingStation
  attr_accessor :bikes
  attr_reader :capacity
  attr_reader :working_bike

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end
  def release_bike
    available? ? get_bike : (raise Exception.new("No bikes"))
  end
  def dock_bike(bike)
    full? ? @bikes << bike : (raise Exception.new("Dock is full"))
  end

  def available?
    @working_bike = @bikes.select do |bike|
      bike.is_working?
    end

    !empty? && (@working_bike.length > 0)
  end
  def report_broken(bike)
    bike.condition = "bad"
  end

  private
  def get_bike
    returned_bike = nil
    @bikes.each_with_index do |bike, index|
      if bike.is_working?
        returned_bike = @bikes.delete_at(index)
        break
      end
    end
    returned_bike
  end
  def full?
    @bikes.size < DEFAULT_CAPACITY
  end
  def empty?
    @bikes.length == 0
  end
end
