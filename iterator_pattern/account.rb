class Account
	attr_accessor :name, :balance

	def initialize(name, balance)
		@name = name
		@balance = balance
	end

	def <=>(other)
		balance <=> other.balance
	end
end

class Portfolio
	include Enumerable

	def initialize
		@accounts = []
	end

	def each(&block)
		@accounts.each(&block)
	end

	def add_account(account)
		@accounts << account
	end

end

account1 = Account.new("Rene Escobar", 20)
account2 = Account.new("Pablo Escobar", 40)
account3 = Account.new("Pablo Escobar", 100)
account4 = Account.new("Pablo Escobar", 3000)
account5 = Account.new("Pablo Escobar", 32340)

portfolio = Portfolio.new
portfolio.add_account(account1 )
portfolio.add_account(account2 )
portfolio.add_account(account3 )
portfolio.add_account(account4 )
portfolio.add_account(account5 )

puts portfolio.all? { |account| account.balance >= 20  }

h = {'name' => 'russ', 'eyes' => 'blue', 'sex' => 'male'}

h.each_key{|key| puts(key)}

