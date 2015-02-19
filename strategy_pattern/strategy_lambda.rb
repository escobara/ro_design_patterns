class Report
	attr_reader :title, :content
	attr_accessor :formatter

	def initialize(&formatter)
		@title = 'Monthly Report'
		@content =  [ 'Things are going', 'really, really well.']
		@formatter = formatter
	end

	def output_report
		# get selfs instance variables
		@formatter.call(self)
	end
end

# This allows us to pull chunk of code from an object and pass them around
# like other objects. Here it is pulling the instance variables and passing them
# around like other objects
HTMLFORMATTER = lambda do |context|
	puts('<html>')
	puts('  <head>')
	puts("    <title> #{context.title} </title>")
	puts('  </head>')
	puts('	</body>')
	context.content.each do |line|
		puts("    <p>#{line}</p>")
	end
	puts('	</body>')
	puts('</html>')
	puts 
end

r = Report.new(&HTMLFORMATTER)
r.output_report
# <html>
#   <head>
#     <title> Monthly Report </title>
#   </head>
# 	</body>
#     <p>Things are going</p>
#     <p>really, really well.</p>
# 	</body>
# </html>

report = Report.new do |context|
	puts("***** #{context.title} *****")
	context.content.each do |line|
		puts(line)
	end
end.output_report

# ***** Monthly Report *****
# Things are going
# really, really well.
