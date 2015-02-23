class SlickButton
	attr_accessor :command

	def initialize(&block)
		@command = block
	end

	def on_button_push
		@command.call if @command
	end
end

class SaveCommand
	def execute

	end
end

new_button = SlickButton.new do 
	puts 'Saving the content'
end



