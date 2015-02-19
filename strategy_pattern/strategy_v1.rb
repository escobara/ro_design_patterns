class Formatter
	def output_report(title, text)
		raise 'Abstract method called'
	end
end

class HTMLFormatter < Formatter

	def output_report(title, content)
		puts('<html>')
		puts('  <head>')
		puts("    <title> #{title} </title>")
		puts('  </head>')
		puts('	</body>')
		content.each do |line|
			puts("    <p>#{line}</p>")
		end
		puts('	</body>')
		puts('</html>')
	end
end

class PlainTextFormatter < Formatter
	def output_report(title, text)
		puts("***** #{title} *****")
		text.each do |line|
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
		@formatter.output_report(@title, @content)
	end
end
report = Report.new(HTMLFormatter.new)
report.output_report
# <html>
#   <head>
#     <title> Monthly Report </title>
#   </head>
# 	</body>
#     <p>Things are going</p>
#     <p>really, really well.</p>
# 	</body>
# </html>