# Use Case
# As a user, I can create monthly status reports
class Report 
	
	def initialize
		@title = 'Monthly Report'
		@content =  [ 'Things are going', 'really, really well.']
	end

	def output_report
		puts('<html>')
		puts('  <head>')
		puts("<title> #{@title} </title>")
		puts('  </head>')
		puts('	</body>')
		@content.each do |line|
			puts("  <p>#{line}</p>")
		end
		puts('	</body>')
		puts('</html>')
	end
end

report = Report.new
report.output_report
