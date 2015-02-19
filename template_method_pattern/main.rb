require './report'
require './plain_text_report'
require './html_report'

HTMLReport.new.output_report
puts "----------------------------------------------------"
PlainTextReport.new.output_report
