class Employee
	attr_reader :name, :title
	attr_reader :salary

	def initialize(name, title, salary, payroll)
		@payroll = payroll
		@name = name
		@title = title
		@salary = salary
	end

	def salary=(new_salary)
		@salary = new_salary
		@payroll.update(self)
	end
end


class Payroll 
	def update(changed_employee)
		puts("Cut a new check for #{changed_employee.name}!")
		puts("His salary is now #{changed_employee.salary}!")
	end
end

rene = Employee.new("Rene Escobar", "Developer", 55000.00, Payroll.new)
rene.salary = 60000.00
# Cut a new check for Rene Escobar!
# His salary is now 60000.0!


