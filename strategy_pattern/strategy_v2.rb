class HTMLFormatter 

	def output_report(context)
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
	end
end

class PlainTextFormatter 
	def output_report(context)
		puts("***** #{context.title} *****")
		context.content.each do |line|
			puts(line)
		end
	end
end

class Report 
	attr_reader :title, :content
	attr_accessor :formatter

	def initialize(formatter)
		@title = 'Monthly Report'
		@content =  [ 'Things are going', 'really, really well.']
		@formatter = formatter
	end

	def output_report
		@formatter.output_report(self)
	end
end
report = Report.new(PlainTextFormatter.new)
report.output_report
# ***** Monthly Report *****
# Things are going
# really, really well.


