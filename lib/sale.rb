require 'pry'

class Sale
  attr_accessor :sales_input, :sales_output, :tax

  def initialize
    @sales_input = []
    @sales_output = []
  end

  def input( quantity, product, price )
    sales_input << product_details( quantity, product, price )
    calculate_product_tax(h product_details )
    input_display
  end

  def input_display

  end

  def output

  end

  private

  def calculate_sales_tax
    sales_output.map{ |product|  product[:sales_tax] }.inject(:+)
  end

  def total_sales
    sales_output.map{ |product| product[:price_with_tax] }.inject(:+)
  end

  def product_details( quantity, product, price )
    product_details = {
      quantity: quantity,
      product: product,
      price: price
    }
  end

  def calculate_product_tax( product_details )
    product_tax = Tax.new( product_details )
    sales_output << product_tax.calculate_item_tax
  end
end