class Tax
  # list of tag for the tax exemption
  BASIC_TAX_EXEMPTION_TAGS = ["books", "food", "chocolates", "medicine", "pills"]
  BASIC_SALES_TAX = 0.10
  IMPORTED_GOOD_TAX = 0.05

  attr_accessor :item

  def initialize( item = {} )
    @item[:name] = item[:name]
    @item[:original_price] = item[:price]
    @item[:quantity] = item[:quantity]
    @item[:price_with_tax] = 0
    @item[:sales_tax] = 0
  end

  def calculate_item_tax
    calculate_basic_tax if basic_non_taxable?
    calculate_imported_tax if imported_taxable?

    item
  end

  def basic_non_taxable?
    BASIC_TAX_EXEMPTION_TAGS == item_split.sort
  end

  def imported_taxable?
    item_split.include?( "imported" )
  end

  private

  def calculate_basic_tax
    item[:sales_tax] = ( item[:price] * item[:quantity] ) * BASIC_SALES_TAX
    item[:price_with_tax] = ( item[:price] * item[:quantity] ) + item[:sales_tax]
  end

  def calculate_imported_tax
    item[:sales_tax] = ( item[:price] * item[:quantity] )  * IMPORTED_GOOD_TAX
    item[:price_with_tax] = ( item[:price] * item[:quantity] ) + item[:sales_tax]
  end

  def item_split
    item[:name].downcase.split(" ")
  end
end