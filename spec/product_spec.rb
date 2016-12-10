require 'spec_helper'

RSpec.describe Product do
  let( :product ) { Product.new }

  describe '#input' do
    context 'when add new sales' do
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

      it 'display the list of item inside sales' do
        expect( product.input( sales ) ).to eq( sales )
      end
    end

    context 'when sales is empty' do
      it 'return warning message' do
        expect( product.input ).to eq( "Oops, Please provide sales." )
      end
    end
  end
end