require 'docking_station'
require 'bike'

describe DockingStation do 

  let(:bike) {double :bike, broken?: false, working?: true}
  let(:broken_bike) {double :bike, broken?: true}

  it 'responds to release bike' do
    expect(subject).to respond_to :release_bike
  end

	it 'releases working bikes' do
		subject.dock(bike)
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'responds to dock' do 
    expect(subject).to respond_to(:dock).with(1).argument
  end
	
  it 'docks something' do
    expect(subject.dock(bike)).to eq [bike]
  end
	
  describe '#release_bike' do
    it 'releases a bike' do
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when a bike is broken' do 
      subject.dock(broken_bike)
      expect { subject.release_bike }.to raise_error 'This bike is broken'
    end

    it 'raises an error when there are no bikes available' do
     	#Let's not dock a bike first:
      #remember subject == DockingStation.new
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end
  
  describe '#dock' do
		it 'raises an error when full' do
      subject.capacity.times { subject.dock(bike) }
  		expect { subject.dock(bike) }.to raise_error 'Docking station full'
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
