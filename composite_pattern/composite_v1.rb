class Task 
	attr_reader :name

	def initialize(name)
		@name = name
	end

	def get_time_required
		0.0
	end
end

class AddDryIngredientsTask < Task

	def initialize
		super('Add dry ingredients')
	end

	def get_time_required
		1.0
	end
end

class AddLiquidsTask < Task
	def initialize
		super('Pour on the liquids!')
	end

	def get_time_required
		3.0
	end
end

class MixTask < Task
	def initialize
		super('Mix That Batter up!')
	end

	def get_time_required
		3.0
	end
end

