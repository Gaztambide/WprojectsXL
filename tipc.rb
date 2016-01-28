puts "What is the cost?"
cost = gets.chomp.to_f

total = (cost * (1.00 + 0.20))

puts "The total is $#{sprintf('%0.2f', total)}"
