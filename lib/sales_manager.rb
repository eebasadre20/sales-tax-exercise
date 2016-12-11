require 'pry'
require_relative 'tax_manager'

class SalesManager
  attr_accessor :calculated_sales_item, :tax_manager

  def initialize
    @calculated_sales_item = []
    @tax_manager = TaxManager.new
  end

  def calculate_sales( item = [] )
    return "Oops, Item to be calculate is empty." if item.empty?
    calculated_sales_item.push( tax_manager.calculate_product_tax( item ) ).flatten!
    calculated_sales_item
  end

  def total_sales_tax
    return "Oops, Item is not yet calculated" if calculated_sales_item.empty?
    calculated_sales_item.map{ |product|  product[:sales_tax] }.inject(:+)
  end

  def total_sales
    return "Oops, Item is not yet calculated" if calculated_sales_item.empty?
    calculated_sales_item.map{ |product| product[:price_with_tax] }.inject(:+)
  end
end