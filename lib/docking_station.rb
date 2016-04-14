require_relative 'bike'
class DockingStation

	DEFAULT_CAPACITY = 20
	
	attr_reader :bikes
	attr_accessor :capacity 

	def initialize(capacity = DEFAULT_CAPACITY)
	  @bikes = []
	  @capacity = DEFAULT_CAPACITY
	end

	def release_bike
		raise 'No bikes available' if empty?
    released_bike = @bikes.pop 
    if released_bike.broken? == true 
      raise 'This bike is broken' 
    else
      released_bike
    end
	end

	def dock(bike)
		raise 'Docking station full' if full?
		@bikes << bike
	end

  private 

  def full? 
  	@bikes.count >= capacity
  end

  def empty? 
  	@bikes == []
  end
end
