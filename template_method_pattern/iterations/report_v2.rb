class Report 
	
	def initialize
		@title = 'Monthly Report'
		@content =  [ 'Things are going', 'really, really well.']
	end

	def output_report(formatter)
		if formatter == :plain
			puts("*** #{@title} ***")
		elsif formatter == :html
			puts('<html>')
			puts('  <head>')
			puts("<title> #{@title} </title>")
			puts('  </head>')
			puts('	</body>')
		else
			raise "Unknown format: #{format}"
		end

		@content.each do |line|
			if formatter == :plain
				puts(line)
			else
				puts("  <p>#{line}</p>")
			end
		end

		if formatter == :html
			puts('	</body>')
			puts('</html>')
		end
	end
end

r = Report.new
r.output_report(:html)
# <html>
#   <head>
# <title> Monthly Report </title>
#   </head>
# 	</body>
#   <p>Things are going</p>
#   <p>really, really well.</p>
# 	</body>
# </html>
r.output_report(:plain)
# *** Monthly Report ***
# Things are going
# really, really well.





