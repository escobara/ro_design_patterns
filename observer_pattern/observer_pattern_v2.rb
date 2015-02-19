class Employee
	attr_reader :salary, :name, :title
	
	def initialize(name, title, salary)
		@name = name
		@title = title
		@salary = salary
		@observers = []
	end

	def salary=(new_salary)
		@salary = new_salary
		notify_observers
	end

	def notify_observers
		@observers.each do |observer|
			observer.update(self)
		end
	end

	def add_observer(observer)
		@observers << observer
	end

	def delete_observer(observer)
		@observers.delete(observer)
	end
end

class Payroll
	def update(changed_employee)
		puts("Cut a new check for #{changed_employee.name}!")
		puts("His salary is now #{changed_employee.salary}!")
	end
end

class Email
	def update(changed_employee)
		puts("We are proud to anounce #{changed_employee.name} new title #{changed_employee.title}!")
	end
end
rene = Employee.new('Rene', 'Developer', 55000.00)
rene.add_observer(Payroll.new)
rene.add_observer(Email.new)

rene.salary = 70000.00

# Cut a new check for Rene!
# His salary is now 70000.0!