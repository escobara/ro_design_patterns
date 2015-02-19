class Report 
	
	def initialize
		@title = 'Monthly Report'
		@content =  [ 'Things are going', 'really, really well.']
	end

	def output_report
		output_start
		output_head
		output_body_start
		output_body
		output_body_end
		output_end
	end

	def output_start
		raise 'Called abstract method: output_start'
	end

	def output_body_start
		raise 'Called abstract method: output_body_start'
	end

	def output_body_end
		raise 'Called abstract method: output_body_end'
	end

	def output_end
		raise 'Called abstract method: output_end'
	end

	def output_body
		@content.each do |line|
			output_line(line)
		end
	end

end

class HTMLReport < Report
	def output_start
		puts('<html>')
	end

	def output_head
		puts('  <head>')
	end

	def output_body_start
		puts('<body>')
	end

	def output_line(line)
		puts("  <p>#{line}</p>")
	end

	def output_body_end
		puts('	</body>')
	end

	def output_end
		puts('</html>')
	end

end

HTMLReport.new.output_report

class PlainReport < Report
	def output_start
	end

	def output_head
		puts("*** #{@title} ***")
	end

	def output_body_start
	end

	def output_line(line)
		puts("  <p>#{line}</p>")
	end

	def output_body_end
	end

	def output_end
	end
end

PlainReport.new.output_report
