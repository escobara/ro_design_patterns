# Iterator pattern, a technique that allows an
# aggregate object to provide the outside world with a way to access its collection of subobjects.

class ArrayIterator
	def initialize(array)
		@array = array
		@index = 0
	end

	def has_next?
		@index < @array.length
	end

	def item
		@array[@index]
	end

	def next_step
		value = @array[@index]
		@index += 1
		value
	end

end

array = ["Personal Information", "Family", "Gifts", "Review", "Submit Payment"]

i = ArrayIterator.new(array)
while i.has_next?
	puts("Step: #{i.next_step}")
end

string = ArrayIterator.new('abcdefghijklmnop')
while string.has_next?
	puts("String: #{string.next_step.chars}")
end

# Internal Iterator
def for_each_element(array)
	i = 0
	while i < array.length
		yield(array[i])
		i += 1
	end
end

# for_each_element(array) {|element| puts("Step: #{element}")}
# or use the enumerable
# array.each {|e| puts("Step: #{e}") }

array.all? {|element| element.length < 4}
# false, all elements in the array are not less than 4

