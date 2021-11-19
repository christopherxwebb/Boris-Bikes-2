require_relative 'bike'
class DockingStation

  attr_reader :bikes
  DEFAULT_CAPACITY = 20

  def initialize
    @bikes = []
  end

  def release_bike
    fail "There are no bikes available" if empty?
    @bikes.pop
  end

  def dock(bike)
    fail "Docking station full" if full?
    @bikes.push(bike)
  end

  #private

  def full?
    if @bikes.count >= DEFAULT_CAPACITY 
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