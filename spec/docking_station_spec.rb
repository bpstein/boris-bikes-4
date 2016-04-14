require 'docking_station'
require 'bike'

describe DockingStation do 
	#it 'responds to release_bike' do
    	#	expect(subject).to respond_to :release_bike
  	#end	

	it { is_expected.to respond_to :release_bike }

	it 'releases working bikes' do
		bike = Bike.new
		subject.dock(bike)
    rbike = subject.release_bike
    expect(rbike).to be_working
  end

	it { is_expected.to respond_to(:dock).with(1).argument }
	
  it 'docks something' do
    bike = Bike.new
    # We want to return the bike we dock
    expect(subject.dock(bike)).to eq [bike]
  end
	
  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      # we want to release the bike we docked
      expect(subject.release_bike).to eq bike
			#expect(subject.dock(bike)).to eq bike
    end


    it 'raises an error when there are no bikes available' do
     	#Let's not dock a bike first:
      #remember subject == DockingStation.new
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end
  
  describe '#dock' do
		it 'raises an error when full' do
      subject.capacity.times { subject.dock Bike.new }
  		expect { subject.dock Bike.new }.to raise_error 'Docking station full'
		end
  end

  describe '#capacity' do 
    it 'allows custom capacity or default capacity' do 
    end

    it 'sets capacity to a default value when no explicit value is provided' do 
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end

end
