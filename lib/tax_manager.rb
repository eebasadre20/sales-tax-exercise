require 'pry'

class TaxManager
  # List of tag for the tax exemption
  BASIC_TAX_EXEMPTION_TAGS = ["books", "food", "chocolates", "medicine", "pills"]
  BASIC_SALES_TAX = 0.10
  IMPORTED_GOOD_TAX = 0.05

  attr_accessor :calculated_product, :item_name

  def initialize
    @calculated_product = []
    @item_name = ''
  end

  def calculate_product_tax( products = [] )
    products.each do | product |
      self.item_name = product[:product]
      product.merge!( calculate_basic_tax( product ) ) unless basic_non_taxable?
      product.merge!( calculate_imported_tax( product ) ) if imported_taxable?

      calculated_product.push( product )
    end

    calculated_product
  end

  # Let's just assume that item name use only spaces between the words.
  def basic_non_taxable?
    item_name.downcase.split(" ").
      find { |keyword| return BASIC_TAX_EXEMPTION_TAGS.include?( keyword ) }
  end

  def imported_taxable?
    item_name.downcase.split(" ").include?( "imported" )
  end

  private

  def calculate_basic_tax( product )
    sales_tax = ( product[:price] * product[:quantity] ) * BASIC_SALES_TAX
    price_with_tax = ( product[:price] * product[:quantity] ) + sales_tax

    return { sales_tax: sales_tax, price_with_tax: price_with_tax }
  end

  def calculate_imported_tax( product )
    sales_tax = ( product[:original_price] * product[:quantity] )  * IMPORTED_GOOD_TAX
    price_with_tax = ( product[:original_price] * product[:quantity] ) + sales_tax

    return { sales_tax: sales_tax, price_with_tax: price_with_tax }
  end
end