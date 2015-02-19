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
		old_salary = @salary
		@salary = new_salary
		if old_salary != new_salary
			changed
		end
	end

	def name=(new_name)
		old_name = @name
		@name = new_name
		if old_name != new_name
			changed
		end
	end
	
	def changes_complete
		notify_observers(self) if changed
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

class SSA
	def update(changed_employee)
		puts("#{changed_employee.name} changed his name to #{changed_employee.name}!")
	end
end

rene = Employee.new('Rene Escobar', '2927 Hungary Road', 54809)
rene.add_observer(Payroll.new)
rene.add_observer(SSA.new)
rene.salary = 32423
rene.name = 'Bobby Brown'
rene.changes_complete