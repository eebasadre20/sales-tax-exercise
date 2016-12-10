require 'pry'
require_relative 'sales_manager'

class Product
  attr_accessor :quantity, :item_name, :price
  attr_accessor :sales_item, :calculated_sales
  attr_reader :sales_manager

  def initialize
    @quantity = 0
    @item_name = ''
    @price = 0.0
    @sales_item = []
    @calculated_sales = []
    @sales_manager = SalesManager.new
  end

  def input( sales = [] )
    return "Oops, Please provide sales." if sales.empty?
    self.sales_item = sales
    display_input( sales )
  end

  def calculate_sales
    return "Oops, No sales item." if self.sales_item.empty?
    self.calculated_sales = sales_manager.calculate_sales( sales_item )
  end

  def print_receipt
    return "Oops, No calculated sales." if self.calculated_sales.empty?

    puts "Quantity, Product, Price"
    calculated_sales.each do | item |
      puts "#{item[:quantity]}, #{item[:name]}, #{item[:price]}"
    end

    # puts "Sales tax: #{calculated_sales[:total_sales_tax]}"
    # puts "Total sales: #{calculated_sales[:total_sales]}"
  end

  private

  def display_input( sales )
    puts "Quantity, Product, Price"
    sales.each do | item |
      puts "#{item[:quantity]}, #{item[:name]}, #{item[:price]}"
    end
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

Product.new.input( sales_input_1 )