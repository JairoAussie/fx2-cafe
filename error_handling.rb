class MyErrors < StandardError
end

begin
    print "Enter a menu item: "
    name = gets.chomp
    while name == ""
        print "Empty name, please enter a name: "
        name = gets.chomp
    end
    print "Enter the price for the menu item: "
    price = gets.chomp.to_f
    #puts price.kind_of? (Float)
    if price <= 0.0
        raise StandardError
    end
    puts "#{name}: $#{price}"
    rescue ArgumentError
        puts "Empty name"
        retry
    rescue StandardError
        puts "Price has to be a number > 0"
        retry
end
# begin
#     print "Enter a number: "
#     number1 = gets.chomp.to_i
#     print "Enter a second number: "
#     number2 = gets.chomp.to_i

#     puts number1/number2
#     puts "this was the result"
# rescue ZeroDivisionError
#     puts "Division by zero error, input a different number"
#     retry

# end

puts "end of the program"

