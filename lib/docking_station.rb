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
    raise 'This bike is broken' if @bikes[0].broken?
    @bikes.delete_at(0) unless @bikes[0].broken?
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
