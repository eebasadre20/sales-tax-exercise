require 'spec_helper'

RSpec.describe Product do
  let( :product ) { Product.new }
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

  describe '#input' do
    context 'when add new sales' do

      it 'display the list of item inside sales' do
        expect( product.input( sales ) ).to eq( sales )
      end

      it 'add the sales in the sales item' do
        product.input( sales )

        expect( product.sales_item ).not_to be_empty
        expect( product.sales_item ).to eq( sales )
      end
    end

    context 'when sales is empty' do
      it 'return warning message' do
        expect( product.input ).to eq( "Oops, Please provide sales." )
      end
    end
  end

  describe '#calculate_sales' do
    let( :calculated_sales_output ) { [
      {:quantity=>1, :name=>"Book", :price=>12.49, :sales_tax=>1.249, :price_with_tax=>13.739},
      {:quantity=>1, :name=>"music cd", :price=>14.99, :sales_tax=>1.499, :price_with_tax=>16.489},
      {:quantity=>1, :name=>"Chocolate Bar", :price=>0.85, :sales_tax=>0.085, :price_with_tax=>0.9349999999999999}
      ] }

    context 'when sales is present' do
      before { product.input( sales ) }

      it 'return calculated sales' do
        expect( product.calculate_sales ).to eq( calculated_sales_output )
      end
    end

    context 'when no sales to be calculated' do
      it 'return warning message' do
        expect( product.calculate_sales ).to eq( 'Oops, No sales item.' )
      end
    end
  end

  describe '#print_receipt' do
    let( :calculated_sales_output ) { [
      {:quantity=>1, :name=>"Book", :price=>12.49, :sales_tax=>1.249, :price_with_tax=>13.739},
      {:quantity=>1, :name=>"music cd", :price=>14.99, :sales_tax=>1.499, :price_with_tax=>16.489},
      {:quantity=>1, :name=>"Chocolate Bar", :price=>0.85, :sales_tax=>0.085, :price_with_tax=>0.9349999999999999}
    ] }

    context 'when calculated sales is present' do
      before do
        product.input( sales )
        product.calculate_sales
      end

      it "return print the calculated sales" do
        expect( product.print_receipt ).to eq( calculated_sales_output )
      end
    end

    context 'when no calculated sales' do
      it "return warning message" do
        expect( product.print_receipt ).to eq( "Oops, No calculated sales." )
      end
    end
  end
end