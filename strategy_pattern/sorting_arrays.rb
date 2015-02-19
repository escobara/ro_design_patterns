a = ['russell', 'mike', 'john', 'dan', 'rob']
# puts a.sort
# dan
# john
# mike
# rob
# russell

a.sort
puts a.sort {|a, b| a.length <=> b.length }
# rob
# dan
# mike
# john
# russell