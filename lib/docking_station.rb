require_relative 'bike'
class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail "There are no bikes available" if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    fail "Docking station full" if @bikes.count >= 20
    @bikes.push(bike)
  end

end