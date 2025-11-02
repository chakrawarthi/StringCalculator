class StringCalculator

	def initialize()
		@count = 0
	end

	def add(string)

		@count +=1

		return 0 if string.empty?

		delimiter = ","
		
		if string.start_with?("//")
    	header, string = string.split("\n", 2)
    	delimiter = header[2..-1]
    end

		string = string.gsub("\n",delimiter) if string.include?("\n")
    numbers = string.split(delimiter).map(&:to_i)

    check_for_negaitives(numbers)
		numbers.sum
	end

	def check_for_negaitives(numbers)
		negitive_numbers = numbers.select{ |number|
			number < 0
		}
		raise "negative numbers not allowed #{negitive_numbers.join(',')}" unless negitive_numbers.empty?
	end

	def count_add
		@count
	end

end
