class Menu
    attr_reader :menu_items
    #initialize with an array of menu items
    def initialize(menu_items)
        @menu_items = menu_items
    end

    #show menu
    def show_menu
        puts "Menu: "
        @menu_items.each {|item| puts item}
    end

    #add item
    def add_item(name, price)
        menu_item = MenuItem.new(name, price)
        #@menu_items.push(menu_item)
        @menu_items << menu_item
    end

    #find item, it receives a name, it returns the index if the item was found, -1 if not found
    def find_item(name)
        #to return the index
        @menu_items.each_with_index do |item, index|
            if item.name == name
                return index
            end
        end
        return -1
        #to return the object
        # item = @menu_items.find{|item| item.name=name}
    end

    #delete item, receives the index, and deletes that item
    def delete_item(index)
        #receiving an object ->  @menu_items.delete(item)
        @menu_items.delete_at(index)
    end
end