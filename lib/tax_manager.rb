require 'pry'

class TaxManager
  # List of tag for the tax exemption
  BASIC_TAX_EXEMPTION_TAGS = ["books", "food", "chocolates", "medicine", "pills"]
  BASIC_SALES_TAX = 0.10
  IMPORTED_GOOD_TAX = 0.05

  attr_accessor :item

  def initialize
    @item = {}
    @item[:product] = ''
    @item[:original_price] = 0.0
    @item[:quantity] = 0
    @item[:price_with_tax] = 0
    @item[:sales_tax] = 0
  end

  def calculate_product_tax
    calculate_basic_tax unless basic_non_taxable?
    calculate_imported_tax if imported_taxable?
    item
  end

  def basic_non_taxable?
    item_split.find { |keyword| return BASIC_TAX_EXEMPTION_TAGS.include?( keyword ) }
  end

  def imported_taxable?
    item_split.include?( "imported" )
  end

  def product_details=( product = {} )
    item[:product] = product[:product]
    item[:original_price] = product[:price]
    item[:quantity] = product[:quantity]

    binding.pry
  end

  private

  def calculate_basic_tax
    item[:sales_tax] = ( item[:original_price] * item[:quantity] ) * BASIC_SALES_TAX
    item[:price_with_tax] = ( item[:original_price] * item[:quantity] ) + item[:sales_tax]
  end

  def calculate_imported_tax
    item[:sales_tax] = ( item[:original_price] * item[:quantity] )  * IMPORTED_GOOD_TAX
    item[:price_with_tax] = ( item[:original_price] * item[:quantity] ) + item[:sales_tax]
  end

  # Lets just assume the product name are separated with space
  def item_split
    item[:product].downcase.split(" ")
  end
end