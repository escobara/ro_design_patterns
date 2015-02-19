# aliases for procs include closure and lambda. Proc-producing method
hello = lambda do 
	puts 'Hello'
	puts 'I am inside of a proc'
end

# This allows us to pull chunk of code from an object and pass them around
# like other objects
# hello.call
# Hello
# I am inside of a proc

name = 'Rene'
proc = Proc.new do 
	name = 'John'
end

# Without calling the proc the name remains to be Rene, once it is called it 
# is changed to john. Weird
proc.call
puts(name)

hello = lambda {
	puts 'Hello I am inside of a proc'
	puts name
}

hello.call

return_24 = lambda {24}
puts(return_24.call)
# 24

multiply = lambda { |x , y, z| x * y * z }
n = multiply.call(20, 3, 23)
puts(n)
# 1380

def run_it
	puts "Before the yield"
	yield
	puts 'after the yield'
end





run_it do 
	puts 'Hello'
	puts 'I am inside of the proc'
end
# Before the yield
# Hello
# I am inside of the proc
# after the yield


def run_with_params
	puts 'Before the yield'
	yield(24)
	puts 'after the yield'
end

run_with_params do |x|
	puts 'inside the proc'
	puts "the value of x is #{x}"
end

# Before the yield
# inside the proc
# the value of x is 24
# after the yield

def run_with_params2(&block)
	puts 'Before the yield'
	block.call(24)
	puts 'after the yield'
end


run_with_params2 do |x|
	puts 'inside the proc'
	puts "the value of x is #{x}"
end

# Before the yield
# inside the proc
# the value of x is 24
# after the yield









