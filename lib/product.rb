require 'pry'
require_relative 'sales_manager'

class Product
  attr_accessor :quantity, :item_name, :price
  attr_accessor :sales_item
  attr_reader :sales_manager

  def initialize
    @quantity = 0
    @item_name = ''
    @price = 0.0
    @sales_item = []
    @sales_manager = SalesManager.new
  end

  def input( sales = [] )
    return "Oops, Please provide sales." if sales.empty?

    display_input( sales )
  end

  private

  def display_input( sales )
    puts "Quantity, Product, Price"
    sales.each do | item |
      puts "#{item[:quantity]}, #{item[:name]}, #{item[:price]}"
    end
  end

  def validate_sales_input

  end

  def display_option
    puts "Options:"
    puts "[1] Add new product sale"
    puts "[2] Print Reciept"
    puts "[3] Print Reciept and Exit"
    option( gets.chomp )
  end

  def option( choosen_option )
    case choosen_option.to_i
    when 1
      input
    when 2
      calculated_sales = sales_manager.calculate_sales( sales_item )
      print_receipt( calculated_sales )
    when 3
      # Exit terminal
    else

    end
  end

  def add_sales_item
    self.sales_item.push({
      quantity: quantity.to_i,
      product: item_name,
      price: price.to_f
    })
  end



  def print_receipt( calculated_sales )
    puts "Quantity, Product, Price"
    calculated_sales[:product].each do | item |
      puts "#{item[:quantity]}, #{item[:product]}, #{item[:price]}"
    end

    puts "Sales tax: #{calculated_sales[:total_sales_tax]}"
    puts "Total sales: #{calculated_sales[:total_sales]}"
  end
end

sales_input_1 = [ {
  quantity: 1,
  name: "Music CD",
  price: 14.99
}, {
  quantity: 1,
  name: "Book",
  price: 12.49
}, {
  quantity: 1,
  name: "Chocolate Bar",
  price: 0.85
} ]

# Product.new.input( sales_input_1 )