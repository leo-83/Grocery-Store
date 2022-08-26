@store_items = [
    {product: "apple", cost: 0.50, stock: 24}, 
    {product: "bannana", cost: 0.75, stock: 12},
    {product: "grapes", cost: 0.75, stock: 50},
    {product: "pears", cost: 0.55, stock: 14},
    {product: "frosted flakes", cost: 2.75, stock: 7},
    {product: "apple jacks", cost: 3.50, stock: 10},
]

@cart_items = [

]

def menu()

    puts "Grocery Store"
    puts "1)" + "Add Item to cart"
    puts "2)" + "Display Items in cart"
    puts "3)" + "Remove an Item from cart"
    puts "4)" + "Total cost of items in cart"
    puts "5)" + "Add new items to the grocery store"
    menu_choice = gets.strip.to_i

    if menu_choice == 1
        add_items_to_cart
    elsif menu_choice == 2
        view_cart
    elsif menu_choice == 3
        remove_items_from_cart
    elsif menu_choice == 4
        display_cart_cost
    elsif menu_choice == 5
        add_to_store
    else 
        puts "Error: you need to choose pick a number on the menu."
    end
    menu
end

def ask_question(question)
    puts "Please enter #{question}"
    gets.strip
end
def add_items_to_cart()
    puts "Displaying items in store:"
    puts
    @store_items.each_with_index do |item, i|
        puts "Item #" + "#{i + 1}"
        item.each do |key, value|
            puts "#{key.to_s}: #{value}"
        end
        puts
    end
    puts

    answer = ask_question("Which item number do you want?").to_i

    length = @store_items.length()

    @store_items.each_with_index do |item, i|
        if answer > length || answer < 1
            break
        elsif answer == i + 1 
            @cart_items << item
        end
    end
end


def view_cart()
    puts "Displaying items in cart"
    puts
    @cart_items.each_with_index do |item, i|
        puts "Item #" + "#{i + 1}"
        item.each do |key, value|
            puts "#{key.to_s}: #{value}"
        end
    end

end

def remove_items_from_cart ()
    puts "Display items in cart:"
    puts
    @cart_items.each_with_index do |item, i|
        puts "Item #" + "#{i + 1}"
        item.each do |key, value|
            puts "#{key.to_s}: #{value}"
        end
        puts
    end
    puts

    answer = ask_question("Which item number do you want to remove?").to_i

    length = @cart_items.length()

    @cart_items.each_with_index do |item, i|
        if answer > length || answer < 1
            break
        elsif answer == i + 1 
            @cart_items.delete_at(i)
        end
    end
end

def display_cart_cost()
    puts "Display cart cost:"
    puts
    total_cart_cost = 0
    @cart_items.each do |value|
        total_cart_cost += @cart_items[:cost]
    end
    puts total_cart_cost.to_f
end





def add_to_store()
    puts "Adding items to store"

    product = ask_question("the product:")
    cost = ask_question("the cost:")
    stock = ask_question("the stock")
    { product: product, cost: cost, stock: stock }



end


menu

# Basic Objectives
# 1) Display a menu in the console for the user to interact with.
# 2) Create a default array of hashes that represent items at a grocery store.
# 3) Create a menu option to add items to a user's grocery cart.
# 4) Create a menu option to display all the items in the cart.
# 5) Create a menu option to remove an item from the users cart.
# 6) Create a menu option to show the total cost of all the items in the user's cart.
# 7) Add new items to the grocery store.
# 8) Zip it up and turn it in!
 

# Bonus Objectives:
# Allow a user to remove multiple items at once from the cart.
# Assign the user an amount of money to start.
# Give the user the option to "Check out".
# If they have enough money, their cart gets cleared and money is subtracted.
# If they don't have enough money, they have to delete items.
# Apply some sort of coupon system.
# For example, a 20% off coupon that takes the price of all items down by 20%.
# Apply taxes to transaction.
# A menu option that shows a history of all the items purchased. (While the script runs)
# Grocery store items have a quantity. (They can be out of stock)