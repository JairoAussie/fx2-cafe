#Create a menu with 4 menu items
require_relative './menu_item.rb'
require_relative './menu.rb'

def seed
    menu = Menu.new([MenuItem.new("Latte", 4.0),MenuItem.new("Espresso", 3.0),MenuItem.new("Capuccino", 4.5),MenuItem.new("Tea", 3.0)])
    return menu
end