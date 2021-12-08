#create a Menu object and seed it

def print_options
    puts "1. Show menu"
    puts "2. Add product to the menu"
    puts "3. Edit price of a product from the menu"
    puts "4. Delete a product from the menu"
    puts "5. Take an order"
    puts "6. Exit"
    print "Select your option (1-6): "
    opt = gets.chomp
    return opt
end


def add_product

    print "What's the name of the new product? "
    n = gets.chomp
    print "What's the price of #{n}? "
    p = gets.chomp.to_f
    
    #add menu item to the menu
    
end

def delete_product
    #show the list of products, just names
    
    #ask about the product we want to delete
    print "What the product you want to delete? "
    name = gets.chomp
    #make sure it is in the menu

    #delete it
    
end
def edit_product
    
    #ask about the product we want to delete
    print "What the product you want to edit? "
    name = gets.chomp
    #make sure it is in the menu

    #ask for the new price
end

def take_order
    #create a new order
    #start adding items to the order, ask if there are more items each time after
    #when all the items are added show the total price of the order.

end

option = ""
while option != "6"
    system "clear"
    option = print_options

    case option
        when "1"
            print_menu
        when "2"
            add_product
        when "3"
            edit_product
        when "4"
            delete_product
        when "5"
            take_order
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