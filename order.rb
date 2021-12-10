class Order
    attr_reader :order_items
    #initialize it with order_items, and empty hash. {product => quantity}
    def initialize
        @order_items = {}
    end
    #receives a product name and a quantity and it updates the order items hash
    def add_order_line(name, quantity) #Espresso , 1
        if @order_items.has_key?(name)
            @order_items[name] += quantity 
        else
            @order_items[name] = quantity
        end
    end
    #it returns the total price of the order, we need the menu
    def total_order(menu)
        total = 0
        @order_items.each do |name, quantity|
            price = menu.get_price(name)
            total += price * quantity
        end
        return total
    end
end