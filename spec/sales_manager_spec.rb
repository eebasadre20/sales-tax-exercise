require 'spec_helper'

RSpec.describe SalesManager do
  let( :sales_manager ) { SalesManager.new }
  let( :sales ) { [ {
                      quantity: 1,
                      name: "Book",
                      price: 12.49
                    }, {
                      quantity: 1,
                      name: "music cd",
                      price: 14.99
                    }, {
                      quantity: 1,
                      name: "Chocolate Bar",
                      price: 0.85
                    } ] }

  describe '#calculate_sales' do
    let( :calculated_sales ) { [
        {:quantity=>1, :name=>"Book", :price=>12.49, :sales_tax=>1.249, :price_with_tax=>13.739},
        {:quantity=>1, :name=>"music cd", :price=>14.99, :sales_tax=>1.499, :price_with_tax=>16.489},
        {:quantity=>1, :name=>"Chocolate Bar", :price=>0.85, :sales_tax=>0.085, :price_with_tax=>0.9349999999999999}
      ] }

    context 'when item to be calculate is empty' do
      it 'return warning message' do
        expect( sales_manager.calculate_sales ).to eq( "Oops, Item to be calculate is empty." )
      end
    end

    context 'when item to be calculate is present' do
      it 'return calculated sales' do
        expect( sales_manager.calculate_sales( sales ) ).to eq( calculated_sales )
      end
    end
  end

  describe '#total_sales_tax' do
    context 'when item to be calculate is present' do
      before { sales_manager.calculate_sales( sales ) }

      it 'return calculated total sales tax' do
        expect( sales_manager.total_sales_tax ).to eq( 2.833 )
      end
    end

    context 'when item to be calculate is empty' do
      it 'return warning message' do
        expect( sales_manager.total_sales_tax ).to eq( "Oops, Item is not yet calculated" )
      end
    end
  end

  fdescribe '#total_sales' do
    context 'when item to be calculate is present' do
      before { sales_manager.calculate_sales( sales ) }

      it 'return calculated total sales' do
        expect( sales_manager.total_sales ).to eq( 31.163 )
      end
    end

    context 'when item to be calculate is empty' do
      it 'return warning message' do
        expect( sales_manager.total_sales_tax ).to eq( "Oops, Item is not yet calculated" )
      end
    end
  end
end