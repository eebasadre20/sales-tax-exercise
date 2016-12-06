require 'pry'
require_relative 'tax_manager'

class SalesManager
  attr_accessor :sales_input, :sales_output, :tax_manager

  def initialize
    @sales_input = []
    @sales_output = []
    @tax_manager = TaxManager.new
  end

  def input( quantity, product, price )
    product_details = product_details( quantity, product, price )
    sales_input << product_details
    calculate_product_tax( product_details )
    input_display
  end

  def calculate_sales( sales = { } )
    {
      product: calculate_sales_tax(sales),
      total_sales_tax: total_sales_tax,
      total_sales: total_sales
    }
    binding.pry
  end

  private

  def total_sales_tax
    sales_output.map{ |product|  product[:sales_tax] }.inject(:+)
  end

  def total_sales
    sales_output.map{ |product| product[:price_with_tax] }.inject(:+)
  end

  def calculate_sales_tax( sales)
    sales.each do | sale |
      tax_manager.product_details = sale
      binding.pry
      sales_output << tax_manager.calculate_product_tax
      binding.pry
    end

    binding.pry
    return sales_output
  end
end