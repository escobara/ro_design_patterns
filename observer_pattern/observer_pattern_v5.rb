require 'observer'

class Employee
	include Observable 
	
	attr_reader :name, :address
	attr_reader :salary

	def initialize(name, address, salary)
		@name = name
		@address = address
		@salary = salary
	end

	def salary=(new_salary)
		@salary = new_salary
		changed
		notify_observers(self)
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

rene = Employee.new('Rene Escobar', '2927 Marlow Road', 54809)
rene.add_observer(Payroll.new)
rene.salary = 342344