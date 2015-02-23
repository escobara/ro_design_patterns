require './composite_v1'

class CompositeTask < Task
	def initialize(name)
		super(name)
		@sub_tasks = []
	end

	def add_sub_task(task)
		@sub_tasks << task
	end

	def remove_sub_task(task)
		@sub_tasks.delete(task)
	end

	def get_time_required
		time = 0.0
		@sub_tasks.each {|task| time += task.get_time_required }
		time
	end

	def [](index)
		@sub_tasks[index]
	end

	def []=(index, new_value)
		@sub_tasks[index] = new_value
	end
end


class MakeBatterTask < CompositeTask
	def initialize
		super('Making the Batter')
		add_sub_task( AddDryIngredientsTask.new )
		add_sub_task( AddLiquidsTask.new )
		add_sub_task( MixTask.new )
	end

end

making_batter = MakeBatterTask.new
