require_relative "./seed.rb"
require_relative "./order.rb"
#create a Menu object and seed it
menu = seed

if ARGV.length > 0
    cafe_name = ARGV[0]
    ARGV.clear
else
    cafe_name = "Random cafe"
end

def print_options
    puts "1. Show menu"
    puts "2. Add product to the menu"
    puts "3. Edit price of a product from the menu"
    puts "4. Delete a product from the menu"
    puts "5. Take an order"
    puts "6. Exit"
    print "Select your option (1-6): "
    opt = STDIN.gets.chomp
    return opt
end


def add_product(m)
    #menu -> m, name -> n, price -> p, just to demonstrate that I can handle variable scope
    print "What's the name of the new product? "
    n = gets.chomp
    print "What's the price of #{n}? "
    p = gets.chomp.to_f
    
    #add menu item to the menu
    m.add_item(n, p)

    #show the menu to see the added menu item
    m.show_menu
end

def delete_product(menu)
    #show the list of products, just names
    
    #ask about the product we want to delete
    print "What the product you want to delete? "
    name = gets.chomp
    #make sure it is in the menu
    index = menu.find_item(name)
    if index != -1
        #delete it
        menu.delete_item(index)
        menu.show_menu
    else
        puts "Item not found"
    end

    
end
def edit_product(menu)
    
     #ask about the product we want to edit
     print "What the product you want to edit? "
     name = gets.chomp
     #make sure it is in the menu
     index = menu.find_item(name)
     if index != -1
         #edit it
         print "What is the new price for #{name}? "
         price = gets.chomp.to_f
         menu.edit_item(index, price)
         menu.show_menu
     else
         puts "Item not found"
     end
 
end

def take_order(menu)
    #show menu
    menu.show_menu
    #create a new order
    order = Order.new
    continue = "y"
    #start adding items to the order, ask if there are more items each time after
    while continue == "y"
        print "What do you want have? "
        name = gets.chomp 
        if (menu.find_item(name) != -1)
            print "How many of them? "
            quantity = gets.chomp.to_i
            order.add_order_line(name, quantity)
        else
            puts "Item not found"
        end

        print "Do you want to order something else? (y/n) "
        continue = gets.chomp
    end
    puts order.order_items
    puts "This is your bill: $#{order.total_order(menu)}"
    #when all the items are added show the total price of the order.

end

option = ""
while option != "6"
    system "clear"
    print "Welcome to #{cafe_name}"
    option = print_options

    case option
        when "1"
            menu.show_menu
        when "2"
            add_product(menu)
        when "3"
            edit_product(menu)
        when "4"
            delete_product(menu)
        when "5"
            take_order(menu)
        when "6"
            next
        else
            puts "invalid option"
    end
    puts "press Enter to continue..."
    gets
    system "clear"
end
puts "Goodbye!"