module Subject 
	def initialize
		@observers = []
	end

	def add_observer(observer)
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


class Employee
	include Subject
	attr_reader :name, :address
	attr_reader :salary

	def initialize(name, salary, address)
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

class Payroll
	def update(changed_employee)
		puts("Cut a new check for #{changed_employee.name}!")
		puts("His salary is now #{changed_employee.salary}!")
	end
end

class Email
	def update(changed_employee)
		puts("We are proud to anounce #{changed_employee.name} new address: #{changed_employee.address}!")
	end
end

rene = Employee.new('Rene', 55000.00, '2927 Marlow Rd')
rene.add_observer(Payroll.new)
rene.add_observer(Email.new)
rene.salary = 89043.00
