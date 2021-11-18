require 'docking_station'
require 'bike'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
 
  it { is_expected.to respond_to :bike }

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
    expect(docking_station.bike).to eq bike
  end

  it "should not release a bike when none are available" do
    docking_station = DockingStation.new
    expect { docking_station.release(bike) }.to raise_error
  end

end