require_relative '../menu_item.rb'
require_relative '../menu.rb'

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

describe "Test find item" do
    it "deletes an item from the menu" do
        menu_items = [MenuItem.new("Latte", 4.0), MenuItem.new("Tea", 3.0)]
        menu = Menu.new(menu_items)
        menu.delete_item(0)
        expect(menu.menu_items.length).to eq 1
        expect(menu.menu_items[0].name).to eq("Tea")
    end
end



