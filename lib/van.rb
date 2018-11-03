require_relative './docking_station.rb'
require_relative './bike.rb'

class Van
  attr_accessor :capacity
  attr_reader :bikes

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end
  def dock_bike(bike)
    full? ? @bikes << bike : false
  end
  def release_broken_bike
    broken? ? get_broken_bike : false
  end
  def release_working_bike
    available? ? get_working_bike : false
  end
  def get_broken_bike
    returned_bike = nil
    @bikes.each_with_index do |bike, index|
      if !bike.is_working?
        returned_bike = @bikes.delete_at(index)
        break
      end
    end
    returned_bike
  end
  private
  def get_working_bike
    returned_bike = nil
    @bikes.each_with_index do |bike, index|
      if bike.is_working?
        returned_bike = @bikes.delete_at(index)
        break
      end
    end
    returned_bike
  end
  def available?
    @working_bike = @bikes.select do |bike|
      bike.is_working?
    end
    !empty? && (@working_bike.length > 0)
  end
  def broken?
    @broken_bike = @bikes.select do |bike|
      bike.is_working? == false
    end
    !empty? && (@broken_bike.length > 0)
  end
  def full?
    @bikes.size < DEFAULT_CAPACITY
  end
  def empty?
    @bikes.length == 0
  end

end
