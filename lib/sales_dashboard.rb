require 'pry'
require_relative 'sales_manager'

class SalesDashboard
  attr_accessor :quantity, :product_name, :price
  attr_accessor :sales_input
  attr_reader :sales_manager

  def initialize
    @quantity = 0
    @product_name = ''
    @price = 0.0
    @sales_input = []
    @sales_manager = SalesManager.new
  end

  def input
    puts "Quantity: "
    self.quantity = gets.chomp

    puts "Product name: "
    self.product_name = gets.chomp

    puts "Price: "
    self.price = gets.chomp

    # Display options
    set_sales
    display_option
  end

  private

  def display_option
    puts "Options:"
    puts "[1] Add new product sales"
    puts "[2] Print Reciept"
    puts "[3] Print Reciept and Exit"
    option( gets.chomp )
  end

  def option( choosen_option )
    case choosen_option.to_i
    when 1
      input
    when 2
      calculated_sales = sales_manager.calculate_sales( sales_input )
      print_receipt( calculated_sales )
    when 3
      # Exit terminal
    else

    end
  end

  def set_sales
    sales_input << {
      quantity: quantity.to_i,
      product: product_name,
      price: price.to_f
    }
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

SalesDashboard.new.input