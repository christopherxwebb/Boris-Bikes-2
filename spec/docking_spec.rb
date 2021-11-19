require 'docking_station'
require 'bike'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
 
  it { is_expected.to respond_to :bikes }

  it "Expects the bike to be working" do
    bike = Bike.new
    expect(bike.working?).to eq true
  end

  it "Should get true when call the method working on DockingStation.release_bike" do
    docking_station = DockingStation.new
    bike = Bike.new
    docking_station.dock(bike)
    expect(docking_station.release_bike.working?).to eq true
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it "should be able to see if a bike has been docked" do
    docking_station = DockingStation.new
    bike = Bike.new
    docking_station.dock(bike)
    expect(docking_station.bikes).to include bike
  end

  it "should not release a bike when none are available" do
    docking_station = DockingStation.new
    expect { docking_station.release_bike }.to raise_error
  end

  it "raise an error when you try to dock a bike in a full station" do
    docking_station = DockingStation.new
    DockingStation::DEFAULT_CAPACITY.times { docking_station.dock Bike.new } 
    expect { docking_station.dock Bike.new }.to raise_error 'Docking station full'
  end

  it "if station is full we get true from the full? method" do
    docking_station = DockingStation.new
    DockingStation::DEFAULT_CAPACITY.times { docking_station.dock Bike.new }
    expect(docking_station.full?).to eq true
  end

  it "if station is empty we get true from the empty? method" do
   docking_station = DockingStation.new
   expect(docking_station.empty?).to eq true
  end

  it "allow a user to set larger capacity when necessary" do
    expect(DockingStation.new(50)).to be_an_instance_of(DockingStation)
  end

  it "if no desired capacity is provided then assigns default capacity (20)" do
    expect(DockingStation.new()).to be_an_instance_of(DockingStation)
  end

end
