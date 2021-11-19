require_relative 'bike'
class DockingStation

  attr_reader :bikes, :broken_bikes
  DEFAULT_CAPACITY = 20

  def initialize(desired_capacity = DEFAULT_CAPACITY)
    @bikes = []
    @broken_bikes = []
    @desired_capacity = desired_capacity
  end

  def release_bike
    fail "There are no bikes available" if empty?
    @bikes.pop
  end

  def dock(bike, report = nil)
    fail "Docking station full" if full?
    if report == nil
      @bikes.push(bike)
    else
      @broken_bikes.push(bike)
    end
  end

  #private

  def full?
    if @bikes.count + @broken_bikes.count >= @desired_capacity
      true
    else
      false
    end
  end

  def empty?
    if @bikes.count == 0
      true
    else
      false
    end
  end

end