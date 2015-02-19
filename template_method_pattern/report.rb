class Report 
	
	def initialize
		@title = 'Monthly Report'
		@content =  [ 'Things are going', 'really, really well.']
	end

	def output_report
		output_start
		output_head
		output_body_start
		@content.each do |line|
			output_line(line)
		end
		output_body_end
		output_end
	end

	def output_start
	end

	def output_body_start
	end

	def output_body_end
	end

	def output_end
	end

	def output_body
	end

end



