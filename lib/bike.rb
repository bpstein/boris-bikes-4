class Bike

  attr_reader :report_broken, :broken

	def working?
	  true
	end

	def broken?
		@broken
	end	

 	def report_broken
		@broken  = true
	end	

end
