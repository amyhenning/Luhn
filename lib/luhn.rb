module Luhn
	def self.is_valid?(number)
		# split the number into an array of its individual digits
		numbers = number.to_s.split('').map { |x| x.to_i }
		# set the index value for the starting number to be the second to last digit in numbers
		digit_to_double = numbers.length - 2

		# until digit_to_double reaches the end of the array
		while digit_to_double >= 0
			# double the number with an index of digit_to_double
			doubled = numbers[digit_to_double] * 2
			# if the doubled number at the given index is greater than or equal to 10, subtract 9
			if doubled >= 10
				numbers[digit_to_double] = doubled - 9
			# otherwise, keep the doubled number
			else 
				numbers[digit_to_double] = doubled
			end
			# reset digit_to_double to be the digit two to the left
			digit_to_double -= 2
		end

		# sum the numbers in the array called numbers. If it's evenly divisible
		# by 10, it's valid. Otherwise, it's not.
		if numbers.inject(:+) % 10 == 0
			return true
		else
			return false
		end
		
	end
end