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

	def next_item
		value = @array[@index]
		@index += 1
		value
	end
end

def merge(array1, array2)
	merge = []

	iterator1 = ArrayIterator.new(array1)
	iterator2 = ArrayIterator.new(array2)

	while(iterator1.has_next? and iterator2.has_next?)
		if iterator1.item < iterator2.item
			merged << iterator1.next_item
		else
			merged << iterator2.next_item
		end
	end

	# pick up the leftovers from array1
	while iterator1.has_next?
		merged << iterator1.next_item
	end
	# pick up the leftovers from array2
	while iterator2.has_next?
		merged << iterator2.next_item
	end

	merged
end
array = ["Personal Information", "Family", "Gifts", "Review", "Submit Payment"]
array2 = ["Personal", "Family", "Gifts", "Review", "Submit Payment"]

i = ArrayIterator.new(array)

i2 = ArrayIterator.new(array2)

merge(i, i2)
