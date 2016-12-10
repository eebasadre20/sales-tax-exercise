require 'pry'
require_relative 'tax_manager'

class SalesManager
  attr_accessor :calculated_sales_item, :tax_manager

  def initialize
    @calculated_sales_item = []
    @tax_manager = TaxManager.new
  end

  def calculate_sales( item = [] )
    calculated_sales_item.push( tax_manager.calculate_product_tax( item ) ).flatten!
  end

  private

  def total_sales_tax
    sales_output.map{ |product|  product[:sales_tax] }.inject(:+)
  end

  def total_sales
    sales_output.map{ |product| product[:price_with_tax] }.inject(:+)
  end
end