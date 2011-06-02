class LotteryNumbers
  # Initialise object with required information
  # numbers: How many numbers are to be generated.
  # range: How many numbers to draw from
	def initialize(numbers, range)
		@numbers = numbers
		@range = range
	end
	
	# Generate lottery numbers
	def generate_numbers
		@your_numbers = Array.new()
		
		for num in 0...@numbers
			generated_num = rand(@range) + 1
			if (verify_numbers(generated_num))
				@your_numbers[num] = generated_num
			else
				redo
			end
		end
	  @your_numbers
	end
	
	# Make sure that there are no duplicate numbers
	def verify_numbers(generated_num)
		@your_numbers.each do |x|
			return false if (x == generated_num)
		end
		return true
	end

end
			
