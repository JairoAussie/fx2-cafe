require_relative '../menu_item.rb'
require_relative '../menu.rb'
require_relative '../order.rb'

describe "Test MenuItem object" do
    it "should store the attributes of the menuItem correctly" do
        name = "Latte"
        price = 4.0
        menu_item = MenuItem.new(name, price)
        expect(menu_item.name).to eq(name)
        expect(menu_item.price).to eq(price)
    end

     
end

describe "Test Menu objects" do
    it "should store the array of MenuItems correctly" do
        menu_items = [MenuItem.new("Latte", 4.0), MenuItem.new("Tea", 3.0)]
        menu = Menu.new(menu_items)
        expect(menu.menu_items.length).to be > 0
        expect(menu.menu_items.length).to eq 2
        expect(menu.menu_items[0].name).to eq("Latte")
        expect(menu.menu_items[1].price).to eq(3.0)
    end
end

describe "Test add item" do
    it "adds a menu item to an empty array  Menu" do
        name = "Latte"
        price = 4.0
        menu = Menu.new([])
        menu.add_item(name, price)
        expect(menu.menu_items.length).to eq 1
        expect(menu.menu_items[0].name).to eq("Latte")

    end

    it "adds a new menu item to an array with one menu item"  do
        name = "Latte"
        price = 4.0
        menu = Menu.new([MenuItem.new("Tea", 3.0)])
        menu.add_item(name, price)
        expect(menu.menu_items.length).to eq 2
        expect(menu.menu_items[0].name).to eq("Tea")
        expect(menu.menu_items[1].price).to eq(4.0)

    end
end

describe "Test find item" do
    it "finds a menu item in the array" do
        menu_items = [MenuItem.new("Latte", 4.0), MenuItem.new("Tea", 3.0)]
        menu = Menu.new(menu_items)
        index = menu.find_item("Tea")
        expect(index).to eq 1

    end

    it "doesn't find a menu item in the array"  do
        menu_items = [MenuItem.new("Latte", 4.0), MenuItem.new("Tea", 3.0)]
        menu = Menu.new(menu_items)
        expect(menu.find_item("Espresso")).to eq -1
    end
end

describe "Test Delete item" do
    it "deletes an item from the menu" do
        menu_items = [MenuItem.new("Latte", 4.0), MenuItem.new("Tea", 3.0)]
        menu = Menu.new(menu_items)
        menu.delete_item(0)
        expect(menu.menu_items.length).to eq 1
        expect(menu.menu_items[0].name).to eq("Tea")
    end
end

describe "Test edit item" do
    it "edit the price of an item" do
        menu_items = [MenuItem.new("Latte", 4.0), MenuItem.new("Tea", 3.0)]
        menu = Menu.new(menu_items)
        menu.edit_item(1, 4.5)
        expect(menu.menu_items[1].price).to eq 4.5
        expect(menu.menu_items[1].name).to eq "Tea"
        expect(menu.menu_items[0].price).to eq 4.0
    end
    
end

describe "Test add order line" do
    it "adds name -> quantity item correctly to the hash" do
        order = Order.new #empty hash
        name = "Espresso"
        quantity = 3
        order.add_order_line(name, quantity)
        expect(order.order_items[name]).to eq quantity
    end

    it "increments the quantity in the same product" do
        order = Order.new #empty hash
        name = "Espresso"
        quantity = 3
        order.add_order_line(name, quantity)
        order.add_order_line(name, 1)

        expect(order.order_items[name]).to eq 4
    end
    
end

describe "Test order total value" do
    it "order total calculates the total bill correctly" do
        menu_items = [MenuItem.new("Latte", 4.0), MenuItem.new("Tea", 3.0)]
        menu = Menu.new(menu_items)
        order = Order.new #empty hash
        order.add_order_line("Tea", 3)
        order.add_order_line("Latte", 1)
        expect(order.total_order(menu)).to eq 13.0
    end
    
end





