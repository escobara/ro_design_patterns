class Subject 
	def initialize
		@observers = []
	end

	def add_observers(observer)
		@observers << observer
	end

	def delete_observer(observer)
		@observers.delete(observer)
	end

	def notify_observers
		@observers.each do |observer|
			observer.update(self)
		end
	end
end


class Employee < Subject
	attr_reader :name, :address
	attr_reader :salary

	def initialize(name, title, salary)
		super()
		@name = name
		@salary = salary
		@address = address
	end

	def salary=(new_salary)
		@salary = new_salary
		notify_observers
	end
end

# Ruby only allows a class to have one subclass! 
# Solution: use a module 

